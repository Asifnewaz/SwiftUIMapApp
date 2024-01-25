//
//  LocationsViewModel.swift
//  SwiftUIMapApp
//
//  Created by USER on 1/24/24.
//

import SwiftUI
import MapKit

class LocationsViewModel: ObservableObject {
    @Published var locations:[Location]
    
    //Current Location on Map
    @Published var mapLocation: Location {
        didSet {
            self.updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
   
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
 
    private func updateMapRegion(location:Location) {
        self.mapRegion = MKCoordinateRegion(center: location.coordinates,
                                            span: mapSpan)
    }
}
