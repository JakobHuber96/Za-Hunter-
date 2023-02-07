
//  ViewController.swift
//  Za' Hunter (not za za)
//  Created by Huber, Jakob - Student on 2/7/23.


import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate  {

    var initialRegion:MKCoordinateRegion!
    var currentLocation: CLLocation!
    var isInitialMapLoad: Bool = true
    var parks: [MKMapItem] = []
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()

       locationManager.requestWhenInUseAuthorization()
    mapView.showsUserLocation = true
    mapView.delegate = self
        
        
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func whenZoomButtonPressed(_ sender: Any) {
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let center = currentLocation.coordinate
        let region = MKCoordinateRegion(center: center, span: coordinateSpan)
        mapView.setRegion(region, animated: true)
        }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        currentLocation = locations[0]
        print (currentLocation)
    }
    
    
    
    
    
    
    
    
}

