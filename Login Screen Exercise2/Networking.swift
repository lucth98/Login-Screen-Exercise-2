//
//  Networking.swift
//  Login Screen Exercise2
//
//  Created by Lucas on 28.10.22.
//

import Foundation


class Networking{
    let url: URL = URL(string: "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCTryhlVmmRHYE7iQT3k0eeNRHIKsTMpRw")!
    
    func login(_ email:String, _ pwd:String){
        var urlRequest:URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var jsonBody:[String:Any] = ["email": "m@m.at",
                                     "password": "madmad",
                                     "returnSecureToken": true]
        
        jsonBody["email"] = email
        jsonBody["password"] = pwd
      
        let json = try!  JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        urlRequest.httpBody = json
        
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest){ data, response, error in
            print("recived Data: ")
            print(String(data: data!, encoding: .utf8)!)
            
            print(response)
            print(error)
            
            /*
            print(response)
            print(error)
            */
            
            let jsonDecoder = JSONDecoder()
            
            
            
            do{
                
                let recivedUser:User =  try jsonDecoder.decode(User.self, from: data!)
                
                print("decodet user:")
                print(recivedUser.toString())
                 
            }catch{
                do{
                    let recivedError:ResponseError =  try jsonDecoder.decode(ResponseError.self , from: data!)
                    
                    print("decodet Error")
                    print(recivedError.toString())
                }catch{
                    print("Error cant be decodet")
                }
                
            }
             
                
               
                  
               //test
             
            
        }
        dataTask.resume()
    }
}
