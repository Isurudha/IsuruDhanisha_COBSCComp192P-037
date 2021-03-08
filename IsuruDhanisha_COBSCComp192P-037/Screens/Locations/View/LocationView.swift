//
//  LocationView.swift
//  IsuruDhanisha_COBSCComp192P-037
//
//  Created by Isuru Dhanisha  on 2021-03-02.
//

import UIKit

@IBDesignable class LoactionView: BaseView{
    @IBOutlet weak var allowButton: UIButton!
    @IBOutlet weak var denyButton: UIButton!
    
    var didTapAllow: (() -> Void)?
    
    @IBAction func handleAllow(_ sender: UIButton){
        didTapAllow?()
    }
    
    @IBAction func handleDeny(_ sender: UIButton){
        
    }
}
