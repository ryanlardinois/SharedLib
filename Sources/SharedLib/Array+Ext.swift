//
//  File.swift
//  
//
//  Created by Ryan Lardinois on 1/16/21.
//

import Foundation

extension Array
{
  public mutating func append(_ newElement: Element?)
  {
    if let element = newElement
    {
      self.append(element)
    }
  }
}
