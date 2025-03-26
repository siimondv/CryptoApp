//
//  ExchangeDTO.swift
//  CoinGeckoAPI
//
//  Created by Simon Delgado on 20/3/25.
//

import Foundation

public struct ExchangeDTO: Codable {
    public let id: String
        public let name: String
        public let yearEstablished: Int
        public let country: String
        public let description: String
        public let url: String
        public let imageUrl: String
        public let hasTradingIncentive: Bool
        public let trustScore: Int
        public let trustScoreRank: Int

        enum CodingKeys: String, CodingKey {
            case id
            case name
            case yearEstablished = "year_established"
            case country
            case description
            case url
            case imageUrl = "image"
            case hasTradingIncentive = "has_trading_incentive"
            case trustScore = "trust_score"
            case trustScoreRank = "trust_score_rank"
        }

}
