// -----------------------------------------------------------------------------
// ProgrammerToolSettingsPropertyDefinition.swift
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
//     26/09/2024  Paul Willmott - ProgrammerToolSettingsPropertyDefinition.swift created
// -----------------------------------------------------------------------------

public typealias ProgrammerToolSettingsPropertyDefinition = (
  title                : String,
  section              : ProgrammerToolSettingsSection,
  controlType          : ProgrammerToolControlType,
  encoding             : ProgrammerToolEncodingType,
  cvIndexingMethod     : CVIndexingMethod?,
  cv                   : [CV]?,
  mask                 : [UInt8]?,
  shift                : [Int]?,
  minValue             : Double?,
  maxValue             : Double?,
  trueDefaultValue     : UInt8?,
  infoType             : ProgrammerToolInfoType,
  infoFactor           : Double?,
  infoMaxDecimalPlaces : Int?,
  infoFormat           : String?,
  requiredCapabilities : Set<DecoderCapability>
)

public enum ProgrammerToolInfoType : CaseIterable, Sendable {
  
  // MARK: Enumeration
  
  case none
  case value
  case percentage
  case time
  case voltage
  case decibel
  case frequency
  case temperature
  case manufacturerName
  case esuFunctionCategory
  
}

public enum ProgrammerToolEncodingType : Int, CaseIterable, Sendable {
  
  // MARK: Enumeration

  // Generic Encodings
  
  case none             // No encoding - property is a description or warning
  case byte             // Byte, Min, Max, Mask, Shift
  case word             // Word, Min, Max
  case dword            // DWord, Min, Max
  case boolBit          // Bit of Byte, Mask
  case boolBitReversed  // Bit of Byte, Mask, 0 means true, 1 maeans false
  case boolNZ           // Byte, Non-Zero means true, 0 means false
  case boolNZReversed   // Byte, Non-Zero means false, 0 means true
  case extendedAddress  // Word DCC long address encoding
  case specialInt8      // Byte +/- 127 with bit 7 as sign (not 2s complement)
  case custom           // Decoding/Encoding is handled by separate code
  case dWordHex         // 4 byte value in hex, little endian
  case manufacturerName // 1 byte decoded as NMRA Manufacturer Name
  case railComDate      // 4 bytes encoded as number of seconds since 1 Jan 2000
  case zString          // Null terminated string upto the Max length of the field.
                        // If all characters are used there is no null termination
  
  // Selection Encodings (ComboBox)
  
  case esuDecoderPhysicalOutput
  case esuPhysicalOutputMode
  case esuSteamChuffMode
  case esuSmokeUnitControlMode
  case esuExternalSmokeUnitType
  case esuSoundControlBasis
  case esuTriggeredFunction
  case esuSpeedTablePreset
  case threeValueSpeedTablePreset
  case locomotiveAddressType
  case esuMarklinConsecutiveAddresses
  case esuSpeedStepMode
  case manufacturerCode
  case esuDecoderSensorSettings
  case esuClassLightLogicLength
  case speedTableIndex
  case speedTableValue
  case speedTableValueB
  case analogModeEnable
  case esuRandomFunction
  case soundCV
  case esuSoundSlot
  case esuFunction
  case esuFunctionIcon
  case esuFunctionMapping
  case esuCondition
  case esuConditionDriving
  case esuConditionDirection
  case speedTableType
  case esuDCMotorPWMFrequency
  case esuDCMotorPWMFrequencyLok3
  case esuSoundType
  case esuBrakingMode
}

public enum CVIndexingMethod : Sendable {
  
  // MARK: Enumeration
  
  case standard
  case esuDecoderPhysicalOutput
  case esuRandomFunction
  case soundCV
  case esuSoundSlot
  case esuFunction
  case esuFunctionMapping
  
}
