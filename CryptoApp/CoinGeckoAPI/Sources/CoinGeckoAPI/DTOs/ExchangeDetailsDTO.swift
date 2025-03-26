//
//  ExchangeDetailsDTO 2.swift
//  CoinGeckoAPI
//
//  Created by Simon Delgado on 26/3/25.
//


import Foundation

public struct ExchangeDetailsDTO: Codable {
    public let name: String
    public let yearEstablished: Int
    public let country: String
    public let description: String
    public let url: String
    public let imageUrl: String
    public let facebookURL: String?
    public let redditURL: String?
    public let telegramURL: String?
    public let slackURL: String?
    public let otherURL1: String?
    public let otherURL2: String?
    public let twitterHandle: String?
    public let hasTradingIncentive: Bool
    public let centralized: Bool
    public let publicNotice: String?
    public let alertNotice: String?
    public let trustScore: Int
    public let trustScoreRank: Int
    public let coins: Int
    public let pairs: Int

    enum CodingKeys: String, CodingKey {
        case name
        case yearEstablished = "year_established"
        case country
        case description
        case url
        case imageUrl = "image"
        case facebookURL = "facebook_url"
        case redditURL = "reddit_url"
        case telegramURL = "telegram_url"
        case slackURL = "slack_url"
        case otherURL1 = "other_url_1"
        case otherURL2 = "other_url_2"
        case twitterHandle = "twitter_handle"
        case hasTradingIncentive = "has_trading_incentive"
        case centralized
        case publicNotice = "public_notice"
        case alertNotice = "alert_notice"
        case trustScore = "trust_score"
        case trustScoreRank = "trust_score_rank"
        case coins
        case pairs
    }

}
