//
//  E.swift
//  CryptoApp
//
//  Created by Simon Delgado on 23/3/25.
//

import Foundation
import CoinGeckoAPI

class ExchangeDetailsViewModel {
    var exchangeDetailsState: ExchangeDetailsState = ExchangeDetailsState()
    private let coinGeckoService: CoinGeckoAPIServiceProtocol
    init(coinGeckoService: CoinGeckoAPIServiceProtocol = CoinGeckoAPIService(), id: String) {
        self.coinGeckoService = coinGeckoService
        Task {
            await fetchExchangeDetails(id)
        }
    }
    func fetchExchangeDetails(_ id: String) async {
        self.exchangeDetailsState.isLoading = true
        let result = await coinGeckoService.getExchangeDetails(id)
        switch result {
        case .success(let data):
            if let data {
                self.exchangeDetailsState.exchangeDetals = ExchangeDetails.fromDTO(data)
            }

        case .failure(let error):
            self.exchangeDetailsState.errorMessage = error.localizedDescription
        }

        self.exchangeDetailsState.isLoading = false
    }
}
