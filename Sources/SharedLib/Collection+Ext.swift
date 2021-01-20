//
//  File.swift
//  
//
//  Created by Ryan Lardinois on 1/19/21.
//

import Foundation

extension Collection
{
  subscript(safe index: Index) -> Element?
  {
    return indices.contains(index) ? self[index] : nil
  }
}
