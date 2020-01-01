//
//  MenuViewController.swift
//  GEZ
//
//  Created by Ayselkas on 6/29/18.
//  Copyright © 2018 IceL. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var menuNameArr:Array = [String]()
    var iconeImage:Array = [UIImage]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        cell.menuIcon.image = iconeImage[indexPath.row]
        cell.name.text! = menuNameArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        self.performSegue(withIdentifier: menuNameArr[indexPath.row],sender: self)
        
//        let revealViewController: SWRevealViewController = self.revealViewController()
//
//        let cell:MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
//
//        if cell.name.text! == "Home"{
//            let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main",bundle: nil)
//            let desController = mainStoryboard.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
          //  let newController = navigationController?.instantiateViewController(desController)
            
           // revealViewController.pushViewController(desController,animated:true)
        
     
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        menuNameArr = ["Home","Settings", "About", "Contacts", "Bonus","Support"]
        iconeImage = [UIImage(named:"home")!,UIImage(named:"user")!,UIImage(named:"information")!,UIImage(named:"contacts")!,UIImage(named:"like")!, UIImage(named:"support")!]
      
        // Do any additional setup after loading the view.
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
