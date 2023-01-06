//
//  TitleTextCell.swift
//  SecondUpLoad
//
//  Created by 1 on 2023/01/06.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit


final class TitleTextCell: UITableViewCell {
    let disposBag = DisposeBag()
    
    
    let titleInputField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: TitleTextCellViewModel) {
        titleInputField.rx.text.bind(to: viewModel.titleText).disposed(by: disposBag)
    }
    
    
    private func attribute() {
        titleInputField.font = .systemFont(ofSize: 17)
    }
    
    private func layout() {
        contentView.addSubview(titleInputField)
        
        titleInputField.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
    }
}
