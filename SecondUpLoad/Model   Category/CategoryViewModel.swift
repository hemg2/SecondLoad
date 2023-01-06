//
//  CategoryViewModel.swift
//  SecondUpLoad
//
//  Created by 1 on 2023/01/06.
//

import UIKit
import RxSwift
import RxCocoa


struct CategoryViewModel {
    let disposeBag = DisposeBag()
    
    
    let cellData: Driver<[Category]>
    let pop: Signal<Void>
    let itemSelected = PublishRelay<Int>()
    
    let selectedCategory = PublishSubject<Category>()
    
    
    init() {
        let categoryes = [
            Category(id: 1, name: "디지털/가전"),
            Category(id: 2, name: "게임"),
            Category(id: 3, name: "스포츠/레저"),
            Category(id: 4, name: "유아/아동용품"),
            Category(id: 5, name: "여성패션/잡화"),
            Category(id: 6, name: "뷰티/미용"),
            Category(id: 7, name: "남성팬션/잡화"),
            Category(id: 8, name: "생활/식품"),
            Category(id: 9, name: "가구"),
            Category(id: 10, name: "도서/티켓")
        ]
        
        self.cellData = Driver.just(categoryes)
        
        self.itemSelected
            .map {
                categoryes[$0]
            }
            .bind(to: selectedCategory)
            .disposed(by: disposeBag)
        
        self.pop = itemSelected
            .map { _ in Void() }
            .asSignal(onErrorSignalWith: .empty())
    }
}
