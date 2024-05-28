//
//  LoginViewModel.swift
//  DashTracker
//
//  Created by Anders Bjorland on 13/03/2024.
//

import SwiftUI

class LoginViewmodel: ObservableObject{
    
    @Published var phNo = ""
    @Published var code = ""
    
    
    
    
    // getting coutnry Phone Code...
    
    func getCountryCode() -> String {
        let regionIdentifier = Locale.current.region?.identifier ?? ""
        return countries[regionIdentifier] ?? ""
    }
    
}
