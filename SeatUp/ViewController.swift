//
//  ViewController.swift
//  SeatUp
//
//  Created by Jack Chen on 7/23/16.
//  Copyright © 2016 Jack Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var groupField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        scrollView.setContentOffset(CGPointMake(0, 220), animated: true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
    }
 
    @IBAction func buttonPressed(sender: AnyObject) {
        print(nameField.text)
        print(heightField.text)
        print(groupField.text)
        
//      Make sure they enter in the first two fields, if they don't, then don't let them segue
        
        self.performSegueWithIdentifier("showMainPage", sender: nil)
        
    }

}

