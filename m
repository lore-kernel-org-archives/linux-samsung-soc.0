From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: skip the clock initialization for exynos5440
Date: Mon, 31 Dec 2012 15:33:58 -0800
Message-ID: <1356996838-21796-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20336 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750774Ab2LaXeM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Dec 2012 18:34:12 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFX00C4R5GZSC10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 01 Jan 2013 08:34:11 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFX0074X5GSZ470@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 01 Jan 2013 08:34:10 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

Since exynos5440 can support only common clk stuff, so this
patch skips legacy exynos5 clock initialization.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/common.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index d6d0dc6..1a89824 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -424,11 +424,18 @@ static void __init exynos5_init_clocks(int xtal)
 {
 	printk(KERN_DEBUG "%s: initializing clocks\n", __func__);
 
+	/* EXYNOS5440 can support only common clock framework */
+
+	if (soc_is_exynos5440())
+		return;
+
+#ifdef CONFIG_SOC_EXYNOS5250
 	s3c24xx_register_baseclocks(xtal);
 	s5p_register_clocks(xtal);
 
 	exynos5_register_clocks();
 	exynos5_setup_clocks();
+#endif
 }
 
 #define COMBINER_ENABLE_SET	0x0
-- 
1.7.10.4
