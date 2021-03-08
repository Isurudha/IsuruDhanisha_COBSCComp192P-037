//
//  SignUpViewController.swift
//  IsuruDhanisha_COBSCComp192P-037
//
//  Created by Isuru Dhanisha  on 2021-03-07.
//

import UIKit
import Firebase
import Foundation
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var txt_Email: UITextField!
    @IBOutlet weak var txt_phoneNo: UITextField!
    @IBOutlet weak var txt_password: UITextField!
    @IBOutlet weak var txt_rePassword: UITextField!
    var ref: DatabaseReference!
    
    @IBAction func btnSignup_Clicked(_ sender: Any) {
        SignUp()
    }
    
    func SignUp(){
        if(txt_password.text == txt_rePassword.text){
            Auth.auth().createUser(withEmail: txt_Email.text!,password: txt_password.text!) { (authResult, error) in
                if let error = error as NSError? {
                    switch AuthErrorCode(rawValue: error.code) {
                    case .operationNotAllowed:
                        let alert = UIAlertController(title: "Error", message: "Email is not allowed..!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        break
                    case .emailAlreadyInUse:
                        let alert = UIAlertController(title: "Error", message: "The email address is already in use by another account.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        break
                        
                    case .invalidEmail:
                        let alert = UIAlertController(title: "Error", message: "The email address is badly formatted. ", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        break
                    case .weakPassword:
                        let alert = UIAlertController(title: "Error", message: "The password must be 6 characters long or more . ", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        break
                    default:
                        let alert = UIAlertController(title: "Error", message: "Something is wrong", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                print("User signs up successfully")
                let newUserInfo = Auth.auth().currentUser
                let email = newUserInfo?.email
                self.ref = Database.database().reference()
                self.ref.child("users").child(self.txt_phoneNo.text ?? "0").setValue(["email": self.txt_Email.text!])
                if let error = error {
                    let alert = UIAlertController(title: "Failed", message: "Please Meet Your Service Provider", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    return
                }
                let alertController: UIAlertController = UIAlertController(title: "Success", message: "User Registration is Successful", preferredStyle: .alert)
                
                let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default) { action -> Void in
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(identifier: "Allow_Location" )
                    vc.modalPresentationStyle = .overFullScreen
                    self.present(vc, animated: true)
                    self.navigationController?.pushViewController(vc,animated: true)
                }
                
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Password Didnt Match", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
    }
}
