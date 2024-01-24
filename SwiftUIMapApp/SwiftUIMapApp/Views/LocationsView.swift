//
//  LocationsView.swift
//  SwiftUIMapApp
//
//  Created by USER on 1/24/24.
//

import SwiftUI

struct LocationsView: View {
    @Environment(LocationsViewModel.self) var vm : LocationsViewModel

    var body: some View {
        List {
            ForEach(vm.locations) {
                Text($0.name)
            }
        }
    }
}

#Preview {
    LocationsView()
        .environment(LocationsViewModel())
}
