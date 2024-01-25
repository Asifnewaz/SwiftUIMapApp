//
//  LocationsViewModel.swift
//  SwiftUIMapApp
//
//  Created by USER on 1/24/24.
//

import SwiftUI
import MapKit

class LocationsViewModel: ObservableObject {
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)

    @Published var locations:[Location]
    
    //Current Location on Map
    @Published var mapLocation: Location {
        didSet {
            self.updateMapRegion(location: mapLocation)
        }
    }

    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()    
    @Published var showLocationList: Bool = false
    
   
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
    func toggleLocationList() {
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    func showNextLocation(location:Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
}
