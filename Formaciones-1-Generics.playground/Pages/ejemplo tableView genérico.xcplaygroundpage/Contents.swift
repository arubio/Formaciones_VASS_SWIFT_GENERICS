import UIKit
import PlaygroundSupport

protocol GenericCell {
  associatedtype CellState
  
  func configCell(_ viewState: CellState)
  static var identifier: String { get }
}

protocol GenericTableViewCoordinatorDelegate {
  associatedtype CellState
  
  var cellData: [CellState] { get }
}

class GenericTableViewCoordinator<Cell, CellState, Delegate>: NSObject, UITableViewDataSource, UITableViewDelegate where
  Cell: UITableViewCell & GenericCell,
  Cell.CellState == CellState,
  Delegate: GenericTableViewCoordinatorDelegate & AnyObject,
  Delegate.CellState == CellState {
  
  weak var delegate: Delegate?
  var didSelectRow: ((IndexPath) -> Void)?
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return delegate?.cellData.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier) as? Cell else { return Cell() }
    
    guard let delegate = self.delegate else { fatalError("We don't have a GenericTableViewCoordinatorDelegate") }
    
    let celldata = delegate.cellData[indexPath.row]
    cell.configCell(celldata)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    didSelectRow?(indexPath)
  }
}

struct User {
  let name: String
  let platform: String
}

class UserCell: UITableViewCell, GenericCell {
  static var identifier = "UserCellIdentifier"
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func configCell(_ viewState: User) {
    textLabel?.text = "\(viewState.name), \(viewState.platform)"
  }
}

extension UITableView {
  func register<C: UITableViewCell & GenericCell>(_ t: C.Type) {
    register(C.self, forCellReuseIdentifier: C.identifier)
  }
}

class GenericTableViewController<Cell, CellState>: UIViewController, GenericTableViewCoordinatorDelegate where
  Cell: UITableViewCell & GenericCell,
  CellState == Cell.CellState {
  
  private let tableView = UITableView()
  private var tableCoordinator: GenericTableViewCoordinator<Cell, CellState, GenericTableViewController>!
  
  var cellData: [CellState] = [] {
    didSet { tableView.reloadData() }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configViews()
  }
  
  private func configViews() {
    tableView.frame = view.bounds
    
    view.addSubview(tableView)
    view.backgroundColor = .white
    
    title = "TableViewGenérico"
    
    tableView.register(UserCell.self)
    
    tableCoordinator = GenericTableViewCoordinator<Cell, CellState, GenericTableViewController>()
    tableCoordinator.delegate = self
    
    tableView.delegate = tableCoordinator
    tableView.dataSource = tableCoordinator
  }
}



let vc = GenericTableViewController<UserCell, User>()

PlaygroundPage.current.liveView = UINavigationController(rootViewController: vc)

vc.cellData = [
  .init(name: "Adrián", platform: "iOS"),
  .init(name: "Miguel Ángel", platform: "Xamarin"),
  .init(name: "Iván", platform: "IOS"),
    .init(name: "ep", platform: "??")
]
