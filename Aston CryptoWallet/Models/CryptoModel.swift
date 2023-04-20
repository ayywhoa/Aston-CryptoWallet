//
//  CryptoModel.swift
//  Aston CryptoWallet
//
//  Created by Semyon Semyonov on 3/29/23.
//

import Foundation

struct CryptoModel {
    
    let symbol: String
    let name: String
    
    let price: Double
    var priceString: String {
        if price > 1000 {
            return String(format: "%.2f", price)
        } else if price > 1 {
            return String(format: "%.3f", price)
        } else if price > 0.001 {
            return String(format: "%.5f", price)
        } else {
            return String(format: "%.6f", price)
        }
    }
    
    let percentChange: Double
    var percentChangeString: String {
        if percentChange < 0 {
            return String(format: "%.2f", percentChange * (-1))
        } else {
            return String(format: "%.2f", percentChange)
        }
    }
    
    let volume: Double
    var volumeString: String {
        if volume > 1000000000 {
            return String(format: "%.2f", volume/1000000000) + " US$ Bn"
        } else {
            return String(format: "%.2f", volume/1000000) + " US$ M"
        }
    }
    
    let rank: Double
    var rankString: String {
        return String(format: "%.0f", rank)
    }
    
    let marketDominance: Double
    var marketDominanceString: String {
        return String(format: "%.2f", marketDominance) + " %"
    }
    
    let allTimeHigh: Double
    var allTimeHighString: String {
        if allTimeHigh > 1000 {
            return String(format: "%.2f", allTimeHigh) + " US$"
        } else if allTimeHigh > 1 {
            return String(format: "%.3f", allTimeHigh) + " US$"
        } else if allTimeHigh > 0.001 {
            return String(format: "%.5f", allTimeHigh) + " US$"
        } else {
            return String(format: "%.6f", allTimeHigh) + " US$"
        }
    }
    
    let cycleLow: Double
    var cycleLowString: String {
        if cycleLow > 1000 {
            return String(format: "%.2f", cycleLow) + " US$"
        } else if cycleLow > 1 {
            return String(format: "%.3f", cycleLow) + " US$"
        } else if cycleLow > 0.001 {
            return String(format: "%.5f", cycleLow) + " US$"
        } else {
            return String(format: "%.6f", cycleLow) + " US$"
        }
    }
    
    let marketcap: Double
    var marketcapString: String {
        return String(format: "%.2f", marketcap/1000000000) + " Bn"
    }
    
    let circulatingSupply: Double
    var circulatingSupplyString: String {
        if circulatingSupply > 1000000000000 {
            return String(format: "%.3f", circulatingSupply/1000000000000) + " T"
        } else if circulatingSupply > 1000000000 {
            return String(format: "%.3f", circulatingSupply/1000000000) + " Bn"
        } else if circulatingSupply > 1000000 {
            return String(format: "%.3f", circulatingSupply/1000000) + " M"
        } else {
            return String(format: "%.0f", circulatingSupply)
        }
    }
    
    let projectedMarketcap: Double
    var projectedMarketcapString: String {
        return String(format: "%.2f", projectedMarketcap/1000000000) + " Bn"
    }
    
    let projectedSupply: Double
    var projectedSupplyString: String {
        if projectedSupply > 1000000000000 {
            return String(format: "%.3f", projectedSupply/1000000000000) + " T"
        } else if projectedSupply > 1000000000 {
            return String(format: "%.3f", projectedSupply/1000000000) + " Bn"
        } else if projectedSupply > 1000000 {
            return String(format: "%.3f", projectedSupply/1000000) + " M"
        } else {
            return String(format: "%.0f", projectedSupply)
        }
    }
    
    let projectedIssuedPercent: Double
    var projectedIssuedPercentString: String {
        return String(format: "%.2f", projectedIssuedPercent) + " %"
    }
    
}
