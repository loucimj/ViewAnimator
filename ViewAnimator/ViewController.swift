//
//  ViewController.swift
//  ViewAnimator
//
//  Created by Javier Loucim on 9/16/16.
//  Copyright © 2016 Javier Loucim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Skinnable {

    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var isEnabled = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonView.addDropShadow()
        buttonView.layer.cornerRadius = 14
        imageView.alpha = 1
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func animateAction(sender: AnyObject) {
        let button = sender as! UIButton
        button.enabled = false
        if isEnabled {
            buttonView.shrinkAndDisable()
            imageView.popAndEnable({ self.imageView.shrinkAndDisable() })
            isEnabled = false
        } else {
            buttonView.extendAndEnable()
            imageView.extendAndEnable(20, heightShrink: 10, completionBlock: { self.imageView.disappearAndDisable() })
            
            isEnabled = true
        }
        button.enabled = true
    }

}

