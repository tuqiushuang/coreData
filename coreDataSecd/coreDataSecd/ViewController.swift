//
//  ViewController.swift
//  coreDataSecd
//
//  Created by 屠秋霜 on 2018/3/30.
//  Copyright © 2018年 shuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   @IBOutlet weak var name: UITextField!
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }

   @IBAction func tosave(_ sender: Any) {
      
      let str = self.name.text ?? "nihao"
      let phone = "12345678901"
      let time = Date()
      let age:Float = 1.0
      
      let u = ueser(name: str, age: age, time: time, phone: phone)
      myViewController.insertData(u: u)
      
      self.navigationController?.popViewController(animated: true)
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

