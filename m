From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: Exynos4: don't change sclk_audio0 parent in core clocks
 code
Date: Mon, 27 Jun 2011 09:25:19 +0200
Message-ID: <1309159519-27412-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:9201 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756986Ab1F0HZg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jun 2011 03:25:36 -0400
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LNF00C51TYMCD@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Jun 2011 08:25:34 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LNF0057XTYKRD@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Jun 2011 08:25:33 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Core clock API code should not change parent clocks set initially by
the boot-loader. This patch removes implicit sclk_audio0 clock change
introduced in commit "ARM: EXYNOS4: Add PCM audio support for WM8994"
(09c60e8). If SMDK board needs such change it should be done in respective
board startup code or preferably in the boot-loader.

This patch fixes problems with suspend/resume on Samsung NURI board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-exynos4/clock.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 5091e13..6146c6e 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -1287,7 +1287,6 @@ void __init_or_cpufreq exynos4_setup_clocks(void)
 		s3c_set_clksrc(&clksrcs[ptr], true);
 
 	clk_audiocdclk0.rate = PCM_EXTCLK0;
-	clk_set_parent(&clk_sclk_audio0.clk, &clk_audiocdclk0);
 }
 
 static struct clk *clks[] __initdata = {
-- 
1.7.1.569.g6f426
