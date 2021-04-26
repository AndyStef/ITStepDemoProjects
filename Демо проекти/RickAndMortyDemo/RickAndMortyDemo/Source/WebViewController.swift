//
//  WebViewController.swift
//  RickAndMortyDemo
//
//  Created by Andy Stef on 05.11.2020.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet var browser: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = URLRequest(url: URL(string: "https://rickandmortyapi.com/documentation")!)
        browser.load(request)
    }
}
