//
//  ListViewController+TableView.swift
//  ChuckNorris
//
//  Created by Thiago Cavalcante de Oliveira on 27/11/2018.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

extension ListViewController: UITableViewDelegate, UITableViewDataSource{
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.categories.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        self.tableView.rowHeight = 80
        if let viewModel = self.viewModel {
            cell.textLabel?.text = viewModel.categories[indexPath.row].capitalized
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewModel = self.viewModel {
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "detail") as? CategoryDetailViewController {
                controller.name = viewModel.categories[indexPath.row]
                if(Utils.isConnected()){
                    self.navigationController?.pushViewController(controller, animated: true)
                }
                else {
                    self.getErrorMessage()
                }
                
            }
        }
    }
    
}








