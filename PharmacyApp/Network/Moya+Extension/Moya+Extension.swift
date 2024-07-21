//
//  Moya+Extension.swift
//
//  Created by Alaa Mohamed.
//
import Foundation
import Moya
import Alamofire

extension TargetType {
    
    var baseURL: URL {
        
        guard let url = URL(string: EndPoints.BASE_URL) else {
            fatalError("invalid error message")
        }
        return url
    }
    
    var headers: [String : String]? {
        var headers = [
            "Accept-Language": "en"
        ]
        if let token = UserDefaultsConfig.token {
            headers["Authorization"] = "Bearer \(token)"
        }
        return headers
    }
    
    
    var sampleData: Data { return Data() }
}

extension Moya.Response {
    var isSuccess: Bool {
        return (200 ... 299) ~= self.statusCode
    }
    var isFailedWithMessage: Bool {
        return (400 ... 499) ~= self.statusCode
    }
    
    var isAppTokenExpired: Bool {
        return self.statusCode == 401
    }
}

extension NetworkLoggerPlugin.Configuration {
    
    static var loggerConfiguration: NetworkLoggerPlugin.Configuration {
        NetworkLoggerPlugin.Configuration (formatter: Formatter (),
                                           output: defaultOutput(target:items:),
                                           logOptions: LogOptions.verbose)
    }
}
extension NetworkLoggerPlugin {
    
    static var networkLogger: PluginType {
        NetworkLoggerPlugin (configuration: NetworkLoggerPlugin.Configuration.loggerConfiguration)
    }
}

extension MoyaProvider {
    
    func requestDataWithCustomResponse<T: Codable>(_ target: Target, callBack: @escaping (T?, String?) -> Void) {
        self.request(target) { (result) in
            switch result {
            case let .success(response):
                do {
                    let decoder = JSONDecoder()
                    if let dataArray = try response.mapJSON() as? [[String: Any]] {
                        let jsonData = try JSONSerialization.data(withJSONObject: dataArray, options: [])
                        let serverResponse = try decoder.decode(T.self, from: jsonData)
                        callBack(serverResponse as? T, nil) // Cast to T since callBack expects T?
                    } else if let dataDict = try response.mapJSON() as? [String: Any] {
                        let jsonData = try JSONSerialization.data(withJSONObject: dataDict, options: [])
                        let serverResponse = try decoder.decode(T.self, from: jsonData)
                        callBack(serverResponse, nil)
                    } else {
                        callBack(nil, "Unexpected Error. Please try again later!")
                    }
                } catch {
                    callBack(nil, "Unexpected Error. Please try again later!")
                }
            case .failure(let error):
                if let moyaError = error as? MoyaError {
                    switch moyaError {
                    case .underlying(let afError as AFError, _):
                        switch afError {
                        case .sessionTaskFailed(let urlError as URLError):
                            if urlError.code == .notConnectedToInternet {
                                callBack(nil, "No Internet Connection")
                            } else if urlError.code == .timedOut {
                                callBack(nil, "Request Timed Out")
                            }
                        default:
                            callBack(nil, "Unexpected Error. Please try again later!")
                        }
                    default:
                        callBack(nil, "Unexpected Error. Please try again later!")
                    }
                } else {
                    callBack(nil, "Unexpected Error. Please try again later!")
                }
            }
        }
    }
}
