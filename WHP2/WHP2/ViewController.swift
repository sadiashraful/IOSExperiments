//
//  ViewController.swift
//  WHP2
//
//  Created by Mohammad Ashraful Islam Sadi on 8/1/20.
//  Copyright © 2020 Wheels-Corporation. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let urlString:String
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else if navigationController?.tabBarItem.tag == 1 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        } else if navigationController?.tabBarItem.tag == 2 {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        } else if navigationController?.tabBarItem.tag == 3 {
            urlString = "my-json-server.typicode.com/user/repo/posts/1"
        } else if navigationController?.tabBarItem.tag == 4 {
            urlString = "www.hackingwithswift.com"
        } else {
            urlString = "www.kcl.ac.uk"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }

        showError()
    }
    
    func showError(){
        let alertController = UIAlertController(title: "Loading error",
                                                message: "There was a problem loading the feed, please check your connection and try again.",
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json){
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailViewController()
        viewController.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}

