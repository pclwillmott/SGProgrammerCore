// -----------------------------------------------------------------------------
// ProgrammerToolInspector.swift
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
//     26/09/2024  Paul Willmott - ProgrammerToolInspector.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit

public enum ProgrammerToolInspector : Int, CaseIterable, Sendable {
  
  // MARK: Enumeration
  
  case settings = 0
  case changedCVs = 1
  case sound = 2
  case rwCVs = 3
  case quickHelp = 4

  // MARK: Public Properties
  
  public var title : String {
    
    let titles : [ProgrammerToolInspector:String] = [
      .quickHelp  : String(localized: "Quick Help"),
      .settings   : String(localized: "Change Decoder Settings"),
      .rwCVs      : String(localized: "Read and Write CVs"),
      .changedCVs : String(localized: "Changed CVs"),
      .sound      : String(localized: "Sound Project Overview"),
    ]
    
    return titles[self]!
    
  }
  
  public var button : NSButton {
    
    let icons : [ProgrammerToolInspector:MyIcon] = [
      .quickHelp  : .help,
      .settings   : .gear,
      .rwCVs      : .wrench,
      .sound      : .speaker,
      .changedCVs : .sunglasses,
    ]
    
    let tooltip : [ProgrammerToolInspector:String] = [
      .quickHelp  : String(localized: "Show Quick Help Inspector"),
      .settings   : String(localized: "Show Settings Inspector"),
      .rwCVs      : String(localized: "Show Read/Write CVs Inspector"),
      .sound      : String(localized: "Show Sound Inspector"),
      .changedCVs : String(localized: "Show Changed CVs Inspector"),
    ]
    
    let button = icons[self]!.button(target: nil, action: nil)!
    button.toolTip = tooltip[self]!
    button.translatesAutoresizingMaskIntoConstraints = false
    button.isBordered = false
    button.tag = self.rawValue
    
    return button
    
  }
  
  public var backgroundColor : CGColor {
    
    let colors : [ProgrammerToolInspector:CGColor] = [
      .quickHelp  : NSColor.red.cgColor,
      .settings   : NSColor.yellow.cgColor,
      .rwCVs      : NSColor.green.cgColor,
      .sound      : NSColor.magenta.cgColor,
      .changedCVs : NSColor.orange.cgColor,
    ]
    
    return colors[self]!
    
  }
  
}
