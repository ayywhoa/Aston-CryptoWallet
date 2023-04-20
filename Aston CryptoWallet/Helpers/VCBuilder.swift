//
//  VCBuilder.swift
//  Aston CryptoWallet
//
//  Created by Semyon Semyonov on 3/24/23.
//

import UIKit

final class VCBuilder {
    
    static func buildAuthVC() -> UIViewController {
        let view = AuthVC()
        let userModel = UserModel()
        let viewModel = AuthVM(userModel: userModel)
        
        view.viewModel = viewModel
        
        return view
    }
    
    static func buildCoinTableVC() -> UIViewController {
        let tableView = CoinTableVC()
        let apiManager = APIManager()
        let viewModel = CoinTableVM(apiManager: apiManager)
        
        tableView.viewModel = viewModel
        
        return tableView
    }
    
}
