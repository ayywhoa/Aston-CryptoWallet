//
//  UserModel.swift
//  Aston CryptoWallet
//
//  Created by Semyon Semyonov on 3/19/23.
//

import Foundation

struct UserModel: UserProtocolOut {
    
    static let accounts: [String: String] = ["1234": "1234",
                                             "5555": "5555"]
    
    func getAccounts() -> [String: String] {
        return UserModel.accounts
    }
    
}
