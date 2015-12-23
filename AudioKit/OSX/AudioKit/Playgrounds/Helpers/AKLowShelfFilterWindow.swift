//
//  AKLowShelfFilterWindow.swift
//  AudioKit
//
//  Autogenerated by scripts by Aurelius Prochazka. Do not edit directly.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

import Foundation
import Cocoa

/// A Window to control AKLowShelfFilter in Playgrounds
public class AKLowShelfFilterWindow: NSWindow {
    
    private let windowWidth = 400
    private let padding = 30
    private let sliderHeight = 20
    private let numberOfComponents = 2
    
    /// Slider to control cutoffFrequency
    public let cutoffFrequencySlider: NSSlider
    /// Slider to control gain
    public let gainSlider: NSSlider
    
    private let cutoffFrequencyTextField: NSTextField
    private let gainTextField: NSTextField
    
    private var lowShelfFilter: AKLowShelfFilter
    
    /// Initiate the AKLowShelfFilter window
    public init(_ control: AKLowShelfFilter) {
        lowShelfFilter = control
        let sliderWidth = windowWidth - 2 * padding
        
        cutoffFrequencySlider = newSlider(sliderWidth)
        gainSlider = newSlider(sliderWidth)
        
        cutoffFrequencyTextField = newTextField(sliderWidth)
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
        self.title = "AKLowShelfFilter"
        
        let viewRect = NSRect(x: 0, y: 0, width: windowWidth, height: windowHeight)
        let view = NSView(frame: viewRect)
        
        let topTitle = NSTextField()
        topTitle.stringValue = "AKLowShelfFilter"
        topTitle.editable = false
        topTitle.drawsBackground = false
        topTitle.bezeled = false
        topTitle.alignment = NSCenterTextAlignment
        topTitle.font = NSFont(name: "Lucida Grande", size: 24)
        topTitle.sizeToFit()
        topTitle.frame.origin.x = CGFloat(windowWidth / 2) - topTitle.frame.width / 2
        topTitle.frame.origin.y = CGFloat(windowHeight - padding) - topTitle.frame.height
        view.addSubview(topTitle)
        
        makeTextField(cutoffFrequencyTextField, view: view, below: topTitle, distance: 2,
            stringValue: "Cutoff Frequency: \(lowShelfFilter.cutoffFrequency) Hz")
        makeSlider(cutoffFrequencySlider, view: view, below: topTitle, distance: 3, target: self,
            action: "updateCutofffrequency",
            currentValue: lowShelfFilter.cutoffFrequency,
            minimumValue: 10,
            maximumValue: 200)
        
        makeTextField(gainTextField, view: view, below: topTitle, distance: 5,
            stringValue: "Gain: \(lowShelfFilter.gain) dB")
        makeSlider(gainSlider, view: view, below: topTitle, distance: 6, target: self,
            action: "updateGain",
            currentValue: lowShelfFilter.gain,
            minimumValue: -40,
            maximumValue: 40)
        
        self.contentView!.addSubview(view)
        self.makeKeyAndOrderFront(nil)
    }
    
    internal func updateCutofffrequency() {
        lowShelfFilter.cutoffFrequency = cutoffFrequencySlider.doubleValue
        cutoffFrequencyTextField.stringValue =
        "Cutoff Frequency \(String(format: "%0.4f", lowShelfFilter.cutoffFrequency)) Hz"
    }
    internal func updateGain() {
        lowShelfFilter.gain = gainSlider.doubleValue
        gainTextField.stringValue =
        "Gain \(String(format: "%0.4f", lowShelfFilter.gain)) dB"
    }
    
    /// Required initializer
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

