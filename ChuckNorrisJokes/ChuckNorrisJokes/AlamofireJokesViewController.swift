//
//  AlamofireJokesViewController.swift
//  ChuckNorrisJokes
//
//  Created by Miljan Angelovik on 6/11/20.
//  Copyright © 2020 Miljan Angelovik. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireJokesViewController: UIViewController {

    @IBOutlet weak var jokeLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func newJokeTapped(_ sender: Any) {
        AF.request("https://api.chucknorris.io/jokes/random").response { response in
            if let data = response.data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let dict = json as? [String: Any] {
                        if let value = dict["value"] as? String {
                            DispatchQueue.main.async {
                                self.jokeLbl.text = value
                            }
                        }
                    }
                } catch {
                    print (error)
                }
            }
        }
    }
}
