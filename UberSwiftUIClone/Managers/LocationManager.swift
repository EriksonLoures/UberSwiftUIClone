//
//  LocationManager.swift
//  UberSwiftUIClone
//
//  Created by Erik Loures on 27/05/23.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    static let shared = LocationManager()
    @Published var userLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()    
        locationManager.delegate =  self 
        // localizacao mais precisa do usuario
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // solicita ao usuario a permissao para acessar a localizacao
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.userLocation = location.coordinate
        locationManager.stopUpdatingLocation()
    }
}
