import Foundation

enum CoinGeckoAPI: URLRequestConvertible {
    case getExchanges(_ perPage: Int)
    case getExchangeDetails(_ id: String)
    case getExchangeVolume(_ id: String)
    
    var baseURL: URL{
        .init(string: "https://api.coingecko.com/api/v3")!
    }
    
    var path: String{
        switch self {
        case .getExchanges:
            "exchanges"
        case .getExchangeDetails(let id):
            "exchanges/\(id)"
        case .getExchangeVolume(let id):
            "exchanges/\(id)/volume_chart"
        }
    }
    
    var httpMethod: HTTPMethods{
        switch self {
        case .getExchanges:
            .get
        case .getExchangeDetails:
            .get
        case .getExchangeVolume:
            .get
        }
    }
    
    var headers: [String : String]?{
        switch self {
        case .getExchanges, .getExchangeDetails, .getExchangeVolume:
            nil
        }
    }
    
    var queryParameters: [String : Any]?{
        switch self {
        case .getExchanges(let perPage):
            ["per_page" : perPage]
        case .getExchangeDetails, .getExchangeVolume:
            nil
        }

    }
    
    var bodyParameters: [String : Any]?{
        switch self {
        case .getExchanges, .getExchangeDetails, .getExchangeVolume :
            nil
        }
        
    }
    
    
}
