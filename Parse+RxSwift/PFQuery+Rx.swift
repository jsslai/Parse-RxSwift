//
//  PFQuery+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

// Swift compiler crash
/*extension PFQuery {
    public func rx_findObjects() -> Observable<[PFObject]?> {
        let typeEreasedSelf = self as! PFQuery<PFObject>
        
        return createWithParseCallback { observer in
            typeEreasedSelf.findObjectsInBackground(block: ParseRxCallbacks.rx_parseOptionalCallback(observer))
        }
    }
    
    public func rx_getObject(_ objectId: String) -> Observable<PFObject?> {
        let typeEreasedSelf = self as! PFQuery<PFObject>
        
        return createWithParseCallback { observer in
            typeEreasedSelf.getObjectInBackground(withId: objectId, block: ParseRxCallbacks.rx_parseOptionalCallback(observer))
        }
    }
    
    public func rx_getFirstObject() -> Observable<PFObject?> {
        let typeEreasedSelf = self as! PFQuery<PFObject>
        
        return createWithParseCallback { observer in
            typeEreasedSelf.getFirstObjectInBackground(block: ParseRxCallbacks.rx_parseOptionalCallback(observer))
        }
    }
    
    public func rx_countObjects() -> Observable<Int32> {
        let typeEreasedSelf = self as! PFQuery<PFObject>
        
        return createWithParseCallback { observer in
            typeEreasedSelf.countObjectsInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        }
    }
    
}*/

public class MyPFQuery: PFQuery<PFObject> {
    public func rx_findObjects() -> Observable<[PFObject]?> {
        return createWithParseCallback { observer in
            self.findObjectsInBackground(block: ParseRxCallbacks.rx_parseOptionalCallback(observer))
        }
    }
    
    public func rx_getObject(_ objectId: String) -> Observable<PFObject?> {
        return createWithParseCallback { observer in
            self.getObjectInBackground(withId: objectId, block: ParseRxCallbacks.rx_parseOptionalCallback(observer))
        }
    }
    
    public func rx_getFirstObject() -> Observable<PFObject?> {
        return createWithParseCallback { observer in
            self.getFirstObjectInBackground(block: ParseRxCallbacks.rx_parseOptionalCallback(observer))
        }
    }
    
    public func rx_countObjects() -> Observable<Int32> {
        return createWithParseCallback { observer in
            self.countObjectsInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        }
    }
}
