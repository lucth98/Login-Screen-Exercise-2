//
//  NetworkingError.swift
//  Login Screen Exercise2
//
//  Created by Lucas on 09.11.22.
//

import Foundation

enum NetworkingError:Error {
    case emailOrPasswordSerilazingError
    case notAnEmailError
    case wrongEmailAddressError
    case wrongPasswordError
    case networkIsOfflineError
    case responceDataFormatIsInFalseFormatError
    case noSuccesfulResponseCodeError
    case unknownError
}
