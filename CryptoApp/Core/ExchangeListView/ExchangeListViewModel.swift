//
//  ExchangeListViewModel.swift
//  CryptoApp
//
//  Created by Simon Delgado on 23/3/25.
//

import Foundation
import CoinGeckoAPI

@Observable class ExchangeListViewModel {
    var exchanges: [Exchange] = []
    var isLoading: Bool = false
    var errorMessage: String?
    private let coinGeckoService: CoinGeckoAPIServiceProtocol
    init(coinGeckoService: CoinGeckoAPIServiceProtocol = CoinGeckoAPIService()) {
        self.coinGeckoService = coinGeckoService
        Task {
            await fetchExchanges()
        }
    }
    func fetchExchanges() async {
        self.isLoading = true
        let result = await coinGeckoService.getExchanges()
        switch result {
        case .success(let data):
            if let data {
                self.exchanges = data.map {
                    Exchange(
                        id: $0.id, name: $0.name,
                        yearEstablished: $0.yearEstablished,
                        country: $0.country, description: $0.description,
                        url: $0.url, imageUrl: $0.imageUrl,
                        hasTradingIncentive: $0.hasTradingIncentive,
                        trustScore: $0.trustScore,
                        trustScoreRank: $0.trustScoreRank
                    )
                }
            }

        case .failure(let error):
            self.errorMessage = error.localizedDescription
        }

        self.isLoading = false
    }
}
