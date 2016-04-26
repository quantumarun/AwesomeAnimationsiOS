//
//  ViewController.swift
//  TestOrientation
//
//  Created by Arun on 4/25/16.
//  Copyright © 2016 Arun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var draggableButton: UIButton!
    @IBOutlet weak var horizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    var buttonCenter = CGPointZero
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.panButton(_:)))
        self.draggableButton.addGestureRecognizer(pan)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func panButton(pan: UIPanGestureRecognizer) {
        
        if pan.state == .Began {
            //self.buttonCenter = self.draggableButton.center // store old button center
        } else if pan.state == .Ended || pan.state == .Failed || pan.state == .Cancelled {
            //self.draggableButton.center = self.buttonCenter // restore button center
        } else {
            let location = pan.locationInView(self.draggableButton) // get pan location
            //print(" Horiznontal Constant  \(self.horizontalConstraint.constant)")
            if(self.horizontalConstraint.constant >= -100 && self.horizontalConstraint.constant <= 100 ) {
                //print(location)
                if(location.x >= -100 && location.x <= 100) {
                    self.horizontalConstraint.constant = location.x
                    
                }
                
                
               
            }
            self.containerView.layoutIfNeeded()
            //self.draggableButton.center = location // set button to where finger is
        }
        
    }


}

