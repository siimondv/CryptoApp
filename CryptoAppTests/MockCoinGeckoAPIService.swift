//
//  MockCoinGeckoAPIService.swift
//  CryptoApp
//
//  Created by Simon Delgado on 24/3/25.
//

import CoinGeckoAPI
import Foundation

class MockCoinGeckoAPIService: CoinGeckoAPIServiceProtocol {
    var mockExchangesResult: Result<[ExchangeDTO]?, ServiceError>?
    var mockExchangeDetailsResult: Result<ExchangeDetailsDTO?, ServiceError>?
    var mockExchangeVolumeResult: Result<VolumeEntryDTO?, ServiceError>?
    
    func getExchanges() async -> Result<[ExchangeDTO]?, ServiceError> {
        return mockExchangesResult ?? .failure(.requestFailed)
    }
    func getExchangeDetails(_ id: String) async -> Result<ExchangeDetailsDTO?, ServiceError> {
        return mockExchangeDetailsResult ?? .failure(.requestFailed)
    }
    func getExchangeVolume(_ id: String) async -> Result<VolumeEntryDTO?, ServiceError> {
        return mockExchangeVolumeResult ?? .failure(.requestFailed)
    }
}
