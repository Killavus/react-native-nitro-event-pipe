//
//  EventPipeProtocol.swift
//  Pods
//
//  Created by Marcin Grzywaczewski on 09/03/2026.
//

import Foundation

public protocol EventPipeProtocol: AnyObject {
  var onAccommodationChange: ((AccommodationMap) -> Void)? { get set }
  
  func accommodationMapRequested() -> Bool
  func accommodationSelected(hotelId: String)
  func refreshRequested()
}
