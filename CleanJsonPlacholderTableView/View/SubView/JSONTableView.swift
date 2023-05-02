//
//  JSONTableView.swift
//  CleanJsonPlacholderTableView
//
//  Created by aykut ipek on 2.05.2023.
//

import UIKit


protocol JSONTableViewProtocol{
    func updates(items: [PostModel])
}

protocol JSONTableViewOutput: AnyObject{
    func onSelected(item: PostModel)
}

final class JSONTableView: NSObject {
    private lazy var items: [PostModel] = []
    weak var delegate: JSONTableViewOutput?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row].title
        cell.detailTextLabel?.text = items[indexPath.row].body
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(item: items[indexPath.row])
    }
}

// MARK: - Helpers
extension JSONTableView: UITableViewDelegate, UITableViewDataSource{}
extension JSONTableView: JSONTableViewProtocol{
    func updates(items: [PostModel]) {
        self.items = items
    }
}
