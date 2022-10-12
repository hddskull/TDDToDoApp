//
//  ViewController.swift
//  TDDToDoApp
//
//  Created by Maxim Gladkov on 16.09.2022.
//

import UIKit

class TaskListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var dataProvider: DataProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

