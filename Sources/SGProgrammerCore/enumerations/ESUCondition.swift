// -----------------------------------------------------------------------------
// ESUCondition.swift
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
//     26/09/2024  Paul Willmott - ESUCondition.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit

public enum ESUCondition : UInt8, CaseIterable, Sendable {
  
  // MARK: Enumeration
  
  case ignore = 0b00000000
  case on     = 0b00000001
  case off    = 0b00000010

  // MARK: Constructors
  
  public init?(title:String) {
    for temp in ESUCondition.allCases {
      if temp.title == title {
        self = temp
        return
      }
    }
    return nil
  }

  // MARK: Public Properties
  
  public var title : String {
    return ESUCondition.titles[self]!
  }

  // MARK: Private Class Properties
  
  private static let titles : [ESUCondition:String] = [
    .ignore : String(localized:"Ignore"),
    .on     : String(localized:"On"),
    .off    : String(localized:"Off"),
  ]

  // MARK: Public Class Methods
  
  @MainActor public static func populate(comboBox:NSComboBox) {
    comboBox.removeAllItems()
    for item in ESUCondition.allCases {
      comboBox.addItem(withObjectValue: item.title)
    }
  }

}
