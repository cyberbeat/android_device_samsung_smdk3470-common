/*
 * Copyright (C) 2026 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <openssl/ssl.h>
#include <sensor/SensorManager.h>

/*
 * The legacy proprietary gpsd blob was built against Android Pie, where
 * SensorManager::getSensorList(Sensor const* const**) was a const member
 * function living in libgui.so. On Android 10 it is non-const and lives in
 * libsensor.so, so gpsd fails to link:
 *
 *   CANNOT LINK EXECUTABLE ".../gpsd": cannot locate symbol
 *   "_ZNK7android13SensorManager13getSensorListEPPKPKNS_6SensorE"
 *
 * This shim exports that exact P-ABI symbol and forwards to the Q
 * implementation. Loaded via LD_PRELOAD in the gpsd init service.
 */
extern "C" ssize_t _ZNK7android13SensorManager13getSensorListEPPKPKNS_6SensorE(
        android::SensorManager* mgr, const android::Sensor* const** list) {
    return mgr->getSensorList(list);
}

/*
 * BoringSSL on Q removed the SSLv3-specific method getters that the gpsd
 * blob references (SSLv3 itself is gone). Forward them to the
 * version-flexible TLS client method.
 */
extern "C" const SSL_METHOD* SSLv3_client_method(void) {
    return TLS_client_method();
}

extern "C" const SSL_METHOD* SSLv23_client_method(void) {
    return TLS_client_method();
}
