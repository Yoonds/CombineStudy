//
//  CoronaDataResponse.swift
//  CombineStudy
//
//  Created by YoonDaesung on 2023/08/22.
//

import Foundation

struct CoronaDataResponse: Codable {
    
    let main: [mainData]
    let city: [cityData]
    
    struct mainData: Codable {
        
        let apiName: String
        let updateTime: String
        let deathPercent: String
        
        enum CodingKeys: String, CodingKey {
            case apiName
            case updateTime
            case deathPercent = "deathPcnt"
        }
        
    }
    
    struct cityData: Codable {
        let countryName: String
        let totalCount: Int
        let deathCount: Int
        
        enum CodingKeys: String, CodingKey {
            case countryName = "countryNm"
            case totalCount = "totalCnt"
            case deathCount = "deathCnt"
        }
    }
    
}
