// -----------------------------------------------------------------------------
// DecoderCapability.swift
//
// This Swift source file is a part of the SGProgrammerCore package
// by Paul C. L. Willmott.
//
// Copyright © 2024 Paul C. L. Willmott. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy 
// of this software and associated documentation files (the “Software”), to deal 
// in the Software without restriction, including without limitation the rights 
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
// copies of the Software, and to permit persons to whom the Software is 
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in 
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
// SOFTWARE.
// -----------------------------------------------------------------------------
//
// Revision History:
//
//     26/09/2024  Paul Willmott - DecoderCapability.swift created
// -----------------------------------------------------------------------------

import Foundation

public enum DecoderCapability : CaseIterable, Sendable {
  
  // MARK: Enumeration
  
  // Address
  
  case primaryAddress
  case extendedAddress
  case respondsToNonDCCCommands
  case marklinConsecutiveAddresses
  case secondAddressForMotorolaCommands
  case dccAddresses
  case consistFunctions2
  case consistFunctionsFRF1F12
  case consistFunctionsF0F15
  case consistFunctions4
  case consistFunctionsFRF1F30

  // Analog Settings
  
  case analogFunctions
  case analogFunctionsFRF1F12
  case analogFunctionsLF1F15
  case acAnalogMode
  case acAnalogModeVoltages
  case dcAnalogModeSimple
  case dcAnalogMode
  case dcAnalogModeVoltages
  case quantumEngineer
  case soundControlBehaviour
  case highFrequencyPWMMotorControl
  case analogModeHysteresis

  // Brake Settings

  case abcBrakeSections
  case abcShuttleTrain
  case hluSections
  case zimoBrakeSections
  case sendZIMOZACKSignals
  case trixBrakeSections
  case marklinBrakeSections
  case lenzBrakeSections
  case lenzBrakeSectionsB
  case autoStopDCPolarity
  case selectrixBrakeSections
  case brakeFunction2And3
  case constantBrakeDistance

  // DCC Settings
  
  case railCom
  case railComPlusAutomaticAnnouncement
  case detectSpeedStepAutomatically

  // Driving Characteristics
  
  case accelerationRateA
  case accelerationRateC
  case accelerationRateD
  case accelerationAdjustmentA
  case accelerationAdjustmentB
  case trimming
  case loadAdjustment
  case timeToBridgePowerInterruption
  case powerPackSolderedWarning
  case preserveDirection

  // Function Outputs
  
  case physicalOutputs
  case singleFrontRearAux1Aux2
  case aux1
  case aux2
  case aux3toAux4
  case aux5toAux6
  case aux7toAux8
  case aux9toAux10
  case aux11toAux12
  case aux13toAux18
  case physicalOutputsPropertiesA
  case physicalOutputsPropertiesB
  case digitalWheelSensorDisablesAUX10
  case susiMasterDisablesAUX11
  case susiMasterDisablesAUX12
  case susiMasterDisablesAUX3
  case susiMasterDisablesAUX4

  // Function Settings
  
  case frequencyForBlinkingEffectsA
  case frequencyForBlinkingEffectsB
  case gradeCrossingHoldingTime
  case gradeCrossingHoldingTimeB
  case enforceSlaveCommunicationOnAUX3AndAUX4
  case enforceOutputDriverOnAUX3AndAUX4
  case sensorSettings
  case sensorConfiguration
  case automaticUncoupling

  // Identification
  
  case userIdentification

  // Compatibility

  case serialFunctionModeForLGBMTS
  case broadway
  case simpleSUSI
  case susi

  // Motor Settings
  
  case locoMaximumSpeedAndName
  case speedTable
  case threeValueSpeedTable
  case esuSpeedTable
  case nmraSpeedTable
  case minMaxSpeedB
  case loadControlBackEMF
  case regulationReference
  case regulationParameterIA
  case regulationParameterID
  case loadControlBackEMFA
  case loadControlBackEMFB
  case loadControlBackEMFC
  case loadControlBackEMFSlow
  case backEMFSettings
  case adaptiveRegulationFrequency
  case backEMFSamplingPeriod
  case motorOverloadProtection
  case pwmFrequency
  case automaticParkingBrake

  // Smoke Unit
  
  case esuSmokeUnit

  // Special Options
  
  case dccProtocol
  case marklinMotorolaProtocol
  case selectrixProtocol
  case m4Protocol
  case syncWithMasterDecoder

  // Sound Settings
  
  case sound
  case smokeChuffs
  case soundFadeInOut
  case toneControl
  case dynamicSoundControl

  // Sound Slot Settings
  
  case soundSlot1to10
  case soundSlot11to24
  case soundSlot25to27
  case soundSlot28to32
  case soundSlotGearShift
  case soundSlotBrake
  case soundSlotRandom

  case lok5
  case lok4
  case lok3
  case disableMotorPWM
  case noSound
  case startingDelay
  case marklinDeltaMode
  case functionIcons
  case triggerSoundsOnFunctionStatusChange
  case zimoManualFunction
  case disableMotorEMKMeasure
  case disableMotorBrake
  case brightnessOfLightAndFunctionOutputsCV54
  case brightnessOfLightAndFunctionOutputsCV63
  case functionMappings
  case startingDelayIfVirtualSoundEnabledCV221
  case startingDelayIfVirtualSoundEnabledCV252
  case startingDelayIfVirtualSoundEnabledCV253
  case startingDelayIfVirtualSoundEnabledCV128
  case disableFunctionOutputPWM
  
}
