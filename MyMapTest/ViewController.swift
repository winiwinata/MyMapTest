//
//  ViewController.swift
//  MyMapTest
//
//  Created by NDHU_CSIE on 2020/12/3.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    let centerLocation = CLLocationCoordinate2D(latitude: 40.689247, longitude: -74.044502)
    
    @IBOutlet var mapView: MKMapView!
    
    @IBAction func selectType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                mapView.mapType = .standard
            case 1:
                mapView.mapType = .satellite
            case 2:
                mapView.mapType = .satelliteFlyover
                let myCamera = MKMapCamera(lookingAtCenter: centerLocation, fromDistance: 500.0, pitch: 70.0, heading: 0.0)
                mapView.setCamera(myCamera, animated: true)
            default:
                break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func initMap() {
        let region = MKCoordinateRegion(center: centerLocation, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
        
        mapView.setRegion(region, animated: false)
    }
}

