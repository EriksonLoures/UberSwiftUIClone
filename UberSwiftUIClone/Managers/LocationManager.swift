//
//  LocationManager.swift
//  UberSwiftUIClone
//
//  Created by Erik Loures on 27/05/23.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
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
        guard !locations.isEmpty else { return }
        print(locations.first)
        locationManager.stopUpdatingLocation()
    }
}
