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
    
    func nextButtonPressed(){
        //current Index
        guard let currentIndex = locations.firstIndex(where:{ $0 == mapLocation}) else  {
            return
        }
        //next index
        let nextIndex =  currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else {return}
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
