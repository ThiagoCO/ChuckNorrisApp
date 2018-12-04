//
//  ListViewController+ListView.swift
//  ChuckNorris
//
//  Created by Thiago Cavalcante de Oliveira on 27/11/2018.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

protocol ListView {
    func reloadList()
    func startLoading()
    func stopLoading()
    func getErrorMessage()
}

extension ListViewController: ListView {
    
    func reloadList() {
        tableView.reloadData()
    }
    
    func startLoading() {
        tableView.isHidden = true
        self.view.addSubview(activityIndicator)
        activityIndicator.frame = self.view.frame
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        tableView.isHidden = false
        activityIndicator.removeFromSuperview()
    }
    func getErrorMessage() {
        showAlert(title: "Erro", message: "Problems connecting to the internet")
    }
    
}
