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
        doWebRequest { (content) in
                self.updateTextView(content!)
        }
    }
    
    func updateTextView(_ text: String) {
        DispatchQueue.main.async {
            self.textView.text = text
        }
    }
    
    func doWebRequest(closure: @escaping (_ webSiteContent: String?) -> Void) {
        let url = URL(string: "https://www.packtpub.com")!
        let urlRequest = URLRequest(url: url)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            let content = String(data: data!, encoding: .utf8)
            closure(content)
        }
        task.resume()
    }
}

