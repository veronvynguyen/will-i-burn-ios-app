//
//  ViewController.swift
//  Will I Burn
//
//  Created by Vy Nguyen on 8/26/17.
//  Copyright © 2017 Vy Nguyen. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    var coords: CLLocationCoordinate2D?
    
    @IBOutlet weak var skinTypeLabel: UILabel!
    var skinType: String = Utilities().getSkinType() {
        didSet {
            updateSkinTypeLabel()
            Utilities().setSkinType(value: skinType)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        updateSkinTypeLabel()
    }
    
    @IBAction func skinTypeButtonClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Skin Type?", message: "Please choose one", preferredStyle: .actionSheet)
        for var st in SkinType().allSkinTypes() {
            alert.addAction(UIAlertAction(title: st, style: .default, handler: { (action) in
                self.skinType = action.title!
            }))
        }
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.authorizedWhenInUse) {
             print("LOCATION authorized")
        } else if (status == .denied) {
            print("loc denied")
            let alert = UIAlertController(title: "Error!", message: "Allow app to access your location via settings", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func getLocation () {
        if let loc = locationManager.location {
            coords = loc.coordinate
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateSkinTypeLabel() {
        skinTypeLabel.text = "Skin type: " + skinType
    }
}

