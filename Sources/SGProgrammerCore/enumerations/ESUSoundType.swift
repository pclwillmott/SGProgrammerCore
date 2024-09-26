// -----------------------------------------------------------------------------
// ESUSoundType.swift
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
//     26/09/2024  Paul Willmott - ESUSoundType.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit

public enum ESUSoundType : Int, CaseIterable, Sendable {
  
  // MARK: Enumeration
  
  case dieselHydraulical                    = 0
  case dieselMechanical                     = 1
  case electricOrDieselElectric             = 2
  case steamLocomotiveWithoutExternalSensor = 3
  case steamLocomotiveWithExternalSensor    = 4
  
  // MARK: Constructors
  
  init?(title:String) {
    for temp in ESUSoundType.allCases {
      if temp.title == title {
        self = temp
        return
      }
    }
    return nil
  }

  init(cv57:UInt8, cv58:UInt8) {
    if cv57 == 0 && cv58 == 0 {
      self = .dieselHydraulical
    }
    else if cv57 == 1 && cv58 == 0 {
      self = .dieselMechanical
    }
    else if cv57 != 0 && cv58 != 0 {
      self = .steamLocomotiveWithoutExternalSensor
    }
    else { // There are two cases that match this so pick the first
      self = .electricOrDieselElectric
    }
  }

  // MARK: Public Properties
  
  public var title : String {
    return ESUSoundType.titles[self]!
  }

  // MARK: Private Class Properties
  
  private static let titles : [ESUSoundType:String] = [
    .dieselHydraulical                    : String(localized:"Diesel Hydraulical"),
    .dieselMechanical                     : String(localized:"Diesel Mechanical"),
    .electricOrDieselElectric             : String(localized:"Electric or Diesel Electric"),
    .steamLocomotiveWithoutExternalSensor : String(localized:"Steam Locomotive without External Sensor"),
    .steamLocomotiveWithExternalSensor    : String(localized:"Steam Locomotive with External Sensor"),
  ]

  // MARK: Public Class Methods
  
  @MainActor public static func populate(comboBox:NSComboBox) {
    comboBox.removeAllItems()
    for item in ESUSoundType.allCases {
      comboBox.addItem(withObjectValue: item.title)
    }
  }

}
