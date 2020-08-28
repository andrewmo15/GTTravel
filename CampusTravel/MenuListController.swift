//
//  MenuListController.swift
//  CampusTravel
//
//  Created by Andrew Mo on 8/26/20.
//  Copyright © 2020 Andrew Mo. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MenuListController: UITableViewController {
    
    private var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items.removeAll()
        tableView.backgroundColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        let name = UserDefaults.standard.string(forKey: "Name") ?? "Failed to Retrieve Name"
        let phone = UserDefaults.standard.string(forKey: "Phone") ?? "Failed to Retrieve Phone"
        items.append("Welcome " + name + "!")
        items.append(UserDefaults.standard.string(forKey: "Email") ?? "Failed to Retrieve Email")
        items.append(phone)
        items.append(" ")
        items.append("Edit Profile")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        items.removeAll()
        let name = UserDefaults.standard.string(forKey: "Name") ?? "Failed to Retrieve Name"
        let phone = UserDefaults.standard.string(forKey: "Phone") ?? "Failed to Retrieve Phone"
        items.append("Welcome " + name + "!")
        items.append(UserDefaults.standard.string(forKey: "Email") ?? "Failed to Retrieve Email")
        items.append(phone)
        items.append(" ")
        items.append("Edit Profile")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 125
        case 1,2,3,4:
            return 50
        default:
            return 50
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        if indexPath.row == 0 {
            cell.textLabel?.font = .systemFont(ofSize: 30)
        }
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.numberOfLines = 3
        cell.textLabel?.textColor = .white
        cell.backgroundColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 4:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "edit")
            vc.modalPresentationStyle = .automatic
            present(vc, animated: true)
        default:
            break
        }
    }
}
