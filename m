From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v7 3/6] ARM: S5P: Added default pll values for APLL 800/1000MHz
Date: Tue, 10 Aug 2010 14:44:06 +0900
Message-ID: <1281419049-11562-4-git-send-email-myungjoo.ham@samsung.com>
References: <1281419049-11562-1-git-send-email-myungjoo.ham@samsung.com>
 <1281419049-11562-2-git-send-email-myungjoo.ham@samsung.com>
 <1281419049-11562-3-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10661 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752197Ab0HJFoV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Aug 2010 01:44:21 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6X00DTG99M9Q90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Aug 2010 14:44:10 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6X001UW99MYP@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Aug 2010 14:44:10 +0900 (KST)
In-reply-to: <1281419049-11562-3-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

CPUFREQ of S5PV210 uses different APLL settings according to
different CPU frequencies. We provide such settings values for
CPUFREQ at pll.h.

Note that at 1GHz of ARMCLK, APLL should be 1GHz and for other lower
ARMCLK, APLL should be 800MHz.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
--
v6
	- Style correction

---
 arch/arm/plat-s5p/include/plat/pll.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/include/plat/pll.h b/arch/arm/plat-s5p/include/plat/pll.h
index 7db3227..d5ee48c 100644
--- a/arch/arm/plat-s5p/include/plat/pll.h
+++ b/arch/arm/plat-s5p/include/plat/pll.h
@@ -21,6 +21,9 @@
 
 #include <asm/div64.h>
 
+#define PLL45XX_APLL_VAL_1000	((1 << 31) | (125 << 16) | (3 << 8) | (1))
+#define PLL45XX_APLL_VAL_800	((1 << 31) | (100 << 16) | (3 << 8) | (1))
+
 enum pll45xx_type_t {
 	pll_4500,
 	pll_4502,
-- 
1.6.3.3
