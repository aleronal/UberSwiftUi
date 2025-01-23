//
//  HomeView.swift
//  UberSwiftUi
//
//  Created by Alejandro Rodriguez on 03/08/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        UberMapViewRepresentable()
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
