//
//  ExchangeList.swift
//  CryptoApp
//
//  Created by Simon Delgado on 23/3/25.
//

import Foundation

@Observable class ExchangeListState {
    var exchanges: [Exchange] = []
    var isLoading: Bool = false
    var errorMessage: String?
}
