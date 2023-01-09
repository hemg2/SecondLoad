//
//  PriceTextFieldCellViewModel.swift
//  SecondUpLoad
//
//  Created by 1 on 2023/01/06.
//

import RxSwift
import RxCocoa
import UIKit

struct PriceTextFieldCellViewModel {
    // 모델에서 뷰로
    let showFreeShareButton: Signal<Bool>
    let resetPrice: Signal<Void>
    
    
    let priceValue = PublishRelay<String?>()
    let freeShareButtonTapped = PublishRelay<Void>()
    
    init() {
        self.showFreeShareButton = Observable.merge(priceValue.map {
            $0 ?? "" == "0"
        }, freeShareButtonTapped.map { _ in false }) .asSignal(onErrorJustReturn: false)
        
        self.resetPrice = freeShareButtonTapped
            .asSignal(onErrorSignalWith: .empty())
    }
}
