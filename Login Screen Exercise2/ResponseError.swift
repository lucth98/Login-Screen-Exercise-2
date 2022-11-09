//
//  ResponseError.swift
//  Login Screen Exercise2
//
//  Created by Lucas on 09.11.22.
//

import Foundation

struct ResponseError: Codable{
    var error: recivedError
    
    func toString()->String{
        return "error: " + error.toString()
    }
    
}

struct recivedError:Codable{
    var code: Int
    var message: String
    var errors: [rErrors]
    
    func toString()->String{
        var result:String = ""
        var codeS:String = "code: " + String(code) + "\n"
        var domainS:String = "message: " + message + "\n"
        
        
        result += codeS + domainS
        result+="{" + "\n"
        for er in errors {
            result += er.toString()
        }
        result+="}" + "\n"
        return result
    }
}

struct rErrors: Codable{
    var message: String
    var domain: String
    var reason: String
    
    func toString()->String{
        var messageS:String = "message: " + message + "\n"
        var domainS:String = "domain: " + domain + "\n"
        var reasonS:String = "reason: " + reason + "\n"
        return messageS + domainS + reasonS
    }
}

