// -----------------------------------------------------------------------------
// PTSettingsPropertyView.swift
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
//     26/09/2024  Paul Willmott - PTSettingsPropertyView.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit
import SGAppKit

public class PTSettingsPropertyView : NSView, NSTextFieldDelegate {

  // MARK: Destructors
  
  deinit {
    
//    NSLayoutConstraint.deactivate(viewConstraints)
    
//    viewConstraints.removeAll()
    
//    self.subviews.removeAll()
    
    cvLabel = nil
    
    label = nil
    
    checkBox = nil
    
    comboBox = nil
    
    textField = nil
    
    slider = nil
    
    info = nil
    
    image = nil
    
    speedTable = nil
    
    functionButtons.removeAll()
    
    functionLabels.removeAll()
    
    sfLabels.removeAll()
    
    threeValueSpeedTable = nil
    
    nmraSpeedTable = nil
    
  }
  
  // MARK: Controls
  
  private var cvLabel : NSTextField?
  
  private var label : NSTextField?
  
  private var checkBox : NSButton?
  
  private var comboBox : SGComboBox?
  
  private var textField : NSTextField?
  
  private var slider : NSSlider?
  
  private var info : NSTextField?
  
  private var image : NSImageView?
  
  private var speedTable : ESUSpeedTable?
  
  private var functionButtons : [NSButton] = []
  
  private var functionLabels : [NSTextField] = []
  
  private var sfLabels : [NSTextField] = []
  
  private var threeValueSpeedTable : ThreeValueSpeedTable?
  
  private var nmraSpeedTable : NMRASpeedTable?
  
  // MARK: Private Properties
  
  private var _property : ProgrammerToolSettingsProperty?
  
  private var _definition : ProgrammerToolSettingsPropertyDefinition?
  
  private let leadingOffset : CGFloat = 20.0
  
  private var comboWidth : CGFloat {
    switch definition.encoding {
    case .esuCondition, .esuConditionDriving, .esuConditionDirection:
      return 100.0
    default:
      return 350.0
    }
  }
  
  private var textWidth : CGFloat {
    switch definition.encoding {
    case .dWordHex:
      return 100.0
    case .zString:
      return 300.0
    default:
      return 50.0
    }
  }
  
  private let sliderWidth : CGFloat = 150.0
  
  private var viewConstraints : [NSLayoutConstraint] = []
  
  private var _isExtant = true {
    didSet {
      isHidden = true
    }
  }
  
  // MARK: Internal Properties
  
  // MARK: Public Properties
  
  public override var isHidden : Bool {
    get {
      return super.isHidden
    }
    set(value) {
      super.isHidden = value || !isExtant
    }
  }
  
  public var isExtant : Bool {
    get {
      return _isExtant
    }
    set(value) {
      _isExtant = value
    }
  }
  
  public var property : ProgrammerToolSettingsProperty {
    get {
      return _property!
    }
  }
  
  public var definition : ProgrammerToolSettingsPropertyDefinition {
    get {
      return _definition!
    }
  }
  
  public var indexingMethod : CVIndexingMethod? {
    return definition.cvIndexingMethod
  }
  
  public var section : ProgrammerToolSettingsSection {
    return definition.section
  }
  
  public var group : ProgrammerToolSettingsGroup {
    return definition.section.inspector
  }
  
  public weak var decoder : Decoder? {
    didSet {
      reload()
    }
  }
  
  // MARK: Private Methods
  
  private func buildInterface() {
    
    // Info Labels
    
    if definition.infoType != .none {
      
      info = NSTextField(labelWithString: "")
      
      if let info {
        
        info.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(info)
        
        viewConstraints.append(self.bottomAnchor.constraint(greaterThanOrEqualTo: info.bottomAnchor))
        
        viewConstraints.append(self.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: info.trailingAnchor, multiplier: 1.0))
        
      }
      
    }
    
    // CV Labels
    
    if definition.cv != nil {
      
      cvLabel = NSTextField(labelWithString: "")
      
      if let cvLabel {
        
        cvLabel.translatesAutoresizingMaskIntoConstraints = false
        cvLabel.fontSize = 10
        
        #if DEBUG
        cvLabel.toolTip = "\(property)"
        #endif
        
        self.addSubview(cvLabel)
        
        viewConstraints.append(self.trailingAnchor.constraint(equalToSystemSpacingAfter: cvLabel.trailingAnchor, multiplier: 1.0))
        
        viewConstraints.append(self.bottomAnchor.constraint(greaterThanOrEqualTo: cvLabel.bottomAnchor))
        
        if let info {
          
          viewConstraints.append(cvLabel.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: info.trailingAnchor, multiplier: 1.0))
          
        }
        
      }
      
    }
    
    // Label
    
    let controlsWithLabels : Set<ProgrammerToolControlType> = [
      .comboBox,
      .comboBoxDynamic,
      .description,
      .functionsAnalogMode,
      .functionsConsistMode,
      .label,
      .textField,
      .textFieldWithSlider,
      .warning,
      .esuSUSIMapping,
    ]
    
    if controlsWithLabels.contains(definition.controlType) {
      
      label = NSTextField(labelWithString: definition.title)
      
      if let label {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(label)
        
        #if DEBUG
          label.toolTip = "\(property)"
        #endif

        viewConstraints.append(label.topAnchor.constraint(equalTo: self.topAnchor))
        
        if definition.controlType == .description {
          label.lineBreakMode = .byWordWrapping
          label.maximumNumberOfLines = 0
          label.preferredMaxLayoutWidth = 400.0
        }
        
        if definition.controlType == .warning {
          
          image = NSImageView(image: SGIcon.warning.image!)
          
          if let image {
            
            image.translatesAutoresizingMaskIntoConstraints = false
            
            self.addSubview(image)
            
            viewConstraints.append(image.centerYAnchor.constraint(equalTo: label.centerYAnchor))
            
            viewConstraints.append(image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingOffset))
            
            viewConstraints.append(self.bottomAnchor.constraint(greaterThanOrEqualTo: image.bottomAnchor))
            
            viewConstraints.append(label.leadingAnchor.constraint(equalToSystemSpacingAfter: image.trailingAnchor, multiplier: 1.0))
            
          }
          
        }
        else {
          
          viewConstraints.append(label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingOffset))
          
        }
        
        viewConstraints.append(self.bottomAnchor.constraint(greaterThanOrEqualTo: label.bottomAnchor))
        
        viewConstraints.append(self.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: label.trailingAnchor, multiplier: 1.0))
        
      }
      
    }
    
    // Controls
    
    switch definition.controlType {
    case .checkBox:
      
      checkBox = NSButton(checkboxWithTitle: definition.title, target: self, action: #selector(checkBoxAction(_:)))
      
      if let checkBox {
        
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(checkBox)
        
        #if DEBUG
          checkBox.toolTip = "\(property)"
        #endif

        viewConstraints.append(checkBox.topAnchor.constraint(equalTo: self.topAnchor))
        
        viewConstraints.append(checkBox.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingOffset))
        
        viewConstraints.append(self.bottomAnchor.constraint(greaterThanOrEqualTo: checkBox.bottomAnchor))
        
        viewConstraints.append(self.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: checkBox.trailingAnchor, multiplier: 1.0))
        
      }
      
    case .comboBox, .comboBoxDynamic:
      
      comboBox = SGComboBox()

      if let comboBox, let label {
        
        comboBox.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(comboBox)
 
        #if DEBUG
          comboBox.toolTip = "\(property)"
        #endif

        comboBox.target = self
        comboBox.action = #selector(comboBoxAction(_:))
        comboBox.isEditable = false
        
        viewConstraints.append(comboBox.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 1.0))
        
        viewConstraints.append(comboBox.leadingAnchor.constraint(equalTo: label.leadingAnchor))
        
        viewConstraints.append(comboBox.widthAnchor.constraint(equalToConstant: comboWidth))
        
        viewConstraints.append(self.bottomAnchor.constraint(greaterThanOrEqualTo: comboBox.bottomAnchor))
        
        viewConstraints.append(self.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: comboBox.trailingAnchor, multiplier: 1.0))
        
        if let cvLabel {
          
          viewConstraints.append(cvLabel.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: comboBox.trailingAnchor, multiplier: 1.0))
          
          viewConstraints.append(cvLabel.centerYAnchor.constraint(equalTo: comboBox.centerYAnchor))
          
          if let info {
            
            viewConstraints.append(info.leadingAnchor.constraint(equalToSystemSpacingAfter: comboBox.trailingAnchor, multiplier: 1.0))
            
            viewConstraints.append(info.centerYAnchor.constraint(equalTo: comboBox.centerYAnchor))
            
            viewConstraints.append(cvLabel.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: info.trailingAnchor, multiplier: 1.0))
            
          }
          
        }
        
        if definition.controlType == .comboBox {
          initComboBox()
        }
        
      }
      
    case .label:
      
      textField = NSTextField(labelWithString: "")
      
      if let textField, let label {
      
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(textField)
        
        viewConstraints.append(textField.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 1.0))
        
        viewConstraints.append(textField.leadingAnchor.constraint(equalTo: label.leadingAnchor))
        
        viewConstraints.append(self.bottomAnchor.constraint(greaterThanOrEqualTo: textField.bottomAnchor))
        
        viewConstraints.append(self.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1.0))

        if let cvLabel {
          
          viewConstraints.append(cvLabel.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1.0))

          viewConstraints.append(cvLabel.centerYAnchor.constraint(equalTo: textField.centerYAnchor))

        }

      }
      
    case .textField:
      
      textField = NSTextField()
      
      if let textField, let label {
      
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(textField)
        
        textField.delegate = self
        
        viewConstraints.append(textField.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 1.0))
        
        viewConstraints.append(textField.leadingAnchor.constraint(equalTo: label.leadingAnchor))
        
        viewConstraints.append(textField.widthAnchor.constraint(equalToConstant: textWidth))
        
        viewConstraints.append(self.bottomAnchor.constraint(greaterThanOrEqualTo: textField.bottomAnchor))
        
        viewConstraints.append(self.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1.0))

        if let cvLabel {
          
          viewConstraints.append(cvLabel.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1.0))

          viewConstraints.append(cvLabel.centerYAnchor.constraint(equalTo: textField.centerYAnchor))

          if let info {
            
            viewConstraints.append(info.centerYAnchor.constraint(equalTo: textField.centerYAnchor))
            
            viewConstraints.append(info.leadingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1.0))
            
            viewConstraints.append(cvLabel.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: info.trailingAnchor, multiplier: 1.0))
            
          }
          
        }

      }
      
    case .textFieldWithSlider:
      
      slider = NSSlider(value: 0.0, minValue: definition.minValue!, maxValue: definition.maxValue!, target: self, action: #selector(sliderAction(_:)))
      
      textField = NSTextField()
      
      if let slider, let textField, let label {
      
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(slider)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(textField)
        
        textField.delegate = self
        
        viewConstraints.append(slider.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 1.0))
        
        viewConstraints.append(slider.leadingAnchor.constraint(equalTo: label.leadingAnchor))
        
        viewConstraints.append(slider.widthAnchor.constraint(equalToConstant: sliderWidth))
        
        viewConstraints.append(self.bottomAnchor.constraint(greaterThanOrEqualTo: slider.bottomAnchor))
        
        viewConstraints.append(self.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: slider.trailingAnchor, multiplier: 1.0))
        
        viewConstraints.append(textField.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 1.0))
        
        viewConstraints.append(textField.leadingAnchor.constraint(equalToSystemSpacingAfter: slider.trailingAnchor, multiplier: 1.0))
        
        viewConstraints.append(textField.widthAnchor.constraint(equalToConstant: textWidth))

        viewConstraints.append(self.bottomAnchor.constraint(greaterThanOrEqualTo: textField.bottomAnchor))
        
        viewConstraints.append(self.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1.0))

        if let cvLabel {
          
          viewConstraints.append(cvLabel.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1.0))

          viewConstraints.append(cvLabel.centerYAnchor.constraint(equalTo: textField.centerYAnchor))

          if let info {
            
            viewConstraints.append(info.centerYAnchor.constraint(equalTo: textField.centerYAnchor))
            
            viewConstraints.append(info.leadingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1.0))
            
            viewConstraints.append(cvLabel.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: info.trailingAnchor, multiplier: 1.0))
            
          }
          
        }

      }
      
    case .esuSpeedTable:
      
      speedTable = ESUSpeedTable()
      
      if let speedTable {
        
        speedTable.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(speedTable)
        
        viewConstraints.append(speedTable.topAnchor.constraint(equalTo: self.topAnchor))
        
        viewConstraints.append(speedTable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingOffset))

        viewConstraints.append(speedTable.heightAnchor.constraint(equalToConstant: 400))
        
        viewConstraints.append(speedTable.widthAnchor.constraint(equalToConstant: 600))
        
        viewConstraints.append(self.bottomAnchor.constraint(greaterThanOrEqualTo: speedTable.bottomAnchor))
        
        viewConstraints.append(self.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: speedTable.trailingAnchor, multiplier: 1.0))
        
        if let cvLabel {
          
          viewConstraints.append(cvLabel.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: speedTable.trailingAnchor, multiplier: 1.0))

          viewConstraints.append(cvLabel.centerYAnchor.constraint(equalTo: speedTable.centerYAnchor))

        }
        
      }
      
    case .nmraSpeedTable:
      
      nmraSpeedTable = NMRASpeedTable()
      
      if let speedTable = nmraSpeedTable {
        
        speedTable.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(speedTable)
        
        viewConstraints.append(speedTable.topAnchor.constraint(equalTo: self.topAnchor))
        
        viewConstraints.append(speedTable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingOffset))

        viewConstraints.append(speedTable.heightAnchor.constraint(equalToConstant: 400))
        
        viewConstraints.append(speedTable.widthAnchor.constraint(equalToConstant: 600))
        
        viewConstraints.append(self.bottomAnchor.constraint(greaterThanOrEqualTo: speedTable.bottomAnchor))
        
        viewConstraints.append(self.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: speedTable.trailingAnchor, multiplier: 1.0))
        
        if let cvLabel {
          
          viewConstraints.append(cvLabel.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: speedTable.trailingAnchor, multiplier: 1.0))

          viewConstraints.append(cvLabel.centerYAnchor.constraint(equalTo: speedTable.centerYAnchor))

        }
        
      }
      
    case .threeValueSpeedTable:
      
      threeValueSpeedTable = ThreeValueSpeedTable()
      
      if let speedTable = threeValueSpeedTable {
        
        speedTable.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(speedTable)
        
        viewConstraints.append(speedTable.topAnchor.constraint(equalTo: self.topAnchor))
        
        viewConstraints.append(speedTable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingOffset))

        viewConstraints.append(speedTable.heightAnchor.constraint(equalToConstant: 400))
        
        viewConstraints.append(speedTable.widthAnchor.constraint(equalToConstant: 600))
        
        viewConstraints.append(self.bottomAnchor.constraint(greaterThanOrEqualTo: speedTable.bottomAnchor))
        
        viewConstraints.append(self.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: speedTable.trailingAnchor, multiplier: 1.0))
        
        if let cvLabel {
          
          viewConstraints.append(cvLabel.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: speedTable.trailingAnchor, multiplier: 1.0))

          viewConstraints.append(cvLabel.centerYAnchor.constraint(equalTo: speedTable.centerYAnchor))

        }
        
      }
      
    case .esuSUSIMapping:
      
      if let label {
        
        for index in 0 ... 15 {

          let title = String(localized: "SF\(index)")

          let sfLabel = NSTextField(labelWithString: title)
          
          sfLabel.translatesAutoresizingMaskIntoConstraints = false
          
          sfLabels.append(sfLabel)
          
          self.addSubview(sfLabel)
          
          if index > 0 {
            
            viewConstraints.append(sfLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: sfLabels[index - 1].trailingAnchor, multiplier: 1.0))
            
          }
          
          viewConstraints.append(sfLabel.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 1.0))
          
        }
        
        for label1 in sfLabels {
          for label2 in sfLabels {
            if !(label1 === label2) {
              viewConstraints.append(label1.widthAnchor.constraint(greaterThanOrEqualTo: label2.widthAnchor))
            }
          }
        }
        
        var buttonIndex = 0
        
        for index in 0 ... 15 {
          
          let title = String(localized: "F\(index)")

          let functionLabel = NSTextField(labelWithString: title)
          
          functionLabel.translatesAutoresizingMaskIntoConstraints = false
          
          functionLabels.append(functionLabel)
          
          self.addSubview(functionLabel)
          
          let topAnchor = (index == 0) ? sfLabels[0].bottomAnchor : functionLabels[index - 1].bottomAnchor

          viewConstraints.append(functionLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0))
          
          viewConstraints.append(functionLabel.leadingAnchor.constraint(equalTo: label.leadingAnchor))
          
          for sfIndex in 0 ... 15 {
            
            let checkBox = NSButton(checkboxWithTitle: "", target: self, action: #selector(sfbuttonAction(_:)))
            
            checkBox.translatesAutoresizingMaskIntoConstraints = false
            
            functionButtons.append(checkBox)
            
            self.addSubview(checkBox)
            
            checkBox.tag = buttonIndex
            buttonIndex += 1
            
            viewConstraints.append(checkBox.centerYAnchor.constraint(equalTo: functionLabel.centerYAnchor))
            
            viewConstraints.append(checkBox.centerXAnchor.constraint(equalTo: sfLabels[sfIndex].centerXAnchor))
            
            if (sfIndex + 1) % 16 == 0 {
              viewConstraints.append(self.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: checkBox.trailingAnchor, multiplier: 1.0))
              
            }
            
          }
          
        }
        
        for label1 in functionLabels {
          for label2 in functionLabels {
            if !(label1 === label2) {
              viewConstraints.append(label1.widthAnchor.constraint(greaterThanOrEqualTo: label2.widthAnchor))
            }
          }
        }
        
        viewConstraints.append(sfLabels[0].leadingAnchor.constraint(equalToSystemSpacingAfter: functionLabels[0].trailingAnchor, multiplier: 1.0))
        
        viewConstraints.append(self.bottomAnchor.constraint(greaterThanOrEqualTo: functionLabels.last!.bottomAnchor))
        
      }
      
    case .functionsAnalogMode, .functionsConsistMode:
    
      if let label, let cvLabel {
          
        viewConstraints.append(cvLabel.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 1.0))

      }

    default:
      break
    }

  }
  
  private func initComboBox() {
    
    guard let comboBox else {
      return
    }
    
    switch definition.encoding {
    case .locomotiveAddressType:
      LocomotiveAddressType.populate(comboBox: comboBox)
    case .esuMarklinConsecutiveAddresses:
      ESUMarklinConsecutiveAddresses.populate(comboBox: comboBox)
    case .manufacturerCode:
      ManufacturerCode.populate(comboBox: comboBox)
    case .esuSpeedStepMode:
      SpeedStepMode.populate(comboBox: comboBox)
    case .esuClassLightLogicLength:
      ESUClassLightLogicSequenceLength.populate(comboBox: comboBox)
    case .esuDecoderSensorSettings:
      ESUDecoderSensorSettings.populate(comboBox: comboBox)
    case .esuSteamChuffMode:
      ESUSteamChuffMode.populate(comboBox: comboBox)
    case .esuSoundControlBasis:
      ESUSoundControlBasis.populate(comboBox: comboBox)
    case .esuTriggeredFunction, .esuFunction:
      ESUTriggeredFunction.populate(comboBox: comboBox)
    case .esuSmokeUnitControlMode:
      ESUSmokeUnitControlMode.populate(comboBox: comboBox)
    case .esuExternalSmokeUnitType:
      ESUExternalSmokeUnitType.populate(comboBox: comboBox)
    case .esuRandomFunction:
      ESURandomFunction.populate(comboBox: comboBox)
    case .speedTableIndex:
      comboBox.removeAllItems()
      for index in 1 ... 28 {
        comboBox.addItem(withObjectValue: "\(index)")
      }
    case .esuSpeedTablePreset:
      SpeedTablePreset.populate(comboBox: comboBox)
    case .soundCV:
      ESUSoundCV.populate(comboBox: comboBox)
    case .esuFunctionIcon:
      ESUFunctionIcon.populate(comboBox: comboBox)
    case .esuCondition:
      ESUCondition.populate(comboBox: comboBox)
    case .esuConditionDriving:
      ESUConditionDriving.populate(comboBox: comboBox)
    case .esuConditionDirection:
      ESUConditionDirection.populate(comboBox: comboBox)
    case .speedTableType:
      SpeedTableType.populate(comboBox: comboBox)
    case .threeValueSpeedTablePreset:
      ThreeValueSpeedTablePreset.populate(comboBox: comboBox)
    case .esuDCMotorPWMFrequency:
      ESUDCMotorPWMFrequency.populate(comboBox: comboBox)
    case .esuSoundType:
      ESUSoundType.populate(comboBox: comboBox)
    case .esuDCMotorPWMFrequencyLok3:
      ESUDCMotorPWMFrequencyLok3.populate(comboBox: comboBox)
    case .esuBrakingMode:
      ESUBrakingMode.populate(comboBox: comboBox)
    default:
      break
    }
    
  }
  
  private func initComboBoxDynamic() {
    
    guard let comboBox, let decoder else {
      return
    }

    let target = comboBox.target
    let action = comboBox.action
    
    comboBox.target = nil
    comboBox.action = nil
    
    switch property {
    case .physicalOutput:
      ESUDecoderPhysicalOutput.populate(comboBox: comboBox, decoder: decoder)
    case .physicalOutputOutputMode, .physicalOutputModeB:
      ESUPhysicalOutputMode.populate(comboBox: comboBox, decoder: decoder)
    case .esuSoundSlot:
      ESUSoundSlot.populate(comboBox: comboBox, decoder: decoder)
    case .esuFunctionMapping:
      ESUFunctionMapping.populate(comboBox: comboBox, decoder: decoder)
    default:
      break
    }
    
    comboBox.target = target
    comboBox.action = action
    
  }

  // MARK: Public Methods
  
  public func initialize(property:ProgrammerToolSettingsProperty, definition:ProgrammerToolSettingsPropertyDefinition) {
    
    _property = property
    
    _definition = definition
    
    self.translatesAutoresizingMaskIntoConstraints = false
    
    buildInterface()
    
  }
  
  public func activateConstraints() {
    
    switch definition.controlType {
      
    case .functionsAnalogMode:
      
      if functionButtons.isEmpty {
        
        if let label, let decoder {
          
          var lastButton : NSButton?
          
          var buttonCount = 0
          
          var topAnchor : NSLayoutYAxisAnchor = label.bottomAnchor
          
          for item in FunctionAnalogMode.allCases {
            
            if let _ = item.cvMask(decoder: decoder) {
              
              let button = NSButton(checkboxWithTitle: item.title, target: self, action: #selector(buttonAnalogAction(_:)))
              
              button.translatesAutoresizingMaskIntoConstraints = false
              
              self.addSubview(button)
              
              button.tag = Int(item.rawValue)
              
              functionButtons.append(button)
              
              if let lastButton {
                
                viewConstraints.append(button.leadingAnchor.constraint(equalToSystemSpacingAfter: lastButton.trailingAnchor, multiplier: 1.0))
                
              }
              else {
                
                viewConstraints.append(button.leadingAnchor.constraint(equalTo: label.leadingAnchor))
                
              }
              
              viewConstraints.append(button.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0))
              
              viewConstraints.append(self.bottomAnchor.constraint(greaterThanOrEqualTo: button.bottomAnchor))
              
              viewConstraints.append(self.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: button.trailingAnchor, multiplier: 1.0))
              
              lastButton = button
              
              buttonCount += 1
              
              if buttonCount == 4 {
                
                if let cvLabel {
                  
                  viewConstraints.append(cvLabel.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: button.trailingAnchor, multiplier: 1.0))
                  
                }
                
                lastButton = nil
                buttonCount = 0
                topAnchor = button.bottomAnchor
                
              }
              
            }
            
          }
          
          for button1 in functionButtons {
            for button2 in functionButtons {
              if !(button1 === button2) {
                viewConstraints.append(button1.widthAnchor.constraint(greaterThanOrEqualTo: button2.widthAnchor))
              }
            }
          }
          
        }
        
      }
      
      reload()
      
    case .functionsConsistMode:
      
      if functionButtons.isEmpty {
        
        if let label, let decoder {
          
          var lastButton : NSButton?
          
          var buttonCount = 0
          
          var topAnchor : NSLayoutYAxisAnchor = label.bottomAnchor
          
          for item in FunctionConsistMode.allCases {
            
            if let _ = item.cvMask(decoder: decoder) {
              
              let button = NSButton(checkboxWithTitle: item.title, target: self, action: #selector(buttonConsistAction(_:)))
              
              button.translatesAutoresizingMaskIntoConstraints = false
              
              self.addSubview(button)
              
              button.tag = Int(item.rawValue)
              
              functionButtons.append(button)
              
              if let lastButton {
                
                viewConstraints.append(button.leadingAnchor.constraint(equalToSystemSpacingAfter: lastButton.trailingAnchor, multiplier: 1.0))
                
              }
              else {
                
                viewConstraints.append(button.leadingAnchor.constraint(equalTo: label.leadingAnchor))
                
              }
              
              viewConstraints.append(button.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0))
              
              viewConstraints.append(self.bottomAnchor.constraint(greaterThanOrEqualTo: button.bottomAnchor))
              
              viewConstraints.append(self.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: button.trailingAnchor, multiplier: 1.0))
              
              lastButton = button
              
              buttonCount += 1
              
              if buttonCount == 4 {
                
                if let cvLabel {
                  
                  viewConstraints.append(cvLabel.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: button.trailingAnchor, multiplier: 1.0))
                  
                }
                
                lastButton = nil
                buttonCount = 0
                topAnchor = button.bottomAnchor
                
              }
              
            }
            
          }
          
          for button1 in functionButtons {
            for button2 in functionButtons {
              if !(button1 === button2) {
                viewConstraints.append(button1.widthAnchor.constraint(greaterThanOrEqualTo: button2.widthAnchor))
              }
            }
          }
          
        }
        
      }
      
      reload()

    default:
      break
    }
    
    NSLayoutConstraint.activate(viewConstraints)
  }
  
  public func reload() {
    
    if let decoder {
      
      let value = decoder.getValue(property: property)
      
      switch definition.controlType {
      case .checkBox:
        checkBox!.state = value == "true" ? .on : .off
      case .comboBoxDynamic:
        initComboBoxDynamic()
        fallthrough
      case .comboBox:
        let target = comboBox!.target
        let action = comboBox!.action
        comboBox!.target = nil
        comboBox!.action = nil
        comboBox!.selectItem(withObjectValue: value)
        comboBox!.target = target
        comboBox!.action = action
      case .textFieldWithSlider:
        slider!.integerValue = Int(value)!
        fallthrough
      case .textField, .label:
        textField!.stringValue = value
      case .esuSpeedTable:
        speedTable!.decoder = decoder
        speedTable?.needsDisplay = true
      case .nmraSpeedTable:
        nmraSpeedTable!.decoder = decoder
        nmraSpeedTable?.needsDisplay = true
      case .threeValueSpeedTable:
        threeValueSpeedTable?.decoder = decoder
        threeValueSpeedTable?.needsDisplay = true
      case .functionsAnalogMode:
        
        for button in functionButtons {
          if let function = FunctionAnalogMode(rawValue: UInt8(button.tag)) {
            button.state = decoder.getAnalogFunctionState(function: function) ? .on : .off
          }
        }
        
      case .functionsConsistMode:
        
        for button in functionButtons {
          if let function = FunctionConsistMode(rawValue: UInt8(button.tag)) {
            button.state = decoder.getConsistFunctionState(function: function) ? .on : .off
          }
        }
        
      case .esuSUSIMapping:
        
        for button in functionButtons {
          button.state = decoder.getSFMappingState(mapIndex: button.tag) ? .on : .off
        }
        
      default:
        break
      }
      
      if let info {
        info.stringValue = decoder.getInfo(property: property)
      }
      
      if let cvLabel, let text = property.cvLabel(decoder: decoder) {
        cvLabel.stringValue = text
      }
      
    }

  }
  
  // MARK: Actions
  
  @objc func checkBoxAction(_ sender:NSButton) {
    decoder?.setValue(property: property, string: sender.state == .on ? "true" : "false", definition: definition)
  }
  
  @objc func comboBoxAction(_ sender:SGComboBox) {
    if let string = sender.objectValueOfSelectedItem as? String {
      decoder?.setValue(property: property, string: string, definition: definition)
    }
  }
  
  @objc func sliderAction(_ sender:NSSlider) {
    
    if let decoder, let textField {
      
      let value = "\(sender.integerValue)"
      
      decoder.setValue(property: property, string: "\(value)", definition: definition)
      
      textField.stringValue = value
      
      if let info {
        info.stringValue = decoder.getInfo(property: property, definition: definition)
      }
      
    }
    
  }
  
  @objc func buttonAnalogAction(_ sender:NSButton) {
    if let function = FunctionAnalogMode(rawValue:UInt8(exactly: sender.tag)!) {
      decoder?.setAnalogFunctionState(function: function, state: sender.state == .on)
    }
  }
  
  @objc func buttonConsistAction(_ sender:NSButton) {
    if let function = FunctionConsistMode(rawValue:UInt8(exactly: sender.tag)!) {
      decoder?.setConsistFunctionState(function: function, state: sender.state == .on)
    }
  }

  @objc func sfbuttonAction(_ sender:NSButton) {
    decoder?.setSFMappingState(mapIndex: sender.tag, value: sender.state == .on)
  }

  // MARK: NSTextFieldDelegate Methods
  
  @objc public func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
    
    var isValid = true
    
    if let decoder {
      
      let string = control.stringValue.trimmingCharacters(in: .whitespaces)
      
      isValid = decoder.isValid(property: property, string: string, definition: definition)
      
      if isValid {
        
        decoder.setValue(property: property, string: string, definition: definition)
        
        if let slider, let value = Int(string) {
          slider.integerValue = value
        }
        
        if let info {
          info.stringValue = decoder.getInfo(property: property, definition: definition)
        }
        
      }
      
    }
    
    return isValid
    
  }

}
