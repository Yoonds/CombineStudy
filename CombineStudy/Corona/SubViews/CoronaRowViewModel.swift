//
//  CoronaRowViewModel.swift
//  CombineStudy
//
//  Created by YoonDaesung on 2023/08/25.
//

import Foundation

struct CoronaRowViewModel: Identifiable {
    private let item: CoronaDataResponse.cityData
    
    var id: String { countryName }
    var countryName: String { item.countryName }
    var totalCount: Int { item.totalCount }
    var deathCount: Int { item.deathCount }
    
    init(item: CoronaDataResponse.cityData) {
        self.item = item
    }
    
}
