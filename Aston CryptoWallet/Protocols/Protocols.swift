//
//  Protocols.swift
//  Aston CryptoWallet
//
//  Created by Semyon Semyonov on 3/24/23.
//

import Foundation

//MARK: - AuthProtocols

protocol AuthProtocolIn {
    func getData(_ username: String?, _ password: String?)
}

protocol AuthProtocolOut {
    var updateView: (Bool) -> Void { get set }
}

//MARK: - UserProtocols

protocol UserProtocolOut {
    func getAccounts() -> [String: String]
}

//MARK: - TableProtocols

protocol TableProtocolIn {
    func getArrayData(_ parameter: String, _ isDescending: Bool)
}

protocol TableProtocolOut {
    var getSortedArray: ([CryptoModel]) -> Void { get set}
}

//MARK: - APIProtocol

protocol APIManagerOut {
    func getData(cryptoList: [String]) -> [CryptoModel]
}
