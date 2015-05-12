From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH 3/3] ARM: exynos_defconfig: Enable LED's for odroidxu3.
Date: Wed, 13 May 2015 00:54:22 +0930
Message-ID: <1431444262-29531-4-git-send-email-linux.amoon@gmail.com>
References: <Anand Moon <linux.amoon@gmail.com>
 <1431444262-29531-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:33215 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932883AbbELPZP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 May 2015 11:25:15 -0400
Received: by pacwv17 with SMTP id wv17so16185331pac.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 May 2015 08:25:14 -0700 (PDT)
In-Reply-To: <1431444262-29531-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>, Doug Anderson <dianders@chromium.org>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Enable CONFIG_LEDS_GPIO, CONFIG_LEDS_TRIGGERS, CONFIG_LEDS_TRIGGER_HEARTBEAT.

---
Tested on OdroidXU3 Board.
---

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/configs/exynos_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 300678a..21411c5 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -179,6 +179,9 @@ CONFIG_MMC_SDHCI_S3C_DMA=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_DW_IDMAC=y
 CONFIG_MMC_DW_EXYNOS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_MAX77802=y
-- 
1.9.1
