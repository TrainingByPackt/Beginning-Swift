//
//  ViewController.swift
//  Web Request with Closure (finished, but no error handling)
//
//  Created by Robert Kerr on 2/3/18.
//  Copyright © 2018 Rob Kerr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        print("not implemented")
    }
    
    func updateTextView(_ text: String) {
        DispatchQueue.main.async {
            self.textView.text = text
        }
    }
}

