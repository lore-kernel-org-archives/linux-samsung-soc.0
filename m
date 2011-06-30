From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 2/7] ARM: SAMSUNG: Define common macro for SPI physical address
Date: Thu, 30 Jun 2011 08:25:18 -0400
Message-ID: <1309436723-662-3-git-send-email-padma.v@samsung.com>
References: <1309436723-662-1-git-send-email-padma.v@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:62759 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753826Ab1F3GiV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 02:38:21 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNL00KLCBRPPAC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 15:38:17 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNL0026NBR6C8@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 15:38:17 +0900 (KST)
In-reply-to: <1309436723-662-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, jassisinghbrar@gmail.com, sbkim73@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

A common macro has been defined for SPI physical address as
SPI has been made common across all the S3C64xx and S5P series.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/mach-s3c64xx/include/mach/map.h |    2 ++
 arch/arm/mach-s5p64x0/include/mach/map.h |    2 ++
 arch/arm/mach-s5pc100/include/mach/map.h |    3 +++
 arch/arm/mach-s5pv210/include/mach/map.h |    2 ++
 4 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/include/mach/map.h b/arch/arm/mach-s3c64xx/include/mach/map.h
index a1f13f0..1082e2e 100644
--- a/arch/arm/mach-s3c64xx/include/mach/map.h
+++ b/arch/arm/mach-s3c64xx/include/mach/map.h
@@ -122,6 +122,8 @@
 #define S3C_VA_USB_HSPHY	S3C64XX_VA_USB_HSPHY
 #define S3C_PA_RTC		S3C64XX_PA_RTC
 #define S3C_PA_WDT		S3C64XX_PA_WATCHDOG
+#define S3C_PA_SPI0		S3C64XX_PA_SPI0
+#define S3C_PA_SPI1		S3C64XX_PA_SPI1
 
 #define SAMSUNG_PA_ADC		S3C64XX_PA_ADC
 #define SAMSUNG_PA_CFCON	S3C64XX_PA_CFCON
diff --git a/arch/arm/mach-s5p64x0/include/mach/map.h b/arch/arm/mach-s5p64x0/include/mach/map.h
index 95c9125..13f453c 100644
--- a/arch/arm/mach-s5p64x0/include/mach/map.h
+++ b/arch/arm/mach-s5p64x0/include/mach/map.h
@@ -64,6 +64,8 @@
 #define S3C_PA_IIC1		S5P6440_PA_IIC1
 #define S3C_PA_RTC		S5P64X0_PA_RTC
 #define S3C_PA_WDT		S5P64X0_PA_WDT
+#define S3C_PA_SPI0		S5P64X0_PA_SPI0
+#define S3C_PA_SPI1		S5P64X0_PA_SPI1
 
 #define S5P_PA_CHIPID		S5P64X0_PA_CHIPID
 #define S5P_PA_SROMC		S5P64X0_PA_SROMC
diff --git a/arch/arm/mach-s5pc100/include/mach/map.h b/arch/arm/mach-s5pc100/include/mach/map.h
index ccbe6b7..54bc4f8 100644
--- a/arch/arm/mach-s5pc100/include/mach/map.h
+++ b/arch/arm/mach-s5pc100/include/mach/map.h
@@ -100,6 +100,9 @@
 #define S3C_PA_USB_HSOTG		S5PC100_PA_USB_HSOTG
 #define S3C_PA_USB_HSPHY		S5PC100_PA_USB_HSPHY
 #define S3C_PA_WDT			S5PC100_PA_WATCHDOG
+#define S3C_PA_SPI0			S5PC100_PA_SPI0
+#define S3C_PA_SPI1			S5PC100_PA_SPI1
+#define S3C_PA_SPI2			S5PC100_PA_SPI2
 
 #define S5P_PA_CHIPID			S5PC100_PA_CHIPID
 #define S5P_PA_FIMC0			S5PC100_PA_FIMC0
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index 1dd5883..3fdacfa 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -101,6 +101,8 @@
 #define S3C_PA_RTC			S5PV210_PA_RTC
 #define S3C_PA_USB_HSOTG		S5PV210_PA_HSOTG
 #define S3C_PA_WDT			S5PV210_PA_WATCHDOG
+#define S3C_PA_SPI0			S5PV210_PA_SPI0
+#define S3C_PA_SPI1			S5PV210_PA_SPI1
 
 #define S5P_PA_CHIPID			S5PV210_PA_CHIPID
 #define S5P_PA_FIMC0			S5PV210_PA_FIMC0
-- 
1.7.0.4
