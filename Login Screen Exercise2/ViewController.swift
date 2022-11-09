//
//  ViewController.swift
//  Login Screen Exercise2
//
//  Created by Lucas on 05.10.22.
//

import UIKit

class ViewController: UIViewController  ,UITextFieldDelegate {
    
    let correctEmail = "a@b.c"
    let correctpwd = "1234"
    
    //ToDo: Setting up the UITextFields
    
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var indecator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textFieldEmail.autocorrectionType = UITextAutocorrectionType.no
        textFieldPassword.autocorrectionType = UITextAutocorrectionType.no
        
        
        
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        //networkTest()
        
        guard let email = textFieldEmail?.text else{
            drawAlert("Error ", "Countaint of Textfield email is nil")
            return
        }
        guard email != "" else{
            drawAlert("Missing", "Email is empty")
            return
        }
        
        guard let password = textFieldPassword?.text else{
            drawAlert("Error ", "Countaint of username email is nil")
            return
        }
        
        disableUiElements()
        self.enableIndicator()
        
        
        var networking: Networking = Networking()
        networking.login(email, password)
        /*
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
          // This code executes after 2 seconds
          // Check here if the login was successful
            
            self.enableUiElements()
            self.disableIndicator()
            if( email != self.correctEmail || password != self.correctpwd){
                self.drawAlert("Wrong creantinals", "Email or password incorrect")
            }else{
                self.drawAlert("Locked in", "Locked in")
                self.cleanElements()
            }
        }
        */
        
        
    }
    
    func networkTest(){
        var networking: Networking = Networking()
        networking.login("test", "test 2")
    }
    
    func drawAlert(_ titleOfAlert:String,_ messageOfAlert:String){
        let alert:UIAlertController=UIAlertController(title: titleOfAlert,
                                                      message: messageOfAlert,
                                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.destructive))
    
        self.present(alert, animated: true, completion: nil)
    }
    
    func enableIndicator(){
        indecator.isHidden = false
    }
    
    func disableIndicator(){
        indecator.isHidden = true
    }
    
    func disableUiElements(){
        textFieldEmail.isEnabled = false
        textFieldPassword.isEnabled = false
        logInButton.isEnabled = false
    }
    
    func enableUiElements(){
        textFieldEmail.isEnabled = true
        textFieldPassword.isEnabled = true
        logInButton.isEnabled = true
    }
    
    func cleanElements(){
        textFieldEmail.text = ""
        textFieldPassword.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == textFieldEmail){
            textFieldPassword.becomeFirstResponder()
        }else{
            loginButtonPressed(textField)
        }
        
        return true
    }
}

