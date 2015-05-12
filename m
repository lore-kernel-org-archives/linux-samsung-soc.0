From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH 2/3] ARM: exynos_defconfig: Enable CONFIG_SENSORS_INA2XX for odroidxu3.
Date: Wed, 13 May 2015 00:54:21 +0930
Message-ID: <1431444262-29531-3-git-send-email-linux.amoon@gmail.com>
References: <Anand Moon <linux.amoon@gmail.com>
 <1431444262-29531-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:34452 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932914AbbELPZJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 May 2015 11:25:09 -0400
Received: by pacyx8 with SMTP id yx8so16082209pac.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 May 2015 08:25:09 -0700 (PDT)
In-Reply-To: <1431444262-29531-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>, Doug Anderson <dianders@chromium.org>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Odroidxu3 board support power monitor sensor.

Below is the output of boot log.
[    3.241438] ina2xx 0-0040: power monitor ina231 (Rshunt = 10000 uOhm)
[    3.248068] ina2xx 0-0041: power monitor ina231 (Rshunt = 10000 uOhm)
[    3.254724] ina2xx 0-0044: power monitor ina231 (Rshunt = 10000 uOhm)
[    3.261354] ina2xx 0-0045: power monitor ina231 (Rshunt = 10000 uOhm)

ina231-i2c-0-40
Adapter: s3c2410-i2c
in0:          +0.00 V
in1:          +1.01 V
power1:      175.00 mW
curr1:        +0.18 A

ina231-i2c-0-41
Adapter: s3c2410-i2c
in0:          +0.00 V
in1:          +1.21 V
power1:       50.00 mW
curr1:        +0.04 A

ina231-i2c-0-44
Adapter: s3c2410-i2c
in0:          +0.00 V
in1:          +1.02 V
power1:       50.00 mW
curr1:        +0.04 A

ina231-i2c-0-45
Adapter: s3c2410-i2c
in0:          +0.00 V
in1:          +1.04 V
power1:       75.00 mW
curr1:        +0.07 A

---
Tested on OdroidXU3 Board.
---

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 3c2784f..300678a 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -102,6 +102,7 @@ CONFIG_CHARGER_TPS65090=y
 CONFIG_HWMON=y
 CONFIG_SENSORS_LM90=y
 CONFIG_SENSORS_PWM_FAN=y
+CONFIG_SENSORS_INA2XX=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL=y
-- 
1.9.1
