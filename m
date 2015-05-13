From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv2 1/3] ARM: exynos_defconfig: Enable CONFIG_SENSORS_PWM_FAN for odroidxu3 pmw-fan
Date: Wed, 13 May 2015 13:22:52 +0930
Message-ID: <1431489174-4479-2-git-send-email-linux.amoon@gmail.com>
References: <1431489174-4479-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:33356 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751583AbbEMDxN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 May 2015 23:53:13 -0400
Received: by pacwv17 with SMTP id wv17so36649466pac.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 May 2015 20:53:13 -0700 (PDT)
In-Reply-To: <1431489174-4479-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>, Doug Anderson <dianders@chromium.org>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Enable CONFIG_SENSORS_PWM_FAN on exynos_defconfig to control fan power on Odroidxu3.

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
