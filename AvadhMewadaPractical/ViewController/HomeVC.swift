//
//  HomeVC.swift
//  AvadhMewadaPractical
//
//  Created by Avadh Mevada on 23/12/22.
//

import UIKit

class HomeVC: UIViewController, cellButtonProtocols {


    @IBOutlet weak var homeTableView: UITableView!
    var selectedPics: [Int] = []
    var likedPics: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    func didPressSaveButton(_ tag: Int) {
        let item = tag
        let result = selectedPics.firstIndex(where: {$0 == item})
        print("\(result ?? 0)")
        if result != nil {
            selectedPics.remove(at: result!)
        }else{
            self.selectedPics.append(item)
        }
        homeTableView.reloadData()
    }
    
    func didPressLikeButton(_ tag: Int) {
        let item = tag
        let result = likedPics.firstIndex(where: {$0 == item})
        if result != nil {
            likedPics.remove(at: result!)
        }else{
            self.likedPics.append(item)
        }
        homeTableView.reloadData()
    }
    
}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 19
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        
        cell.mainImage.image = UIImage(named: "\(indexPath.row)")
        cell.selectionStyle = .none
        cell.cellDelegate = self
        cell.tagButtonSave.tag = indexPath.row
        cell.likeButtonTag.tag = indexPath.row
        cell.likeButtonTag.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    
        if selectedPics.contains(indexPath.row){
            cell.savedFlowsButton.isHidden = false
            cell.tagButtonSave.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            
        }else{
            cell.savedFlowsButton.isHidden = true
            cell.tagButtonSave.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
        
        if likedPics.contains(indexPath.row){
            print("yes")
            cell.likeButtonTag.tintColor = .red
        }else{
            cell.likeButtonTag.tintColor = .white
        }
        
        return cell
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return homeTableView.frame.height
    }
    
    
}
