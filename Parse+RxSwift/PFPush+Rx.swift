//
//  PFPush+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

extension PFPush {
    
    public func rx_sendPush() -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.sendInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_sendPushMessageToChannel(_ channel: String, withMessage: String) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.sendMessageToChannel(inBackground: channel, withMessage: withMessage, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_sendPushMessageToQuery(_ query: PFQuery<PFInstallation>, withMessage: String) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.sendMessageToQuery(inBackground: query, withMessage: withMessage, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_sendPushDataToChannel(_ channel: String, withData: Dictionary<NSObject, AnyObject>) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.sendDataToChannel(inBackground: channel, withData: withData, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_sendPushDataToQuery(_ query: PFQuery<PFInstallation>, withData: Dictionary<NSObject, AnyObject>) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.sendDataToQuery(inBackground: query, withData: withData, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_subscribeToChannel(_ channel: String) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.subscribeToChannel(inBackground: channel, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_unsubscribeFromChannel(_ channel: String) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.unsubscribeFromChannel(inBackground: channel, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_getSubscribedChannels() -> Observable<Set<AnyHashable>> {
        return createWithParseCallback({ observer in
            self.getSubscribedChannelsInBackground(ParseRxCallbacks.rx_parseUnwrappedOptionalCallback(observer))
        })
    }
}
