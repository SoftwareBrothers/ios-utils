//
//  UICollectionView+Extensions.swift
//  Pods
//
//  Created by Piotr Gorzelany on 06/06/2017.
//
//

import UIKit

public extension UICollectionView {
    
    public func register<T>(cellType: T.Type) where T: UICollectionViewCell, T: NibLoadable, T: ReuseIdentifiable {
        let bundle = Bundle(for: cellType)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        self.register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    public func dequeReusableCell<T>(cellType: T.Type, for indexPath: IndexPath) -> T where T: UICollectionViewCell, T: ReuseIdentifiable {       
        return self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
}
