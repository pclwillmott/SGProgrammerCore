// -----------------------------------------------------------------------------
// ESURandomFunction.swift
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
//     26/09/2024  Paul Willmott - ESURandomFunction.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit

public enum ESURandomFunction : UInt8, CaseIterable, Sendable {
  
  // MARK: Enumeration
  
  case random1 = 0
  case random2 = 1
  case random3 = 2
  case random4 = 3
  case random5 = 4
  case random6 = 5
  case random7 = 6
  case random8 = 7

  // MARK: Constructors
  
  init?(title:String) {
    for temp in ESURandomFunction.allCases {
      if temp.title == title {
        self = temp
        return
      }
    }
    return nil
  }

  // MARK: Public Properties
  
  public var title : String {
    return ESURandomFunction.titles[self]!
  }
  
  // MARK: Public Methods
  
  public func cvIndexOffset(decoder:Decoder) -> Int {
    return Int(self.rawValue) * 8
  }
  
  // MARK: Private Class Properties
  
  private static let titles : [ESURandomFunction:String] = [
    .random1 : String(localized:"Random 1"),
    .random2 : String(localized:"Random 2"),
    .random3 : String(localized:"Random 3"),
    .random4 : String(localized:"Random 4"),
    .random5 : String(localized:"Random 5"),
    .random6 : String(localized:"Random 6"),
    .random7 : String(localized:"Random 7"),
    .random8 : String(localized:"Random 8"),
  ]

  // MARK: Public Class Methods
  
  @MainActor public static func populate(comboBox:NSComboBox) {
    let target = comboBox.target
    let action = comboBox.action
    comboBox.target = nil
    comboBox.action = nil
    comboBox.removeAllItems()
    for item in ESURandomFunction.allCases {
      comboBox.addItem(withObjectValue: item.title)
    }
    comboBox.target = target
    comboBox.action = action
  }

}
