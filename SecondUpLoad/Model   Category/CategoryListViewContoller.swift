//
//  CategoryListViewContoller.swift
//  SecondUpLoad
//
//  Created by 1 on 2023/01/06.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa


class CategoryListViewContoller: UIViewController {
    let disposeBag = DisposeBag()
    let tableView = UITableView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ ViewModel: CategoryViewModel) {
        
    }
    
    private func attribute() {
        
    }
    
    private func layout() {
        
    }
}
