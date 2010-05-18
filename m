From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/8] ARM: SAMSUNG: Add S3C64XX RTC register definitions
Date: Tue, 18 May 2010 14:59:15 +0900
Message-ID: <1274162355-1876-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:51604 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754961Ab0ERGCY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 May 2010 02:02:24 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Taekgyun Ko <taeggyun.ko@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Taekgyun Ko <taeggyun.ko@samsung.com>

This patch adds S3C64XX RTC register definitions.

Signed-off-by: Taekgyun Ko <taeggyun.ko@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-samsung/include/plat/regs-rtc.h |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/regs-rtc.h b/arch/arm/plat-samsung/include/plat/regs-rtc.h
index 5b547ce..82c3aab 100644
--- a/arch/arm/plat-samsung/include/plat/regs-rtc.h
+++ b/arch/arm/plat-samsung/include/plat/regs-rtc.h
@@ -1,5 +1,8 @@
 /* arch/arm/mach-s3c2410/include/mach/regs-rtc.h
  *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
  * Copyright (c) 2003 Simtec Electronics <linux@simtec.co.uk>
  *		      http://www.simtec.co.uk/products/SWLINUX/
  *
@@ -15,11 +18,16 @@
 
 #define S3C2410_RTCREG(x)	(x)
 
+#define S3C64XX_INTP		S3C2410_RTCREG(0x30)
+#define S3C64XX_INTP_TIC	(1 << 0)
+#define S3C64XX_INTP_ALM	(1 << 1)
+
 #define S3C2410_RTCCON		S3C2410_RTCREG(0x40)
 #define S3C2410_RTCCON_RTCEN	(1 << 0)
 #define S3C2410_RTCCON_CLKSEL	(1 << 1)
 #define S3C2410_RTCCON_CNTSEL	(1 << 2)
 #define S3C2410_RTCCON_CLKRST	(1 << 3)
+#define S3C64XX_RTCCON_TICEN	(1 << 8)
 
 #define S3C2410_TICNT		S3C2410_RTCREG(0x44)
 #define S3C2410_TICNT_ENABLE	(1 << 7)
-- 
1.6.2.5
