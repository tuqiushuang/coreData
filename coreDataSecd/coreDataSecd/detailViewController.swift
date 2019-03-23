//
//  detailViewController.swift
//  coreDataSecd
//
//  Created by 屠秋霜 on 2018/3/30.
//  Copyright © 2018年 shuang. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

   @IBOutlet weak var name: UILabel!
   @IBOutlet weak var phone: UILabel!
   var user:ueser?
   override func viewDidLoad() {
      super.viewDidLoad()
      self.name.text = user?.name
      self.phone.text = user?.phone
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
 

}
