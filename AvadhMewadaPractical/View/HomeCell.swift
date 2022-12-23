//
//  HomeCell.swift
//  AvadhMewadaPractical
//
//  Created by Avadh Mevada on 23/12/22.
//

import UIKit

protocol cellButtonProtocols : AnyObject {
    func didPressSaveButton(_ tag: Int)
    func didPressLikeButton(_ tag: Int)
}

class HomeCell: UITableViewCell {

    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var savedFlowsButton: UIButton!
    
    @IBOutlet weak var tagButtonSave: UIButton!
    
    @IBOutlet weak var likeButtonTag: UIButton!
    
    var cellDelegate: cellButtonProtocols?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

    @IBAction func likeButtonPresed(_ sender: Any) {
        cellDelegate?.didPressLikeButton((sender as AnyObject).tag)
    }
    @IBAction func saveButtonPressedAction(_ sender: Any) {
        cellDelegate?.didPressSaveButton((sender as AnyObject).tag)
    }
}
