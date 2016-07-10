//
//  PFUser+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

extension PFUser {
    
    public func rx_signUp() -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.signUpInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_login(_ username: String, password: String) -> Observable<PFUser> {
        return createWithParseCallback({ observer in
            self.logInWithUsername(inBackground: username, password: password, block: ParseRxCallbacks.rx_parseUnwrappedOptionalCallback(observer))
        })
    }
    
    public static func rx_resetPassword(_ email: String) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.requestPasswordResetForEmail(inBackground: email, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }

}
    
