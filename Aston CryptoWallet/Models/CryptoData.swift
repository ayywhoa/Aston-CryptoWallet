//
//  CryptoData.swift
//  Aston CryptoWallet
//
//  Created by Semyon Semyonov on 3/23/23.
//
//  This file was generated from JSON Schema using quicktype, do not modify it directly.
//  To parse the JSON, add this file to your project and do:
//
//  let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome

struct Welcome: Codable {
    let data: DataClass
}

// MARK: - DataClass

struct DataClass: Codable {
    let symbol: String
    let name: String
    let marketData: MarketData
    let marketcap: Marketcap
    let supply: Supply
    let ath: AllTimeHigh
    let cycleLow: CycleLow
    
    enum CodingKeys: String, CodingKey {
        case symbol
        case name
        case marketData = "market_data"
        case marketcap
        case supply
        case ath = "all_time_high"
        case cycleLow = "cycle_low"
    }
}

// MARK: - MarketData

struct MarketData: Codable {
    let priceUsd: Double
    let volumeLast24_Hours: Double
    let percentChangeUsdLast24_Hours: Double
    
    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
        case volumeLast24_Hours = "volume_last_24_hours"
        case percentChangeUsdLast24_Hours = "percent_change_usd_last_24_hours"
    }
}

// MARK: - Marketcap

struct Marketcap: Codable {
    let rank: Double
    let marketcapDominancePercent: Double
    let currentMarketcapUsd: Double
    let projectedMarketcap: Double
    
    enum CodingKeys: String, CodingKey {
        case rank
        case marketcapDominancePercent = "marketcap_dominance_percent"
        case currentMarketcapUsd = "current_marketcap_usd"
        case projectedMarketcap = "y_2050_marketcap_usd"
    }
}

// MARK: - Supply

struct Supply: Codable {
    let circulating: Double
    let projectedSupply: Double
    let projectedIssuedPercent: Double
    
    enum CodingKeys: String, CodingKey {
        case circulating
        case projectedSupply = "y_2050"
        case projectedIssuedPercent = "y_2050_issued_percent"
    }
}

// MARK: - AllTimeHigh

struct AllTimeHigh: Codable {
    let price: Double
    
    enum CodingKeys: String, CodingKey {
        case price
    }
}

// MARK: - CycleLow

struct CycleLow: Codable {
    let price: Double
    
    enum CodingKeys: String, CodingKey {
        case price
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
    
}
