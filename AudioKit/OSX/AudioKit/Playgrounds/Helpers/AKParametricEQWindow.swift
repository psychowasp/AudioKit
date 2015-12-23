//
//  AKParametricEQWindow.swift
//  AudioKit
//
//  Autogenerated by scripts by Aurelius Prochazka. Do not edit directly.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

import Foundation
import Cocoa

/// A Window to control AKParametricEQ in Playgrounds
public class AKParametricEQWindow: NSWindow {
    
    private let windowWidth = 400
    private let padding = 30
    private let sliderHeight = 20
    private let numberOfComponents = 3
    
    /// Slider to control centerFreq
    public let centerFreqSlider: NSSlider
    /// Slider to control q
    public let qSlider: NSSlider
    /// Slider to control gain
    public let gainSlider: NSSlider
    
    private let centerFreqTextField: NSTextField
    private let qTextField: NSTextField
    private let gainTextField: NSTextField
    
    private var parametricEQ: AKParametricEQ
    
    /// Initiate the AKParametricEQ window
    public init(_ control: AKParametricEQ) {
        parametricEQ = control
        let sliderWidth = windowWidth - 2 * padding
        
        centerFreqSlider = newSlider(sliderWidth)
        qSlider = newSlider(sliderWidth)
        gainSlider = newSlider(sliderWidth)
        
        centerFreqTextField = newTextField(sliderWidth)
        qTextField = newTextField(sliderWidth)
        gainTextField = newTextField(sliderWidth)
        
        let titleHeightApproximation = 50
        let windowHeight = padding * 2 + titleHeightApproximation + numberOfComponents * 3 * sliderHeight
        
        super.init(contentRect: NSRect(x: padding, y: padding, width: windowWidth, height: windowHeight),
            styleMask: NSTitledWindowMask,
            backing: .Buffered,
            `defer`: false)
        self.hasShadow = true
        self.styleMask = NSBorderlessWindowMask | NSResizableWindowMask
        self.movableByWindowBackground = true
        self.level = 7
        self.title = "AKParametricEQ"
        
        let viewRect = NSRect(x: 0, y: 0, width: windowWidth, height: windowHeight)
        let view = NSView(frame: viewRect)
        
        let topTitle = NSTextField()
        topTitle.stringValue = "AKParametricEQ"
        topTitle.editable = false
        topTitle.drawsBackground = false
        topTitle.bezeled = false
        topTitle.alignment = NSCenterTextAlignment
        topTitle.font = NSFont(name: "Lucida Grande", size: 24)
        topTitle.sizeToFit()
        topTitle.frame.origin.x = CGFloat(windowWidth / 2) - topTitle.frame.width / 2
        topTitle.frame.origin.y = CGFloat(windowHeight - padding) - topTitle.frame.height
        view.addSubview(topTitle)
        
        makeTextField(centerFreqTextField, view: view, below: topTitle, distance: 2,
            stringValue: "Center Frequency: \(parametricEQ.centerFrequency) Hz")
        makeSlider(centerFreqSlider, view: view, below: topTitle, distance: 3, target: self,
            action: "updateCenterfreq",
            currentValue: parametricEQ.centerFrequency,
            minimumValue: 20,
            maximumValue: 22050)
        
        makeTextField(qTextField, view: view, below: topTitle, distance: 5,
            stringValue: "Q: \(parametricEQ.q) Hz")
        makeSlider(qSlider, view: view, below: topTitle, distance: 6, target: self,
            action: "updateQ",
            currentValue: parametricEQ.q,
            minimumValue: 0.1,
            maximumValue: 20)
        
        makeTextField(gainTextField, view: view, below: topTitle, distance: 8,
            stringValue: "Gain: \(parametricEQ.gain) dB")
        makeSlider(gainSlider, view: view, below: topTitle, distance: 9, target: self,
            action: "updateGain",
            currentValue: parametricEQ.gain,
            minimumValue: -20,
            maximumValue: 20)
        
        self.contentView!.addSubview(view)
        self.makeKeyAndOrderFront(nil)
    }
    
    internal func updateCenterfreq() {
        parametricEQ.centerFrequency = centerFreqSlider.doubleValue
        centerFreqTextField.stringValue =
        "Center Frequency \(String(format: "%0.4f", parametricEQ.centerFrequency)) Hz"
    }
    internal func updateQ() {
        parametricEQ.q = qSlider.doubleValue
        qTextField.stringValue =
        "Q \(String(format: "%0.4f", parametricEQ.q)) Hz"
    }
    internal func updateGain() {
        parametricEQ.gain = gainSlider.doubleValue
        gainTextField.stringValue =
        "Gain \(String(format: "%0.4f", parametricEQ.gain)) dB"
    }
    
    /// Required initializer
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

