From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 8/9] ARM: EXYNOS: temporary add map definitions for uart
Date: Wed,  1 Feb 2012 00:39:13 +0900
Message-ID: <1328024354-4277-9-git-send-email-kgene.kim@samsung.com>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:38938 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754714Ab2AaPkC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 10:40:02 -0500
Received: by mail-pw0-f46.google.com with SMTP id u11so258976pbd.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2012 07:40:02 -0800 (PST)
In-Reply-To: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: rmk+kernel@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net, Kukjin Kim <kgene.kim@samsung.com>

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/include/mach/map.h |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index f88acaf..300ed7e 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -167,9 +167,10 @@
 #define S3C_PA_IIC5			EXYNOS4_PA_IIC(5)
 #define S3C_PA_IIC6			EXYNOS4_PA_IIC(6)
 #define S3C_PA_IIC7			EXYNOS4_PA_IIC(7)
+
 #define S3C_PA_RTC			EXYNOS4_PA_RTC
 #define S3C_PA_WDT			EXYNOS4_PA_WATCHDOG
-#define S3C_PA_UART			EXYNOS4_PA_UART
+
 #define S3C_PA_SPI0			EXYNOS4_PA_SPI0
 #define S3C_PA_SPI1			EXYNOS4_PA_SPI1
 #define S3C_PA_SPI2			EXYNOS4_PA_SPI2
@@ -198,9 +199,17 @@
 
 /* Compatibility UART */
 
+#ifdef CONFIG_ARCH_EXYNOS4
+#define S3C_PA_UART			EXYNOS4_PA_UART
+#endif
+
+#ifdef CONFIG_ARCH_EXYNOS5
+#define S3C_PA_UART			EXYNOS5_PA_UART
+#endif
+
 #define S3C_VA_UARTx(x)			(S3C_VA_UART + ((x) * S3C_UART_OFFSET))
 
-#define S5P_PA_UART(x)			(EXYNOS4_PA_UART + ((x) * S3C_UART_OFFSET))
+#define S5P_PA_UART(x)			(S3C_PA_UART + ((x) * S3C_UART_OFFSET))
 #define S5P_PA_UART0			S5P_PA_UART(0)
 #define S5P_PA_UART1			S5P_PA_UART(1)
 #define S5P_PA_UART2			S5P_PA_UART(2)
-- 
1.7.4.4
