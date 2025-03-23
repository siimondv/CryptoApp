//
//  ExchangeListViewModel.swift
//  CryptoApp
//
//  Created by Simon Delgado on 23/3/25.
//

import Foundation
import CoinGeckoAPI

class ExchangeListViewModel {
    var exchangeListState: ExchangeListState = ExchangeListState()
    var errorMessage: String?
    private let coinGeckoService: CoinGeckoAPIServiceProtocol
    init(coinGeckoService: CoinGeckoAPIServiceProtocol = CoinGeckoAPIService()) {
        self.coinGeckoService = coinGeckoService
        Task {
            await fetchExchanges()
        }
    }
    func fetchExchanges() async {
        self.exchangeListState.isLoading = true
        let result = await coinGeckoService.getExchanges()
        switch result {
        case .success(let data):
            if let data {
                self.exchangeListState.exchanges = data.map {
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

        self.exchangeListState.isLoading = false
    }
}
