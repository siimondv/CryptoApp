//
//  ExchangeDetails.swift
//  CryptoApp
//
//  Created by Simon Delgado on 23/3/25.
//

import CoinGeckoAPI

struct ExchangeDetails {
    var name: String
    var yearEstablished: Int
    var country: String
    var description: String
    var url: String
    var imageUrl: String
    var facebookURL: String?
    var redditURL: String?
    var telegramURL: String?
    var slackURL: String?
    var otherURL1: String?
    var otherURL2: String?
    var twitterHandle: String?
    var hasTradingIncentive: Bool
    var centralized: Bool
    var publicNotice: String?
    var alertNotice: String?
    var trustScore: Int
    var trustScoreRank: Int
    var coins: Int
    var pairs: Int
    init() {
            self.name = ""
            self.yearEstablished = 0
            self.country = ""
            self.description = ""
            self.url = ""
            self.imageUrl = ""
            self.facebookURL = nil
            self.redditURL = nil
            self.telegramURL = nil
            self.slackURL = nil
            self.otherURL1 = nil
            self.otherURL2 = nil
            self.twitterHandle = nil
            self.hasTradingIncentive = false
            self.centralized = false
            self.publicNotice = nil
            self.alertNotice = nil
            self.trustScore = 0
            self.trustScoreRank = 0
            self.coins = 0
            self.pairs = 0
        }
    init(
        name: String,
        yearEstablished: Int,
        country: String,
        description: String,
        url: String,
        imageUrl: String,
        facebookURL: String? = nil,
        redditURL: String? = nil,
        telegramURL: String? = nil,
        slackURL: String? = nil,
        otherURL1: String? = nil,
        otherURL2: String? = nil,
        twitterHandle: String? = nil,
        hasTradingIncentive: Bool,
        centralized: Bool,
        publicNotice: String? = nil,
        alertNotice: String? = nil,
        trustScore: Int,
        trustScoreRank: Int,
        coins: Int,
        pairs: Int
    ) {
        self.name = name
        self.yearEstablished = yearEstablished
        self.country = country
        self.description = description
        self.url = url
        self.imageUrl = imageUrl
        self.facebookURL = facebookURL
        self.redditURL = redditURL
        self.telegramURL = telegramURL
        self.slackURL = slackURL
        self.otherURL1 = otherURL1
        self.otherURL2 = otherURL2
        self.twitterHandle = twitterHandle
        self.hasTradingIncentive = hasTradingIncentive
        self.centralized = centralized
        self.publicNotice = publicNotice
        self.alertNotice = alertNotice
        self.trustScore = trustScore
        self.trustScoreRank = trustScoreRank
        self.coins = coins
        self.pairs = pairs
    }
    static func fromDTO(_ dto: ExchangeDetailsDTO) -> ExchangeDetails {
        return ExchangeDetails(
            name: dto.name,
            yearEstablished: dto.yearEstablished,
            country: dto.country,
            description: dto.description,
            url: dto.url,
            imageUrl: dto.imageUrl,
            facebookURL: dto.facebookURL,
            redditURL: dto.redditURL,
            telegramURL: dto.telegramURL,
            slackURL: dto.slackURL,
            otherURL1: dto.otherURL1,
            otherURL2: dto.otherURL2,
            twitterHandle: dto.twitterHandle,
            hasTradingIncentive: dto.hasTradingIncentive,
            centralized: dto.centralized,
            publicNotice: dto.publicNotice,
            alertNotice: dto.alertNotice,
            trustScore: dto.trustScore,
            trustScoreRank: dto.trustScoreRank,
            coins: dto.coins,
            pairs: dto.pairs
        )
    }
}
