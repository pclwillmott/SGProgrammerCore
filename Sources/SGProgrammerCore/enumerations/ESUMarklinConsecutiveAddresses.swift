// -----------------------------------------------------------------------------
// ESUMarklinConsecutiveAddresses.swift
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
//     26/09/2024  Paul Willmott - ESUMarklinConsecutiveAddresses.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit

public enum ESUMarklinConsecutiveAddresses : UInt8, CaseIterable, Sendable {
  
  // MARK: Enumeration
  
  case noAdditionalAddresses = 0b00000000
  case use2Addresses         = 0b00001000
  case use3Addresses         = 0b10000000
  case use4Addresses         = 0b10001000

  // MARK: Constructors
  
  init?(title:String) {
    for temp in ESUMarklinConsecutiveAddresses.allCases {
      if temp.title == title {
        self = temp
        return
      }
    }
    return nil
  }

  // MARK: Public Properties
  
  public var title : String {
    return ESUMarklinConsecutiveAddresses.titles[self]!
  }
  
  // MARK: Private Class Properties
  
  private static let titles : [ESUMarklinConsecutiveAddresses:String] = [
    .noAdditionalAddresses : String(localized:"No Additional Addresses"),
    .use2Addresses : String(localized:"Second Address for Motorola and Selectrix"),
    .use3Addresses : String(localized:"Use 3 Addresses (Motorola only)"),
    .use4Addresses : String(localized:"Use 4 Addresses (Motorola only)"),
  ]
  
  // MARK: Public Class Properties
  
  public static let mask : UInt8 = 0b10001000
  
  // MARK: Public Class Methods
  
  @MainActor public static func populate(comboBox:NSComboBox) {
    comboBox.removeAllItems()
    for item in ESUMarklinConsecutiveAddresses.allCases {
      comboBox.addItem(withObjectValue: item.title)
    }
  }

}
