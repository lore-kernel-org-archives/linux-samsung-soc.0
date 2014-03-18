From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 5/6] ARM: s3c64xx: Fix incorrect selection of PM-related
 symbols
Date: Tue, 18 Mar 2014 18:16:03 +0100
Message-ID: <1395162964-5916-5-git-send-email-t.figa@samsung.com>
References: <1395162964-5916-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:49312 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753950AbaCRRQZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Mar 2014 13:16:25 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N2N00ND36NB4B90@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Mar 2014 17:16:23 +0000 (GMT)
In-reply-to: <1395162964-5916-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Tomasz Figa <t.figa@samsung.com>

This patch modifies ARCH_S3C64XX Kconfig entry to select
SAMSUNG_WAKEMASK and PM_GENERIC_DOMAINS conditionally if PM_SLEEP and
PM_RUNTIME are enabled respectively to avoid introducing unmet
dependenies such as

warning: (ARCH_S3C64XX && S3C2412_PM && CPU_S5P6440 && CPU_S5P6450)
selects SAMSUNG_WAKEMASK which has unmet direct dependencies
(PLAT_SAMSUNG && PM)

warning: (ARCH_S3C64XX && ARCH_EXYNOS4 && SOC_EXYNOS5250 &&
SOC_EXYNOS5420) selects PM_GENERIC_DOMAINS which has unmet direct
dependencies (PM)

and related compilation errors, when PM_SLEEP or PM_RUNTIME is not
enabled.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index afc751f..0608177 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -757,11 +757,11 @@ config ARCH_S3C64XX
 	select HAVE_TCM
 	select NO_IOPORT_MAP
 	select PLAT_SAMSUNG
-	select PM_GENERIC_DOMAINS
+	select PM_GENERIC_DOMAINS if PM_RUNTIME
 	select S3C_DEV_NAND
 	select S3C_GPIO_TRACK
 	select SAMSUNG_ATAGS
-	select SAMSUNG_WAKEMASK
+	select SAMSUNG_WAKEMASK if PM_SLEEP
 	select SAMSUNG_WDT_RESET
 	help
 	  Samsung S3C64XX series based systems
-- 
1.9.0
