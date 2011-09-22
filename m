From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH] S3C2443: Fix bit-reset in setrate of clk_armdiv
Date: Thu, 22 Sep 2011 23:08:59 +0200
Message-ID: <201109222309.00068.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:34285 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753098Ab1IVVJL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Sep 2011 17:09:11 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

The changed statement should set the old armdiv bits to 0
and not everything else, before setting the new value.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-s3c2443/clock.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c2443/clock.c b/arch/arm/mach-s3c2443/clock.c
index 966bde5..27549c4 100644
--- a/arch/arm/mach-s3c2443/clock.c
+++ b/arch/arm/mach-s3c2443/clock.c
@@ -124,7 +124,7 @@ static int s3c2443_armclk_setrate(struct clk *clk, unsigned long rate)
 		unsigned long clkcon0;
 
 		clkcon0 = __raw_readl(S3C2443_CLKDIV0);
-		clkcon0 &= S3C2443_CLKDIV0_ARMDIV_MASK;
+		clkcon0 &= ~S3C2443_CLKDIV0_ARMDIV_MASK;
 		clkcon0 |= val << S3C2443_CLKDIV0_ARMDIV_SHIFT;
 		__raw_writel(clkcon0, S3C2443_CLKDIV0);
 	}
-- 
1.7.2.3
