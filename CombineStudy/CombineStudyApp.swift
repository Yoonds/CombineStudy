//
//  CombineStudyApp.swift
//  CombineStudy
//
//  Created by YoonDaesung on 2023/08/22.
//

import SwiftUI

@main
struct CombineStudyApp: App {
    var body: some Scene {
        WindowGroup {
            // 서비스, 뷰모델 주입
            let service = CoronaService()
            let viewModel = CoronaViewModel(coronaFetchable: service)
            CoronaView(viewMdoel: viewModel)
        }
    }
}
