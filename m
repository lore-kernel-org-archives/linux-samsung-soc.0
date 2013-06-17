From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 10/38] ARM: EXYNOS: common: Remove platform device
 initialization
Date: Mon, 17 Jun 2013 18:33:55 +0200
Message-ID: <1371486863-12398-11-git-send-email-t.figa@samsung.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41745 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752801Ab3FQQeu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 12:34:50 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOJ00MBNQ1N6260@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 17:34:44 +0100 (BST)
In-reply-to: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch removes legacy platform device initialization code that was
used to set names and other parameters of static platform devices when
booting with ATAGS, which is not supported on Exynos any more.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/common.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index b1d0afa..2c8527c 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -43,16 +43,7 @@
 #include <mach/regs-gpio.h>
 
 #include <plat/cpu.h>
-#include <plat/devs.h>
 #include <plat/pm.h>
-#include <plat/sdhci.h>
-#include <plat/gpio-cfg.h>
-#include <plat/adc-core.h>
-#include <plat/fb-core.h>
-#include <plat/fimc-core.h>
-#include <plat/iic-core.h>
-#include <plat/tv-core.h>
-#include <plat/spi-core.h>
 #include <plat/regs-serial.h>
 
 #include "common.h"
@@ -401,34 +392,6 @@ static void __init exynos4_map_io(void)
 		iotable_init(exynos4210_iodesc, ARRAY_SIZE(exynos4210_iodesc));
 	if (soc_is_exynos4212() || soc_is_exynos4412())
 		iotable_init(exynos4x12_iodesc, ARRAY_SIZE(exynos4x12_iodesc));
-
-	/* initialize device information early */
-	exynos4_default_sdhci0();
-	exynos4_default_sdhci1();
-	exynos4_default_sdhci2();
-	exynos4_default_sdhci3();
-
-	s3c_adc_setname("samsung-adc-v3");
-
-	s3c_fimc_setname(0, "exynos4-fimc");
-	s3c_fimc_setname(1, "exynos4-fimc");
-	s3c_fimc_setname(2, "exynos4-fimc");
-	s3c_fimc_setname(3, "exynos4-fimc");
-
-	s3c_sdhci_setname(0, "exynos4-sdhci");
-	s3c_sdhci_setname(1, "exynos4-sdhci");
-	s3c_sdhci_setname(2, "exynos4-sdhci");
-	s3c_sdhci_setname(3, "exynos4-sdhci");
-
-	/* The I2C bus controllers are directly compatible with s3c2440 */
-	s3c_i2c0_setname("s3c2440-i2c");
-	s3c_i2c1_setname("s3c2440-i2c");
-	s3c_i2c2_setname("s3c2440-i2c");
-
-	s5p_fb_setname(0, "exynos4-fb");
-	s5p_hdmi_setname("exynos4-hdmi");
-
-	s3c64xx_spi_setname("exynos4210-spi");
 }
 
 static void __init exynos5_map_io(void)
-- 
1.8.2.1
