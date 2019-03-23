//
//  myViewController.swift
//  coreDataSecd
//
//  Created by 屠秋霜 on 2018/3/30.
//  Copyright © 2018年 shuang. All rights reserved.
//

import UIKit
import CoreData
class myViewController: UITableViewController {
   var userArr = [ueser]()
   var userSelected:ueser?
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.getData()
   }
   override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.userArr.count
    }

   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 100
   }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath) as! showCell
        cell.nameLabel.text = self.userArr[indexPath.row].name
        cell.phoneLabel.text = self.userArr[indexPath.row].phone
        
        return cell
    }
   
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      self.userSelected = userArr[indexPath.row]
      performSegue(withIdentifier: "tomycard", sender: self.userSelected)
   }
   @IBAction func gotoadd(_ sender: Any) {
      performSegue(withIdentifier: "toadd", sender: nil)
   }
   
   @IBAction func todelete(_ sender: Any) {
      let appdelegate = UIApplication.shared.delegate as! AppDelegate
      let mangedObjectContext = appdelegate.persistentContainer.viewContext
      let fetch = NSFetchRequest<NSFetchRequestResult>(entityName:"My")
      do{
         let fetchResult = try mangedObjectContext.fetch(fetch) as! [NSManagedObject]
         for info in fetchResult{
            mangedObjectContext.delete(info)
         }
         self.userArr.removeAll()
      }catch{
        print("删除出错")
      }
      do {
         try mangedObjectContext.save()
      } catch  {
         print("保存error")
      }
      self.tableView.reloadData()
   }
   //获取数据
   fileprivate func getData(){
      let appdelegate = UIApplication.shared.delegate as! AppDelegate
      let managedObjectContext = appdelegate.persistentContainer.viewContext
      let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "My")
      do {
          let fetchs = try managedObjectContext.fetch(fetch) as? [NSManagedObject]
         if let son = fetchs{
            self.userArr.removeAll()
            for info in son{
               guard  let a =  getContextToUser(context: info) else{
                  return
               }
               self.userArr.append(a)
            }
           self.tableView.reloadData()
         }
      } catch  {
         print("获取数据error")
      }
   }
   
   //转换数据
   fileprivate func getContextToUser(context:NSManagedObject) -> (ueser?){
      if let name = context.value(forKey: "name") as? String,let age = context.value(forKey: "age") as? Float,let date = context.value(forKey: "time") as? Date,let phone = context.value(forKey: "phone") as? String{
         let user = ueser(name: name, age: age, time: date, phone: phone)
         return user
      }
      return nil
   }
   //插入数据
   class func insertData(u:ueser){
      let appdelegate = UIApplication.shared.delegate as! AppDelegate
      let managedObjectContext = appdelegate.persistentContainer.viewContext
      let entity = NSEntityDescription.entity(forEntityName: "My", in: managedObjectContext)
      let managed = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
      managed.setValue(u.name, forKey: "name")
      managed.setValue(u.age, forKey: "age")
      managed.setValue(u.phone, forKey: "phone")
      managed.setValue(u.time, forKey: "time")
      do {
         try managedObjectContext.save()
      } catch  {
         print("添加失败")
      }
   }
   
   /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "tomycard",
         let vc = segue.destination as? detailViewController{
         vc.user = sender as? ueser
      }
      
   }

}
