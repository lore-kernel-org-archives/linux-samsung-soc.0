From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v8 3/8] ARM64: EXYNOS: enable exynos_chipid for ARCH_EXYNOS
Date: Sat, 10 Dec 2016 18:38:38 +0530
Message-ID: <1481375323-29724-4-git-send-email-pankaj.dubey@samsung.com>
References: <1481375323-29724-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50780 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752847AbcLJNGW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 10 Dec 2016 08:06:22 -0500
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OHZ0235C0ED59A0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 10 Dec 2016 22:06:21 +0900 (KST)
In-reply-to: <1481375323-29724-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, arnd@arndb.de, geert+renesas@glider.be, m.szyprowski@samsung.com, javier@osg.samsung.com, kgene@kernel.org, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch enables exynos_chipid driver for ARCH_EXYNOS
based SoC.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 72f4eac..e6aa5c2 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -53,6 +53,7 @@ config ARCH_BRCMSTB
 
 config ARCH_EXYNOS
 	bool "ARMv8 based Samsung Exynos SoC family"
+	select EXYNOS_CHIPID
 	select COMMON_CLK_SAMSUNG
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	select HAVE_S3C_RTC if RTC_CLASS
-- 
2.7.4
