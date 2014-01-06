From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: Exynos: Use generic uncompress.h
Date: Mon,  6 Jan 2014 14:32:54 +0530
Message-ID: <1388998975-32362-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:32772 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753441AbaAFJGr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jan 2014 04:06:47 -0500
Received: by mail-pa0-f45.google.com with SMTP id fb1so18412779pad.32
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2014 01:06:47 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, arnd@arndb.de, sachin.kamat@linaro.org, patches@linaro.org

As a pre-requisite step towards enabling multi-platform support
for Exynos, enable it to use generic uncompress.h instead of the
one provided in machine code.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/Kconfig.debug |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index e6c313ec5ece..de379a93c8ba 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1131,7 +1131,7 @@ config DEBUG_UART_8250_FLOW_CONTROL
 
 config DEBUG_UNCOMPRESS
 	bool
-	depends on ARCH_MULTIPLATFORM || ARCH_MSM
+	depends on ARCH_MULTIPLATFORM || ARCH_MSM || ARCH_EXYNOS
 	default y if DEBUG_LL && !DEBUG_OMAP2PLUS_UART && \
 		     (!DEBUG_TEGRA_UART || !ZBOOT_ROM)
 	help
@@ -1147,7 +1147,8 @@ config DEBUG_UNCOMPRESS
 
 config UNCOMPRESS_INCLUDE
 	string
-	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM
+	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
+					ARCH_EXYNOS
 	default "mach/uncompress.h"
 
 config EARLY_PRINTK
-- 
1.7.9.5
