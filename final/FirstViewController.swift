//
//  FirstViewController.swift
//  final
//
//  Created by Stu_19 on 2017/6/8.
//  Copyright © 2017年 mcu. All rights reserved.
//

import UIKit
import FirebaseDatabase
class FirstViewController: UIViewController{
    var ref : DatabaseReference?
    var nameList1 : [String] = []
    
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        ref?.child("餐廳").observe(.childAdded,with:{(snapshot)in
            if let item = snapshot.key as? String{
                // print(item+"1")
                self.nameList1.append(item)
               }
        })

        }
    @IBAction func showAlert() {
        let alertController = UIAlertController(title: "錯誤", message: "請輸入餐廳名稱！不能為空值！", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        if nameTextField.text != "" {
            ref = Database.database().reference()
            ref?.child("餐廳").child(nameTextField.text!).child("restaurant value").setValue(nameTextField.text!)
                    }
        else{
            showAlert()

       }
    }
    @IBAction func randomFood(_ sender: Any) {
        let count = UInt32(nameList1.count);
        let n:UInt32 = UInt32(arc4random_uniform(count))
        let n1 = Int(n)
        print(n1)
        foodLabel.text = nameList1[n1]
    }
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
   
     

}

