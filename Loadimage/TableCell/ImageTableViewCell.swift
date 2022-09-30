//
//  ImageTableViewCell.swift
//  Loadimage
//
//  Created by admin on 30/09/2022.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet private var lbName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateUI(_ data: ImageData) {
        lbName.text  = data.name
    }

}
