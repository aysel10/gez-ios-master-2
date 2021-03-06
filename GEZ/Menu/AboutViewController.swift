//
//  AboutViewController.swift
//  GEZ
//
//  Created by Ayselkas on 6/30/18.
//  Copyright © 2018 IceL. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

   
    @IBOutlet weak var menu: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.target = self.revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().rearViewRevealWidth = 240
        // Do any additional setup after loading the view.
    }
    @IBAction func openMenu(_ sender: Any) {
        let btnTitle = (sender as AnyObject).currentTitle!
        self.revealViewController().rearViewController.performSegue(withIdentifier: btnTitle!, sender: self.revealViewController().rearViewController)
        
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
