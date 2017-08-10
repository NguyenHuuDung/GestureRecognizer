//
//  BlockRoration.swift
//  Pods
//
//  Created by Nguyễn Hữu Dũng on 8/10/17.
//
//


import UIKit


open class BlockRoration: UIRotationGestureRecognizer {
    private var rorationAction: ((UIRotationGestureRecognizer) -> Void)?
    
    public override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }
    
    public convenience init (action: ((UIRotationGestureRecognizer) -> Void)?) {
        self.init()
        rorationAction = action
        addTarget(self, action: #selector(BlockRoration.didRoration(_:)))
    }
    
    open func didRoration(_ roration: UIRotationGestureRecognizer) {
     
            rorationAction?(roration)
        
    }
}
