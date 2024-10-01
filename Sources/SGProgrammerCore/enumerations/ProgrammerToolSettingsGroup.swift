// -----------------------------------------------------------------------------
// ProgrammerToolSettingsGroup.swift
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
//     26/09/2024  Paul Willmott - ProgrammerToolSettingsGroup.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit
import SGAppKit

public enum ProgrammerToolSettingsGroup : Int, CaseIterable, Sendable {
  
  // MARK: Enumeration
  
  case info = 0
  case address = 1
  case analogSettings = 2
  case brakeSettings = 3
  case dccSettings = 4
  case drivingCharacteristics = 5
  case functionOutputs = 6
  case functionSettings = 7
  case functionMapping = 8
  case identification = 9
  case compatibility = 10
  case motorSettings = 11
  case smokeUnit = 12
  case specialOptions = 13
  case soundSettings = 14
  case soundSlotSettings = 15
  case manualCVInput = 16
  
  // MARK: Public Properties
  
  public var title : String {
  
    let titles : [ProgrammerToolSettingsGroup:String] = [
      .info                   : String(localized: "Decoder Information"),
      .address                : String(localized: "Address"),
      .analogSettings         : String(localized: "Analog Settings"),
      .brakeSettings          : String(localized: "Brake Settings"),
      .dccSettings            : String(localized: "DCC Settings"),
      .drivingCharacteristics : String(localized: "Driving Characteristics"),
      .functionOutputs        : String(localized: "Function Outputs"),
      .functionSettings       : String(localized: "Function Settings"),
      .functionMapping        : String(localized: "Function Mappings"),
      .identification         : String(localized: "Identification"),
      .compatibility          : String(localized: "Compatibility"),
      .motorSettings          : String(localized: "Motor Settings"),
      .smokeUnit              : String(localized: "Smoke Unit"),
      .specialOptions         : String(localized: "Special Options"),
      .soundSettings          : String(localized: "Sound Settings"),
      .soundSlotSettings      : String(localized: "Sound Slot Settings"),
      .manualCVInput          : String(localized: "Manual CV Input"),
    ]
    
    return titles[self]!

  }
  
  @MainActor public var button : NSButton {
    
    let icons : [ProgrammerToolSettingsGroup:SGIcon] = [
      .info : .info,
      .address : .envelope,
      .analogSettings : .speedometer,
      .brakeSettings : .brake,
      .dccSettings : .gear,
      .drivingCharacteristics : .gearshift,
      .functionOutputs : .lightbulb,
      .functionSettings : .button,
      .functionMapping : .button,
      .identification : .id,
      .compatibility : .button,
      .motorSettings : .engine,
      .smokeUnit : .smoke,
      .specialOptions : .button,
      .soundSettings : .speaker,
      .soundSlotSettings : .speaker,
      .manualCVInput : .wrench,
    ]
    
    let button = icons[self]!.button(target: nil, action: nil)
    button?.toolTip = title
    button?.translatesAutoresizingMaskIntoConstraints = false
    button?.isBordered = false
    button?.tag = self.rawValue
    
    return button ?? NSButton(title: "\(self)", target: nil, action: nil)
    
  }
  
}
