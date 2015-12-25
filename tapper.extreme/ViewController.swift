//
//  ViewController.swift
//  tapper.extreme
//
//  Created by Carl Henningsson on 12/25/15.
//  Copyright © 2015 Carl Henningsson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Properties
    var maxTaps = 0
    var currentTaps = 0
    
    //Outlet
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howmanytaps: UITextField!
    @IBOutlet weak var playbnt: UIButton!
    
    @IBOutlet weak var coinbtn: UIButton!
    @IBOutlet weak var taplabel: UILabel!
    
    @IBOutlet weak var done: UILabel!
    
    @IBAction func onCoinBtn(sender: UIButton!) {
        currentTaps++
        updateTapsLable()
        
        if isGameOver() {
            restartGame()
        }
    }
    
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        if howmanytaps.text != nil && howmanytaps.text != "" {
            if let numberOfTaps = Int(howmanytaps.text!) {
                
                logoImg.hidden = true
                howmanytaps.hidden = true
                playbnt.hidden = true
                done.hidden = true
                
                coinbtn.hidden = false
                taplabel.hidden = false
                
                maxTaps = numberOfTaps
                currentTaps = 0
            }
            updateTapsLable()
        }
    }
    
    func restartGame() {
        maxTaps = 0
        howmanytaps.text = ""
        
        logoImg.hidden = false
        howmanytaps.hidden = false
        playbnt.hidden = false
        done.hidden = false
        
        coinbtn.hidden = true
        taplabel.hidden = true
    }
    
    func isGameOver() -> Bool{
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    func updateTapsLable() {
        taplabel.text = "\(currentTaps) Taps"
    }
    
}

