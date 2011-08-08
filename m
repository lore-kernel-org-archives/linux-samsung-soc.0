From: Rajeshwari Shinde <rajeshwari.s@samsung.com>
Subject: RFC[PATCH 2/6] ARM: S5P64X0: Enable SDHCI device
Date: Mon, 08 Aug 2011 14:17:52 +0530
Message-ID: <1312793277-18689-3-git-send-email-rajeshwari.s@samsung.com>
References: <1312793277-18689-1-git-send-email-rajeshwari.s@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11927 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751140Ab1HHItu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Aug 2011 04:49:50 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPL00AWCPUNLPT0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 17:49:49 +0900 (KST)
Received: from rajeshwari-linux.sisodomain.com ([107.108.215.115])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPL00BGTPUTHJ@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 17:49:49 +0900 (KST)
In-reply-to: <1312793277-18689-1-git-send-email-rajeshwari.s@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, cjb@laptop.org, ben-linux@fluff.org

Select HSMMC device for S5P6440 and S5P6450.

Signed-off-by: Rajeshwari Shinde <rajeshwari.s@samsung.com>
---
 arch/arm/mach-s5p64x0/Kconfig |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/Kconfig b/arch/arm/mach-s5p64x0/Kconfig
index 65c7518..bbc533e 100644
--- a/arch/arm/mach-s5p64x0/Kconfig
+++ b/arch/arm/mach-s5p64x0/Kconfig
@@ -26,6 +26,18 @@ config S5P64X0_SETUP_I2C1
 	help
 	  Common setup code for i2c bus 1.
 
+config S5P64X0_SETUP_SDHCI
+	bool
+	select S5P64X0_SETUP_SDHCI_GPIO
+	help
+	  Internal helper functions for S5P64X0 based SDHCI systems
+
+config S5P64X0_SETUP_SDHCI_GPIO
+	bool
+	help
+	  Common setup code for SDHCI gpio.
+	  Gpio values are machine specific.
+
 # machine support
 
 config MACH_SMDK6440
@@ -34,12 +46,16 @@ config MACH_SMDK6440
 	select S3C_DEV_I2C1
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
+	select S3C_DEV_HSMMC
+	select S3C_DEV_HSMMC1
+	select S3C_DEV_HSMMC2
 	select S3C64XX_DEV_SPI
 	select SAMSUNG_DEV_ADC
 	select SAMSUNG_DEV_BACKLIGHT
 	select SAMSUNG_DEV_PWM
 	select SAMSUNG_DEV_TS
 	select S5P64X0_SETUP_I2C1
+	select S5P64X0_SETUP_SDHCI
 	help
 	  Machine support for the Samsung SMDK6440
 
@@ -49,13 +65,27 @@ config MACH_SMDK6450
 	select S3C_DEV_I2C1
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
+	select S3C_DEV_HSMMC
+	select S3C_DEV_HSMMC1
+	select S3C_DEV_HSMMC2
 	select S3C64XX_DEV_SPI
 	select SAMSUNG_DEV_ADC
 	select SAMSUNG_DEV_BACKLIGHT
 	select SAMSUNG_DEV_PWM
 	select SAMSUNG_DEV_TS
 	select S5P64X0_SETUP_I2C1
+	select S5P64X0_SETUP_SDHCI
 	help
 	  Machine support for the Samsung SMDK6450
 
+menu "Use 8-bit SDHCI bus width"
+
+config S5P64X0_SD_CH1_8BIT
+	bool "SDHCI Channel 1 (Slot 1)"
+	depends on MACH_SMDK6450 || MACH_SMDK6440
+	help
+	  Support SDHCI Channel 1 8-bit bus.
+
+endmenu
+
 endif
-- 
1.7.4.4
