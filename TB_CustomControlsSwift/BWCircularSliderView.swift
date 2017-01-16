//
//  BWCircularSliderView.swift
//  TB_CustomControlsSwift
//
//  Created by Yari D'areglia on 14/11/14.
//  Copyright (c) 2014 Yari D'areglia. All rights reserved.
//

import UIKit

@IBDesignable class BWCircularSliderView: UIView {
    
    @IBInspectable var startColor:UIColor = UIColor.red
    @IBInspectable var endColor:UIColor = UIColor.blue
    
    #if TARGET_INTERFACE_BUILDER
    override func willMoveToSuperview(newSuperview: UIView?) {
        
        let slider:BWCircularSlider = BWCircularSlider(startColor:self.startColor, endColor:self.endColor, frame: self.bounds)
        self.addSubview(slider)
    
    }
    
    #else
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        // Build the slider
        let slider:BWCircularSlider = BWCircularSlider(startColor:self.startColor, endColor:self.endColor, frame: self.bounds)
        
        // Attach an Action and a Target to the slider
        slider.addTarget(self, action: #selector(BWCircularSliderView.valueChanged(_:)), for: UIControlEvents.valueChanged)
        
        // Add the slider as subview of this view
        self.addSubview(slider)

    }
    #endif
    
    func valueChanged(_ slider:BWCircularSlider){
        // Do something with the value...
        print("Value changed \(slider.angle)")
    }
}
