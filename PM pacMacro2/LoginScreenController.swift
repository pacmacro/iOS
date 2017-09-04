//
//  LoginScreenController.swift
//  PM pacMacro2
//
//  Created by Josh Wu on 2016-01-29.
//  Copyright © 2016 Josh Wu. All rights reserved.
//

import UIKit

class LoginScreenController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        gameModePicker.dataSource = self
        gameModePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var currentPlayerType = Player.PlayerType.viewer
    let serverInstance = Server()
    
    // Delegates for gameModePicker
    let pickerOptions = [
        "Team Pacman",
        "Team Ghosts",
        "Blinky (Red Ghost)",
        "Pinky (Pink Ghost)",
        "Inky (Blue Ghost)",
        "Clyde (Orange Ghost)"
    ]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerOptions[row]
    }
    func selectedRow(inComponent: Int) -> String{
        return pickerOptions[inComponent]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerOptions[row])
    }
    
    @IBOutlet weak var gameModePicker: UIPickerView!
    
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
