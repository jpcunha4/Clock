//
//  AlarmTableViewCell.swift
//  Clock
//
//  Created by Joao Paulo Cunha Ávila on 06/07/18.
//  Copyright © 2018 Joao Paulo Cunha Ávila. All rights reserved.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //This function makes an alarm either available or not
    @IBAction func changeState(_ sender: Any) {
        print("State: \(alarmSwitch.isOn ? "on" : "off")")
    }
}
