//
//  ViewController.swift
//  ImageLoadExample
//
//  Created by Andy Stef on 05.11.2020.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    private var imageURL = "https://preview.redd.it/gnv94oll6im01.jpg?auto=webp&s=250d509828503c56e56311af9d2fa4c79d71b8dd"
    
    @IBAction func downloadImage() {
        downloadOnMainThread()
        //downloadWithDataMethod()
        //downloadImageWithRequest()
        
        //showMarvelWiki()
    }
    
    private func downloadOnMainThread() {
        guard let url = URL(string: self.imageURL), let data = try? Data(contentsOf: url) else {
            print("Failed to download image")
            return
        }
        
        updateImage(with: data)
    }
    
    private func downloadWithDataMethod() {
        activityIndicator.startAnimating()
        DispatchQueue.main.async {
            guard let url = URL(string: self.imageURL), let data = try? Data(contentsOf: url) else {
                print("Failed to download image")
                return
            }
            
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.updateImage(with: data)
            }
        }
    }
    
    private func downloadImageWithRequest() {
        guard let url = URL(string: self.imageURL) else {
            print("Invalid URL")
            return
        }
        
        activityIndicator.startAnimating()
        
        let manager = URLSession.shared
        let urlRequest = URLRequest(url: url)
        let dataTask = manager.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.updateImage(with: data)
                }
            }
        }
        
        dataTask.resume()
    }
    
    private func updateImage(with data: Data) {
        self.imageView.alpha = 1
        self.imageView.backgroundColor = .clear
        self.imageView.image = UIImage(data: data)
    }
    
    func showMarvelWiki() {
        guard let url = URL(string: "https://en.wikipedia.org/wiki/Marvel_Cinematic_Universe") else {
            return
        }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
    
    func testNetworkCall() {
        // 1. We create URL object of resource we want to get
        guard let url = URL(string: "") else {
            print("Failed to create URL")
            return
        }
        
        // 2. We create urlSession (that's like network manager that can send request)
        let urlSession = URLSession.shared
        
        // 3. We create request itself
        let urlRequest = URLRequest(url: url)
        
        // 4. We send request and in callback handle what came form server
        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            // 6. Handle request failure
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            // 7. Check if status code is okay
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Invalid response")
                return
            }
            
            // 8. Check if we have data in response
            guard let data = data else {
                print("No data")
                return
            }
            
            // 9. Update UI on main thread
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        
        // 5. That's needed to start request, otherwise it won't execute any code at step 4
        dataTask.resume()
    }
    
    func testNetworkCall2() {
        guard let url = URL(string: "https://topImages.com/MarvelUniverse.jpg") else {
            return
        }
        
        let urlSession = URLSession.shared
        let urlRequest = URLRequest(url: url)
        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Invalid response")
                return
            }
            
            guard let data = data else {
                print("No data")
                return
            }
                
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        
        dataTask.resume()
    }
}
