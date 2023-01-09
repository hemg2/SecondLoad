//
//  MainModel.swift
//  SecondUpLoad
//
//  Created by 1 on 2023/01/09.
//

import Foundation


struct MainModel {
    func setAlert(errorMessages: [String]) -> (title: String, message: String?) {
        let title = errorMessages.isEmpty ? "성공": "실패"
        let message = errorMessages.isEmpty ? nil : errorMessages.joined(separator: "\n")
        return (title: title, message: message)
    }
}
