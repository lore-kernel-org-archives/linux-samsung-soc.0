From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v2 1/2] ARM: SAMSUNG: use generic uncompress.h
Date: Tue, 25 Feb 2014 20:38:17 +0100
Message-ID: <2544454.5zxXse5cEm@phil>
References: <6973248.vNO4T7GhE6@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:37902 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752522AbaBYTi7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Feb 2014 14:38:59 -0500
In-Reply-To: <6973248.vNO4T7GhE6@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com, Sachin Kamat <sachin.kamat@linaro.org>, Arnd Bergmann <arnd@arndb.de>

All Samsung platforms, not only Exynos, use the custom uncompress.h
simply to setup the uart for the initial debug output. This can also
be done using the generic uncompress.h.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/Kconfig.debug | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 3e988f6..a160744 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1145,7 +1145,7 @@ config DEBUG_UART_8250_FLOW_CONTROL
 
 config DEBUG_UNCOMPRESS
 	bool
-	depends on ARCH_MULTIPLATFORM || ARCH_MSM || ARCH_EXYNOS
+	depends on ARCH_MULTIPLATFORM || ARCH_MSM || PLAT_SAMSUNG
 	default y if DEBUG_LL && !DEBUG_OMAP2PLUS_UART && \
 		     (!DEBUG_TEGRA_UART || !ZBOOT_ROM)
 	help
@@ -1162,7 +1162,7 @@ config DEBUG_UNCOMPRESS
 config UNCOMPRESS_INCLUDE
 	string
 	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
-					ARCH_EXYNOS
+					PLAT_SAMSUNG
 	default "mach/uncompress.h"
 
 config EARLY_PRINTK
-- 
1.8.5.3
