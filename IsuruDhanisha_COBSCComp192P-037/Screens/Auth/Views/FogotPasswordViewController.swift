//
//  FogotPasswordViewController.swift
//  IsuruDhanisha_COBSCComp192P-037
//
//  Created by Isuru Dhanisha  on 2021-03-07.
//

import UIKit
import Firebase
import FirebaseAuth

class FogotPasswordViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var txt_FEmail: UITextField!
    var PresentAlert: (() -> Void)?
    
    @IBAction func btn_updateClicked(_ sender: Any) {
        
        if(txt_FEmail.text == nil){
            print("Please Enter your Email")
            self.PresentAlert!()
        }
        else
        {
            Auth.auth().sendPasswordReset(withEmail: txt_FEmail.text!) { error in
                DispatchQueue.main.async {
                    if self.txt_FEmail.text?.isEmpty==true || error != nil {
                        let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                        resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(resetFailedAlert, animated: true, completion: nil)
                    }
                    if error == nil && self.txt_FEmail.text?.isEmpty==false{
                        let resetEmailAlertSent = UIAlertController(title: "Reset Email Sent", message: "Reset email has been sent to your login email, please follow the instructions in the mail to reset your password", preferredStyle: .alert)
                        resetEmailAlertSent.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(resetEmailAlertSent, animated: true, completion: nil)
                    }
                }
            }
            
        }
        
    }
}
