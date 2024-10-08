// -----------------------------------------------------------------------------
// ProgrammerToolSettingsSection.swift
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
//     26/09/2024  Paul Willmott - ProgrammerToolSettingsSection.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit

public enum ProgrammerToolSettingsSection : Int, CaseIterable, Sendable {
  
  // MARK: Enumeration
  
  // Decoder Information
  
  case decoderInformation
  
  // Address
  
  case locomotiveAddress = 1
  case dccConsistAddress = 2
  case activateFunctionsInConsistMode = 3
  
  // Analog Settings
  
  case activeFunctionsInAnalogMode = 4
  case acAnalogMode = 5
  case dcAnalogMode = 6
  case quantumEngineer = 7
  case soundControlBehaviour = 8
  case analogModeMotorControl = 9
  case analogVoltageHysteresis = 10
  case analogModePWM = 69
  
  // Brake Settings
  
  case abcBrakeSections = 11
  case allowedBrakeSections = 70
  case hluSettings = 12
  case autoStopInPresenceOfDCPolarity = 13
  case selectrixBrakeSections = 14
  case constantBrakeDistance = 15
  case brakeSectionSettings = 16
  case brakeFunctions = 17
  case dynamicBrakeSettings = 68
  
  // DCC Settings
  
  case railComSettings = 18
  case speedStepMode = 19
 
  // Driving Characteristics
  
  case accelerationAndDeceleration = 21
  case reverseMode = 22
  case trimming = 23
  case loadAdjustment = 24
  case gearboxBacklash = 25
  case powerPack = 26
  case preserveDirection = 27
  case startingDelay = 28
  case stopBehaviour = 62
  
  // Function Outputs
  
  case physicalOutputConfiguration = 29
  
  // Function Settings
  
  case soundFunctionBehaviour = 65
  case generalPhysicalOutputSettings = 30
  case sensorSettings = 31
  case sensorConfiguration = 32
  case automaticUncoupling = 33
  case randomFunctions = 34
  case additionalFunctionSettings = 57
  
  // Function Mapping
  
  case functionMappings = 35
  case functionMappingConditions = 58
  case functionMappingPhysicalOutputs = 59
  case functionMappingLogicalFunctions = 60
  case functionMappingSounds = 61

  // Identification
  
  case userIdentification = 20
  
  // Compatibility
  
  case settingsForCertainCommandStations = 36
  case broadwayLimitedSteamEngineControl = 37
  case serialUserStandardInterface = 38
  case susiMapping = 39
  case motorEMKMeasure = 72
  
  // Motor Settings
  
  case locomotiveInformation = 63
  case speedTable = 40
  case loadControlBackEMF = 41
  case dcMotorPWMFrequency = 66
  case motorOverloadProtection = 42
  case pwmFrequency = 43
  case automaticParkingBrake = 44
  
  // Smoke Unit
  
  case esuSmokeUnit = 45
  case smokeChuffs = 46
  
  // Special Options
  
  case enabledProtocols = 47
  case memorySettings = 48
  case railComDecoderSync = 49
  case motorBrake = 76
  
  // Sound Settings
  
  case soundType = 73
  case driveSoundSpeed = 74
  case soundSelection = 64
  case steamChuffs = 50
  case randomSounds = 71
  case volume = 51
  case toneControl = 52
  case brakeSound = 53
  case loadDependentSound = 77
  case dynamicSoundControl = 54
  case heavyLoadCoastControl = 67
  case soundSteamShift = 75
  
  // Sound Slot Settings
  
  case soundCVConfiguration = 55
  case soundSlotConfiguration = 56
  
  // MARK: Public Properties
  
  public var inspector : ProgrammerToolSettingsGroup {
    return ProgrammerToolSettingsSection.groups[self]!.inspector
  }

  public var title : String {
    return ProgrammerToolSettingsSection.groups[self]!.title
  }

  // MARK: Private Class Properties
  
  private static let groups : [ProgrammerToolSettingsSection:(title:String, inspector:ProgrammerToolSettingsGroup)] = [
    .decoderInformation : (
      String(localized: "Decoder Information"),
      .info
    ),
    .driveSoundSpeed : (
      String(localized: "Drive Sound Speed"),
      .soundSettings
    ),
    .loadDependentSound : (
      String(localized: "Load Dependent Sound"),
      .soundSettings
    ),
    .soundSteamShift : (
      String(localized: "Sound Steam Shift"),
      .soundSettings
    ),
    .soundSelection : (
      String(localized: "Sound Selection"),
      .soundSettings
    ),
    .randomSounds : (
      String(localized: "Random Sounds"),
      .soundSettings
    ),
    .heavyLoadCoastControl : (
      String(localized: "Heavy Load and Coast Mode"),
      .soundSettings
    ),
    .locomotiveAddress : (
      String(localized: "Locomotive Address"),
      .address
    ),
    .motorBrake : (
      String(localized: "Motor Brake"),
      .specialOptions
    ),
    .dccConsistAddress : (
      String(localized: "DCC Consist Address"),
      .address
    ),
    .soundFunctionBehaviour : (
      String(localized: "Sound Function Behaviour"),
      .functionSettings
    ),
    .motorEMKMeasure : (
      String(localized: "Motor EMK Measure"),
      .compatibility
    ),
    .additionalFunctionSettings : (
      String(localized: "Additional Function Settings"),
      .functionSettings
    ),
    .activateFunctionsInConsistMode : (
      String(localized: "Activate Functions in Consist Mode"),
      .address
    ),
    .activeFunctionsInAnalogMode: (
      String(localized: "Active Functions in Analog Mode"),
      .analogSettings
    ),
    .acAnalogMode : (
      String(localized: "AC Analog Mode"),
      .analogSettings
    ),
    .dynamicBrakeSettings : (
      String(localized: "Dynamic Brake Settings"),
      .brakeSettings
    ),
    .dcAnalogMode : (
      String(localized: "DC Analog Mode"),
      .analogSettings
    ),
    .analogModePWM : (
      String(localized: "Analog Mode PWM"),
      .analogSettings
    ),
    .dcMotorPWMFrequency : (
      String(localized: "DC Motor PWM Frequency"),
      .motorSettings
    ),
    .quantumEngineer : (
      String(localized: "Quantum Engineer"),
      .analogSettings
    ),
    .soundControlBehaviour : (
      String(localized: "Sound Control Behaviour"),
      .analogSettings
    ),
    .analogModeMotorControl : (
      String(localized: "Analog Mode Motor Control"),
      .analogSettings
    ),
    .analogVoltageHysteresis : (
      String(localized: "Analog Voltage Hysteresis"),
      .analogSettings
    ),
    .abcBrakeSections : (
      String(localized: "ABC Brake Sections"),
      .brakeSettings
    ),
    .hluSettings : (
      String(localized: "HLU Sections"),
      .brakeSettings
    ),
    .autoStopInPresenceOfDCPolarity : (
      String(localized: "Auto Stop in presence of DC Polarity"),
      .brakeSettings
    ),
    .selectrixBrakeSections : (
      String(localized: "Selectrix Brake Sections"),
      .brakeSettings
    ),
    .constantBrakeDistance : (
      String(localized: "Constant Brake Distance"),
      .brakeSettings
    ),
    .brakeSectionSettings : (
      String(localized: "Brake Section Settings"),
      .brakeSettings
    ),
    .brakeFunctions : (
      String(localized: "Brake Functions"),
      .brakeSettings
    ),
    .allowedBrakeSections : (
      String(localized: "Allowed Brake Sections"),
      .brakeSettings
    ),
    .railComSettings : (
      String(localized: "RailCom Settings"),
      .dccSettings
    ),
    .speedStepMode : (
      String(localized: "Speed Step Mode"),
      .dccSettings
    ),
    .userIdentification : (
      String(localized: "User Identification"),
      .identification
    ),
    .accelerationAndDeceleration : (
      String(localized: "Acceleration and Deceleration"),
      .drivingCharacteristics
    ),
    .reverseMode : (
      String(localized: "Reverse Mode"),
      .drivingCharacteristics
    ),
    .trimming : (
      String(localized: "Trimming"),
      .drivingCharacteristics
    ),
    .loadAdjustment : (
      String(localized: "Load Adjustment"),
      .drivingCharacteristics
    ),
    .gearboxBacklash : (
      String(localized: "Gearbox Backlash"),
      .drivingCharacteristics
    ),
    .powerPack : (
      String(localized: "Power Pack"),
      .drivingCharacteristics
    ),
    .preserveDirection : (
      String(localized: "Preserve Direction"),
      .drivingCharacteristics
    ),
    .startingDelay : (
      String(localized: "Starting Delay"),
      .drivingCharacteristics
    ),
    .stopBehaviour : (
      String(localized: "Stop Behaviour"),
      .drivingCharacteristics
    ),
    .physicalOutputConfiguration : (
      String(localized: "Physical Output Configuration"),
      .functionOutputs
    ),
    .generalPhysicalOutputSettings : (
      String(localized: "General Physical Output Settings"),
      .functionSettings
    ),
    .sensorSettings : (
      String(localized: "Sensor Settings"),
      .functionSettings
    ),
    .sensorConfiguration : (
      String(localized: "Sensor Configuration"),
      .functionSettings
    ),
    .automaticUncoupling : (
      String(localized: "Automatic Uncoupling"),
      .functionSettings
    ),
    .randomFunctions : (
      String(localized: "Random Functions"),
      .functionSettings
    ),
    .functionMappings : (
      String(localized: "Function Mappings"),
      .functionMapping
    ),
    .functionMappingConditions : (
      String(localized: "Conditions"),
      .functionMapping
    ),
    .functionMappingPhysicalOutputs : (
      String(localized: "Physical Outputs"),
      .functionMapping
    ),
    .functionMappingLogicalFunctions : (
      String(localized: "Logical Functions"),
      .functionMapping
    ),
    .functionMappingSounds : (
      String(localized: "Sounds"),
      .functionMapping
    ),
    .settingsForCertainCommandStations : (
      String(localized: "Settings for certain Command Stations"),
      .compatibility
    ),
    .broadwayLimitedSteamEngineControl : (
      String(localized: "Broadway Limited Steam Engine Control"),
      .compatibility
    ),
    .serialUserStandardInterface : (
      String(localized: "Serial User Standard Interface"),
      .compatibility
    ),
    .susiMapping : (
      String(localized: "SUSI Mapping"),
      .compatibility
    ),
    .locomotiveInformation : (
      String(localized: "Locomotive Information"),
      .motorSettings
    ),
    .speedTable : (
      String(localized: "Speed Table"),
      .motorSettings
    ),
    .loadControlBackEMF : (
      String(localized: "Load Control / Back EMF"),
      .motorSettings
    ),
    .motorOverloadProtection : (
      String(localized: "Motor Overload Protection"),
      .motorSettings
    ),
    .pwmFrequency : (
      String(localized: "PWM Frequency"),
      .motorSettings
    ),
    .automaticParkingBrake : (
      String(localized: "Automatic Parking Brake"),
      .motorSettings
    ),
    .esuSmokeUnit : (
      String(localized: "ESU Smoke Unit"),
      .smokeUnit
    ),
    .smokeChuffs : (
      String(localized: "Smoke Chuffs"),
      .smokeUnit
    ),
    .enabledProtocols : (
      String(localized: "Enabled Protocols"),
      .specialOptions
    ),
    .memorySettings : (
      String(localized: "Memory Settings"),
      .specialOptions
    ),
    .railComDecoderSync : (
      String(localized: "RailComPlus and M4 Master Decoder Synchronization"),
      .specialOptions
    ),
    .steamChuffs : (
      String(localized: "Steam Chuffs"),
      .soundSettings
    ),
    .volume : (
      String(localized: "Volume"),
      .soundSettings
    ),
    .soundType : (
      String(localized: "Sound Type"),
      .soundSettings
    ),
    .toneControl : (
      String(localized: "Tone Control"),
      .soundSettings
    ),
    .brakeSound : (
      String(localized: "Brake Sound"),
      .soundSettings
    ),
    .dynamicSoundControl : (
      String(localized: "Dynamic Sound Control"),
      .soundSettings
    ),
    .soundCVConfiguration : (
      String(localized: "Sound CV Configuration"),
      .soundSlotSettings
    ),
    .soundSlotConfiguration : (
      String(localized: "Sound Slot Configuration"),
      .soundSlotSettings
    ),
  ]
  
  // MARK: Public Class Properties
  
  @MainActor public static var inspectorSectionFields : [ProgrammerToolSettingsSection:ProgrammerToolSettingsSectionField] {
    
    var constraints : [NSLayoutConstraint] = []

    var result : [ProgrammerToolSettingsSection:ProgrammerToolSettingsSectionField] = [:]
    
    for item in ProgrammerToolSettingsSection.allCases {
      
      var field : ProgrammerToolSettingsSectionField = (nil, nil, item)
      
      let view = NSView()
      view.translatesAutoresizingMaskIntoConstraints = false
      
      let label = NSTextField(labelWithString: item.title)
      label.translatesAutoresizingMaskIntoConstraints = false
      label.font = NSFont.systemFont(ofSize: 15, weight: .bold)
      label.textColor = NSColor.systemGray
      label.alignment = .left
      
      view.addSubview(label)
      constraints.append(label.leadingAnchor.constraint(equalTo: view.leadingAnchor))
      constraints.append(view.heightAnchor.constraint(equalTo: label.heightAnchor))
      
      field.view = view
      field.label = label
      
      result[item] = field
      
    }
    
    NSLayoutConstraint.activate(constraints)

    return result
    
  }
  
  @MainActor public static var inspectorSectionSeparators : [ProgrammerToolSettingsSection:ProgrammerToolSettingsSectionField] {
    
    var constraints : [NSLayoutConstraint] = []

    var result : [ProgrammerToolSettingsSection:ProgrammerToolSettingsSectionField] = [:]
    
    for item in ProgrammerToolSettingsSection.allCases {
      
      var field : ProgrammerToolSettingsSectionField = (nil, nil, item)
      
      let separator = SeparatorView()
      separator.translatesAutoresizingMaskIntoConstraints = false
      constraints.append(separator.heightAnchor.constraint(equalToConstant: 20))

      field.view = separator
      
      result[item] = field
      
    }
    
    NSLayoutConstraint.activate(constraints)

    return result
    
  }

}
