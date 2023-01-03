//
//  ConversationTableViewCell.swift
//  final
//
//  Created by baccoucheyessin on 2/1/2023.
//

import SwiftUI
import UIKit

class ConversationTableViewCell: UITableViewCell {

    @IBOutlet weak var messagechatlabel: UILabel!
    @IBOutlet weak var usernamechatlabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
