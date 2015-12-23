//
//  AKDistortionWindow.swift
//  AudioKit
//
//  Autogenerated by scripts by Aurelius Prochazka. Do not edit directly.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

import Foundation
import Cocoa

/// A Window to control AKDistortion in Playgrounds
public class AKDistortionWindow: NSWindow {
    
    private let windowWidth = 400
    private let padding = 30
    private let sliderHeight = 20
    private let numberOfComponents = 16
    
    /// Slider to control delay
    public let delaySlider: NSSlider
    /// Slider to control decay
    public let decaySlider: NSSlider
    /// Slider to control delayMix
    public let delayMixSlider: NSSlider
    /// Slider to control decimation
    public let decimationSlider: NSSlider
    /// Slider to control rounding
    public let roundingSlider: NSSlider
    /// Slider to control decimationMix
    public let decimationMixSlider: NSSlider
    /// Slider to control linearTerm
    public let linearTermSlider: NSSlider
    /// Slider to control squaredTerm
    public let squaredTermSlider: NSSlider
    /// Slider to control cubicTerm
    public let cubicTermSlider: NSSlider
    /// Slider to control polynomialMix
    public let polynomialMixSlider: NSSlider
    /// Slider to control ringModFreq1
    public let ringModFreq1Slider: NSSlider
    /// Slider to control ringModFreq2
    public let ringModFreq2Slider: NSSlider
    /// Slider to control ringModBalance
    public let ringModBalanceSlider: NSSlider
    /// Slider to control ringModMix
    public let ringModMixSlider: NSSlider
    /// Slider to control softClipGain
    public let softClipGainSlider: NSSlider
    /// Slider to control finalMix
    public let finalMixSlider: NSSlider
    
    private let delayTextField: NSTextField
    private let decayTextField: NSTextField
    private let delayMixTextField: NSTextField
    private let decimationTextField: NSTextField
    private let roundingTextField: NSTextField
    private let decimationMixTextField: NSTextField
    private let linearTermTextField: NSTextField
    private let squaredTermTextField: NSTextField
    private let cubicTermTextField: NSTextField
    private let polynomialMixTextField: NSTextField
    private let ringModFreq1TextField: NSTextField
    private let ringModFreq2TextField: NSTextField
    private let ringModBalanceTextField: NSTextField
    private let ringModMixTextField: NSTextField
    private let softClipGainTextField: NSTextField
    private let finalMixTextField: NSTextField
    
    private var distortion: AKDistortion
    
    /// Initiate the AKDistortion window
    public init(_ control: AKDistortion) {
        distortion = control
        let sliderWidth = windowWidth - 2 * padding
        
        delaySlider = newSlider(sliderWidth)
        decaySlider = newSlider(sliderWidth)
        delayMixSlider = newSlider(sliderWidth)
        decimationSlider = newSlider(sliderWidth)
        roundingSlider = newSlider(sliderWidth)
        decimationMixSlider = newSlider(sliderWidth)
        linearTermSlider = newSlider(sliderWidth)
        squaredTermSlider = newSlider(sliderWidth)
        cubicTermSlider = newSlider(sliderWidth)
        polynomialMixSlider = newSlider(sliderWidth)
        ringModFreq1Slider = newSlider(sliderWidth)
        ringModFreq2Slider = newSlider(sliderWidth)
        ringModBalanceSlider = newSlider(sliderWidth)
        ringModMixSlider = newSlider(sliderWidth)
        softClipGainSlider = newSlider(sliderWidth)
        finalMixSlider = newSlider(sliderWidth)
        
        delayTextField = newTextField(sliderWidth)
        decayTextField = newTextField(sliderWidth)
        delayMixTextField = newTextField(sliderWidth)
        decimationTextField = newTextField(sliderWidth)
        roundingTextField = newTextField(sliderWidth)
        decimationMixTextField = newTextField(sliderWidth)
        linearTermTextField = newTextField(sliderWidth)
        squaredTermTextField = newTextField(sliderWidth)
        cubicTermTextField = newTextField(sliderWidth)
        polynomialMixTextField = newTextField(sliderWidth)
        ringModFreq1TextField = newTextField(sliderWidth)
        ringModFreq2TextField = newTextField(sliderWidth)
        ringModBalanceTextField = newTextField(sliderWidth)
        ringModMixTextField = newTextField(sliderWidth)
        softClipGainTextField = newTextField(sliderWidth)
        finalMixTextField = newTextField(sliderWidth)
        
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
        self.title = "AKDistortion"
        
        let viewRect = NSRect(x: 0, y: 0, width: windowWidth, height: windowHeight)
        let view = NSView(frame: viewRect)
        
        let topTitle = NSTextField()
        topTitle.stringValue = "AKDistortion"
        topTitle.editable = false
        topTitle.drawsBackground = false
        topTitle.bezeled = false
        topTitle.alignment = NSCenterTextAlignment
        topTitle.font = NSFont(name: "Lucida Grande", size: 24)
        topTitle.sizeToFit()
        topTitle.frame.origin.x = CGFloat(windowWidth / 2) - topTitle.frame.width / 2
        topTitle.frame.origin.y = CGFloat(windowHeight - padding) - topTitle.frame.height
        view.addSubview(topTitle)
        
        makeTextField(delayTextField, view: view, below: topTitle, distance: 2,
            stringValue: "Delay: \(distortion.delay) Milliseconds")
        makeSlider(delaySlider, view: view, below: topTitle, distance: 3, target: self,
            action: "updateDelay",
            currentValue: distortion.delay,
            minimumValue: 0.1,
            maximumValue: 500)
        
        makeTextField(decayTextField, view: view, below: topTitle, distance: 5,
            stringValue: "Decay: \(distortion.decay) Rate")
        makeSlider(decaySlider, view: view, below: topTitle, distance: 6, target: self,
            action: "updateDecay",
            currentValue: distortion.decay,
            minimumValue: 0.1,
            maximumValue: 50)
        
        makeTextField(delayMixTextField, view: view, below: topTitle, distance: 8,
            stringValue: "Delay Mix: \(distortion.delayMix) Percent")
        makeSlider(delayMixSlider, view: view, below: topTitle, distance: 9, target: self,
            action: "updateDelaymix",
            currentValue: distortion.delayMix,
            minimumValue: 0,
            maximumValue: 100)
        
        makeTextField(decimationTextField, view: view, below: topTitle, distance: 11,
            stringValue: "Decimation: \(distortion.decimation) Percent")
        makeSlider(decimationSlider, view: view, below: topTitle, distance: 12, target: self,
            action: "updateDecimation",
            currentValue: distortion.decimation,
            minimumValue: 0,
            maximumValue: 100)
        
        makeTextField(roundingTextField, view: view, below: topTitle, distance: 14,
            stringValue: "Rounding: \(distortion.rounding) Percent")
        makeSlider(roundingSlider, view: view, below: topTitle, distance: 15, target: self,
            action: "updateRounding",
            currentValue: distortion.rounding,
            minimumValue: 0,
            maximumValue: 100)
        
        makeTextField(decimationMixTextField, view: view, below: topTitle, distance: 17,
            stringValue: "Decimation Mix: \(distortion.decimationMix) Percent")
        makeSlider(decimationMixSlider, view: view, below: topTitle, distance: 18, target: self,
            action: "updateDecimationmix",
            currentValue: distortion.decimationMix,
            minimumValue: 0,
            maximumValue: 100)
        
        makeTextField(linearTermTextField, view: view, below: topTitle, distance: 20,
            stringValue: "Linear Term: \(distortion.linearTerm) Percent")
        makeSlider(linearTermSlider, view: view, below: topTitle, distance: 21, target: self,
            action: "updateLinearterm",
            currentValue: distortion.linearTerm,
            minimumValue: 0,
            maximumValue: 100)
        
        makeTextField(squaredTermTextField, view: view, below: topTitle, distance: 23,
            stringValue: "Squared Term: \(distortion.squaredTerm) Percent")
        makeSlider(squaredTermSlider, view: view, below: topTitle, distance: 24, target: self,
            action: "updateSquaredterm",
            currentValue: distortion.squaredTerm,
            minimumValue: 0,
            maximumValue: 100)
        
        makeTextField(cubicTermTextField, view: view, below: topTitle, distance: 26,
            stringValue: "Cubic Term: \(distortion.cubicTerm) Percent")
        makeSlider(cubicTermSlider, view: view, below: topTitle, distance: 27, target: self,
            action: "updateCubicterm",
            currentValue: distortion.cubicTerm,
            minimumValue: 0,
            maximumValue: 100)
        
        makeTextField(polynomialMixTextField, view: view, below: topTitle, distance: 29,
            stringValue: "Polynomial Mix: \(distortion.polynomialMix) Percent")
        makeSlider(polynomialMixSlider, view: view, below: topTitle, distance: 30, target: self,
            action: "updatePolynomialmix",
            currentValue: distortion.polynomialMix,
            minimumValue: 0,
            maximumValue: 100)
        
        makeTextField(ringModFreq1TextField, view: view, below: topTitle, distance: 32,
            stringValue: "Ring Mod Freq1: \(distortion.ringModFreq1) Hertz")
        makeSlider(ringModFreq1Slider, view: view, below: topTitle, distance: 33, target: self,
            action: "updateRingmodfreq1",
            currentValue: distortion.ringModFreq1,
            minimumValue: 0.5,
            maximumValue: 8000)
        
        makeTextField(ringModFreq2TextField, view: view, below: topTitle, distance: 35,
            stringValue: "Ring Mod Freq2: \(distortion.ringModFreq2) Hertz")
        makeSlider(ringModFreq2Slider, view: view, below: topTitle, distance: 36, target: self,
            action: "updateRingmodfreq2",
            currentValue: distortion.ringModFreq2,
            minimumValue: 0.5,
            maximumValue: 8000)
        
        makeTextField(ringModBalanceTextField, view: view, below: topTitle, distance: 38,
            stringValue: "Ring Mod Balance: \(distortion.ringModBalance) Percent")
        makeSlider(ringModBalanceSlider, view: view, below: topTitle, distance: 39, target: self,
            action: "updateRingmodbalance",
            currentValue: distortion.ringModBalance,
            minimumValue: 0,
            maximumValue: 100)
        
        makeTextField(ringModMixTextField, view: view, below: topTitle, distance: 41,
            stringValue: "Ring Mod Mix: \(distortion.ringModMix) Percent")
        makeSlider(ringModMixSlider, view: view, below: topTitle, distance: 42, target: self,
            action: "updateRingmodmix",
            currentValue: distortion.ringModMix,
            minimumValue: 0,
            maximumValue: 100)
        
        makeTextField(softClipGainTextField, view: view, below: topTitle, distance: 44,
            stringValue: "Soft Clip Gain: \(distortion.softClipGain) dB")
        makeSlider(softClipGainSlider, view: view, below: topTitle, distance: 45, target: self,
            action: "updateSoftclipgain",
            currentValue: distortion.softClipGain,
            minimumValue: -80,
            maximumValue: 20)
        
        makeTextField(finalMixTextField, view: view, below: topTitle, distance: 47,
            stringValue: "Final Mix: \(distortion.finalMix) Percent")
        makeSlider(finalMixSlider, view: view, below: topTitle, distance: 48, target: self,
            action: "updateFinalmix",
            currentValue: distortion.finalMix,
            minimumValue: 0,
            maximumValue: 100)
        
        self.contentView!.addSubview(view)
        self.makeKeyAndOrderFront(nil)
    }
    
    internal func updateDelay() {
        distortion.delay = delaySlider.doubleValue
        delayTextField.stringValue =
        "Delay \(String(format: "%0.4f", distortion.delay)) Milliseconds"
    }
    internal func updateDecay() {
        distortion.decay = decaySlider.doubleValue
        decayTextField.stringValue =
        "Decay \(String(format: "%0.4f", distortion.decay)) Rate"
    }
    internal func updateDelaymix() {
        distortion.delayMix = delayMixSlider.doubleValue
        delayMixTextField.stringValue =
        "Delay Mix \(String(format: "%0.4f", distortion.delayMix)) Percent"
    }
    internal func updateDecimation() {
        distortion.decimation = decimationSlider.doubleValue
        decimationTextField.stringValue =
        "Decimation \(String(format: "%0.4f", distortion.decimation)) Percent"
    }
    internal func updateRounding() {
        distortion.rounding = roundingSlider.doubleValue
        roundingTextField.stringValue =
        "Rounding \(String(format: "%0.4f", distortion.rounding)) Percent"
    }
    internal func updateDecimationmix() {
        distortion.decimationMix = decimationMixSlider.doubleValue
        decimationMixTextField.stringValue =
        "Decimation Mix \(String(format: "%0.4f", distortion.decimationMix)) Percent"
    }
    internal func updateLinearterm() {
        distortion.linearTerm = linearTermSlider.doubleValue
        linearTermTextField.stringValue =
        "Linear Term \(String(format: "%0.4f", distortion.linearTerm)) Percent"
    }
    internal func updateSquaredterm() {
        distortion.squaredTerm = squaredTermSlider.doubleValue
        squaredTermTextField.stringValue =
        "Squared Term \(String(format: "%0.4f", distortion.squaredTerm)) Percent"
    }
    internal func updateCubicterm() {
        distortion.cubicTerm = cubicTermSlider.doubleValue
        cubicTermTextField.stringValue =
        "Cubic Term \(String(format: "%0.4f", distortion.cubicTerm)) Percent"
    }
    internal func updatePolynomialmix() {
        distortion.polynomialMix = polynomialMixSlider.doubleValue
        polynomialMixTextField.stringValue =
        "Polynomial Mix \(String(format: "%0.4f", distortion.polynomialMix)) Percent"
    }
    internal func updateRingmodfreq1() {
        distortion.ringModFreq1 = ringModFreq1Slider.doubleValue
        ringModFreq1TextField.stringValue =
        "Ring Mod Freq1 \(String(format: "%0.4f", distortion.ringModFreq1)) Hertz"
    }
    internal func updateRingmodfreq2() {
        distortion.ringModFreq2 = ringModFreq2Slider.doubleValue
        ringModFreq2TextField.stringValue =
        "Ring Mod Freq2 \(String(format: "%0.4f", distortion.ringModFreq2)) Hertz"
    }
    internal func updateRingmodbalance() {
        distortion.ringModBalance = ringModBalanceSlider.doubleValue
        ringModBalanceTextField.stringValue =
        "Ring Mod Balance \(String(format: "%0.4f", distortion.ringModBalance)) Percent"
    }
    internal func updateRingmodmix() {
        distortion.ringModMix = ringModMixSlider.doubleValue
        ringModMixTextField.stringValue =
        "Ring Mod Mix \(String(format: "%0.4f", distortion.ringModMix)) Percent"
    }
    internal func updateSoftclipgain() {
        distortion.softClipGain = softClipGainSlider.doubleValue
        softClipGainTextField.stringValue =
        "Soft Clip Gain \(String(format: "%0.4f", distortion.softClipGain)) dB"
    }
    internal func updateFinalmix() {
        distortion.finalMix = finalMixSlider.doubleValue
        finalMixTextField.stringValue =
        "Final Mix \(String(format: "%0.4f", distortion.finalMix)) Percent"
    }
    
    /// Required initializer
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

