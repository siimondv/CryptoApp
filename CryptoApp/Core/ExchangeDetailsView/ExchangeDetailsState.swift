//
//  ExchangeDetailsState.swift
//  CryptoApp
//
//  Created by Simon Delgado on 23/3/25.
//

import Foundation

@Observable public class ExchangeDetailsState {
    var exchangeDetals: ExchangeDetails = ExchangeDetails()
    var isLoading: Bool = false
    var errorMessage: String?
}
