//
//  ViewController.swift
//  HelloWorldTest
//
//  Created by Ajin on 11/08/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }


    @IBAction func showButtonAction(sender:UIButton){
        print(sender.titleLabel)
    }
}

