//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Trong Le on 12/26/15.
//  Copyright © 2015 Trong Le. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController {
    
    // Override superclass HappinessViewController and add into diagnosticHistory array
    override var happiness: Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
    
    // History of buttons, have to do this way or else MVC is recreated every time clearing history
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var diagnosticHistory: [Int] {
        get {
            // Make sure array of ints else empty array
            return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? []
        }
        set {
            defaults.setObject(newValue, forKey: History.DefaultsKey)
        }
    }
    
    private struct History {
        static let SegueIdentifier = "Show Diagnostic History"
        static let DefaultsKey = "DiagnosedHappinessViewController.History"
    }
    
    // Display diagnostic history
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier:
                if let tvc = segue.destinationViewController as? TextViewController {
                    tvc.text = "\(diagnosticHistory)"
                }
            default: break
            }
        }
    }
    
}