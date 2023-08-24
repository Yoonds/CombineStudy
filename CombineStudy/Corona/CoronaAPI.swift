//
//  CoronaAPI.swift
//  CombineStudy
//
//  Created by YoonDaesung on 2023/08/24.
//

import Foundation

public enum CoronaAPI {
    
    public static var scheme: String = "https"
    public static var host: String = "api.corona-19.kr"
    public static var path: String = "korea"
    public static var serviceKey: String = "8a4OuZPfGdUsVv6izqLH2oyTBjkSp3QeW"
    
    static private var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = [URLQueryItem(name: "serviceKey", value: serviceKey)]
        return components
    }
    
    static func makeCoronaURL() -> URL? {
        return urlComponents.url
    }
    
}
