From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5PC100: Bug fix EPLL_CON MASK settings
Date: Tue, 28 Sep 2010 18:23:24 +0900
Message-ID: <1285665804-8922-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:48413 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753813Ab0I1JlY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Sep 2010 05:41:24 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Seungwhan Youn <sw.youn@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Seungwhan Youn <sw.youn@samsung.com>

This patch fixes EPLL_CON MASK settings which did not contain its
shift values when set epll rate on S5PC100.

Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pc100/clock.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pc100/clock.c b/arch/arm/mach-s5pc100/clock.c
index 084abd1..ff125b4 100644
--- a/arch/arm/mach-s5pc100/clock.c
+++ b/arch/arm/mach-s5pc100/clock.c
@@ -323,7 +323,9 @@ static int s5pc100_epll_set_rate(struct clk *clk, unsigned long rate)
 
 	epll_con = __raw_readl(S5P_EPLL_CON);
 
-	epll_con &= ~(PLL65XX_MDIV_MASK | PLL65XX_PDIV_MASK | PLL65XX_SDIV_MASK);
+	epll_con &= ~((PLL65XX_MDIV_MASK << PLL65XX_MDIV_SHIFT) |
+		      (PLL65XX_PDIV_MASK << PLL65XX_PDIV_SHIFT) |
+		      (PLL65XX_SDIV_MASK << PLL65XX_SDIV_SHIFT));
 
 	for (i = 0; i < ARRAY_SIZE(epll_div); i++) {
 		if (epll_div[i][0] == rate) {
-- 
1.6.2.5
