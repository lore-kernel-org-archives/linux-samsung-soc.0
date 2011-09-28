From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 1/8] S3C2416: Add armdiv_mask constant
Date: Wed, 28 Sep 2011 12:18:53 +0200
Message-ID: <201109281218.53972.heiko@sntech.de>
References: <201109281217.33813.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:59874 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751833Ab1I1KS7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Sep 2011 06:18:59 -0400
In-Reply-To: <201109281217.33813.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, heiko@sntech.de

The S3C2416/2450 has only 3 bits for the armdiv setting instead
of the 4 bits of the S3C2443.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../mach-s3c2410/include/mach/regs-s3c2443-clock.h |    1 +
 arch/arm/mach-s3c2416/clock.c                      |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h b/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
index df6434f..c3feff3 100644
--- a/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
+++ b/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
@@ -65,6 +65,7 @@
 #define S3C2443_CLKDIV0_PREDIV_MASK	(3<<4)
 #define S3C2443_CLKDIV0_PREDIV_SHIFT	(4)
 
+#define S3C2416_CLKDIV0_ARMDIV_MASK	(7 << 9)
 #define S3C2443_CLKDIV0_ARMDIV_MASK	(15<<9)
 #define S3C2443_CLKDIV0_ARMDIV_SHIFT	(9)
 #define S3C2443_CLKDIV0_ARMDIV_1	(0<<9)
diff --git a/arch/arm/mach-s3c2416/clock.c b/arch/arm/mach-s3c2416/clock.c
index 72b7c62..5569def 100644
--- a/arch/arm/mach-s3c2416/clock.c
+++ b/arch/arm/mach-s3c2416/clock.c
@@ -127,7 +127,7 @@ static struct clk hsmmc0_clk = {
 
 static inline unsigned int s3c2416_fclk_div(unsigned long clkcon0)
 {
-	clkcon0 &= 7 << S3C2443_CLKDIV0_ARMDIV_SHIFT;
+	clkcon0 &= S3C2416_CLKDIV0_ARMDIV_MASK;
 
 	return armdiv[clkcon0 >> S3C2443_CLKDIV0_ARMDIV_SHIFT];
 }
-- 
1.7.5.4
