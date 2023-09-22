//
//  TodoManager.swift
//  TodoApp
//
//  Created by Jack Lee on 2023/09/22.
//

import UIKit
import CoreData

class TodoManager {
    static let shared: TodoManager = TodoManager()
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    let containerName: String = "Todo"
    
    // CoreData에 있는 값을 호출
    func fetchData() -> [Todo] {
        var models: [Todo] = [Todo]()
        
        if let context = context {
            let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: containerName)
            do {
                if let fetchResult: [Todo] = try context.fetch(fetchRequest) as? [Todo] {
                    models = fetchResult
                }
            } catch let error as NSError {
                print("데이터 부재 발생: \(error.localizedDescription)")
            }
        }
        return models
    }
    
    // 투두 데이터 저장
    func saveTodo(title: String, isCompleted: Bool = false, section: String, onSuccess: ((Bool) -> Void)? = nil) {
        if let context = context,
           let entity: NSEntityDescription = NSEntityDescription.entity(forEntityName: containerName, in: context) {
            if let todoData: Todo = NSManagedObject(entity: entity, insertInto: context) as? Todo {
                todoData.id = UUID()
                todoData.title = title
                todoData.isCompleted = isCompleted
                todoData.section = section
                contextSave { success in
                    onSuccess?(success)
                }
            }
        }
    }
    
    func deleteTodo(id: UUID, title: String, isCompleted: Bool, section: String, onSuccess: ((Bool) -> Void)? = nil) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = filteredRequest(id: id)
        
        do {
            if let results: [Todo] = try context?.fetch(fetchRequest) as? [Todo] {
                if results.count != 0 {
                    let result = results[0]
                    result.title = title
                    result.isCompleted = isCompleted
                    result.section = section
                    
                    contextSave { success in
                        onSuccess?(success)
                    }
                }
            }
        } catch let error as NSError{
            print("에러가 발생했습니다. \(error) - \(error.description)")
            onSuccess?(false)
        }
    }
}

extension TodoManager {
    fileprivate func contextSave(onSuccess: ((Bool) -> Void)) {
        do {
            try context?.save()
            onSuccess(true)
        } catch let error as NSError {
            print("저장이 되지 않았습니다. \(error), \(error.description)")
            onSuccess(false)
        }
    }
    
    fileprivate func filteredRequest(id: UUID) -> NSFetchRequest<NSFetchRequestResult> {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
            = NSFetchRequest<NSFetchRequestResult>(entityName: containerName)
        fetchRequest.predicate = NSPredicate(format: "id = %@", id as CVarArg)
        return fetchRequest
    }
}
