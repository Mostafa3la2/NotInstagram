//
//  FeedController.swift
//  NotInstagram
//
//  Created by Mostafa Alaa on 21/11/2021.
//

import UIKit

class FeedController : UICollectionViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    
    func configureUI(){
        self.view.backgroundColor = UIColor.white
        self.collectionView.backgroundColor = UIColor.white
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: "feedCell")
    }
}
extension FeedController{
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCell", for: indexPath) as! FeedCell
        return cell
    }
}

extension FeedController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        var height = width+8+40+8
        height += 110
        return CGSize(width: width, height: height)
    }
}
