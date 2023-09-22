//
//  Error.swift
//  TodoApp
//
//  Created by Jack Lee on 2023/08/11.
//

import UIKit

enum AppError: Error {
    case blankTextField
    case tooMuchTodos
    case unknownError
    case noData
    case couldNotSave
}

class ErrorManager {
    static let shared = ErrorManager()
    
    //MARK: - 에러 대처
    func displayErrors(_ error: AppError, inViewController viewController: UIViewController) {
        let alert: UIAlertController
        
        switch error {
        case .blankTextField:
            alert = UIAlertController(title: "내용이 비어있어요!", message: "투두 작성을 잊으신거 아니실까요?", preferredStyle: .alert)
        case .tooMuchTodos:
            alert = UIAlertController(title: "10개 이상은 집중하기 힘들지 않을까요?", message: "맨 위 목표 먼저 마무리해 주세요", preferredStyle: .alert)
        case .noData:
            alert = UIAlertController(title: "데이터가 없음", message: "데이터를 불러올 수 없었어요", preferredStyle: .alert)
        case .couldNotSave:
            alert = UIAlertController(title: "데이터 저장 오류.", message: "데이터를 저장할 수 없었습니다.", preferredStyle: .alert)
        default:
            alert = UIAlertController(title: "알 수 없는 오류", message: "알 수 없는 오류가 발생했어요!", preferredStyle: .alert)
        }
        
        let dismissAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(dismissAction)
        viewController.present(alert, animated: true)
    }
}
