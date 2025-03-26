//
//  ServiceError.swift
//  CoinGeckoAPI
//
//  Created by Simon Delgado on 22/3/25.
//

import Foundation

public enum ServiceError: Error {
    case invalidURL
    case invalidResponse
    case invalidURLRequest
    case requestFailed
    case noConnection
    case unauthorized
    case rateLimit
    
    public var errorDescription: String {
        switch self {
        case .invalidURL:
            return "The URL provided is not valid."
        case .invalidResponse:
            return "Received an unexpected response from the server."
        case .requestFailed:
            return "The request could not be completed."
        case .invalidURLRequest:
            return "There was an issue creating the request."
        case .noConnection:
            return "You are not connected to the internet."
        case .unauthorized:
            return "Access denied."
        case .rateLimit:
            return "Too many requests."
        }
    }
}
