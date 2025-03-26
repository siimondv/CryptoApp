//
//  CoinGeckoAPIService.swift
//  CoinGeckoAPI
//
//  Created by Simon Delgado on 22/3/25.
//

import Foundation

public protocol CoinGeckoAPIServiceProtocol {

    func getExchanges() async -> Result<[ExchangeDTO]?, ServiceError>
    
    func getExchangeDetails(_ id: String) async -> Result<ExchangeDetailsDTO?, ServiceError>
    
    func getExchangeVolume(_ id: String) async -> Result<VolumeEntryDTO?, ServiceError>
        
}

@available(iOS 15.0, *)
public final class CoinGeckoAPIService : CoinGeckoAPIServiceProtocol {
    
    private let serviceManager : ServiceManager
    
    public init () {
        self.serviceManager = ServiceManager()
    }
    
    public func getExchanges() async -> Result<[ExchangeDTO]?, ServiceError> {
        await serviceManager.request(CoinGeckoAPI.getExchanges(10), type: [ExchangeDTO].self)
    }
    
    public func getExchangeDetails(_ id: String) async -> Result<ExchangeDetailsDTO?, ServiceError> {
        
        await serviceManager.request(CoinGeckoAPI.getExchangeDetails(id), type: ExchangeDetailsDTO.self)
    }
    
    public func getExchangeVolume(_ id: String) async -> Result<VolumeEntryDTO?, ServiceError> {
        
        await serviceManager.request(CoinGeckoAPI.getExchangeVolume(id), type: VolumeEntryDTO.self)
    }
    
}
