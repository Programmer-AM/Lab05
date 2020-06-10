//
//  ViewController.swift
//  ChuckNorrisJokes
//
//  Created by Miljan Angelovik on 6/10/20.
//  Copyright © 2020 Miljan Angelovik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var chuckNorrisJokeLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func newJokeTapped(_ sender: Any) {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let dict = json as? [String: Any] {
                        if let value = dict["value"] as? String {
                            DispatchQueue.main.async {
                                self.chuckNorrisJokeLbl.text = value
                            }
                        }
                    }
                } catch {
                    print (error)
                }
            }
        }.resume()
    }
    
}

