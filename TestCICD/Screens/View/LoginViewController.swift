//
//  LoginViewController.swift
//  TestCICD
//
//  Created by APPLE on 30/08/26.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(
            withIdentifier: "FAQViewController") as! FAQViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
