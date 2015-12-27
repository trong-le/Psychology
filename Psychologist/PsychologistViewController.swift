//
//  ViewController.swift
//  Psychologist
//
//  Created by Trong Le on 12/26/15.
//  Copyright © 2015 Trong Le. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        /* If view controller is HappinessViewController then below statement happens
           Otherwise nil and nothing happens unless stated */
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "show sad": hvc.happiness = 0
                    case "show happy": hvc.happiness = 100
                    default: hvc.happiness = 50
                }
            }
        }
    }

}

