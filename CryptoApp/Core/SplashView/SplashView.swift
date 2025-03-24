//
//  SplashView.swift
//  CryptoApp
//
//  Created by Simon Delgado on 24/3/25.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject private var navigationCoordinator: NavigationCoordinator
    var body: some View {
        NavigationStack(path: $navigationCoordinator.path) {
            VStack {
                Spacer()
                ZStack {
                    Circle()
                        .foregroundStyle(Color.orange)
                        .frame(width: 300)
                    Image(systemName: "bitcoinsign")
                        .foregroundStyle(.white)
                        .font(.system(size: 100))
                }
                Spacer()
                Text("© Crypto App ©")
                    .font(.callout)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    navigationCoordinator.push(.exchangeList)
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .exchangeList:
                    ExchangeListView()
                        .navigationBarBackButtonHidden()
                case .exchangeDetail(let id):
                    ExchangeDetailsView(id: id)
                }
            }
        }
    }
}
