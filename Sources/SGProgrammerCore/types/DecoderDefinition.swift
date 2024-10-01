// -----------------------------------------------------------------------------
// DecoderDefinition.swift
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
//     31/08/2024  Paul Willmott - DecoderDefinition.swift created.
//     03/09/2024  Paul Willmott - esuPhysicalOutputs, offsetMethod added.
//     04/09/2024  Paul Willmott - esuOutputModes added.
// -----------------------------------------------------------------------------

import Foundation

public struct DecoderDefinition : Codable {
  
  public var decoderType        : DecoderType
  public var firmwareVersion    : [[Int]]
  public var esuProductIds      : [UInt32]
  public var cvs                : [CV]
  public var defaultValues      : [UInt8]
  public var mapping            : [Int:Set<CV>]
  public var properties         : Set<ProgrammerToolSettingsProperty>
  public var esuPhysicalOutputs : Set<ESUDecoderPhysicalOutput>
  public var offsetMethod       : ESUPhysicalOutputCVIndexOffsetMethod
  public var esuOutputModes     : [ESUDecoderPhysicalOutput:Set<ESUPhysicalOutputMode>]
  
}
