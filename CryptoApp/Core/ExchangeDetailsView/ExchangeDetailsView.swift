//
//  ExchangeDetailsView.swift
//  CryptoApp
//
//  Created by Simon Delgado on 23/3/25.
//

import SwiftUI

struct ExchangeDetailsView: View {
    @State private var exchangeDetailsViewModel: ExchangeDetailsViewModel
    init(id: String) {
        _exchangeDetailsViewModel = State(initialValue: ExchangeDetailsViewModel(id: id))
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let imageUrl = URL(string: exchangeDetailsViewModel.exchangeDetailsState.exchangeDetals.imageUrl) {
                    AsyncImage(url: imageUrl) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .cornerRadius(12)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(width: 200, height: 200)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top)
                }
                Text(exchangeDetailsViewModel.exchangeDetailsState.exchangeDetals.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text("Country: \(exchangeDetailsViewModel.exchangeDetailsState.exchangeDetals.country)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 4)
                Text("Year Established: \(exchangeDetailsViewModel.exchangeDetailsState.exchangeDetals.yearEstablished)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 4)
                Text("Description")
                    .font(.headline)
                    .padding(.top, 8)
                Text(exchangeDetailsViewModel.exchangeDetailsState.exchangeDetals.description)
                    .font(.body)
                    .foregroundColor(.primary)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Trust Score")
                            .font(.headline)
                        Text("\(exchangeDetailsViewModel.exchangeDetailsState.exchangeDetals.trustScore)")
                            .font(.body)
                            .foregroundColor(.green)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Trust Rank")
                            .font(.headline)
                        Text("\(exchangeDetailsViewModel.exchangeDetailsState.exchangeDetals.trustScoreRank)")
                            .font(.body)
                            .foregroundColor(.orange)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.top, 12)
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Exchange Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
