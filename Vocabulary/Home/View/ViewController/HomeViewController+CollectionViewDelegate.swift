//
//  HomeViewController+CollectionViewDelegate.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 12/12/2025.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vocabList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        let model = vocabList[indexPath.row]
        cell.configureCell(model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageHeight = collectionView.frame.height
        let newPage = Int(scrollView.contentOffset.y / pageHeight)
        guard newPage != currentIndex else { return }
        currentIndex = newPage
        generator.impactOccurred()
    }
}
