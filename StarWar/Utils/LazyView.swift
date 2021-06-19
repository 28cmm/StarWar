//
//  LazyView.swift
//  StarWar
//
//  Created by Yilei Huang on 2021-06-18.
//
import SwiftUI

struct NavigationLazyView<T: View>: View {
    let build: () -> T
    init(_ build: @autoclosure @escaping () -> T) {
        self.build = build
    }
    var body: T {
        build()
    }
}
