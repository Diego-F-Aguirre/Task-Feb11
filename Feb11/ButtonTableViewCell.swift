//
//  ButtonTableViewCell.swift
//  Feb11
//
//  Created by Diego Aguirre on 2/15/16.
//  Copyright © 2016 kumar.retika. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    

    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var delegate: ButtonTableViewCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
   
    @IBAction func buttonTapped(sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.buttonCellButtonTapped(self)
        }
    }
    

    func updateButton(isComplete: Bool) {
        
        if isComplete {
            button.setImage(UIImage(named: "checkBox"), forState: .Normal)
        } else {
            button.setImage(UIImage(named: "checkBoxEmpty"), forState: .Normal)
        }
    }
}

protocol ButtonTableViewCellDelegate {
    
   func buttonCellButtonTapped(sender: ButtonTableViewCell)
}

extension ButtonTableViewCell {
    
    func updateWithTask(task:Task) {
        
        primaryLabel.text = task.name
        updateButton(task.isComplete.boolValue)
    }
}
















