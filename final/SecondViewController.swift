//
//  SecondViewController.swift
//  final
//
//  Created by Stu_19 on 2017/6/8.
//  Copyright © 2017年 mcu. All rights reserved.
//

import UIKit
import FirebaseDatabase
class SecondViewController: UIViewController ,UITableViewDataSource{
    var ref : DatabaseReference?
    var nameList : [String] = []

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        ref?.child("餐廳").observe(.childAdded,with:{(snapshot)in
            if let item = snapshot.key as? String{
               // print(item+"1")
                self.nameList.append(item)
                self.myTableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        cell.textLabel?.text = nameList[indexPath.row]
        return cell
    }



}

