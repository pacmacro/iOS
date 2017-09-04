//
//  LoginScreenController.swift
//  PM pacMacro2
//
//  Created by Josh Wu on 2016-01-29.
//  Copyright © 2016 Josh Wu. All rights reserved.
//

import UIKit

class LoginScreenController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBOutlet weak var loginButton: UIButton!
    // TODO Check if selection is valid
    // No other player has taken selected viewer
    @IBAction func loginClicked(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "toMapView", sender: self)
    }
}
