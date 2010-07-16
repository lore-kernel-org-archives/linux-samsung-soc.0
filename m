From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v2 2/5] ARM: S5P: Added default pll values for APLL 800/1000MHz
Date: Fri, 16 Jul 2010 17:01:14 +0900
Message-ID: <1279267277-6804-3-git-send-email-myungjoo.ham@samsung.com>
References: <1279267277-6804-1-git-send-email-myungjoo.ham@samsung.com>
 <1279267277-6804-2-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18235 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935877Ab0GPIBj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jul 2010 04:01:39 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5N00MTV4Y5R670@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Jul 2010 17:01:18 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5N00EHU4Y5Z5@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Jul 2010 17:01:17 +0900 (KST)
In-reply-to: <1279267277-6804-2-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

CPUFREQ of S5PV210 uses different APLL settings and we provide
such values for CPUFREQ at pll.h. We have been using differently
between EVT0 and EVT1 machines. Although this version of kernel
assumes that the CPU is EVT1, users may use code for EVT0 later.

Note that at 1GHz of ARMCLK, APLL should be 1GHz and for other lower
ARMCLK, APLL should be 800MHz.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-s5p/include/plat/pll.h |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/include/plat/pll.h b/arch/arm/plat-s5p/include/plat/pll.h
index 7db3227..3112aba 100644
--- a/arch/arm/plat-s5p/include/plat/pll.h
+++ b/arch/arm/plat-s5p/include/plat/pll.h
@@ -21,6 +21,14 @@
 
 #include <asm/div64.h>
 
+#ifdef CONFIG_CPU_S5PC110_EVT0_ERRATA
+#define PLL45XX_APLL_VAL_1000	(1 << 31) | (0xfa<<16) | (0x6<<8) | (0x1)
+#define PLL45XX_APLL_VAL_800	(1 << 31) | (0xc8<<16) | (0x6<<8) | (0x1)
+#else
+#define PLL45XX_APLL_VAL_1000	(1 << 31) | (125<<16) | (3<<8) | (1)
+#define PLL45XX_APLL_VAL_800	(1 << 31) | (100<<16) | (3<<8) | (1)
+#endif
+
 enum pll45xx_type_t {
 	pll_4500,
 	pll_4502,
-- 
1.6.3.3
