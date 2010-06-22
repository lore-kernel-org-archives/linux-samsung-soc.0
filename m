From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P6442: Fix PLL setting announce message.
Date: Tue, 22 Jun 2010 10:05:59 +0900
Message-ID: <1277168759-4599-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:47291 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752095Ab0FVBKy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jun 2010 21:10:54 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas@localhost.localdomain>, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas@localhost.localdomain>

The S5P6442 PLL setting announce message incorrectly displays S5P6440
as the SoC. Change it to S5P6442.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6442/clock.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5p6442/clock.c b/arch/arm/mach-s5p6442/clock.c
index 3aadbf4..087e57f 100644
--- a/arch/arm/mach-s5p6442/clock.c
+++ b/arch/arm/mach-s5p6442/clock.c
@@ -294,7 +294,7 @@ void __init_or_cpufreq s5p6442_setup_clocks(void)
 	mpll = s5p_get_pll45xx(xtal, __raw_readl(S5P_MPLL_CON), pll_4502);
 	epll = s5p_get_pll45xx(xtal, __raw_readl(S5P_EPLL_CON), pll_4500);
 
-	printk(KERN_INFO "S5P6440: PLL settings, A=%ld, M=%ld, E=%ld",
+	printk(KERN_INFO "S5P6442: PLL settings, A=%ld, M=%ld, E=%ld",
 			apll, mpll, epll);
 
 	clk_fout_apll.rate = apll;
-- 
1.6.6.rc2
