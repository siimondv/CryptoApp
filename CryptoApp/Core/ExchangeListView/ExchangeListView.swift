//
//  ExchangeListView.swift
//  CryptoApp
//
//  Created by Simon Delgado on 23/3/25.
//

import SwiftUI

struct ExchangeListView: View {
    @State private var exchnageListViewModel = ExchangeListViewModel()
    @EnvironmentObject private var navigationCoordinator: NavigationCoordinator

    var body: some View {
            List(exchnageListViewModel.exchangeListState.exchanges, id: \.id) { exchange in
                Button(action: {
                    navigationCoordinator.push(.exchangeDetail(exchange.id))
                }) {
                    HStack {
                        AsyncImage(url: URL(string: exchange.imageUrl)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                        } placeholder: {
                            ProgressView()
                        }

                        VStack(alignment: .leading) {
                            Text(exchange.name)
                                .font(.headline)

                            Text(exchange.country)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
}
