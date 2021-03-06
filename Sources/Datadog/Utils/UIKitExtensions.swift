/*
 * Unless explicitly stated otherwise all files in this repository are licensed under the Apache License Version 2.0.
 * This product includes software developed at Datadog (https://www.datadoghq.com/).
 * Copyright 2019-2020 Datadog, Inc.
 */

import UIKit

internal extension UIApplication {
    /// `UIApplication.shared` does not compile in some environments (e.g. notification service app extension), resulting with:
    /// _"shared' is unavailable in application extensions for iOS: Use view controller based solutions where appropriate instead"_.
    ///
    /// As a workaround, this `managedShared` utility provides a key-path access to the `UIApplication.shared` to make the compiler pass.
    static var managedShared: UIApplication? {
        return UIApplication
            .value(forKeyPath: #keyPath(UIApplication.shared)) as? UIApplication // swiftlint:disable:this unsafe_uiapplication_shared
    }
}
