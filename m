From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 5/8] S3C2443: Add get_rate operation for clk_armdiv
Date: Wed, 28 Sep 2011 12:21:37 +0200
Message-ID: <201109281221.37568.heiko@sntech.de>
References: <201109281217.33813.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:60195 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752316Ab1I1KVm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Sep 2011 06:21:42 -0400
In-Reply-To: <201109281217.33813.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, heiko@sntech.de

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/plat-s3c24xx/s3c2443-clock.c |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/s3c2443-clock.c b/arch/arm/plat-s3c24xx/s3c2443-clock.c
index f9c5b03..fea3d5c 100644
--- a/arch/arm/plat-s3c24xx/s3c2443-clock.c
+++ b/arch/arm/plat-s3c24xx/s3c2443-clock.c
@@ -189,6 +189,19 @@ static unsigned long s3c2443_armclk_roundrate(struct clk *clk,
 	return parent / best;
 }
 
+static unsigned long s3c2443_armclk_getrate(struct clk *clk)
+{
+	unsigned long rate = clk_get_rate(clk->parent);
+	unsigned long clkcon0;
+	int val;
+
+	clkcon0 = __raw_readl(S3C2443_CLKDIV0);
+	clkcon0 &= armdivmask;
+	val = clkcon0 >> S3C2443_CLKDIV0_ARMDIV_SHIFT;
+
+	return rate / armdiv[val];
+}
+
 static int s3c2443_armclk_setrate(struct clk *clk, unsigned long rate)
 {
 	unsigned long parent = clk_get_rate(clk->parent);
@@ -224,6 +237,7 @@ static struct clk clk_armdiv = {
 	.parent		= &clk_msysclk.clk,
 	.ops		= &(struct clk_ops) {
 		.round_rate = s3c2443_armclk_roundrate,
+		.get_rate = s3c2443_armclk_getrate,
 		.set_rate = s3c2443_armclk_setrate,
 	},
 };
-- 
1.7.5.4
