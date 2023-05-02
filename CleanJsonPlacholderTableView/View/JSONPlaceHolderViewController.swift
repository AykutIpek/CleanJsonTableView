//
//  ViewController.swift
//  CleanJsonPlacholderTableView
//
//  Created by aykut ipek on 2.05.2023.
//

import UIKit

final class JSONPlaceHolderViewController: UIViewController {
    //MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        return tableView
    }()
    private let jsonTableView: JSONTableView = JSONTableView()
    private let jsonService: JSONPlaceholderServiceProtocol = JSONPlaceHolderService()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Helpers
extension JSONPlaceHolderViewController{
    private func setupUI(){
        style()
        layout()
        initDelegate()
        initService()
    }
    private func initDelegate(){
        tableView.delegate = jsonTableView
        tableView.dataSource = jsonTableView
        jsonTableView.delegate = self
    }
    private func initService(){
        jsonService.fetchAllPosts {[weak self] models in
            self?.jsonTableView.updates(items: models)
            self?.tableView.reloadData()
        } onFail: { data in
            print(data ?? "")
        }

    }
    private func style(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension JSONPlaceHolderViewController: JSONTableViewOutput{
    func onSelected(item: PostModel) {
        print(item.title ?? "")
    }
}
