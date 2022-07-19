//
//  ViewController.swift
//  pagination-ios
//
//  Created by Connor Przybyla on 7/19/22.
//

import UIKit

class ViewController: UITableViewController {

    private static let cellID = "CellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // MARK: - Auto Layout
    
    private func configureTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.cellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

// MARK: - UITableViewDatasource

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellID, for: indexPath)
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
}

// MARK: - UIScrollViewDelegate

extension ViewController {
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > tableView.contentSize.height - 100 - scrollView.frame.size.height {
            print("Loading more data!")
        }
    }
}
