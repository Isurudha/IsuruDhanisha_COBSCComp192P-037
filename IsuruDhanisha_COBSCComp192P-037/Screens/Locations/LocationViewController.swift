//
//  LocationViewController.swift
//  IsuruDhanisha_COBSCComp192P-037
//
//  Created by Isuru Dhanisha  on 2021-03-06.
//

import UIKit
import Firebase
import CoreLocation

class LocationViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var LocationBtn: UIButton!
    var locationManager : CLLocationManager?
    let ls=LocationService()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager=CLLocationManager()
        locationManager?.delegate=self
        locationManager?.requestAlwaysAuthorization()
        setupButtonStyle();
        
        if ls.status == .authorizedAlways {
            performSegue(withIdentifier: "mainSC", sender: self)
        }
      
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
           
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
              
                if CLLocationManager.isRangingAvailable() {
                 
                }
            }
        }
    }
    
    func setupButtonStyle(){
    
        LocationBtn.layer.cornerRadius = 20
        
    }
    
    @IBAction func btn_Allow(_ sender: Any) {
        let locationService=LocationService()
           locationService.requestLocationAuthrization()
       
        performSegue(withIdentifier: "mainSC", sender: self)
    }
    
    @IBAction func btn_Deny(_ sender: Any) {
    }
}


