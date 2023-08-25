//
//  CoronaViewModel.swift
//  CombineStudy
//
//  Created by YoonDaesung on 2023/08/22.
//

import Combine
import SwiftUI

class CoronaViewModel: ObservableObject{
    
    private let service = CoronaService()
    private let scheduler: DispatchQueue = DispatchQueue(label: "scheduler")
    private var disposables = Set<AnyCancellable>()
    private let coronaFetchable: CoronaFetchable
    
    @Published var city: String = ""
    @Published var dataSource: [CoronaRowViewModel] = []
    
    init(
        coronaFetchable: CoronaFetchable,
        scheduler: DispatchQueue = DispatchQueue(label: "coronaViewModel")
    ) {
        self.coronaFetchable = coronaFetchable
        
        $city
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink(receiveValue: fetchCorona(city:))
            .store(in: &disposables)
    }
    
    func fetchCorona(city: String) { // FIXME: 불필요 파라미터 제거
        coronaFetchable.coronaFetch()
            .map { response in
                response.city.map(CoronaRowViewModel.init)
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] result in
                    guard let weakSelf = self else { return }
                    switch result {
                        case .failure:
                            debugPrint("receive failure")
                            weakSelf.dataSource.removeAll()
                        case .finished:
                            break
                    }
                },
                receiveValue: { [weak self] coronaData in
                    guard let weakSelf = self else { return }
                    debugPrint("수신 데이터: \(coronaData)")
                    weakSelf.dataSource = coronaData
                }
            )
            .store(in: &disposables)
    }
 
}

extension CoronaViewModel {
    
    private func fetchCoronaData(city: String) {
        
    }
    
}
