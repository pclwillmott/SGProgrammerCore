// -----------------------------------------------------------------------------
// ProgrammerToolSettingsProperty.swift
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
//     26/09/2024  Paul Willmott - ProgrammerToolSettingsProperty.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit
import SGInteger

public enum ProgrammerToolSettingsProperty : Int, CaseIterable, Codable, Sendable {

  // MARK: Enumeration
  
  // Decoder Information
  
  case manufacturer = 207
  case model = 208
  case flash = 209
  case manufacturerId = 210
  case productId = 211
  case serialNumber = 212
  case soundLock = 213
  case firmwareVersion = 214
  case firmwareType = 215
  case bootcodeVersion = 216
  case productionInfo = 217
  case productionDate = 218
  case cv7 = 219
  case cv8 = 220
  case decoderOperatingTime = 221
  case smokeUnitOperatingTime = 222
  
  // Address
  
  case locomotiveAddressType = 1
  case locomotiveAddressShort = 2
  case locomotiveAddressLong = 3
  case marklinConsecutiveAddresses = 5
  case enableSecondAddressForMotorolaCommands = 408
  case locomotiveAddressWarning = 6

  // DCC Consist Address
  
  case enableDCCConsistAddress = 7
  case consistAddress = 8
  case consistReverseDirection = 9
  case consistFunctions4 = 163
  case consistFunctions2 = 390

  // Analog Settings
  
  case analogFunctions = 164
  case enableACAnalogMode = 10
  case acAnalogModeStartVoltage = 11
  case acAnalogModeMaximumSpeedVoltage = 12
  case acAnalogModeStartVoltageLok3 = 441
  case acAnalogModeMaximumSpeedVoltageLok3 = 456
  case enableDCAnalogMode = 13
  case enableDCAnalogModeSimple = 420
  case dcAnalogModeStartVoltage = 14
  case dcAnalogModeMaximumSpeedVoltage = 15
  case dcAnalogModeStartVoltageLok3 = 457
  case dcAnalogModeMaximumSpeedVoltageLok3 = 458
  case enableQuantumEngineer = 16
  case ignoreAccelerationDecelerationInSoundSchedule = 17
  case useHighFrequencyPWMMotorControl = 18
  case analogVoltageHysteresisDescription = 19
  case analogMotorHysteresisVoltage = 20
  case analogFunctionDifferenceVoltage = 21
  case disableMotorPWM = 409
  case disableFunctionOutputPWM = 410

  // Brake Settings
  
  case enableABCBrakeMode = 22
  case brakeIfRightRailSignalPositive = 23
  case brakeIfLeftRailSignalPositive = 24
  case voltageDifferenceIndicatingABCBrakeSection = 25
  case voltageDifferenceIndicatingABCBrakeSection32 = 516
  case abcReducedSpeed = 26
  case enableABCShuttleTrain = 27
  case waitingPeriodBeforeDirectionChange = 28
  case allowMarklinBrakeSections = 411
  case allowZIMOBrakeSections = 414
  case allowLenzBrakeSections = 412
  case allowLenzBrakeSectionsB = 504
  case allowTrixBrakeSections = 413
  case hluAllowZIMO = 29
  case hluSendZIMOZACKSignals = 30
  case hluSpeedLimit1 = 31
  case hluSpeedLimit2 = 32
  case hluSpeedLimit3 = 33
  case hluSpeedLimit4 = 34
  case hluSpeedLimit5 = 35
  case brakeOnForwardPolarity = 36
  case brakeOnReversePolarity = 37
  case selectrixBrakeOnForwardPolarity = 52
  case selectrixBrakeOnReversePolarity = 53
  case enableConstantBrakeDistance = 38
  case brakeDistanceLength = 39
  case brakingModeLok3 = 461
  case differentBrakeDistanceBackwards = 40
  case brakeDistanceLengthBackwards = 41
  case driveUntilLocomotiveStopsInSpecifiedPeriod = 42
  case stoppingPeriod = 43
  case constantBrakeDistanceOnSpeedStep0 = 44
  case delayTimeBeforeExitingBrakeSection = 45
  case brakeFunction1BrakeTimeReduction = 46
  case maximumSpeedWhenBrakeFunction1Active = 47
  case brakeFunction2BrakeTimeReduction = 48
  case maximumSpeedWhenBrakeFunction2Active = 49
  case brakeFunction3BrakeTimeReduction = 50
  case maximumSpeedWhenBrakeFunction3Active = 51
  case timeFromMaximumSpeedToStopWhenDynamicBrakeEnabled = 391
  
  // DCC Settings
  
  case enableRailComFeedback = 54
  case enableRailComPlusAutomaticAnnouncement = 55
  case sendFollowingToCommandStation = 56
  case sendAddressViaBroadcastOnChannel1 = 57
  case allowDataTransmissionOnChannel2 = 58
  case allowCommandConfirmationOnChannel1 = 487
  case detectSpeedStepModeAutomatically = 59
  case speedStepMode = 60
  
  // Driving Characteristics
  
  case enableAcceleration = 63
  case accelerationRate = 64
  case accelerationRateLok3 = 459
  case accelerationRateBasic = 498
  case accelerationRateESU = 507
  case accelerationAdjustmentA = 65
  case accelerationAdjustmentB = 509
  case enableDeceleration = 66
  case decelerationRate = 67
  case decelerationRateLok3 = 460
  case decelerationRateBasic = 499
  case decelerationRateESU = 508
  case decelerationAdjustmentA = 68
  case decelerationAdjustmentB = 510
  case reverseMode = 69
  case enableForwardTrim = 70
  case forwardTrim = 71
  case enableReverseTrim = 72
  case reverseTrim = 73
  case enableShuntingModeTrim = 74
  case shuntingModeTrim = 75
  case loadAdjustmentOptionalLoad = 76
  case loadAdjustmentPrimaryLoad = 77
  case enableGearboxBacklashCompensation = 78
  case gearboxBacklashCompensation = 79
  case timeToBridgePowerInterruption = 80
  case timeToBridgePowerInterruptionLok4 = 392
  case timeToBridgePowerInterruptionWarning = 393
  case preserveDirection = 81
  case enableStartingDelay = 82
  case enableStartingDelayIfVirtualDriveSoundEnabledCV252 = 383
  case enableStartingDelayIfVirtualDriveSoundEnabledCV253 = 489
  case enableStartingDelayIfVirtualDriveSoundEnabledCV221 = 496
  case enableStartingDelayIfVirtualDriveSoundEnabledCV128 = 419
  case startingDelayIfVirtualDriveSoundEnabledCV253 = 488
  case startingDelayIfVirtualDriveSoundEnabledCV221 = 495
  case startingDelayIfVirtualDriveSoundEnabledCV252 = 384
  case startingDelayIfVirtualDriveSoundEnabledCV128 = 497
  case stopImmediatelyOnSpeedStep0 = 394
  
  // Function Outputs
  
  case brightnessOfLightAndFunctionOutputsCV54 = 491
  case brightnessOfLightAndFunctionOutputsCV63 = 500
  case physicalOutput = 165
  case physicalOutputModeB = 415
  case physicalOutputBrightnessB = 416
  case physicalOutputPulseLengthB = 417
  case physicalOutputAUX10Warning = 224
  case physicalOutputAUX11Warning = 225
  case physicalOutputAUX12Warning = 226
  case physicalOutputAUX3Warning = 381
  case physicalOutputAUX4Warning = 382
  case physicalOutputPowerOnDelay = 166
  case physicalOutputPowerOffDelay = 167
  case physicalOutputEnableFunctionTimeout = 168
  case physicalOutputTimeUntilAutomaticPowerOff = 169
  case physicalOutputOutputMode = 170
  case physicalOutputBrightness = 171
  case physicalOutputUseClassLightLogic = 198
  case physicalOutputSequencePosition = 199
  case physicalOutputPhaseShift = 172
  case physicalOutputStartupTime = 173
  case physicalOutputStartupTimeInfo = 206
  case physicalOutputStartupDescription = 197
  case physicalOutputLevel = 174
  case physicalOutputSmokeUnitControlMode = 175
  case physicalOutputSpeed = 176
  case physicalOutputAccelerationRate = 177
  case physicalOutputDecelerationRate = 178
  case physicalOutputHeatWhileLocomotiveStands = 179
  case physicalOutputMinimumHeatWhileLocomotiveDriving = 180
  case physicalOutputMaximumHeatWhileLocomotiveDriving = 181
  case physicalOutputChuffPower = 182
  case physicalOutputFanPower = 183
  case physicalOutputTimeout = 184
  case physicalOutputServoDurationA = 185
  case physicalOutputServoDurationB = 186
  case physicalOutputServoPositionA = 187
  case physicalOutputServoDoNotDisableServoPulseAtPositionA = 188
  case physicalOutputServoPositionB = 189
  case physicalOutputServoDoNotDisableServoPulseAtPositionB = 190
  case physicalOutputCouplerForce = 191
  case physicalOutputExternalSmokeUnitType = 204
  case physicalOutputPantographHeight = 223
  case physicalOutputSpecialFunctions = 205
  case physicalOutputGradeCrossing = 196
  case physicalOutputRule17Forward = 192
  case physicalOutputRule17Reverse = 193
  case physicalOutputDimmer = 194
  case physicalOutputLEDMode = 195
  
  // Function Settings
  
  case triggerUserSoundsOnFunctionStatusChange = 422
  case frequencyForBlinkingEffects = 92
  case frequencyForBlinkingEffectsB = 421
  case frequencyForBlinkingEffectsC = 518
  case gradeCrossingHoldingTime = 93
  case gradeCrossingHoldingTimeB = 512
  case fadeInTimeOfLightEffects = 94
  case fadeOutTimeOfLightEffects = 95
  case logicalFunctionDimmerBrightnessReduction = 96
  case classLightLogicSequenceLength = 97
  case enforceSlaveCommunicationOnAUX3AndAUX4 = 98
  case enforceOutputDriverOnAUX3AndAUX4 = 511
  case decoderSensorSettings = 99
  case sensor1DigitalSensorInputEnabled = 227
  case sensor1EnableAnalogSensorInput = 228
  case sensor1Threshold = 229
  case sensor2DigitalSensorInputEnabled = 230
  case sensor2EnableAnalogSensorInput = 231
  case sensor2Threshold = 232
  case enableAutomaticUncoupling = 100
  case automaticUncouplingSpeed = 101
  case automaticUncouplingPushTime = 102
  case automaticUncouplingWaitTime = 103
  case automaticUncouplingMoveTime = 104
  case randomFunction = 241
  case randomStop = 233
  case randomDrive = 234
  case randomOnlyPlayWhenDrivingSoundEnabled = 235
  case randomTriggeredFunction = 236
  case randomActiveMinimum = 237
  case randomActiveMaximum = 238
  case randomPassiveMinimum = 239
  case randomPassiveMaximum = 240
  case esuFunction = 251
  case esuFunctionIcon = 252
  case esuFunctionMomentary = 253
  case esuFunctionInverted = 254
  
  // Function Mappings
  
  case esuFunctionMapping = 257
  
  // Conditions
  
  case condDriving = 336
  case condDirection = 337
  case condF0 = 338
  case condF1 = 339
  case condF2 = 340
  case condF3 = 341
  case condF4 = 342
  case condF5 = 343
  case condF6 = 344
  case condF7 = 345
  case condF8 = 346
  case condF9 = 347
  case condF10 = 348
  case condF11 = 349
  case condF12 = 350
  case condF13 = 351
  case condF14 = 352
  case condF15 = 353
  case condF16 = 354
  case condF17 = 355
  case condF18 = 356
  case condF19 = 357
  case condF20 = 358
  case condF21 = 359
  case condF22 = 360
  case condF23 = 361
  case condF24 = 362
  case condF25 = 363
  case condF26 = 364
  case condF27 = 365
  case condF28 = 366
  case condF29 = 367
  case condF30 = 368
  case condF31 = 369
  case condwheelSensor = 370
  case condSensor1 = 371
  case condSensor2 = 372
  case condSensor3 = 373
  case condSensor4 = 374

  // Physical Outputs
  
  case fmFrontLight_1 = 290
  case fmFrontLight_2 = 291
  case fmRearLight_1 = 292
  case fmRearLight_2 = 293
  case fmAux1_1 = 294
  case fmAux1_2 = 295
  case fmAux2_1 = 312
  case fmAux2_2 = 313
  case fmAux3 = 296
  case fmAux4 = 297
  case fmAux5 = 298
  case fmAux6 = 299
  case fmAux7 = 300
  case fmAux8 = 301
  case fmAux9 = 302
  case fmAux10 = 303
  case fmAux11 = 304
  case fmAux12 = 305
  case fmAux13 = 306
  case fmAux14 = 307
  case fmAux15 = 308
  case fmAux16 = 309
  case fmAux17 = 310
  case fmAux18 = 311

  // Logical Functions

  case fmOptionalLoad = 334
  case fmSwitchingMode = 316
  case fmBrake1 = 331
  case fmBrake2 = 332
  case fmBrake3 = 333
  case fmPrimaryLoad = 335
  case fmUncouplingCycle = 323
  case fmDriveHold = 324

  case fmDimmer = 317
  case fmGradeCrossing = 318
  case fmAcceleration = 315
  case fmESUSmokeUnit = 320
  case fmFadeOutSound = 319
  case fmDisableBrakeSound = 322
  case fmVolumeControl = 321

  case fmShiftMode1 = 325
  case fmShiftMode2 = 326
  case fmShiftMode3 = 327
  case fmShiftMode4 = 328
  case fmShiftMode5 = 329
  case fmShiftMode6 = 330

  // Sounds
  
  case fmSoundSlot1 = 258
  case fmSoundSlot2 = 259
  case fmSoundSlot3 = 260
  case fmSoundSlot4 = 261
  case fmSoundSlot5 = 262
  case fmSoundSlot6 = 263
  case fmSoundSlot7 = 264
  case fmSoundSlot8 = 265
  case fmSoundSlot9 = 266
  case fmSoundSlot10 = 267
  case fmSoundSlot11 = 268
  case fmSoundSlot12 = 269
  case fmSoundSlot13 = 270
  case fmSoundSlot14 = 271
  case fmSoundSlot15 = 272
  case fmSoundSlot16 = 273
  case fmSoundSlot17 = 274
  case fmSoundSlot18 = 275
  case fmSoundSlot19 = 276
  case fmSoundSlot20 = 277
  case fmSoundSlot21 = 278
  case fmSoundSlot22 = 279
  case fmSoundSlot23 = 280
  case fmSoundSlot24 = 281
  case fmSoundSlot25 = 282
  case fmSoundSlot26 = 283
  case fmSoundSlot27 = 284
  case fmSoundSlot28 = 285
  case fmSoundSlot29 = 286
  case fmSoundSlot30 = 287
  case fmSoundSlot31 = 288
  case fmSoundSlot32 = 289

  // Identification
  
  case userId1 = 61
  case userId2 = 62
  
  // Compatibility
  
  case enableSerialFunctionModeF1toF8ForLGBMTS = 158
  case enableMarklinDeltaMode = 395
  case enableZIMOManualFunction = 396
  case enableSupportForBroadwayLimitedSteamEngineControl = 159
  case enableSUSIMaster = 160
  case susiWarning = 161
  case susiWarningAux3Aux4 = 380
  case enableSUSISlave = 162
  case enableSimpleSUSI = 388
  case susiMapping = 242
  case disableMotorEMKMeasureDescription = 423
  case disableMotorEMKMeasure = 424

  // Motor Settings
  
  case locomotiveName = 255
  case locoMaximumSpeed = 256
  case speedTableType = 375
  case threeValueSpeedTable = 379
  case nmraSpeedTable = 425
  case vStart = 376
  case vMid = 377
  case vHigh = 378
  case threeValueSpeedTablePreset = 386
  case esuSpeedTable = 200
  case speedTableIndex = 201
  case speedTableEntryValue = 202
  case speedTableEntryValueB = 426
  case speedTablePreset = 203
  case minimumSpeed = 112
  case minimumSpeedB = 505
  case maximumSpeed = 113
  case maximumSpeedB = 506
  case enableLoadControlBackEMF = 114
  case emfBasicSettings = 130
  case regulationReference = 115
  case regulationReferenceB = 492
  case regulationReferenceC = 501
  case regulationParameterK = 116
  case regulationParameterKB = 493
  case regulationParameterKC = 502
  case regulationParameterIA = 117
  case regulationParameterIB = 494
  case regulationParameterIC = 503
  case regulationParameterID = 513
  case regulationReferenceLok3 = 427
  case regulationParameterKLok3 = 428
  case regulationParameterILok3 = 429
  case emfSlowSpeedSettings = 131
  case regulationParameterKSlow = 118
  case regulationParameterISlow = 397
  case largestInternalSpeedStepThatUsesKSlow = 129
  case regulationInfluenceDuringSlowSpeed = 119
  case regulationInfluence = 514
  case regulationInfluenceLok3 = 430
  case emfBackEMFSettings = 132
  case slowSpeedBackEMFSamplingPeriod = 120
  case fullSpeedBackEMFSamplingPeriod = 121
  case slowSpeedLengthOfMeasurementGap = 122
  case fullSpeedLengthOfMeasurementGap = 123
  case adaptiveRegulationFrequencyEnabled = 398
  case backEMFSamplingPeriod = 399
  case dcMotorPWMFrequency = 400
  case dcMotorPWMFrequencyLok3 = 431
  case enableMotorOverloadProtection = 124
  case enableMotorCurrentLimiter = 125
  case motorCurrentLimiterLimit = 126
  case motorPulseFrequency = 127
  case enableAutomaticParkingBrake = 128
  
  // Smoke Unit
  
  case smokeSGUnitTimeUntilPowerOff = 105
  case smokeUnitFanSpeedTrim = 106
  case smokeSGUnitTemperatureTrim = 107
  case smokeUnitPreheatingTemperatureForSecondarySmokeUnits = 108
  case smokeChuffsDurationRelativeToTriggerDistance = 109
  case smokeChuffsMinimumDuration = 110
  case smokeChuffsMaximumDuration = 111
  
  // Special Options
  
  case enableDCCProtocol = 83
  case enableMarklinMotorolaProtocol = 84
  case enableSelectrixProtocol = 85
  case enableM4Protocol = 86
  case memoryPersistentFunction = 87
  case memoryPersistentSpeed = 88
  case memoryPersistentFunctionLok3 = 432
  case memoryPersistentSpeedLok3 = 433
  case memoryPersistentAccelerationLok3 = 434
  case enableRailComPlusSynchronization = 89
  case m4MasterDecoderManufacturer = 90
  case m4MasterDecoderSerialNumber = 91
  case disableMotorBrake = 490
  
  // Sound Settings
  
  case esuSoundType = 435
  case esuDistanceOfGearSteps = 436
  case esuDistanceOfSteamChuffsAtSpeedStep1 = 437
  case esuDistanceofSteamChuffsAtSpeedStep2 = 438
  case esuTriggerImpulses = 439
  case esuDriveSoundSpeedMinimum = 442
  case esuDriveSoundSpeedMaximum = 443
  case soundSelection = 401
  case steamChuffMode = 133
  case distanceOfSteamChuffsAtSpeedStep1 = 134
  case triggerImpulsesPerSteamChuff = 140
  case divideTriggerImpulsesInTwoIfShuntingModeEnabled = 141
  case steamChuffAdjustmentAtHigherSpeedSteps = 135
  case enableSecondaryTrigger = 136
  case secondaryTriggerDistanceReduction = 137
  case enableMinimumDistanceOfSteamChuffs = 138
  case minimumDistanceofSteamChuffs = 139
  case minimumDistanceofSteamChuffsLok3 = 450
  case warningDigitalWheelSensorDisabled = 517
  case randomSoundsMinimumDistance = 402
  case randomSoundsMaximumDistance = 403
  case randomSoundsMinimumDistanceLok3 = 444
  case randomSoundsMaximumDistanceLok3 = 445
  case masterVolume = 142
  case masterVolumeLok3 = 440
  case volumeControl1 = 446
  case volumeControl2 = 447
  case volumeControl3 = 448
  case fadeSoundVolumeReduction = 143
  case soundFadeOutFadeInTime = 144
  case soundBass = 145
  case soundTreble = 146
  case brakeSoundSwitchingOnThreshold = 147
  case brakeSoundSwitchingOffThreshold = 148
  case brakeSoundSwitchingOffThresholdLok3 = 449
  case soundControlBasis = 149
  case trainLoadAtLowSpeed = 150
  case trainLoadAtHighSpeed = 151
  case enableLoadOperationThreshold = 152
  case loadOperationThreshold = 153
  case loadOperationTriggeredFunction = 154
  case enableIdleOperationThreshold = 155
  case idleOperationThreshold = 156
  case idleOperationTriggeredFunction = 157
  case disableLoadDependentSound = 455
  case heavyLoadIncreaseSoundAcceleration = 404
  case heavyLoadKeepConstantSpeed = 405
  case coastModeIncreaseSoundAcceleration = 406
  case coastModeKeepConstantSpeed = 407
  case enableSoundSteamShift = 451
  case timeForOneSteamShiftCycle = 452
  case earliestRelativeStartPosition = 453
  case latestRelativeEndPosition = 454

  // Sound Slot Settings
  
  case soundCV = 243
  case soundCVValue = 244
  case esuSoundSlot = 245
  case soundSlotVolume = 246
  case soundSlotVolume128 = 515
  case soundSlotMinimumSoundSpeed = 247
  case soundSlotMaximumSoundSpeed = 248
  case soundSlotPlayOnlyIfDriveSoundEnabled = 249
  case soundSlotSoundConfiguration = 250
  
  // MARK: Public Properties
  
  public var definition : ProgrammerToolSettingsPropertyDefinition {
    return ProgrammerToolSettingsProperty.definitions[self]!
  }
  
  public var section : ProgrammerToolSettingsSection {
    return definition.section
  }
  
  public var controlType : ProgrammerToolControlType {
    return definition.controlType
  }
  
  @MainActor public var minMaxBaseProperty : ProgrammerToolSettingsProperty? {
    return ProgrammerToolSettingsProperty.minMaxProperties[self]
  }
  
  public var info : String {
    
    var result = ""
    
    result += "Group:              \(definition.section.inspector.title)\n\n"
    
    result += "Section:            \(definition.section.title)\n\n"
    
    result += "Title:              \(definition.title)\n\n"
    
    result += "Control Type:       \(definition.controlType)\n\n"
    
    result += "Encoding:           \(definition.encoding)\n\n"
    
    if let minValue = definition.minValue {
      result += "Minimum Value:      \(minValue)\n\n"
    }
    
    if let maxValue = definition.maxValue {
      result += "Maximum Value:      \(maxValue)\n\n"
    }
    
    if let trueDefaultValue = definition.trueDefaultValue {
      result += "True Default Value: \(trueDefaultValue)\n\n"
    }
    
    result += "Info Type:          \(definition.infoType)\n\n"

    if let infoFactor = definition.infoFactor {
      result += "Info Factor:        \(infoFactor)\n\n"
    }
    
    if let infoMaxDP = definition.infoMaxDecimalPlaces {
      result += "Info Maximum DP:    \(infoMaxDP)\n\n"
    }
    
    if let infoFormat = definition.infoFormat {
      result += "Info Format:        \(infoFormat)\n\n"
    }

    if let cvIndexingMethod = definition.cvIndexingMethod {
      result += "CV Indexing Method: \(cvIndexingMethod)\n\n"
    }
    
    if let cvs = definition.cv, let mask = definition.mask, let shift = definition.shift {
      var temp = cvs.count == 1 ? "CV: " : "CVs:"
      for index in 0 ..< cvs.count {
        result += "\(temp)                \(cvs[index])   0x\(mask[index].hex())   \(shift[index])\n"
        temp = "    "
      }
    }
    
    return result
    
  }
  
  @MainActor public func cvLabel(decoder:Decoder) -> String? {
    
    guard let definition = ProgrammerToolSettingsProperty.definitions[self], let _cvs = definition.cv, let masks = definition.mask, let cvIndexingMethod = definition.cvIndexingMethod else {
      return nil
    }
    
    func decode(cv:CV, mask:UInt8) -> String {
      
      var bits = ""
      
      if mask != 0xff {
        
        var temp = ByteMask.d7
        var index = 7
        var firstBit : Int?
        var lastBit : Int?
        
        while temp != 0 {
          if (mask & temp) == temp {
            if firstBit == nil {
              firstBit = index
            }
            lastBit = index
          }
          temp >>= 1
          index -= 1
        }
        
        if let firstBit, let lastBit {
          if firstBit == lastBit {
            bits = ".\(firstBit)"
          }
          else {
            bits = ".\(firstBit):\(lastBit)"
          }
        }
        
      }
      
      return "CV\(cv.cv)\(bits)"
      
    }
    
    var cvs = _cvs
    
    if let baseProperty = minMaxBaseProperty {
      let index = rawValue - baseProperty.rawValue
      cvs = [_cvs[index]]
    }
    
    switch definition.encoding {
    case .speedTableValue:
      cvs = [_cvs[0] + (decoder.speedTableIndex - 1)]
    default:
      break
    }
    
    let offset = decoder.cvIndexOffset(indexingMethod: cvIndexingMethod)
    
    let isMultiple = cvs.count > 2
    
    if isMultiple {
      
      var isContiguous = true
      
      for index in 1 ... cvs.count - 1 {
        let previous = cvs[index - 1] + offset
        if let test = CV(cv31: previous.cv31, cv32: previous.cv32, cv: previous.cv + 1, indexMethod: previous.indexMethod) {
          if !(cvs[index] + offset == test && masks[index] == masks[index - 1]) {
            isContiguous = false
            break
          }
        }
        else {
          isContiguous = false
          break
        }
      }
      
      if isContiguous {
        let first = cvs.first! + offset
        var result = "\(decode(cv: first, mask: masks.first!)) to \(decode(cv: cvs.last! + offset, mask: masks.last!))"
        if first.cv31 != 0 || first.cv32 != 0 {
          result += " (CV31 = \(first.cv31), CV32 = \(first.cv32))"
        }
        return result
      }
      
    }
    
    var result = ""
    
    for index in 0 ... cvs.count - 1 {
      if !result.isEmpty {
        result += ", "
      }
      let temp = cvs[index] + offset
      result += decode(cv: temp, mask: masks[index])
      if temp.cv31 != 0 || temp.cv32 != 0 {
        result += " (CV31=\(temp.cv31), CV32=\(temp.cv32))"
      }
    }
    
    return result

  }
  
  // MARK: Private Class Properties
  
  internal static let _minMaxPropertyDefs : [ProgrammerToolSettingsProperty:Int] = [
    .slowSpeedBackEMFSamplingPeriod  : 2,
    .slowSpeedLengthOfMeasurementGap : 2,
    .randomPassiveMinimum            : 2,
    .randomActiveMinimum             : 2,
    .vStart                          : 3,
    .soundSlotMinimumSoundSpeed      : 2,
    .smokeChuffsMinimumDuration      : 2,
    .hluSpeedLimit1                  : 5,
    .randomSoundsMinimumDistance     : 2,
    .randomSoundsMinimumDistanceLok3 : 2,
  ]
  
  @MainActor internal static var _minMaxProperties : [ProgrammerToolSettingsProperty:ProgrammerToolSettingsProperty]?
  
  // MARK: Public Class Properties
  
  @MainActor public static var minMaxProperties : [ProgrammerToolSettingsProperty:ProgrammerToolSettingsProperty] {
    
    if _minMaxProperties == nil {
      
      _minMaxProperties = [:]
      
      for (baseProperty, numberOfProperties) in _minMaxPropertyDefs {
        for index in 0 ... numberOfProperties - 1 {
          if let indexedProperty = ProgrammerToolSettingsProperty(rawValue: baseProperty.rawValue + index) {
            _minMaxProperties![indexedProperty] = baseProperty
          }
        }
      }

    }

    return _minMaxProperties!

  }
  
  @MainActor public static var propertyViews : [PTSettingsPropertyView] {
    
    var result : [PTSettingsPropertyView] = []
    
    for property in ProgrammerToolSettingsProperty.allCases {
      
      if let definition = ProgrammerToolSettingsProperty.definitions[property] {
        
        let view = PTSettingsPropertyView()
        
        view.initialize(property: property, definition: definition)
        
        result.append(view)
        
      }
    }
    
    return result
    
  }
  
}
