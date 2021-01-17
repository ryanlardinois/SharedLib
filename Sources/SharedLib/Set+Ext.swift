//
//  File.swift
//  
//
//  Created by Ryan Lardinois on 1/16/21.
//

import Foundation

extension Set
{
  public mutating func insert(_ newElement: Element?)
  {
    if let element = newElement
    {
      self.insert(element)
    }
  }
}
