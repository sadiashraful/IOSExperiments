//
//  ViewController.swift
//  TableViewCode
//
//  Created by Mohammad Ashraful Islam Sadi on 31/12/19.
//  Copyright © 2019 Wheels-Corporation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var universities = ["University Of Torronto", "Mcgill University", "University of British Columbia",
                        "University of Alberta", "University of Ottowa", "University of Calgary",
                        "Simon Fraser University", "University of Waterloo"]
    
    override func loadView() {
        super.loadView()
        setupTableView()

    }
    
    func setupTableView(){
        title = "Canadian Universities"
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = universities[indexPath.row]
        return cell
    }
}
