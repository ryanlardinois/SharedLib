//
//  File.swift
//  
//
//  Created by Ryan Lardinois on 1/19/21.
//

import Foundation

public typealias TimerCallback = (() -> Void)

public enum TimerState {
  case running, stopped
}

public class IntervalTimer {
  private let repeats: Bool
  private weak var timer: Timer?

  public var callback: TimerCallback?

  public private (set)var state: TimerState = .stopped

  private init(repeats: Bool, callback: TimerCallback?) {
    self.repeats = repeats
    self.callback = callback
  }

  public func start(interval: Double) {
    state = .running
    timer = Timer.scheduledTimer(withTimeInterval: interval,
                                 repeats: repeats) {
      [weak self] _ in self?.onTick() }
  }

  public func stop() {
    state = .stopped
    timer?.invalidate()
  }

  private func onTick() {
    if (!repeats) {
      state = .stopped
    }
    callback?()
  }
}

extension IntervalTimer {
  public static func repeatTimer(callback: TimerCallback? = nil) -> IntervalTimer {
    return IntervalTimer(repeats: true, callback: callback)
  }
}

extension IntervalTimer {
  public static func resetTimer(callback: TimerCallback? = nil) -> IntervalTimer {
    return IntervalTimer(repeats: false, callback: callback)
  }
}

extension IntervalTimer {
  public func isRunning() -> Bool {
    state == .running
  }
}

extension IntervalTimer {
  public func isStopped() -> Bool {
    state == .stopped
  }
}
