//
//  Protocols.swift
//  Clarity
//
//  Created by Ahmed Yamany on 25/12/2023.
//

import SwiftUI

protocol Navigation: ObservableObject {
    associatedtype NavigationType: Hashable
    var routes: [NavigationType] { get set }
}
extension Navigation {
    func navigate(to route: NavigationType) {
        routes.append(route)
    }
    
    func reset() {
        routes = []
    }
}
