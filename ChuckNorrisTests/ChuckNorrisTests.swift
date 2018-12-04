//
//  ChuckNorrisTests.swift
//  ChuckNorrisTests
//
//  Created by Thiago Cavalcante de Oliveira on 02/12/2018.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import XCTest
@testable import ChuckNorris
class ChuckNorrisTests: XCTestCase {

    var sut:ListViewController!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        XCTAssertNotNil(storyboard, "Storyboard error")
       sut = storyboard.instantiateViewController(withIdentifier: "listView") as? ListViewController
        
    }


    func testReturnAPIGetCategories() {
        var listCategories:Array<String>?
        APIManager.shared.getCategories { (categories) in
            listCategories = categories
            XCTAssert(listCategories != nil)
        }
    }
  
    func testReturnAPIGetDetail() {
        var categoryDetail:CategoryDetail?
        APIManager.shared.getCategoriesDetail(category: "movie") { (detail) in
            categoryDetail = detail
            XCTAssert(categoryDetail != nil)
        }
    }
    
    func testReturnAPIGetImageDetail() {
        var imageDetail:UIImage?
        APIManager.shared.getImageDetail { (dataImage) in
            imageDetail = UIImage(data: dataImage)
            XCTAssert(imageDetail != nil)
        }
    }

    func testTableViewNotNullBeforeViewDidLoad() {
        
        _ = sut.view
        XCTAssert(sut.tableView != nil)
    }
    
    func testTableviewDataSourceNotNil(){
        _ = sut.view
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertNotNil(sut.tableView.dataSource is ListViewController)
    }
    
    func testNumberOfRowsEqualNumberCategoriesViewModel() {
        
        _ = sut.view
        
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), sut.viewModel?.categories.count)
    }
    

    func testDetailViewNotNullBeforeViewDidLoad(){

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        XCTAssertNotNil(storyboard, "Storyboard error")

        guard let sutDetail = storyboard.instantiateViewController(withIdentifier: "detail") as? CategoryDetailViewController else {
            XCTAssert(false, "Can't instantiate ListViewController")
            return
        }
        sutDetail.viewModel?.getCategoryDetail(of: "movie")

        _ = sutDetail.view
        XCTAssertNotNil(sutDetail)
    }
    
    
}
   


