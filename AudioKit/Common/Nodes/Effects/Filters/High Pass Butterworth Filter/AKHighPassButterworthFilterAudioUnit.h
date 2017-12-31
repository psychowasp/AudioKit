//
//  AKHighPassButterworthFilterAudioUnit.h
//  AudioKit
//
//  Created by Aurelius Prochazka, revision history on Github.
//  Copyright © 2017 AudioKit. All rights reserved.
//

#pragma once
#import "AKAudioUnit.h"

@interface AKHighPassButterworthFilterAudioUnit : AKAudioUnit
@property (nonatomic) float cutoffFrequency;
@end

