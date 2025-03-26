//
//  URLRequestConvertible.swift
//  CoinGeckoAPI
//
//  Created by Simon Delgado on 22/3/25.
//

import Foundation

protocol URLRequestConvertible {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethods { get }
    var headers: [String: String]? { get }
    var queryParameters: [String: Any]? { get }
    var bodyParameters: [String: Any]? { get }
}

extension URLRequestConvertible {
    func urlRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        
        if let headers = headers {
            headers.forEach { key, value in
                urlRequest.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let queryParameters = queryParameters{
            if var components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                components.queryItems = queryParameters.map { key, value in
                    URLQueryItem(name: key, value: "\(value)")
                }
                urlRequest.url = components.url
            }
        }
        
        if let bodyParameters = bodyParameters {
            let jsonData = try? JSONSerialization.data(withJSONObject: bodyParameters)
            urlRequest.httpBody = jsonData
        }
        
        return urlRequest
    }
}
