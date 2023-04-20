//
//  CoinTableVM.swift
//  Aston CryptoWallet
//
//  Created by Semyon Semyonov on 3/20/23.
//

import Foundation

final class CoinTableVM: TableProtocolOut, TableProtocolIn {
    
    //MARK: - Model Injection
    
    private var apiManager: APIManagerOut
    
    init(apiManager: APIManagerOut) {
        self.apiManager = apiManager
    }
    
    //MARK: - Protocol Conformation
    
    var getSortedArray: ([CryptoModel]) -> Void = { _ in }
    
    func getArrayData(_ parameter: String, _ isDescending: Bool) {
        let sortedArray = sortCryptoModels(by: parameter, isDescending: isDescending)
        self.getSortedArray(sortedArray)
    }
    
    //MARK: - Local Function
    
    private func sortCryptoModels(by parameter: String, isDescending: Bool) -> [CryptoModel] {
        let cryptoList = apiManager.getData(cryptoList: Constants.Crypto.list)
        switch parameter {
        case Constants.rankButton:
            return cryptoList.sorted { (crypto1, crypto2) -> Bool in
                return isDescending ? crypto1.rank < crypto2.rank : crypto1.rank > crypto2.rank
            }
        case Constants.marketcapButton:
            return cryptoList.sorted { (crypto1, crypto2) -> Bool in
                return isDescending ? crypto1.marketcap < crypto2.marketcap : crypto1.marketcap > crypto2.marketcap
            }
        case Constants.priceButton:
            return cryptoList.sorted { (crypto1, crypto2) -> Bool in
                return isDescending ? crypto1.price < crypto2.price : crypto1.price > crypto2.price
            }
        default:
            return cryptoList.sorted { (crypto1, crypto2) -> Bool in
                return isDescending ? crypto1.percentChange < crypto2.percentChange : crypto1.percentChange > crypto2.percentChange
            }
        }
    }
    
}
