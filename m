From: jhbird.choi@gmail.com
Subject: [PATCH] ARM: SAMSUNG: Should check for IS_ERR(clk) instead of NULL
Date: Wed, 18 Apr 2012 00:08:54 -0400
Message-ID: <1334722134-14545-1-git-send-email-jhbird.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:54510 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769Ab2DREJC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Apr 2012 00:09:02 -0400
Received: by mail-pb0-f46.google.com with SMTP id un15so8430945pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Apr 2012 21:09:02 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Jonghwan Choi <jhbird.choi@samsung.com>

From: Jonghwan Choi <jhbird.choi@samsung.com>

On the error condition clk_get() returns ERR_PTR().

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 .../arm/plat-samsung/include/plat/watchdog-reset.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/watchdog-reset.h b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
index f19aff1..bc4db9b 100644
--- a/arch/arm/plat-samsung/include/plat/watchdog-reset.h
+++ b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
@@ -25,7 +25,7 @@ static inline void arch_wdt_reset(void)
 
 	__raw_writel(0, S3C2410_WTCON);	  /* disable watchdog, to be safe  */
 
-	if (s3c2410_wdtclk)
+	if (!IS_ERR(s3c2410_wdtclk))
 		clk_enable(s3c2410_wdtclk);
 
 	/* put initial values into count and data */
-- 
1.7.0.4
