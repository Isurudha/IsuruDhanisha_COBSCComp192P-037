//
//  LoginViewController.swift
//  IsuruDhanisha_COBSCComp192P-037
//
//  Created by Isuru Dhanisha  on 2021-03-07.
//

import UIKit
import Firebase
import Foundation
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_password: UITextField!
    
    var didTapLogin: (() -> Void)?
    var PresentAlert: (() -> Void)?
    
    @IBAction func btn_LoginClicked(_ sender: Any) {
        validate()
    }
    
    func validate(){
        if txt_email.text?.isEmpty == true{
            let alert = UIAlertController(title: "Error", message: "Please Check Your Email and Password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if txt_password.text?.isEmpty == true{
            let alert = UIAlertController(title: "Error", message: "Please Check Your Email and Password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        Login()
    }
    
    func Login(){
        Auth.auth().signIn(withEmail: txt_email.text!, password: txt_password.text!) { [weak self] authResult, error in
            guard let strongSelf = self else {return}
            if let error = error {
                print(error.localizedDescription)
            }
            self!.CheckUser()
        }
    }
    func CheckUser(){
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "Allow_Location" )
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
    }
}
