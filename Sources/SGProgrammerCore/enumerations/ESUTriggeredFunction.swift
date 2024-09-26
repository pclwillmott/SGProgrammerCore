// -----------------------------------------------------------------------------
// ESUTriggeredFunction.swift
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
//     26/09/2024  Paul Willmott - ESUTriggeredFunction.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit

public enum ESUTriggeredFunction : UInt8, CaseIterable, Sendable {
  
  // MARK: Enumeration
  
  case f0  = 0
  case f1  = 1
  case f2  = 2
  case f3  = 3
  case f4  = 4
  case f5  = 5
  case f6  = 6
  case f7  = 7
  case f8  = 8
  case f9  = 9
  case f10 = 10
  case f11 = 11
  case f12 = 12
  case f13 = 13
  case f14 = 14
  case f15 = 15
  case f16 = 16
  case f17 = 17
  case f18 = 18
  case f19 = 19
  case f20 = 20
  case f21 = 21
  case f22 = 22
  case f23 = 23
  case f24 = 24
  case f25 = 25
  case f26 = 26
  case f27 = 27
  case f28 = 28
  case f29 = 29
  case f30 = 30
  case f31 = 31

  // MARK: Constructors
  
  init?(title:String) {
    for temp in ESUTriggeredFunction.allCases {
      if temp.title == title {
        self = temp
        return
      }
    }
    return nil
  }

  // MARK: Public Properties
  
  public var title : String {
    return ESUTriggeredFunction.titles[self]!
  }
  
  // MARK: Public Methods
  
  public func cvIndexOffset(decoder:Decoder) -> Int {
    return Int(self.rawValue) * 2
  }

  // MARK: Public Class Properties
  
  public static let titles : [ESUTriggeredFunction:String] = [
    .f0  : String(localized:"F0"),
    .f1  : String(localized:"F1"),
    .f2  : String(localized:"F2"),
    .f3  : String(localized:"F3"),
    .f4  : String(localized:"F4"),
    .f5  : String(localized:"F5"),
    .f6  : String(localized:"F6"),
    .f7  : String(localized:"F7"),
    .f8  : String(localized:"F8"),
    .f9  : String(localized:"F9"),
    .f10 : String(localized:"F10"),
    .f11 : String(localized:"F11"),
    .f12 : String(localized:"F12"),
    .f13 : String(localized:"F13"),
    .f14 : String(localized:"F14"),
    .f15 : String(localized:"F15"),
    .f16 : String(localized:"F16"),
    .f17 : String(localized:"F17"),
    .f18 : String(localized:"F18"),
    .f19 : String(localized:"F19"),
    .f20 : String(localized:"F20"),
    .f21 : String(localized:"F21"),
    .f22 : String(localized:"F22"),
    .f23 : String(localized:"F23"),
    .f24 : String(localized:"F24"),
    .f25 : String(localized:"F25"),
    .f26 : String(localized:"F26"),
    .f27 : String(localized:"F27"),
    .f28 : String(localized:"F28"),
    .f29 : String(localized:"F29"),
    .f30 : String(localized:"F30"),
    .f31 : String(localized:"F31"),
  ]

  // MARK: Public Class Methods
  
  @MainActor public static func populate(comboBox:NSComboBox) {
    comboBox.removeAllItems()
    for item in ESUTriggeredFunction.allCases {
      comboBox.addItem(withObjectValue: item.title)
    }
  }

}
