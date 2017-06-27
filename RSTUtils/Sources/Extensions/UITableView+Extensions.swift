//
//  UITableView+Extensions.swift
//  Pods
//
//  Created by Piotr Gorzelany on 06/06/2017.
//
//

import UIKit

public extension UITableView {
    
    // MARK: Table header / footer
    
    public func registerHeaderFooterNib<T>(forCellType cellType: T.Type) where T:UITableViewHeaderFooterView, T: NibLoadable, T: ReuseIdentifiable {
        
        let bundle = Bundle(for: cellType)
        let nib = UINib(nibName: cellType.nibName, bundle: bundle)
        self.register(nib, forHeaderFooterViewReuseIdentifier: cellType.reuseIdentifier)
    }
    
    public func dequeReusableHeaderFooter<T>(cellType: T.Type) -> T where T: UITableViewHeaderFooterView, T: ReuseIdentifiable {
        
        return self.dequeueReusableHeaderFooterView(withIdentifier: cellType.reuseIdentifier) as! T
    }
    
    // MARK: Table cell
    
    public func registerNib<T>(forCellType cellType: T.Type) where T:UITableViewCell, T: NibLoadable, T: ReuseIdentifiable {
        
        let bundle = Bundle(for: cellType)
        let nib = UINib(nibName: cellType.nibName, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    public func dequeReusableCell<T>(withCellType cellType: T.Type) -> T where T: UITableViewCell, T: ReuseIdentifiable {
        
        return self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier) as! T
    }
}
