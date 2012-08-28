From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 3/3] ARM: EXYNOS: Add support for FIMC cam port B GPIO setup on
 Exynos4x12
Date: Tue, 28 Aug 2012 12:07:32 +0200
Message-ID: <2273077.MFzyvUNijr@amdc1227>
References: <4648723.rWnut7F0uJ@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52218 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750761Ab2H1KIW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 06:08:22 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9G00I7FMSGXVA0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Aug 2012 19:07:39 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9G007S4MSLVP40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Aug 2012 19:07:39 +0900 (KST)
In-reply-to: <4648723.rWnut7F0uJ@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Exynos4x12 SoCs use different GPIO pins for FIMC cam port B and this patch
modifies the setup code to take it into account.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/setup-fimc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/mach-exynos/setup-fimc.c b/arch/arm/mach-exynos/setup-fimc.c
index d74843e..4b0cce5 100644
--- a/arch/arm/mach-exynos/setup-fimc.c
+++ b/arch/arm/mach-exynos/setup-fimc.c
@@ -11,6 +11,7 @@
 #include <linux/gpio.h>
 #include <plat/gpio-cfg.h>
 #include <plat/camport.h>
+#include <plat/cpu.h>
 
 int exynos4_fimc_setup_gpio(enum s5p_camport_id id)
 {
@@ -26,6 +27,22 @@ int exynos4_fimc_setup_gpio(enum s5p_camport_id id)
 		break;
 
 	case S5P_CAMPORT_B:
+		if (soc_is_exynos4212() || soc_is_exynos4412()) {
+			sfn = S3C_GPIO_SFN(3);
+
+			/* PCLK, DATA[0-6] */
+			ret = s3c_gpio_cfgrange_nopull(EXYNOS4X12_GPM0(0), 8, sfn);
+			/* FIELD, DATA[7]*/
+			if (!ret)
+				ret = s3c_gpio_cfgrange_nopull(EXYNOS4X12_GPM1(0),
+							       2, sfn);
+			/* VSYNC, HREF, CLKOUT*/
+			if (!ret)
+				ret = s3c_gpio_cfgrange_nopull(EXYNOS4X12_GPM2(0),
+							       3, sfn);
+			return ret;
+		}
+
 		gpio8 = EXYNOS4210_GPE0(0); /* DATA[0:7] */
 		gpio5 = EXYNOS4210_GPE1(0); /* PCLK, VSYNC, HREF, CLKOUT, FIELD */
 		sfn = S3C_GPIO_SFN(3);
-- 
1.7.12
