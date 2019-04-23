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

    public func register<T>(headerType: T.Type) where T: UICollectionReusableView, T: NibLoadable, T: ReuseIdentifiable {
        let bundle = Bundle(for: headerType)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        self.register(nib,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                      withReuseIdentifier: headerType.reuseIdentifier
        )
    }

    public func dequeReusableHeaderView<T>(headerType: T.Type, for indexPath: IndexPath) -> T
        where T: UICollectionReusableView, T: ReuseIdentifiable {
            let headerView = dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: headerType.reuseIdentifier, for: indexPath
            )

            guard let header = headerView as? T else {
                fatalError("Could no cast header")
            }

            return header
    }

    public func register<T>(footerType: T.Type) where T: UICollectionReusableView, T: NibLoadable, T: ReuseIdentifiable {
        let bundle = Bundle(for: footerType)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        self.register(nib,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                      withReuseIdentifier: footerType.reuseIdentifier
        )
    }

    public func dequeReusableFooterView<T>(footerType: T.Type, for indexPath: IndexPath) -> T
        where T: UICollectionReusableView, T: ReuseIdentifiable {
            let footerView = dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: footerType.reuseIdentifier, for: indexPath
            )

            guard let footer = footerView as? T else {
                fatalError("Could no cast header")
            }

            return footer
    }
}
