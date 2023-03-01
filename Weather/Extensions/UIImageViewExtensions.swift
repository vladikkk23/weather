//
//  UIImageViewExtensions.swift
//  Weather
//
//  Created by vladikkk on 28/02/2023.
//

import UIKit

extension UIImageView {
    func downloadImage(urlString: String) {
        var temp = urlString
        
        if let char = temp.first, char == "/" {
            while temp.first! == "/" {
                temp.removeFirst()
            }
            
            temp = "http://" + temp
        }
        
        if let imageURL = URL(string: temp) {
            let request = URLRequest(url: imageURL)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data,
                   let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }.resume()
        }
    }
}
