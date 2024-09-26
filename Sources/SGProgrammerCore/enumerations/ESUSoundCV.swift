// -----------------------------------------------------------------------------
// ESUSoundCV.swift
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
//     26/09/2024  Paul Willmott - ESUSoundCV.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit

public enum ESUSoundCV : UInt8, CaseIterable, Sendable {
  
  // MARK: Enumeration
  
  case soundCV1 = 0
  case soundCV2 = 1
  case soundCV3 = 2
  case soundCV4 = 3
  case soundCV5 = 4
  case soundCV6 = 5
  case soundCV7 = 6
  case soundCV8 = 7
  case soundCV9 = 8
  case soundCV10 = 9
  case soundCV11 = 10
  case soundCV12 = 11
  case soundCV13 = 12
  case soundCV14 = 13
  case soundCV15 = 14
  case soundCV16 = 15

  // MARK: Constructors
  
  init?(title:String) {
    for temp in ESUSoundCV.allCases {
      if temp.title == title {
        self = temp
        return
      }
    }
    return nil
  }

  // MARK: Public Properties
  
  public var title : String {
    return ESUSoundCV.titles[self]!
  }

  public func cvIndexOffset(decoder:Decoder) -> Int {
    return Int(self.rawValue)
  }

  // MARK: Private Class Properties
  
  private static let titles : [ESUSoundCV:String] = [
    .soundCV1  : String(localized:"Sound CV 1"),
    .soundCV2  : String(localized:"Sound CV 2"),
    .soundCV3  : String(localized:"Sound CV 3"),
    .soundCV4  : String(localized:"Sound CV 4"),
    .soundCV5  : String(localized:"Sound CV 5"),
    .soundCV6  : String(localized:"Sound CV 6"),
    .soundCV7  : String(localized:"Sound CV 7"),
    .soundCV8  : String(localized:"Sound CV 8"),
    .soundCV9  : String(localized:"Sound CV 9"),
    .soundCV10 : String(localized:"Sound CV 10"),
    .soundCV11 : String(localized:"Sound CV 11"),
    .soundCV12 : String(localized:"Sound CV 12"),
    .soundCV13 : String(localized:"Sound CV 13"),
    .soundCV14 : String(localized:"Sound CV 14"),
    .soundCV15 : String(localized:"Sound CV 15"),
    .soundCV16 : String(localized:"Sound CV 16"),
  ]

  // MARK: Public Class Methods
  
  @MainActor public static func populate(comboBox:NSComboBox) {
    comboBox.removeAllItems()
    for item in ESUSoundCV.allCases {
      comboBox.addItem(withObjectValue: item.title)
    }
  }

}
