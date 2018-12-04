//
//  CategoryDetailViewController+CategoryDetailView.swift
//  ChuckNorris
//
//  Created by Thiago Cavalcante de Oliveira on 03/12/2018.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation
import UIKit

extension CategoryDetailViewController: CategoryDetailView {
    
    func startLoading() {
        imageView.isHidden = true
        labelText.isHidden = true
        self.view.addSubview(activityIndicator)
        activityIndicator.frame = imageView.frame
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.removeFromSuperview()
        imageView.isHidden = false
        labelText.isHidden = false
    }
    
    func setImage(withData data: Data) {
        imageView.image = UIImage(data: data)
    }
    
    func setText(_ text: String?) {
        labelText.text = text
    }
}
