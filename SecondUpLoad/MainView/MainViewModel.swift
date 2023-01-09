//
//  MainViewModel.swift
//  SecondUpLoad
//
//  Created by 1 on 2023/01/06.
//

import UIKit
import RxSwift
import RxCocoa


struct MainViewModel {
    let titleTextFieldCellViewModel = TitleTextCellViewModel()
    let priceTextFieldCellViewModel = PriceTextFieldCellViewModel()
    let detatilWriteFormCellViewModel = DetailWriteFormCellViewModel()
    
    //뷰 모델에서 뷰로 넘긴다
    let cellData: Driver<[String]>
    let presentAlert: Signal<Alert>
    let push: Driver<CategoryViewModel>
    
    // 뷰에서 뷰모델
    let itemSelected = PublishRelay<Int>()
    let submitButtonTapped = PublishRelay<Void>()
    
    init(model: MainModel = MainModel()) {
        let title = Observable.just("글 제목 뷰모델")
        let categoryViewModel = CategoryViewModel()
        let category = categoryViewModel.selectedCategory.map { $0.name }.startWith("카테고리 선택 뷰모델")
        
        let price = Observable.just("$ 가격 (선택사항) 뷰모델")
        let detail = Observable.just("내용을 입력하세요.")
        
        self.cellData = Observable.combineLatest(title, category, price, detail)
        { [$0, $1, $2, $3]}.asDriver(onErrorJustReturn: [])
        
        let titleMessage = titleTextFieldCellViewModel.titleText.map { $0?.isEmpty ?? true }.startWith(true)
            .map { $0 ? ["글 제목을 입력해주세요."] : [] }
        
        let categoryMessage = categoryViewModel.selectedCategory.map { _ in false }.startWith(true)
            .map { $0 ? ["- 카테고리를 선택해주세요."] : [] }
        
        let detailMessage = detatilWriteFormCellViewModel.contentValue.map { $0?.isEmpty ?? true }.startWith(true).map { $0 ? ["- 내용을 입력해주세요."] : [] }
        
        let errorMessage = Observable.combineLatest(titleMessage, categoryMessage, detailMessage) { $0 + $1 + $2 }
        self.presentAlert = submitButtonTapped
            .withLatestFrom(errorMessage)
            .map(model.setAlert)
            .asSignal(onErrorSignalWith: .empty())
        self.push = itemSelected.compactMap { row -> CategoryViewModel? in
            guard case 1 = row else {
                return nil
            }
            return categoryViewModel
        }
        .asDriver(onErrorDriveWith: .empty())
    }
    
}
