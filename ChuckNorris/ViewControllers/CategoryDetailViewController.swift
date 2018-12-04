//
//  CategoriesDetailViewController.swift
//  ChuckNorris
//
//  Created by Thiago Cavalcante de Oliveira on 28/11/2018.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

protocol CategoryDetailView {
    func startLoading()
    func stopLoading()
    func setImage(withData data: Data)
    func setText(_ text: String?)
}

class CategoryDetailViewController : UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    var viewModel: CategoriesDetailViewModel?
    var name: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CategoriesDetailViewModel(view: self, category: name)
        self.navigationItem.title = name.capitalized
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }

    @IBAction func buttonOpenWebPage(_ sender: Any) {        
        if let idDetail = viewModel?.categoryDetail?.id {
           let urlConcat = "https://api.chucknorris.io/jokes/\(idDetail)"
            guard let url = URL(string: urlConcat) else {return}
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
}



