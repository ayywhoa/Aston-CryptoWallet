//
//  Constants.swift
//  Aston CryptoWallet
//
//  Created by Semyon Semyonov on 3/20/23.
//

import Foundation

struct Constants {
    
    static let appName = "Aston CryptoWallet"
    static let appLogo = "AppIcon"
    
    static let textFieldColor = "GrayColor"
    
    static let usernamePlaceholder = "Username"
    static let passwordPlaceholder = "Password"
    
    static let errorStatus = "Incorrect username or password."
    
    static let loginButtonName = "Log In"
    static let logoutButtonName = "Log Out"
    
    static let rankButton = "#"
    static let marketcapButton = "Market Cap"
    static let priceButton = "Price"
    static let percentButton = "24h %"
    static let reloadButton = "Try to reload data"
    
    static let cellIdentifier = "ReusableCell"
    
    static let volumeLabel = "Volume 24h"
    static let rankLabel = "Rank"
    static let dominanceLabel = "Market Dominance"
    static let allTimeHighLabel = "All Time High"
    static let cycleLowLabel = "Cycle Low"
    static let marketcapLabel = "Market Cap"
    static let supplyLabel = "Circulating Supply"
    static let projectedMarketcapLabel = "Market Cap by 2050"
    static let projectedSupplyLabel = "Supply by 2050"
    static let projectedIssueLabel = "Supply % by 2050"
    
    static let backButton = "chevron.backward"
    
    struct Crypto {
        static let list = ["BTC", "BNB", "DOGE", "STX", "SAND", "XEC", "HNT", "LTC", "MKR", "GRT", "AVAX"]
    }
    
}
