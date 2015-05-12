From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH 1/3] ARM: exynos_defconfig: Enable CONFIG_SENSORS_PWM_FAN for odroidxu3 pmw-fan
Date: Wed, 13 May 2015 00:54:20 +0930
Message-ID: <1431444262-29531-2-git-send-email-linux.amoon@gmail.com>
References: <Anand Moon <linux.amoon@gmail.com>
 <1431444262-29531-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:36665 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932914AbbELPZE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 May 2015 11:25:04 -0400
Received: by pdea3 with SMTP id a3so16464662pde.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 May 2015 08:25:03 -0700 (PDT)
In-Reply-To: <1431444262-29531-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>, Doug Anderson <dianders@chromium.org>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Enable CONFIG_SENSORS_PWM_FAN on exynos_defconfig to control fan power on Odroidxu3.

---
Depends on http://www.spinics.net/lists/arm-kernel/msg412031.html
Tested on OdroidXU3 Board.
---

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index d034c96..3c2784f 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -101,6 +101,7 @@ CONFIG_CHARGER_MAX77693=y
 CONFIG_CHARGER_TPS65090=y
 CONFIG_HWMON=y
 CONFIG_SENSORS_LM90=y
+CONFIG_SENSORS_PWM_FAN=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL=y
-- 
1.9.1
