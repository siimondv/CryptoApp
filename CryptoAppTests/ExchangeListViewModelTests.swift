//
//  Test.swift
//  CryptoApp
//
//  Created by Simon Delgado on 24/3/25.
//

import XCTest
import CoinGeckoAPI
@testable import CryptoApp

class ExchangeListViewModelTests: XCTestCase {
    
    var viewModel: ExchangeListViewModel!
    var mockService: MockCoinGeckoAPIService!
    
    override func setUp() {
        super.setUp()
        mockService = MockCoinGeckoAPIService()
        viewModel = ExchangeListViewModel(coinGeckoService: mockService)
    }
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    func testFetchExchangesSuccess() async {
        let mockExchanges = [
            ExchangeDTO(
                id: "1",
                name: "Exchange1",
                yearEstablished: 2010,
                country: "USA",
                description: "A test exchange",
                url: "https://example.com",
                imageUrl: "https://example.com/image.png",
                hasTradingIncentive: true,
                trustScore: 100,
                trustScoreRank: 1
            )
        ]
        mockService.mockExchangesResult = .success(mockExchanges)
        await viewModel.fetchExchanges()
        XCTAssertEqual(viewModel.exchangeListState.exchanges.count, 1)
        XCTAssertEqual(viewModel.exchangeListState.exchanges.first?.name, "Exchange1")
    }
    
    func testFetchExchangesFailure() async {
        mockService.mockExchangesResult = .failure(.requestFailed)
        await viewModel.fetchExchanges()
        XCTAssertNotNil(viewModel.exchangeListState.errorMessage)
    }
}
