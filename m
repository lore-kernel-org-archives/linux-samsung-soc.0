From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv7] ARM: exynos_defconfig: Enable LEDS for Odroid-XU3/XU4
Date: Thu,  3 Sep 2015 18:11:50 +0000
Message-ID: <1441303910-3266-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Anand Moon <linux.amoon@gmail.com>, Andreas Faerber <afaerber@suse.de>, Lukasz Majewski <l.majewski@samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Earlier design of the LED for Odroid XU3 was using gpio-leds
Now It was change to using both pwm-leds and gpio-leds.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

---
Changes from last version
dropped following option.
  CONFIG_LEDS_CLASS_FLASH
  CONFIG_TRIGGER_ONESHOT
  CONFIG_LEDS_TRIGGER_TIMER
  CONFIG_TRIGGER_GPIO
fixed the From address
fixed the commit message.
---
 arch/arm/configs/exynos_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 9504e77..bd6b7f7 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -163,6 +163,12 @@ CONFIG_MMC_SDHCI_S3C_DMA=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_DW_IDMAC=y
 CONFIG_MMC_DW_EXYNOS=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_PWM=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_MAX77802=y
-- 
2.1.4
