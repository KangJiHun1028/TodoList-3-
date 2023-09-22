import CoreData
import UIKit

// 할 일 항목들이 체크된 상태를 보여주는 뷰 컨트롤러입니다.
class TodoDoneViewController: UIViewController, UITableViewDataSource {
    var selectedTask: Contact? // 선택된 할 일 항목을 저장하는 변수입니다.
    var checkedTasks: [Contact] = [] // 체크된 할 일 항목들을 저장하는 배열입니다.
    private var table: UITableView! // 테이블 뷰를 선언합니다.

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupTableView() // 테이블 뷰를 설정합니다.

        let todoModel = TodoModel()
        todoModel.getCheckedTasks() // 체크된 할 일 항목들을 가져옵니다.

        checkedTasks = todoModel.memoList // 가져온 데이터를 배열에 저장합니다.
    }

    private func setupTableView() {
        table = UITableView(frame: view.bounds, style: .plain) // 테이블 뷰 인스턴스를 생성하고 화면에 맞게 크기를 설정합니다.
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell") // 셀의 재사용을 위해 등록합니다.
        table.dataSource = self // 데이터 소스를 현재 클래스로 설정합니다.
        view.addSubview(table) // 테이블 뷰를 서브뷰로 추가하여 화면에 보여줍니다.
    }

    /* UITableViewDataSource 프로토콜 메서드:
     각 섹션의 셀 수(행 수)를 반환합니다. 여기서는 체크된 할 일 항목의 수와 같습니다.*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkedTasks.count
    }

    /* UITableViewDataSource 프로토콜 메서드:
     각 셀에 대한 내용과 동작 방식을 결정하는 메서드입니다.*/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /* dequeueReusableCell(withIdentifier:, for:) 메서드는 재사용 가능한 셀 객체가 있으면 해당 객체를 반환하고,
         없으면 새로운 객체를 생성하여 반환하는 역할을 합니다.*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let task = checkedTasks[indexPath.row] // 현재 셀의 할 일 항목 데이터

        if let title = task.title { // "title" 필드 값(할 일 제목)으로 셀의 텍스트 라벨 값을 설정
            cell.textLabel?.text = title
        }

        return cell
    }
}
