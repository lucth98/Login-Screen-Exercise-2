//
//  User.swift
//  Login Screen Exercise2
//
//  Created by Lucas on 03.11.22.
//

import Foundation

struct User: Codable{
    var kind: String
    var localId: String
    var email: String
    var displayName: String
    var idToken: String
    var registered: Bool
    var profilePicture: String
    var refreshToken: String
    var expiresIn: String
    
    func toString()->String{
        var kindS:String = "kind: " + kind + "\n"
        var localIdS:String = "localId: " + localId + "\n"
        var emailS:String = "email: " + email +  "\n"
        var displayNameS:String = "displayName: " + displayName + "\n"
        var idTokenS:String = "idToken: " + idToken + "\n"
        var registeredS:String = "registered:" + String(registered) + "\n"
        var profilePictureS:String = "profilePicture: " + profilePicture +  "\n"
        var refreshTokenS:String = "refreshToken: " + refreshToken + "\n"
        var expiresInS:String = "expiresIn: " + expiresIn + "\n"
        
        return kindS + localIdS + emailS + displayNameS + idTokenS + registeredS + profilePictureS + refreshTokenS + expiresInS
  
    }
    
}
