//
//  ViewController.swift
//  RonSwansonApp
//
//  Created by Jonathan Shoemaker on 7/7/20.
//  Copyright © 2020 JonathanShoemaker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var getQoute: UILabel!
    @IBAction func QuoteButton(_ sender: Any) {
        let targetUrl = URL(string: "http://ron-swanson-quotes.herokuapp.com/v2/quotes")
        let task = URLSession.shared.dataTask(with: targetUrl!) { (data, response, error) in
            DispatchQueue.main.async {
                if error != nil {
                    print("ERROR!")
                }
                else {
                    if let content = data {
                        do {
                            let q = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                            let quote = (q[0] as! String)
                            self.getQoute.text = quote
                        }
                        catch {
                            print("ERROR.")
                        }
                    }
                }
            }
        }
            task.resume()
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

