From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v5 04/14] ARM: SAMSUNG: Unify base address definitions of timer
 block
Date: Fri, 12 Apr 2013 21:17:20 +0200
Message-ID: <1365794250-14436-5-git-send-email-t.figa@samsung.com>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:44529 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752997Ab3DLTSV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Apr 2013 15:18:21 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ML50027YPMAGV20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 13 Apr 2013 04:18:20 +0900 (KST)
In-reply-to: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, tomasz.figa@gmail.com, heiko@sntech.de, robherring2@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, Tomasz Figa <t.figa@samsung.com>

This patch makes all defintions of timer block base address use the same
prefix to allow using the common name to define platform device
resource.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/include/mach/map.h  | 1 +
 arch/arm/mach-s3c24xx/include/mach/map.h | 2 ++
 arch/arm/mach-s3c64xx/include/mach/map.h | 1 +
 arch/arm/mach-s5p64x0/include/mach/map.h | 1 +
 arch/arm/mach-s5pc100/include/mach/map.h | 1 +
 arch/arm/mach-s5pv210/include/mach/map.h | 1 +
 6 files changed, 7 insertions(+)

diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 99e0a79..7167aba 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -272,6 +272,7 @@
 #define SAMSUNG_PA_ADC			EXYNOS4_PA_ADC
 #define SAMSUNG_PA_ADC1			EXYNOS4_PA_ADC1
 #define SAMSUNG_PA_KEYPAD		EXYNOS4_PA_KEYPAD
+#define SAMSUNG_PA_TIMER		EXYNOS4_PA_TIMER
 
 /* Compatibility UART */
 
diff --git a/arch/arm/mach-s3c24xx/include/mach/map.h b/arch/arm/mach-s3c24xx/include/mach/map.h
index 8ba381f..444793f 100644
--- a/arch/arm/mach-s3c24xx/include/mach/map.h
+++ b/arch/arm/mach-s3c24xx/include/mach/map.h
@@ -167,4 +167,6 @@
 #define S3C_PA_SPI0		S3C2443_PA_SPI0
 #define S3C_PA_SPI1		S3C2443_PA_SPI1
 
+#define SAMSUNG_PA_TIMER	S3C2410_PA_TIMER
+
 #endif /* __ASM_ARCH_MAP_H */
diff --git a/arch/arm/mach-s3c64xx/include/mach/map.h b/arch/arm/mach-s3c64xx/include/mach/map.h
index 8e2097b..f55ccb1 100644
--- a/arch/arm/mach-s3c64xx/include/mach/map.h
+++ b/arch/arm/mach-s3c64xx/include/mach/map.h
@@ -121,5 +121,6 @@
 #define SAMSUNG_PA_ADC		S3C64XX_PA_ADC
 #define SAMSUNG_PA_CFCON	S3C64XX_PA_CFCON
 #define SAMSUNG_PA_KEYPAD	S3C64XX_PA_KEYPAD
+#define SAMSUNG_PA_TIMER	S3C64XX_PA_TIMER
 
 #endif /* __ASM_ARCH_6400_MAP_H */
diff --git a/arch/arm/mach-s5p64x0/include/mach/map.h b/arch/arm/mach-s5p64x0/include/mach/map.h
index 0c0175d..50a6e96 100644
--- a/arch/arm/mach-s5p64x0/include/mach/map.h
+++ b/arch/arm/mach-s5p64x0/include/mach/map.h
@@ -76,6 +76,7 @@
 #define S5P_PA_TIMER		S5P64X0_PA_TIMER
 
 #define SAMSUNG_PA_ADC		S5P64X0_PA_ADC
+#define SAMSUNG_PA_TIMER	S5P64X0_PA_TIMER
 
 /* UART */
 
diff --git a/arch/arm/mach-s5pc100/include/mach/map.h b/arch/arm/mach-s5pc100/include/mach/map.h
index 54bc4f8..2550b61 100644
--- a/arch/arm/mach-s5pc100/include/mach/map.h
+++ b/arch/arm/mach-s5pc100/include/mach/map.h
@@ -116,6 +116,7 @@
 #define SAMSUNG_PA_ADC			S5PC100_PA_TSADC
 #define SAMSUNG_PA_CFCON		S5PC100_PA_CFCON
 #define SAMSUNG_PA_KEYPAD		S5PC100_PA_KEYPAD
+#define SAMSUNG_PA_TIMER		S5PC100_PA_TIMER
 
 #define S5PC100_VA_OTHERS		(S3C_VA_SYS + 0x10000)
 
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index b7c8a19..763929a 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -139,6 +139,7 @@
 #define SAMSUNG_PA_ADC			S5PV210_PA_ADC
 #define SAMSUNG_PA_CFCON		S5PV210_PA_CFCON
 #define SAMSUNG_PA_KEYPAD		S5PV210_PA_KEYPAD
+#define SAMSUNG_PA_TIMER		S5PV210_PA_TIMER
 
 /* UART */
 
-- 
1.8.1.5
