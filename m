From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: autodetect enabled serial port in uncompress
Date: Mon,  2 Apr 2012 12:17:07 -0700
Message-ID: <1333394227-21986-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:63783 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750778Ab2DBTX3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Apr 2012 15:23:29 -0400
Received: by pbcun15 with SMTP id un15so4752944pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Apr 2012 12:23:29 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Colin Cross <ccross@android.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Colin Cross <ccross@android.com>

Check the ULCON register of each serial port to determine if
it has been enabled by the bootloader.  If only one serial port
is found enabled, use that one.  Otherwise, use the value from
CONFIG_S3C_LOWLEVEL_UART_PORT.

Signed-off-by: Colin Cross <ccross@android.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/include/mach/uncompress.h |   25 ++++++++++++++++++++++-
 1 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/uncompress.h b/arch/arm/mach-exynos/include/mach/uncompress.h
index 2979995..0d17a43 100644
--- a/arch/arm/mach-exynos/include/mach/uncompress.h
+++ b/arch/arm/mach-exynos/include/mach/uncompress.h
@@ -25,6 +25,25 @@ static unsigned int __raw_readl(unsigned int ptr)
 	return *((volatile unsigned int *)ptr);
 }
 
+static volatile u8 *exynos_autodetect_uart(volatile u8 *base)
+{
+	int i;
+	int found = 0;
+	int port;
+
+	for (i = 0; i < CONFIG_SERIAL_SAMSUNG_UARTS; i++) {
+		if (__raw_readl((unsigned int)base + S3C_UART_OFFSET * i)) {
+			port = i;
+			found++;
+		}
+	}
+
+	if (found != 1)
+		port = CONFIG_S3C_LOWLEVEL_UART_PORT;
+
+	return base + S3C_UART_OFFSET * port;
+}
+
 static void arch_detect_cpu(void)
 {
 	u32 chip_id = __raw_readl(EXYNOS_PA_CHIPID);
@@ -38,9 +57,11 @@ static void arch_detect_cpu(void)
 	chip_id &= 0xf;
 
 	if (chip_id == 0x5)
-		uart_base = (volatile u8 *)EXYNOS5_PA_UART + (S3C_UART_OFFSET * CONFIG_S3C_LOWLEVEL_UART_PORT);
+		uart_base = (volatile u8 *)EXYNOS5_PA_UART;
 	else
-		uart_base = (volatile u8 *)EXYNOS4_PA_UART + (S3C_UART_OFFSET * CONFIG_S3C_LOWLEVEL_UART_PORT);
+		uart_base = (volatile u8 *)EXYNOS4_PA_UART;
+
+	uart_base = exynos_autodetect_uart(uart_base);
 
 	/*
 	 * For preventing FIFO overrun or infinite loop of UART console,
-- 
1.7.2.3
