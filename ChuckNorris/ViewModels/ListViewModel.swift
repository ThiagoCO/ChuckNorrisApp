//
//  ListViewModel.swift
//  ChuckNorris
//
//  Created by Thiago Cavalcante de Oliveira on 27/11/2018.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class ListViewModel {
    
    var view: ListView
    var categories: [String] = []
    var categoriesFiltred: [String] = []
    
    init(view: ListView) {
        self.view = view
        getListCategories()
    }
    
    
    func getListCategories() {
        if (Utils.isConnected()) {
            view.startLoading()
            APIManager.shared.getCategories { (listCategories) in
                if let list = listCategories {
                    self.categories = list
                    self.categoriesFiltred = list
                    self.view.reloadList()
                    self.view.stopLoading()
                }
            }
        }
        else {
            view.getErrorMessage()
        }
    }
    
    func filterCategories(texto:String) {
        categories = categoriesFiltred.filter { (category) -> Bool in
            return category.uppercased().contains(texto.uppercased())
        }
        self.view.reloadList()
    }
    
    func cancelFilter() {
        categories = categoriesFiltred
        self.view.reloadList()
    }
    
    

}
