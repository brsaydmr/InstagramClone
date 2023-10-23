//
//  ScrollViewDelegate.swift
//  InstagramClone
//
//  Created by Barış Aydemir on 21.10.2023.
//

import Foundation
import UIKit

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == self.tableView {
            DispatchQueue.main.async {
                let yOffset = scrollView.contentOffset.y
                
                if yOffset > 0 {
                    self.collectionViewHeightConstraint.constant = max(self.collectionViewOriginalHeight - yOffset, 0)
                } else {
                    self.collectionViewHeightConstraint.constant = self.collectionViewOriginalHeight
                }
            }
        }
    }
}
