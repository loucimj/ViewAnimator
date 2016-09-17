//
//  Animatable.swift
//  ViewAnimator
//
//  Created by Javier Loucim on 9/16/16.
//  Copyright © 2016 Javier Loucim. All rights reserved.
//

import Foundation
import UIKit

struct AnimatableConstants {
    static var animationDuration:NSTimeInterval = 0.70
    static var damping:CGFloat = 0.75
    static var springVelocity:CGFloat = 15
    static var disabledAlphaLevel:CGFloat = 0.5
}

protocol Animatable {
    
}

extension Animatable where Self: UIView {


    //MARK: - Animations
    func shrinkAndDisable(widthShrink:CGFloat = 20 , heightShrink:CGFloat = 10, completionBlock: (()->())? = nil) {
        
        self.userInteractionEnabled = false

        let constraints = getHeightAndWidthConstraints()
        
        if let _ = constraints.widthConstraint, let _ = constraints.heightConstraint {
            let percentage = 1 - (widthShrink/constraints.widthConstraint!.constant)
            UIView.animateWithDuration(AnimatableConstants.animationDuration, delay: 0, usingSpringWithDamping: AnimatableConstants.damping, initialSpringVelocity: AnimatableConstants.springVelocity, options: UIViewAnimationOptions.BeginFromCurrentState,
                animations: {
                    constraints.widthConstraint!.constant -= widthShrink
                    constraints.heightConstraint!.constant -= heightShrink
                    self.alpha = AnimatableConstants.disabledAlphaLevel
                    if self.isKindOfClass(UIImageView) {
                        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, percentage, percentage)
                    }
                self.layoutIfNeeded()
                }, completion: { _ in
                    completionBlock?()
                }
            )
        } else {
            print ("[Animatable protocol] Cannot detect width and height constraints!")
        }
        
        
    }
    
    func extendAndEnable(widthShrink:CGFloat = 20 , heightShrink:CGFloat = 10, completionBlock: (()->())? = nil) {

        self.userInteractionEnabled = true
        
        let constraints = getHeightAndWidthConstraints()
        
        if let _ = constraints.widthConstraint, let _ = constraints.heightConstraint {
            UIView.animateWithDuration(AnimatableConstants.animationDuration, delay: 0, usingSpringWithDamping: AnimatableConstants.damping, initialSpringVelocity: AnimatableConstants.springVelocity, options: UIViewAnimationOptions.BeginFromCurrentState,
                animations: {
                    constraints.widthConstraint!.constant += widthShrink
                    constraints.heightConstraint!.constant += heightShrink
                    self.alpha = 1
                    self.layoutIfNeeded()
                    if self.isKindOfClass(UIImageView) {
                        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1)
                    }
                }, completion: { _ in
                    completionBlock?()
                }
            )
        } else {
            print ("[Animatable protocol] Cannot detect width and height constraints!")
        }
    }
    
    func disappearAndDisable(completionBlock: (()->())? = nil) {
        let constraints = getHeightAndWidthConstraints()
        
        self.userInteractionEnabled = false
        
        if let _ = constraints.widthConstraint, let _ = constraints.heightConstraint {
            
            let originalWidth = constraints.widthConstraint!.constant
            let originalHeight = constraints.heightConstraint!.constant
            self.alpha = 1
            
            UIView.animateWithDuration(AnimatableConstants.animationDuration, delay: 0, usingSpringWithDamping: AnimatableConstants.damping, initialSpringVelocity: AnimatableConstants.springVelocity, options: UIViewAnimationOptions.BeginFromCurrentState,
                animations: {
                    self.alpha = 0
                    self.layoutIfNeeded()
                    if self.isKindOfClass(UIImageView) {
                        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.1, 0.1)
                    } else {
                        constraints.widthConstraint!.constant = 0
                        constraints.heightConstraint!.constant = 0
                    }
                }, completion: { _ in
                    constraints.widthConstraint?.constant = originalWidth
                    constraints.heightConstraint?.constant = originalHeight
                    self.layoutIfNeeded()
                    completionBlock?()
                }
            )
        } else {
            print ("[Animatable protocol] Cannot detect width and height constraints!")
        }
    }
    
    
    func popAndEnable(completionBlock: (()->())? = nil) {
        let constraints = getHeightAndWidthConstraints()

        if let _ = constraints.widthConstraint, let _ = constraints.heightConstraint {
            
            let originalWidth = constraints.widthConstraint!.constant
            let originalHeight = constraints.heightConstraint!.constant
            
            constraints.heightConstraint?.constant = 0
            constraints.widthConstraint?.constant = 0
            self.alpha = 0
            self.layoutIfNeeded()
            
            UIView.animateWithDuration(AnimatableConstants.animationDuration, delay: 0, usingSpringWithDamping: AnimatableConstants.damping, initialSpringVelocity: AnimatableConstants.springVelocity, options: UIViewAnimationOptions.BeginFromCurrentState,
                animations: {
                    constraints.widthConstraint!.constant = originalWidth
                    constraints.heightConstraint!.constant = originalHeight
                    self.alpha = 1
                    self.layoutIfNeeded()
                    self.userInteractionEnabled = true
                    if self.isKindOfClass(UIImageView) {
                        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1)
                    }
                
                }, completion: { _ in
                    completionBlock?()
                }
            )
        } else {
            print ("[Animatable protocol] Cannot detect width and height constraints!")
        }
    }
    
    //-----------------------------------------------------------------------------------------------------------------
    //MARK: - Internal functions
    private func getHeightAndWidthConstraints() -> (widthConstraint: NSLayoutConstraint?, heightConstraint: NSLayoutConstraint?) {
        var widthConstraint:NSLayoutConstraint?
        var heightConstraint:NSLayoutConstraint?
        
        for constraint in self.constraints {
            if constraint.firstItem.isEqual(self) {
                if constraint.firstAttribute == .Width {
                    widthConstraint = constraint
                }
                if constraint.firstAttribute == .Height {
                    heightConstraint = constraint
                }
            }
        }
        
        return (widthConstraint, heightConstraint)
    }
    
    
}

extension UIView: Animatable {
    
}