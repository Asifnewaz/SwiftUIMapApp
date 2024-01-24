//
//  LocationsViewModel.swift
//  SwiftUIMapApp
//
//  Created by USER on 1/24/24.
//

import Foundation

@Observable class LocationsViewModel {
    var locations:[Location]
    init() {
        self.locations = LocationsDataService.locations
    }
}
