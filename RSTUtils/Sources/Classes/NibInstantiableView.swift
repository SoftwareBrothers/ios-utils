//
//  NibInstantiableView.swift
//  Pods
//
//  Created by Piotr Gorzelany on 06/06/2017.
//
//

import Foundation
import UIKit

open class NibInstantiableView: UIView {
    
    open var nibName: String {
        return String(describing: type(of: self))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        instantiateFromNib()
        configureView()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        instantiateFromNib()
        configureView()
    }
    
    open func instantiateFromNib() {
        let type = Swift.type(of: self)
        let bundle = Bundle(for: type.self)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        insertSubviewConstrainedToEdges(nibView, at: 0)
    }
    
    /** Called after view is instantated from a XiB */
    open func configureView() {
        // Implement in subclasses
        // This method is here so it is always called in the initializers after the view was instantaited from the Nib.
        // It gives the subclass a chance to configure the view in the initializer and not repeat boilerplate init code
    }
}
