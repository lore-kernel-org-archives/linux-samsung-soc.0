From: jhbird.choi@samsung.com
Subject: [PATCH] ARM: EXYNOS4: Fix wrong pll type for vpll
Date: Sat, 20 Aug 2011 10:27:08 +0900
Message-ID: <1313803628-32050-1-git-send-email-jhbird.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:53316 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751156Ab1HTBl2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 21:41:28 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Jonghwan Choi <jhbird.choi@samsung.com>

From: Jonghwan Choi <jhbird.choi@samsung.com>

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 arch/arm/mach-exynos4/clock.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 851dea0..0b39860 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -1160,7 +1160,7 @@ void __init_or_cpufreq exynos4_setup_clocks(void)
 
 	vpllsrc = clk_get_rate(&clk_vpllsrc.clk);
 	vpll = s5p_get_pll46xx(vpllsrc, __raw_readl(S5P_VPLL_CON0),
-				__raw_readl(S5P_VPLL_CON1), pll_4650);
+				__raw_readl(S5P_VPLL_CON1), pll_4650c);
 
 	clk_fout_apll.ops = &exynos4_fout_apll_ops;
 	clk_fout_mpll.rate = mpll;
-- 
1.7.0
