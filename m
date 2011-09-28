From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 6/8] S3C2443: handle unset armdiv values gracefully
Date: Wed, 28 Sep 2011 12:22:16 +0200
Message-ID: <201109281222.17432.heiko@sntech.de>
References: <201109281217.33813.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:43794 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752242Ab1I1KWW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Sep 2011 06:22:22 -0400
In-Reply-To: <201109281217.33813.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, heiko@sntech.de

The armdiv array may contain unset divider values. Check the
relevant value to prevent division by zero errors.
Also check for set nr_armdiv and armdivmask before
meddling with clkdiv0.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/plat-s3c24xx/s3c2443-clock.c |   27 ++++++++++++++++++++-------
 1 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/s3c2443-clock.c b/arch/arm/plat-s3c24xx/s3c2443-clock.c
index fea3d5c..31f97f1 100644
--- a/arch/arm/plat-s3c24xx/s3c2443-clock.c
+++ b/arch/arm/plat-s3c24xx/s3c2443-clock.c
@@ -179,11 +179,16 @@ static unsigned long s3c2443_armclk_roundrate(struct clk *clk,
 	unsigned div;
 	int ptr;
 
+	if (!nr_armdiv)
+		return -EINVAL;
+
 	for (ptr = 0; ptr < nr_armdiv; ptr++) {
 		div = armdiv[ptr];
-		calc = parent / div;
-		if (calc <= rate && div < best)
-			best = div;
+		if (div) {
+			calc = parent / div;
+			if (calc <= rate && div < best)
+				best = div;
+		}
 	}
 
 	return parent / best;
@@ -195,6 +200,9 @@ static unsigned long s3c2443_armclk_getrate(struct clk *clk)
 	unsigned long clkcon0;
 	int val;
 
+	if (!nr_armdiv || !armdivmask)
+		return -EINVAL;
+
 	clkcon0 = __raw_readl(S3C2443_CLKDIV0);
 	clkcon0 &= armdivmask;
 	val = clkcon0 >> S3C2443_CLKDIV0_ARMDIV_SHIFT;
@@ -211,12 +219,17 @@ static int s3c2443_armclk_setrate(struct clk *clk, unsigned long rate)
 	int ptr;
 	int val = -1;
 
+	if (!nr_armdiv || !armdivmask)
+		return -EINVAL;
+
 	for (ptr = 0; ptr < nr_armdiv; ptr++) {
 		div = armdiv[ptr];
-		calc = parent / div;
-		if (calc <= rate && div < best) {
-			best = div;
-			val = ptr;
+		if (div) {
+			calc = parent / div;
+			if (calc <= rate && div < best) {
+				best = div;
+				val = ptr;
+			}
 		}
 	}
 
-- 
1.7.5.4
