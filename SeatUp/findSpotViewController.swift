//
//  findSpotViewController.swift
//  SeatUp
//
//  Created by Jack Chen on 7/23/16.
//  Copyright © 2016 Jack Chen. All rights reserved.
//

import UIKit
import CoreLocation


class findSpotViewController: UIViewController, CLLocationManagerDelegate {
    var isRotating = false
    var shouldStopRotating = false
    var timer: NSTimer!
    
    var donePressed = false

    var direction = "none"
    let locationManager = CLLocationManager()

    var lm:CLLocationManager!

    var findDistance = false
    let sourceLocation = CLLocation(latitude: 37.783101, longitude: -122.394289)
//    let westLocation = CLLocation(latitude: 37.783084, longitude: -122.394954)

    var westLocation = CLLocation(latitude: 37.782115, longitude: -122.395545)
    
    
    
    @IBOutlet weak var animationsImage: UIImageView!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    
    
    @IBOutlet weak var correctDirectionLabel: UILabel!
    
    
    @IBOutlet weak var rightDirection: UILabel!
    
    
    
    override func viewDidLoad() {
        print("came into here")
        super.viewDidLoad()
        lm = CLLocationManager()
        lm.delegate = self
        
        lm.startUpdatingHeading()
        
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }

    
    func displayCorrectDirection(directionString: String) {
        
        if findDistance == false {
            animationsImage.stopRotating()
        }
        
            
        
        
        
        
        
        
    }
    
    @IBAction func pressedDone(sender: AnyObject) {
//        displayCorrectDirection("none")
        findDistance = false
        animationsImage.stopRotating()
        donePressed = true
        animationsImage.image = UIImage(named: "none.png")
    }
    
    @IBAction func startPressed(sender: AnyObject) {
        findDistance = true
        animationsImage.startRotating()
        donePressed = false
    }
    
    
    
    @IBAction func savePressed(sender: AnyObject) {
        let alert = UIAlertView()
        alert.title = "Saving current location"
        alert.message = "You have saved your current location!"
        alert.addButtonWithTitle("Understod")
        alert.show()
        
//  this line below me sets my current location to the right spot
        westLocation = myLocation!
        
        
        
        
        
        
    }
    
    
    
    
    
    var bearing: Double?
    var myLocation: CLLocation?
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue: CLLocationCoordinate2D = manager.location!.coordinate
//        print("my current location is: ")
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        
        var getLat: CLLocationDegrees = locValue.latitude
        var getLon: CLLocationDegrees = locValue.longitude
        myLocation = CLLocation(latitude: getLat, longitude: getLon)
        
        
        
        
        bearing = getBearingBetweenTwoPoints1(myLocation!, point2: westLocation)
        let distance = myLocation!.distanceFromLocation(westLocation)

        
        distanceLabel.text = String(round(distance)) + "m"

        
        
        
    }
    
    
    func degreesToRadians(degrees: Double) -> Double { return degrees * M_PI / 180.0 }
    func radiansToDegrees(radians: Double) -> Double { return radians * 180.0 / M_PI }
    
    func getBearingBetweenTwoPoints1(point1 : CLLocation, point2 : CLLocation) -> Double {
        
        let lat1 = degreesToRadians(point1.coordinate.latitude)
        let lon1 = degreesToRadians(point1.coordinate.longitude)
        
        let lat2 = degreesToRadians(point2.coordinate.latitude);
        let lon2 = degreesToRadians(point2.coordinate.longitude);
        
        let dLon = lon2 - lon1;
        
        let y = sin(dLon) * cos(lat2);
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
        let radiansBearing = atan2(y, x);
        
        return radiansToDegrees(radiansBearing)
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateHeading newHeading: CLHeading!) {
        
        
        var currentHeading = 0.0
        
        if newHeading.magneticHeading > 180 {
            currentHeading = newHeading.magneticHeading - 360.0
        } else {
            currentHeading = newHeading.magneticHeading
        }
        
        if !donePressed {
            if currentHeading < bearing! + 20 && currentHeading > bearing! - 20.0 {
                rightDirection.text = "right"
                rightDirection.textColor = UIColor.blueColor()
                displayCorrectDirection("up")
                animationsImage.stopRotating()
                animationsImage.image = UIImage(named: "thumbsUp.png")
            } else {
                rightDirection.text = "wrong"
                rightDirection.textColor = UIColor.redColor()
                animationsImage.image = UIImage(named: "spin.png")
                animationsImage.startRotating()
            }
        }
        
        
    }

}

extension UIView {
    func startRotating(duration: Double = 1) {
        let kAnimationKey = "rotation"
        
        if self.layer.animationForKey(kAnimationKey) == nil {
            let animate = CABasicAnimation(keyPath: "transform.rotation")
            animate.duration = duration
            animate.repeatCount = Float.infinity
            animate.fromValue = 0.0
            animate.toValue = Float(M_PI * 1.0)
            self.layer.addAnimation(animate, forKey: kAnimationKey)
        }
    }
    func stopRotating() {
        let kAnimationKey = "rotation"
        
        if self.layer.animationForKey(kAnimationKey) != nil {
            self.layer.removeAnimationForKey(kAnimationKey)
        }
    }
}
