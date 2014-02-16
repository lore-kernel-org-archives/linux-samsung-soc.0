From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 1/2] ARM: SAMSUNG: use generic uncompress.h
Date: Sun, 16 Feb 2014 18:33:17 +0100
Message-ID: <9414533.cBWCZj35Zp@phil>
References: <3594365.ORKU4Q2jDp@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:54218 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752690AbaBPReQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Feb 2014 12:34:16 -0500
In-Reply-To: <3594365.ORKU4Q2jDp@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com, Sachin Kamat <sachin.kamat@linaro.org>, Arnd Bergmann <arnd@arndb.de>

All Samsung platforms use the custom uncompress.h simply to setup the uart
for the initial debug output. This can also be done using the generic
uncompress.h.

Suggested-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/Kconfig.debug | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 0531da8..a160744 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1145,7 +1145,7 @@ config DEBUG_UART_8250_FLOW_CONTROL
 
 config DEBUG_UNCOMPRESS
 	bool
-	depends on ARCH_MULTIPLATFORM || ARCH_MSM
+	depends on ARCH_MULTIPLATFORM || ARCH_MSM || PLAT_SAMSUNG
 	default y if DEBUG_LL && !DEBUG_OMAP2PLUS_UART && \
 		     (!DEBUG_TEGRA_UART || !ZBOOT_ROM)
 	help
@@ -1161,7 +1161,8 @@ config DEBUG_UNCOMPRESS
 
 config UNCOMPRESS_INCLUDE
 	string
-	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM
+	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
+					PLAT_SAMSUNG
 	default "mach/uncompress.h"
 
 config EARLY_PRINTK
-- 
1.8.5.3
