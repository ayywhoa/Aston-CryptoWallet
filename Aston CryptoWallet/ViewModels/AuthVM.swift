//
//  AuthVM.swift
//  Aston CryptoWallet
//
//  Created by Semyon Semyonov on 3/20/23.
//

import Foundation

final class AuthVM: AuthProtocolOut, AuthProtocolIn {
    
    //MARK: - Model Injection
    
    private var userModel: UserProtocolOut
    
    init(userModel: UserProtocolOut) {
        self.userModel = userModel
    }
    
    //MARK: - Protocol Conformation
    
    var updateView: (Bool) -> Void = { _ in }
    
    func getData(_ username: String?, _ password: String?) {
        let userAccounts = userModel.getAccounts()
        
        for (key, value) in userAccounts {
            if key == username && value == password {
                self.updateView(true)
                return
            }
        }
        self.updateView(false)
    }
    
}
