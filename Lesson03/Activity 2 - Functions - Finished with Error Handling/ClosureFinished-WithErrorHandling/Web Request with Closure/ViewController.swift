//
//  ViewController.swift
//  Web Request with Closure
//
//  Created by Robert Kerr on 2/3/18.
//  Copyright © 2018 Rob Kerr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        doWebRequest { (content, errorMessage) in
            if let content = content {
                self.updateTextView(content)
            }
            else if let errorMessage = errorMessage {
                self.updateTextView(errorMessage)
            } else {
                self.updateTextView("Nothing received from doWebRequest's closure call")
            }
        }
    }
    
    func updateTextView(_ text: String) {
        DispatchQueue.main.async {
            self.textView.text = text
        }
    }
    
    func doWebRequest(closure: @escaping (_ webSiteContent: String?, _ errorMessage: String?) -> Void) {
        guard let url = URL(string: "https://www.packtpub.com") else { return }
        
        let urlRequest = URLRequest(url: url)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            
            switch (data, error, statusCode) {
            case (.none, .some(let err), .none):
                closure(nil, "Unexpected error: \(err.localizedDescription)")
            case (.none, .none, .some(let statusCode)):
                closure(nil, "Empty html content. Status code: \(statusCode)")
            case (.some(let data), .none, .some(let statusCode)):
                if statusCode == 200 {
                    let content = String(data: data, encoding: .utf8)
                    closure(content, nil)
                } else {
                    closure(nil, "Unexpected status code: \(statusCode)")
                }
            default:
                closure(nil, "Unexpected error occured")
            }
        }
        task.resume()
    }
}

