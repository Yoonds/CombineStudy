//
//  CoronaViewModel.swift
//  CombineStudy
//
//  Created by YoonDaesung on 2023/08/22.
//

import Combine
import SwiftUI

class CoronaViewModel {
    
    private let service = CoronaService()
    private let scheduler: DispatchQueue = DispatchQueue(label: "scheduler")
    private var disposables = Set<AnyCancellable>()
    
    @Published var city: String = ""
    @Published var coronaData: [CoronaDataResponse] = []
    
    init() {
        $city
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink(receiveValue: fetchCoronaData(city:))
            .store(in: &disposables)
    }
 
}

extension CoronaViewModel {
    
    private func fetchCoronaData(city: String) {
        
    }
    
}
