//
//  File.swift
//  ChuckNorris
//
//  Created by Thiago Cavalcante de Oliveira on 01/12/2018.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}




