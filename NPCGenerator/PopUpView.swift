//
//  PopUpView.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/2/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import UIKit
import Material

class PopUpView: UIView {
    
    typealias Action = () -> ()
    
    private var _backgroundView: UIView!
    private var _stackView: UIStackView!
    private var _heightConstraint: NSLayoutConstraint!
    private var _bottomConstraint: NSLayoutConstraint!
    private var _parentView: UIView??
    
    let sideMargin: CGFloat = UIDevice.largeSpacing
    let topBottomMargin: CGFloat = UIDevice.largeMargin
    let containerMargin: CGFloat = 20.0
    var maxHeight: CGFloat = 1000.0
    
    required init?(coder aDecoder: NSCoder) {
        _parentView = UIApplication.shared.delegate?.window
        super.init(coder: aDecoder)
        initiate()
    }
    
    override init(frame: CGRect) {
        _parentView = UIApplication.shared.delegate?.window
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        initiate()
    }
    
    init(fromView view: UIView) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        _parentView = view
        initiate()
    }
    
    func initiate() {
        if UIScreen.main.bounds.height < (maxHeight - (topBottomMargin * 2)) {
            maxHeight = UIScreen.main.bounds.height - (topBottomMargin * 2)
        }
        
        backgroundColor = UIColor(white: 0, alpha: 0.6)
        layer.opacity = 0
        translatesAutoresizingMaskIntoConstraints = false
        _parentView??.addSubview(self)
        superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[self]|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["self": self]))
        superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[self]|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["self": self]))
        
        let constraintView = initiateConstraintView()
        _backgroundView = initiateBackgroundView(withinConstraintView: constraintView)
        _stackView = initiateStackView(withinBackgroundView: _backgroundView)
    }
    
    func initiateConstraintView() -> UIView {
        let constraintView = UIView()
        constraintView.backgroundColor = .clear
        constraintView.translatesAutoresizingMaskIntoConstraints = false
        
        super.addSubview(constraintView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[constraintView]|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["constraintView": constraintView]))
        addConstraint(NSLayoutConstraint(item: constraintView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 15.0))
        _bottomConstraint = NSLayoutConstraint(item: constraintView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        addConstraint(_bottomConstraint)
        
        return constraintView
    }
    
    func initiateBackgroundView(withinConstraintView constraintView: UIView) -> UIView {
        let backgroundView = UIView()
        backgroundView.layer.cornerRadius = 3
        backgroundView.clipsToBounds = true
        backgroundView.backgroundColor = UIColor.white
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        _heightConstraint = NSLayoutConstraint(item: backgroundView, attribute: .height, relatedBy: .lessThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: maxHeight)
        backgroundView.addConstraint(_heightConstraint)
        
        constraintView.addSubview(backgroundView)
        constraintView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(sideMargin)-[backgroundView]-\(sideMargin)-|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["backgroundView": backgroundView]))
        constraintView.addConstraint(NSLayoutConstraint(item: backgroundView, attribute: .centerY, relatedBy: .equal, toItem: constraintView, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        
        return backgroundView
    }
    
    private func initiateStackView(withinBackgroundView backgroundView: UIView) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.addSubview(stackView)
        backgroundView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[stackView]|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["stackView": stackView]))
        backgroundView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[stackView]|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["stackView": stackView]))
        
        return stackView
    }
    
    override func addSubview(_ view: UIView) {
        _stackView.addArrangedSubview(view)
    }
    
    func replaceView(atIndex index: Int, withView view: UIView) {
        endEditing(true)
        view.isHidden = true
        let oldView = _stackView.arrangedSubviews[index]
        _stackView.insertArrangedSubview(view, at: index)
        
        UIView.animate(withDuration: 0.2, animations: {
            view.isHidden = false
            oldView.isHidden = true
        }) { (completed) in
            oldView.removeFromSuperview()
            self._stackView.removeArrangedSubview(oldView)
        }
    }
    
    func getView(atIndex index: Int) -> UIView {
        return _stackView.arrangedSubviews[index]
    }
    
    func show(completed: Action?) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotification(notification:)), name: .UIKeyboardWillChangeFrame, object: nil)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.layer.opacity = 1
        }) { _ in
            completed?()
        }
    }
    
    func hide(completed: Action?) {
        endEditing(true)
        NotificationCenter.default.removeObserver(self)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.layer.opacity = 0
        }) { _ in
            completed?()
        }
    }
    
    func keyboardNotification(notification: NSNotification) {
        guard let userInfo = notification.userInfo, let endFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        
        let duration:TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
        let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
        if endFrame.origin.y >= UIScreen.main.bounds.height {
            let availableHeight = UIScreen.main.bounds.height - (topBottomMargin * 2)
            let actualHeight = availableHeight > maxHeight ? maxHeight : availableHeight
            _heightConstraint.constant = actualHeight
            _bottomConstraint.constant = 0.0
        } else {
            let availableHeight = UIScreen.main.bounds.height - endFrame.height - (topBottomMargin * 2)
            let actualHeight = availableHeight > maxHeight ? maxHeight : availableHeight
            _heightConstraint.constant = actualHeight
            _bottomConstraint.constant = -endFrame.height
        }
        UIView.animate(withDuration: duration, delay: TimeInterval(0), options: animationCurve, animations: { self.layoutIfNeeded() }, completion: nil)
    }
    
}
