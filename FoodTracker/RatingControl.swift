//
//  RatingControl.swift
//  FoodTracker
//
//  Created by LeeJuYong on 2016. 9. 2..
//  Copyright © 2016년 LeeJuYong. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    // MARK: Properties
    var rating = 0{
        didSet{
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    
    // MARK: Iinitialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("[RatingControl] - init")
        let emptyStarImage =  UIImage(named: "emptyStar")
        let filledStarImage = UIImage(named: "filledStar")
        for _ in 0..<starCount
        {
            let button = UIButton()
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Selected, .Highlighted])
            button.adjustsImageWhenHighlighted = false
            button.backgroundColor = UIColor.redColor()
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchUpInside)
            ratingButtons += [button]
            self.addSubview(button)
            print("Button Added!!")
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        print("[RatingControl] - intrinsicContentSize")
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        return CGSize(width: width, height: buttonSize)
    }
    
    override func layoutSubviews() {
        print("[RatingControl] - layoutSubviews")
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        // Offset each button's origin by the length of the button plus some spacing.
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
            print("\(index)-\(button)")
        }
    }
    
    func ratingButtonTapped(button: UIButton)
    {
        print("Button Pressed!!");
        rating = ratingButtons.indexOf(button)!+1
        updateButtonSelectionStates()
        
    }
    
    func updateButtonSelectionStates()
    {
        print("updateButtonSelectionStates")
        for(index, button) in ratingButtons.enumerate()
        {
            print("\(index) - \(button)")
            button.selected = index < rating
        }
    }
}
