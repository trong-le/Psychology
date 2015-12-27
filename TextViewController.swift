//
//  TextViewController.swift
//  Psychologist
//
//  Created by Trong Le on 12/26/15.
//  Copyright © 2015 Trong Le. All rights reserved.
//

import UIKit

class TextViewController: UIViewController
{

    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = text
        }
    }
    
    var text: String = "" {
        didSet {
            textView?.text
        }
    }
    
    // Update size of popover
    override var preferredContentSize: CGSize {
        get {
            if textView != nil && presentingViewController != nil {
                return textView.sizeThatFits(presentingViewController!.view.bounds.size)
            } else {
                return super.preferredContentSize
            }
        }
        set { super.preferredContentSize = newValue }
    }

}
