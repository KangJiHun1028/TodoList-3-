import CoreData
import Foundation
import UIKit

class TodoModel {
    // 앱의 AppDelegate 인스턴스를 가져옵니다.
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    // CoreData의 context를 가져옵니다. 이 context를 통해 데이터를 저장하고 조회할 수 있습니다.
    lazy var context = appDelegate.persistentContainer.viewContext

    // 할 일 항목들을 저장하는 배열입니다.
    var memoList: [Contact] = []

    // 새로운 할 일 항목을 CoreData에 저장하는 메서드입니다.
    func saveTodoData(title: String) {
        let contact = Contact(context: context)
        contact.title = title
        contact.isChecked = false // 새로운 할 일 항목은 기본적으로 체크되지 않은 상태입니다.

        do {
            try context.save() // 변경사항을 저장합니다.
        } catch let error as NSError {
            print("저장하지 못했습니다. \(error), \(error.userInfo)")
        }
    }

    // 체크된 할 일 항목들만 CoreData에서 가져오는 메서드입니다.
    func getCheckedTasks() {
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        request.predicate = NSPredicate(format: "isChecked == %@", NSNumber(value: true))

        do {
            memoList = try context.fetch(request)
        } catch {
            print(error)
        }
    }

    // 모든 할 일 항목들을 CoreData에서 가져오는 메서드입니다.
    func getTodoData() {
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()

        do {
            memoList = try context.fetch(request)
        } catch {
            print(error)
        }
    }

    /* 특정 이름의 할 일 항목의 'isChecked' 상태를 업데이트하는 메서드입니다.
     예를 들어, 사용자가 셀을 탭하여 해당 항목을 완료했다고 표시하면 이 메서드가 호출됩니다.*/
    func updateIsCheckedStatus(forItemWithName itemName: String, to status: Bool) {
        /* 'title' 속성이 itemName과 같은 객체에 대한 요청을 생성합니다.
         이 요청은 하나 또는 그 이상의 결과(해당 이름의 모든 할 일 항목)를 반환할 수 있습니다.*/
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        request.predicate = NSPredicate(format: "title == %@", itemName)

        do {
            /* 요청된 객체들(여기서는 'title'이 itemName과 같은 모든 객체)을 가져옵니다.
             결과가 여러 개일 경우에도 첫 번째 결과만 사용합니다.*/
            let results = try context.fetch(request)

            if let resultToUpdate = results.first {
                /* 'isChecked' 속성을 업데이트합니다.
                 이 값은 사용자가 할 일 항목의 체크 상태를 변경할 때마다 변경됩니다.*/
                resultToUpdate.setValue(status, forKey: "isChecked")

                do {
                    try context.save() // 변경사항을 저장합니다.
                } catch {
                    print("Failed saving")
                }
            }
        } catch {
            print("Failed getting results")
        }
    }
}
