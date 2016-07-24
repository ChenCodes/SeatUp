//
//  findSpotViewController.swift
//  SeatUp
//
//  Created by Jack Chen on 7/23/16.
//  Copyright © 2016 Jack Chen. All rights reserved.
//

import UIKit

class findSpotViewController: UIViewController {
    
    var direction = "none"
    
    @IBOutlet weak var animationsImage: UIImageView!
    
    
    override func viewDidLoad() {
        print("came into here")
        super.viewDidLoad()
        displayCorrectDirection("up")
    }

    
    func displayCorrectDirection(directionString: String) {
        if directionString == "left" {
            print("should be in here")
            animationsImage.animationImages = [

                UIImage(named: "none.png")!,
                UIImage(named: "leftOne.png")!,
                UIImage(named: "leftTwo.png")!,
                UIImage(named: "leftThree.png")!
            ]
            

            animationsImage.animationDuration = 3
            
            animationsImage.startAnimating()
            print("should be running")

        } else if directionString == "right" {
            
            animationsImage.animationImages = [
            UIImage(named: "none.png")!,
            UIImage(named: "rightOne.png")!,
            UIImage(named: "rightTwo.png")!,
            UIImage(named: "rightThree.png")!
            ]
            
            
            animationsImage.animationDuration = 3
            animationsImage.startAnimating()
            
        } else if directionString == "up" {
            animationsImage.animationImages = [
                UIImage(named: "none.png")!,
                UIImage(named: "upOne.png")!,
                UIImage(named: "upTwo.png")!,
                UIImage(named: "upThree.png")!
                
            ]
            
            
            animationsImage.animationDuration = 3
            animationsImage.startAnimating()
        } else if directionString == "down" {
            animationsImage.animationImages = [
                UIImage(named: "none.png")!,
                UIImage(named: "downOne.png")!,
                UIImage(named: "downTwo.png")!,
                UIImage(named: "downThree.png")!
            ]
            
            
            animationsImage.animationDuration = 3
            animationsImage.startAnimating()
        } else {
            print("this case is for when we're in the right spot ")
            animationsImage.stopAnimating()
            animationsImage.image = UIImage(named: "thumbsUp.png")
            
        }
        
    }
    @IBAction func pressedDone(sender: AnyObject) {
        
        displayCorrectDirection("none")
    }

}
