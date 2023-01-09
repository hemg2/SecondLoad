//
//  DetailWriteFormCellViewModel.swift
//  SecondUpLoad
//
//  Created by 1 on 2023/01/09.
//

import UIKit
import RxSwift
import RxCocoa


struct DetailWriteFormCellViewModel {
    // 뷰에서 뷰모델
    let contentValue = PublishRelay<String?>()
}
