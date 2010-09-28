From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P: Remove the unused clk_arm clock from plat-s5p
Date: Tue, 28 Sep 2010 14:48:43 +0900
Message-ID: <1285652923-28502-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:57965 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758100Ab0I1GGW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Sep 2010 02:06:22 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

All the S5P series SoCs use the 'struct clksrc_clk' type to represent the
armclk. So the clk_arm clock instance available in the plat-s5p clock code
is not used in any of the S5P series SoCs.
This patch removes the unused clk_arm instance from plat-s5p clock code.

Reported-by: Jaecheol Lee <jc.lee@samsung.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s5p/clock.c |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/arch/arm/plat-s5p/clock.c b/arch/arm/plat-s5p/clock.c
index 8aaf4e6..8188009 100644
--- a/arch/arm/plat-s5p/clock.c
+++ b/arch/arm/plat-s5p/clock.c
@@ -88,14 +88,6 @@ struct clk clk_fout_vpll = {
 	.ctrlbit	= (1 << 31),
 };
 
-/* ARM clock */
-struct clk clk_arm = {
-	.name		= "armclk",
-	.id		= -1,
-	.rate		= 0,
-	.ctrlbit	= 0,
-};
-
 /* Possible clock sources for APLL Mux */
 static struct clk *clk_src_apll_list[] = {
 	[0] = &clk_fin_apll,
@@ -165,7 +157,6 @@ static struct clk *s5p_clks[] __initdata = {
 	&clk_fout_epll,
 	&clk_fout_dpll,
 	&clk_fout_vpll,
-	&clk_arm,
 	&clk_vpll,
 	&clk_xusbxti,
 };
-- 
1.6.2.5
