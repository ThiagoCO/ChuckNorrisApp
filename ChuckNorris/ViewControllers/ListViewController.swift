//
//  ListViewController.swift
//  ChuckNorris
//
//  Created by Thiago Cavalcante de Oliveira on 27/11/2018.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableTitle: UILabel!
    //MARK: Properties
    var viewModel: ListViewModel?
    var activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    //MARK: Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel = ListViewModel(view: self)
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
    }
    @IBAction func aboutButton(_ sender: Any) {
        self.showAlert(title: "Sobre", message: "Aplicativo desenvolvido por Thiago Cavalcante para o processo seletivo do GuiaBolso")
    }
    
}
