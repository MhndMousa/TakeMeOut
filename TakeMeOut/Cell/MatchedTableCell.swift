//
//  MatchedTableCell.swift
//  TakeMeOut
//
//  Created by Mhnd on 10/20/18.
//  Copyright © 2018 Mhnd. All rights reserved.
//

import UIKit

class MatchedTableCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var backgroud: UIView!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var emoji: UILabel!
    let opened = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroud.backgroundColor = UIColor(white: 0.97, alpha: 1)
        backgroud.layer.cornerRadius = 10
        backgroud.layer.shadowRadius = 10
        
        comment.numberOfLines = 4
        
        
        
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(buttonClicked))
//        gesture.numberOfTapsRequired = 1
//        backgroud.isUserInteractionEnabled = true
//        backgroud.addGestureRecognizer(gesture)
//        backgroud.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        self.selectionStyle = .none
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        self.prepareForReuse()
        // Configure the view for the selected state
    }
    override func prepareForReuse() {
//        super.prepareForReuse()
//        backgroud = nil
//        comment.text = nil
//        name.text = nil
//        emoji.text = nil
    }
}
