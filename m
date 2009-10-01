From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] S3C64xx: Fix S3C6400_EPLL_ MDIV_MASK, PDIV_MASK, and SDIV_MASK value
Date: Thu,  1 Oct 2009 18:22:48 +0900
Message-ID: <1254388968-28146-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38404 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754371AbZJAJXr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Oct 2009 05:23:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

Fix the values of S3C6400_EPLL_MDIV_MASK, S3C6400_EPLL_PDIV_MASK, and
S3C6400_EPLL_SDIV_MASK.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s3c64xx/include/plat/pll.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/plat-s3c64xx/include/plat/pll.h b/arch/arm/plat-s3c64xx/include/plat/pll.h
index 90bbd72..3a59d3b 100644
--- a/arch/arm/plat-s3c64xx/include/plat/pll.h
+++ b/arch/arm/plat-s3c64xx/include/plat/pll.h
@@ -37,9 +37,9 @@ static inline unsigned long s3c6400_get_pll(unsigned long baseclk,
 	return (unsigned long)fvco;
 }
 
-#define S3C6400_EPLL_MDIV_MASK	((1 << (23-16)) - 1)
-#define S3C6400_EPLL_PDIV_MASK	((1 << (13-8)) - 1)
-#define S3C6400_EPLL_SDIV_MASK	((1 << (2-0)) - 1)
+#define S3C6400_EPLL_MDIV_MASK	((1 << (23-16+1)) - 1)
+#define S3C6400_EPLL_PDIV_MASK	((1 << (13-8+1)) - 1)
+#define S3C6400_EPLL_SDIV_MASK	((1 << (2-0+1)) - 1)
 #define S3C6400_EPLL_MDIV_SHIFT	(16)
 #define S3C6400_EPLL_PDIV_SHIFT	(8)
 #define S3C6400_EPLL_SDIV_SHIFT	(0)
-- 
1.5.3.4

