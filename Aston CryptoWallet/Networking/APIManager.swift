//
//  APIManager.swift
//  Aston CryptoWallet
//
//  Created by Semyon Semyonov on 3/29/23.
//

import Foundation

final class APIManager: APIManagerOut {
    
    private let baseUrl = "https://data.messari.io/api/v1/assets/"
    
    func getData(cryptoList: [String]) -> [CryptoModel] {
        var receivedData: [CryptoModel] = []
        let dispatchGroup = DispatchGroup()
        
        for cryptoSymbol in cryptoList {
            dispatchGroup.enter()
            
            let urlString = "\(baseUrl)\(cryptoSymbol)/metrics"
            
            if let url = URL(string: urlString) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) {data, response, error in
                    defer {
                        dispatchGroup.leave()
                    }
                    if error != nil { return }
                    if let safeData = data {
                        if let coin = self.parseJSON(cryptoData: safeData) {
                            receivedData.append(coin)
                        }
                    }
                }
                task.resume()
            }
        }
        dispatchGroup.wait()
        return receivedData
    }
    
    private func parseJSON(cryptoData: Data) -> CryptoModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Welcome.self, from: cryptoData)
            
            let symbol = decodedData.data.symbol
            let name = decodedData.data.name
            let price = decodedData.data.marketData.priceUsd
            let percentChange = decodedData.data.marketData.percentChangeUsdLast24_Hours
            let volume = decodedData.data.marketData.volumeLast24_Hours
            let rank = decodedData.data.marketcap.rank
            let marketDominance = decodedData.data.marketcap.marketcapDominancePercent
            let allTimeHigh = decodedData.data.ath.price
            let cycleLow = decodedData.data.cycleLow.price
            let marketcap = decodedData.data.marketcap.currentMarketcapUsd
            let circulatingSupply = decodedData.data.supply.circulating
            let projectedMarketcap = decodedData.data.marketcap.projectedMarketcap
            let projectedSupply = decodedData.data.supply.projectedSupply
            let projectedIssuedPercent = decodedData.data.supply.projectedIssuedPercent
            
            let coin = CryptoModel(symbol: symbol, name: name, price: price, percentChange: percentChange, volume: volume, rank: rank, marketDominance: marketDominance, allTimeHigh: allTimeHigh, cycleLow: cycleLow, marketcap: marketcap, circulatingSupply: circulatingSupply, projectedMarketcap: projectedMarketcap, projectedSupply: projectedSupply, projectedIssuedPercent: projectedIssuedPercent)
            
            return coin
        } catch {
            return nil
        }
    }
    
}
