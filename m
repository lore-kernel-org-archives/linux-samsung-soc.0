From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/5] ARM: EXYNOS4: Add support clock for EXYNOS4412
Date: Thu, 29 Sep 2011 17:12:54 +0900
Message-ID: <009501cc7e7f$96eb6f60$c4c24e20$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39697 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754853Ab1I2INQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Sep 2011 04:13:16 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LS9007J4YS5OI50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Sep 2011 17:12:54 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LS900DDXYTHCQ30@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 29 Sep 2011 17:12:54 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'LAK' <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org
Cc: chaos.youn@samsung.com, 'Kukjin Kim' <kgene.kim@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

This patch makes EXYNOS4412 use same clock code for
EXYNOS4212 because the clock hierarchy of both SoCs
are same.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos4/clock.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index a25c818..db61691 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -1283,7 +1283,7 @@ static unsigned long exynos4_fout_apll_get_rate(struct clk *clk)
 	if (soc_is_exynos4210())
 		return s5p_get_pll45xx(xtal_rate, __raw_readl(S5P_APLL_CON0),
 					pll_4508);
-	else if (soc_is_exynos4212())
+	else if (soc_is_exynos4212() || soc_is_exynos4412())
 		return s5p_get_pll35xx(xtal_rate, __raw_readl(S5P_APLL_CON0));
 	else
 		return 0;
@@ -1399,7 +1399,7 @@ void __init_or_cpufreq exynos4_setup_clocks(void)
 		vpllsrc = clk_get_rate(&clk_vpllsrc.clk);
 		vpll = s5p_get_pll46xx(vpllsrc, __raw_readl(S5P_VPLL_CON0),
 					__raw_readl(S5P_VPLL_CON1), pll_4650c);
-	} else if (soc_is_exynos4212()) {
+	} else if (soc_is_exynos4212() || soc_is_exynos4412()) {
 		apll = s5p_get_pll35xx(xtal, __raw_readl(S5P_APLL_CON0));
 		mpll = s5p_get_pll35xx(xtal, __raw_readl(S5P_MPLL_CON0));
 		epll = s5p_get_pll36xx(xtal, __raw_readl(S5P_EPLL_CON0),
-- 
1.7.1
