//
//  ViewController+alertController.swift
//  WeatherMap
//
//  Created by Andrey on 05.04.2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    func presentSearchAlertController(with title: String?, message: String?, style: UIAlertController.Style, completionHeandler: @escaping (String) -> Void) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { (textField) in
            let cities = ["San Francisco", "Moscow", "New York", "Stambul", "Viena"]
            textField.placeholder = cities.randomElement()
        }
        
        let search = UIAlertAction(title: "Search", style: .default) { (action) in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else {return}
            if cityName != "" {
                
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHeandler(city)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(search)
        ac.addAction(cancel)
        
        present(ac, animated: true, completion: nil)
    }
    
}
