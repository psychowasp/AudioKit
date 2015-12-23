//
//  AKFlatFrequencyResponseReverb.swift
//  AudioKit
//
//  Autogenerated by scripts by Aurelius Prochazka. Do not edit directly.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

import AVFoundation

/** This filter reiterates the input with an echo density determined by loop time.
 The attenuation rate is independent and is determined by the reverberation time
 (defined as the time in seconds for a signal to decay to 1/1000, or 60dB down
 from its original amplitude).  Output will begin to appear immediately. */
public struct AKFlatFrequencyResponseReverb: AKNode {

    // MARK: - Properties
    public var avAudioNode: AVAudioNode
    private var internalAU: AKFlatFrequencyResponseReverbAudioUnit?
    private var token: AUParameterObserverToken?

    private var reverbDurationParameter: AUParameter?

    /** The duration in seconds for a signal to decay to 1/1000, or 60dB down from its
     original amplitude. */
    public var reverbDuration: Double = 0.5 {
        didSet {
            reverbDurationParameter?.setValue(Float(reverbDuration), originator: token!)
        }
    }

    // MARK: - Initializers

    /** Initialize this reverb node */
    public init(
        _ input: AKNode,
        reverbDuration: Double = 0.5,
        loopDuration: Double = 0.1) {

        self.reverbDuration = reverbDuration

        var description = AudioComponentDescription()
        description.componentType         = kAudioUnitType_Effect
        description.componentSubType      = 0x616c7073 /*'alps'*/
        description.componentManufacturer = 0x41754b74 /*'AuKt'*/
        description.componentFlags        = 0
        description.componentFlagsMask    = 0

        AUAudioUnit.registerSubclass(
            AKFlatFrequencyResponseReverbAudioUnit.self,
            asComponentDescription: description,
            name: "Local AKFlatFrequencyResponseReverb",
            version: UInt32.max)

        self.avAudioNode = AVAudioNode()
        AVAudioUnit.instantiateWithComponentDescription(description, options: []) {
            avAudioUnit, error in

            guard let avAudioUnitEffect = avAudioUnit else { return }

            self.avAudioNode = avAudioUnitEffect
            self.internalAU = avAudioUnitEffect.AUAudioUnit as? AKFlatFrequencyResponseReverbAudioUnit

            AKManager.sharedInstance.engine.attachNode(self.avAudioNode)
            AKManager.sharedInstance.engine.connect(input.avAudioNode, to: self.avAudioNode, format: AKManager.format)
            self.internalAU!.setLoopDuration(Float(loopDuration))
        }

        guard let tree = internalAU?.parameterTree else { return }

        reverbDurationParameter = tree.valueForKey("reverbDuration") as? AUParameter

        token = tree.tokenByAddingParameterObserver {
            address, value in

            dispatch_async(dispatch_get_main_queue()) {
                if address == self.reverbDurationParameter!.address {
                    self.reverbDuration = Double(value)
                }
            }
        }
        reverbDurationParameter?.setValue(Float(reverbDuration), originator: token!)
    }
}
