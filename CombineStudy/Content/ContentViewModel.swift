//
//  ContentViewModel.swift
//  CombineStudy
//
//  Created by YoonDaesung on 2023/08/22.
//

import Combine
import SwiftUI

class ContentViewModel {
    
    private let scheduler: DispatchQueue = DispatchQueue(label: "scheduler")
    private var disposables = Set<AnyCancellable>()
    
    @Published var city: String = ""
    @Published var coronaData = []
    
    init() {
        $city
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink(receiveValue: fetchCoronaData(city:))
            .store(in: &disposables)
    }
 
}

extension ContentViewModel {
    
    private func fetchCoronaData(city: String) {
        
    }
    
}
