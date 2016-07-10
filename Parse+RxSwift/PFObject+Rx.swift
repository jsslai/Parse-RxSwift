//
//  PFObject+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

extension PFObject {
    
    public func rx_save() -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.saveInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func rx_fetch<T: PFObject>() -> Observable<T?> {
        return createWithParseCallback({ observer in
            self.fetchInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
        .map({ object in
            return object as! T?
        })
    }
    
    public func rx_fetchIfNeeded<T: PFObject>() -> Observable<T?> {
        return createWithParseCallback({ observer in
            self.fetchIfNeededInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
        .map({ object in
            return object as! T?
        })
    }
    
    public func rx_delete() -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.deleteInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_saveAll(_ objects: [PFObject]) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.saveAll(inBackground: objects, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_fetchAll<T: PFObject>(_ objects: [PFObject]) -> Observable<[T]?> {
        return createWithParseCallback({ observer in
            self.fetchAll(inBackground: objects, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
        .map({ objects in
            return objects as! [T]?
        })
    }
    
    public static func rx_fetchAllIfNeeded<T: PFObject>(_ objects: [PFObject]) -> Observable<[T]?> {
        return createWithParseCallback({ observer in
            self.fetchAllIfNeeded(inBackground: objects, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
        .map({ objects in
            return objects as! [T]?
        })
    }
    
}
