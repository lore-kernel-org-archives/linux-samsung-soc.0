From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5PV310: Fix clkset_moutcore_list
Date: Sat, 18 Sep 2010 11:42:45 +0900
Message-ID: <1284777765-23223-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:36171 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753948Ab0IRC7J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Sep 2010 22:59:09 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Jaecheol Lee <jc.lee@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Jaecheol Lee <jc.lee@samsung.com>

This patch fixes source clocks of moutcore.
That should be clk_mout_apll instead of clk_sclk_apll.

Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv310/clock.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pv310/clock.c b/arch/arm/mach-s5pv310/clock.c
index 262a46f..32146db 100644
--- a/arch/arm/mach-s5pv310/clock.c
+++ b/arch/arm/mach-s5pv310/clock.c
@@ -155,7 +155,7 @@ static struct clksrc_clk clk_mout_mpll = {
 };
 
 static struct clk *clkset_moutcore_list[] = {
-	[0] = &clk_sclk_apll.clk,
+	[0] = &clk_mout_apll.clk,
 	[1] = &clk_mout_mpll.clk,
 };
 
-- 
1.6.2.5
