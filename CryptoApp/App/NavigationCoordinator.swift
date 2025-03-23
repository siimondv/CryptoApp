//
//  NavigationCoordinator.swift
//  CryptoApp
//
//  Created by Simon Delgado on 24/3/25.
//

import Foundation

enum Route: Hashable {
    case exchangeList
    case exchangeDetail(String)
}

@Observable final class NavigationCoordinator {
    @Published var path: [Route] = []
    func push(_ route: Route) {
        path.append(route)
    }
    func pop() {
        self.path.removeLast()
    }
    func popToRoot() {
        path.removeAll()
    }
}
