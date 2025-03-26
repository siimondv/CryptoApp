//
//  VolumeEntryDTO.swift
//  CoinGeckoAPI
//
//  Created by Simon Delgado on 20/3/25.
//

import Foundation

public struct VolumeEntryDTO: Codable {
    public let timestamp: Date
    public let volume: Double

    enum CodingKeys: String, CodingKey {
        case timestamp = "0"
        case volume = "1"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let timestampMilliseconds = try container.decode(Double.self, forKey: .timestamp)
        timestamp = Date(timeIntervalSince1970: timestampMilliseconds / 1000)
        
        volume = try container.decode(Double.self, forKey: .volume)
    }

}
