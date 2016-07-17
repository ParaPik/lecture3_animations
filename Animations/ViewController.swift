//
//  ViewController.swift
//  Animations
//
//  Created by Admin on 17.07.16.
//  Copyright © 2016 Specialist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var clickMe: UIButton!
    
    @IBOutlet weak var clickMeToo: UIButton!
    
    @IBOutlet weak var clickMeTooTop: NSLayoutConstraint!
    
    @IBOutlet weak var clickMeTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "imageBackground")
        imageView.alpha = 0
    }
    
    @IBAction func clickMeTooTaped(sender: AnyObject) {
        
        UIView.animateWithDuration(3,
                                   delay: 0,
                                   options: [.CurveEaseIn],
                                   animations:
            {
                self.clickMeTooTop.constant += 30
                self.view.layoutIfNeeded()
            },
                                   completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(5) {
            self.imageView.alpha = 1
        }
        
        animateView(clickMe, shift: 200)
        animateView(clickMeToo, shift: -200);
    }
    
    func animateView(view : UIView, shift : Int) {
        
        view.alpha = 0
        let frame = view.frame
        var start = frame
        start.origin.x += CGFloat(shift)
        view.frame = start
        
        UIView.animateWithDuration(5) {
            view.alpha = 1
            view.frame = frame
        }
    }

    @IBAction func clickMeTaped(sender: AnyObject) {
        
        UIView.animateWithDuration(2, animations: {
            self.clickMeTop.constant += 40
            self.view.layoutIfNeeded()
        }) {
            _ -> Void in
            UIView.animateWithDuration(2) {
                self.clickMeTooTop.constant += 20
                self.view.layoutIfNeeded()
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

