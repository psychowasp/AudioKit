//
//  AKToneFilter.swift
//  AudioKit
//
//  Autogenerated by scripts by Aurelius Prochazka. Do not edit directly.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

import AVFoundation

/** A first-order recursive low-pass filter with variable frequency response. */
public struct AKToneFilter: AKNode {

    // MARK: - Properties
    public var avAudioNode: AVAudioNode
    private var internalAU: AKToneFilterAudioUnit?
    private var token: AUParameterObserverToken?

    private var halfPowerPointParameter: AUParameter?

    /** The response curve's half-power point, in Hertz. Half power is defined as peak
     power / root 2. */
    public var halfPowerPoint: Double = 1000 {
        didSet {
            halfPowerPointParameter?.setValue(Float(halfPowerPoint), originator: token!)
        }
    }

    // MARK: - Initializers

    /** Initialize this filter node */
    public init(
        _ input: AKNode,
        halfPowerPoint: Double = 1000) {

        self.halfPowerPoint = halfPowerPoint

        var description = AudioComponentDescription()
        description.componentType         = kAudioUnitType_Effect
        description.componentSubType      = 0x746f6e65 /*'tone'*/
        description.componentManufacturer = 0x41754b74 /*'AuKt'*/
        description.componentFlags        = 0
        description.componentFlagsMask    = 0

        AUAudioUnit.registerSubclass(
            AKToneFilterAudioUnit.self,
            asComponentDescription: description,
            name: "Local AKToneFilter",
            version: UInt32.max)

        self.avAudioNode = AVAudioNode()
        AVAudioUnit.instantiateWithComponentDescription(description, options: []) {
            avAudioUnit, error in

            guard let avAudioUnitEffect = avAudioUnit else { return }

            self.avAudioNode = avAudioUnitEffect
            self.internalAU = avAudioUnitEffect.AUAudioUnit as? AKToneFilterAudioUnit

            AKManager.sharedInstance.engine.attachNode(self.avAudioNode)
            AKManager.sharedInstance.engine.connect(input.avAudioNode, to: self.avAudioNode, format: AKManager.format)
        }

        guard let tree = internalAU?.parameterTree else { return }

        halfPowerPointParameter = tree.valueForKey("halfPowerPoint") as? AUParameter

        token = tree.tokenByAddingParameterObserver {
            address, value in

            dispatch_async(dispatch_get_main_queue()) {
                if address == self.halfPowerPointParameter!.address {
                    self.halfPowerPoint = Double(value)
                }
            }
        }
        halfPowerPointParameter?.setValue(Float(halfPowerPoint), originator: token!)
    }
}
