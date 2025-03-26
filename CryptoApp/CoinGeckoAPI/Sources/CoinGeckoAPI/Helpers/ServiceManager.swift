//
//  ServiceManager.swift
//  CoinGeckoAPI
//
//  Created by Simon Delgado on 22/3/25.
//

import Foundation
import SystemConfiguration

final class ServiceManager {
    
    private let decoder = JSONDecoder()
    
    @available(iOS 15.0, *)
    func request<T: Codable>(_ request: URLRequestConvertible, type: T.Type) async -> Result<T?, ServiceError> {
        do {
            let urlRequest = request.urlRequest()
            let (data, response) = try await URLSession.shared.data(for: urlRequest)

            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200...299:
                    let decodedData = try? decoder.decode(T.self, from: data)
                    return .success(decodedData)

                case 401:
                    return .failure(.unauthorized)

                case 429:
                    return .failure(.rateLimit)

                default:
                    return .failure(.invalidResponse)
                }
            }
        
            return .failure(.invalidResponse)

        } catch {
            return .failure(.invalidURLRequest)
        }
    }
}
