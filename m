From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 1/6] ARM: S3C2443: Use common clock gate code
Date: Sat, 30 Jan 2010 15:11:28 +0200
Message-ID: <1264857093-4040-2-git-send-email-ben-linux@fluff.org>
References: <1264857093-4040-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [82.203.205.227] ([82.203.205.227]:49389 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752888Ab0A3NXh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Jan 2010 08:23:37 -0500
In-Reply-To: <1264857093-4040-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Add common clock gate code for each of the S3C2443 clock gate code. Whether
to move this elsewhere will be decided later.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2443/clock.c |   48 +++++++++++-----------------------------
 1 files changed, 13 insertions(+), 35 deletions(-)

diff --git a/arch/arm/mach-s3c2443/clock.c b/arch/arm/mach-s3c2443/clock.c
index 3eb8b93..5d061ea 100644
--- a/arch/arm/mach-s3c2443/clock.c
+++ b/arch/arm/mach-s3c2443/clock.c
@@ -53,55 +53,33 @@
  * set the correct muxing at initialisation
 */
 
-static int s3c2443_clkcon_enable_h(struct clk *clk, int enable)
+static int s3c2443_gate(void __iomem *reg, struct clk *clk, int enable)
 {
-	unsigned int clocks = clk->ctrlbit;
-	unsigned long clkcon;
-
-	clkcon = __raw_readl(S3C2443_HCLKCON);
+	u32 ctrlbit = clk->ctrlbit;
+	u32 con = __raw_readl(reg);
 
 	if (enable)
-		clkcon |= clocks;
+		con |= ctrlbit;
 	else
-		clkcon &= ~clocks;
-
-	__raw_writel(clkcon, S3C2443_HCLKCON);
+		con &= ~ctrlbit;
 
+	__raw_writel(con, reg);
 	return 0;
 }
 
-static int s3c2443_clkcon_enable_p(struct clk *clk, int enable)
+static int s3c2443_clkcon_enable_h(struct clk *clk, int enable)
 {
-	unsigned int clocks = clk->ctrlbit;
-	unsigned long clkcon;
-
-	clkcon = __raw_readl(S3C2443_PCLKCON);
-
-	if (enable)
-		clkcon |= clocks;
-	else
-		clkcon &= ~clocks;
-
-	__raw_writel(clkcon, S3C2443_PCLKCON);
+	return s3c2443_gate(S3C2443_HCLKCON, clk, enable);
+}
 
-	return 0;
+static int s3c2443_clkcon_enable_p(struct clk *clk, int enable)
+{
+	return s3c2443_gate(S3C2443_PCLKCON, clk, enable);
 }
 
 static int s3c2443_clkcon_enable_s(struct clk *clk, int enable)
 {
-	unsigned int clocks = clk->ctrlbit;
-	unsigned long clkcon;
-
-	clkcon = __raw_readl(S3C2443_SCLKCON);
-
-	if (enable)
-		clkcon |= clocks;
-	else
-		clkcon &= ~clocks;
-
-	__raw_writel(clkcon, S3C2443_SCLKCON);
-
-	return 0;
+	return s3c2443_gate(S3C2443_SCLKCON, clk, enable);
 }
 
 static unsigned long s3c2443_roundrate_clksrc(struct clk *clk,
-- 
1.6.3.3
