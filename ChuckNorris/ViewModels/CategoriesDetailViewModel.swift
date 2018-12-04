//
//  CategoriesDetailViewModel.swift
//  ChuckNorris
//
//  Created by Thiago Cavalcante de Oliveira on 28/11/2018.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class CategoriesDetailViewModel {
    
    //MARK: Properties
    
    var view: CategoryDetailView
    
    //MARK: Response
    
    var categoryDetail:CategoryDetail? {
        didSet {
            self.view.setText(categoryDetail?.value)
        }
    }
    
    //MARK: Methods
    
    init(view: CategoryDetailView, category: String) {
        self.view = view
        getCategoryDetail(of: category)
    }
    
    func getCategoryDetail(of category: String) {
        view.startLoading()
        
        APIManager.shared.getCategoryDetail(category: category) { (detail) in
            self.categoryDetail = detail
            self.saveImage()
        }
    }
    
    
    func saveImage() {
        APIManager.shared.getImageDetail { (data) in
            self.view.setImage(withData: data)
            self.view.stopLoading()
        }
    }
}
