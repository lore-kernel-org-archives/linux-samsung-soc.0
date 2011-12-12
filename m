From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 1/4] ARM: SAMSUNG: cleanup of rtc register definitions
Date: Mon, 12 Dec 2011 15:45:14 +0100
Message-ID: <201112121545.15211.heiko@sntech.de>
References: <201112121543.42299.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:58746 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753193Ab1LLOpj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Dec 2011 09:45:39 -0500
In-Reply-To: <201112121543.42299.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it
Cc: rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

regs-rtc.h uses a mixture of tabs and spaces and also (x<<y)
to format bits. So, before adding new stuff clean up the formatting
and also add spaces to the bit definitions (i.e. (x << y) )

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/plat-samsung/include/plat/regs-rtc.h |   66 ++++++++++++-------------
 1 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/regs-rtc.h b/arch/arm/plat-samsung/include/plat/regs-rtc.h
index 30b7cc1..d9d9bdc 100644
--- a/arch/arm/plat-samsung/include/plat/regs-rtc.h
+++ b/arch/arm/plat-samsung/include/plat/regs-rtc.h
@@ -18,51 +18,49 @@
 #define S3C2410_INTP_ALM	(1 << 1)
 #define S3C2410_INTP_TIC	(1 << 0)
 
-#define S3C2410_RTCCON	      S3C2410_RTCREG(0x40)
-#define S3C2410_RTCCON_RTCEN  (1<<0)
-#define S3C2410_RTCCON_CLKSEL (1<<1)
-#define S3C2410_RTCCON_CNTSEL (1<<2)
-#define S3C2410_RTCCON_CLKRST (1<<3)
-#define S3C64XX_RTCCON_TICEN  (1<<8)
+#define S3C2410_RTCCON		S3C2410_RTCREG(0x40)
+#define S3C2410_RTCCON_RTCEN	(1 << 0)
+#define S3C2410_RTCCON_CLKSEL	(1 << 1)
+#define S3C2410_RTCCON_CNTSEL	(1 << 2)
+#define S3C2410_RTCCON_CLKRST	(1 << 3)
+#define S3C64XX_RTCCON_TICEN	(1 << 8)
 
-#define S3C64XX_RTCCON_TICMSK (0xF<<7)
-#define S3C64XX_RTCCON_TICSHT (7)
+#define S3C64XX_RTCCON_TICMSK	(0xF << 7)
+#define S3C64XX_RTCCON_TICSHT	(7)
 
-#define S3C2410_TICNT	      S3C2410_RTCREG(0x44)
-#define S3C2410_TICNT_ENABLE  (1<<7)
+#define S3C2410_TICNT		S3C2410_RTCREG(0x44)
+#define S3C2410_TICNT_ENABLE	(1 << 7)
 
-#define S3C2410_RTCALM	      S3C2410_RTCREG(0x50)
-#define S3C2410_RTCALM_ALMEN  (1<<6)
-#define S3C2410_RTCALM_YEAREN (1<<5)
-#define S3C2410_RTCALM_MONEN  (1<<4)
-#define S3C2410_RTCALM_DAYEN  (1<<3)
-#define S3C2410_RTCALM_HOUREN (1<<2)
-#define S3C2410_RTCALM_MINEN  (1<<1)
-#define S3C2410_RTCALM_SECEN  (1<<0)
+#define S3C2410_RTCALM		S3C2410_RTCREG(0x50)
+#define S3C2410_RTCALM_ALMEN	(1 << 6)
+#define S3C2410_RTCALM_YEAREN	(1 << 5)
+#define S3C2410_RTCALM_MONEN	(1 << 4)
+#define S3C2410_RTCALM_DAYEN	(1 << 3)
+#define S3C2410_RTCALM_HOUREN	(1 << 2)
+#define S3C2410_RTCALM_MINEN	(1 << 1)
+#define S3C2410_RTCALM_SECEN	(1 << 0)
 
 #define S3C2410_RTCALM_ALL \
   S3C2410_RTCALM_ALMEN | S3C2410_RTCALM_YEAREN | S3C2410_RTCALM_MONEN |\
   S3C2410_RTCALM_DAYEN | S3C2410_RTCALM_HOUREN | S3C2410_RTCALM_MINEN |\
   S3C2410_RTCALM_SECEN
 
+#define S3C2410_ALMSEC		S3C2410_RTCREG(0x54)
+#define S3C2410_ALMMIN		S3C2410_RTCREG(0x58)
+#define S3C2410_ALMHOUR		S3C2410_RTCREG(0x5c)
 
-#define S3C2410_ALMSEC	      S3C2410_RTCREG(0x54)
-#define S3C2410_ALMMIN	      S3C2410_RTCREG(0x58)
-#define S3C2410_ALMHOUR	      S3C2410_RTCREG(0x5c)
+#define S3C2410_ALMDATE		S3C2410_RTCREG(0x60)
+#define S3C2410_ALMMON		S3C2410_RTCREG(0x64)
+#define S3C2410_ALMYEAR		S3C2410_RTCREG(0x68)
 
-#define S3C2410_ALMDATE	      S3C2410_RTCREG(0x60)
-#define S3C2410_ALMMON	      S3C2410_RTCREG(0x64)
-#define S3C2410_ALMYEAR	      S3C2410_RTCREG(0x68)
-
-#define S3C2410_RTCRST	      S3C2410_RTCREG(0x6c)
-
-#define S3C2410_RTCSEC	      S3C2410_RTCREG(0x70)
-#define S3C2410_RTCMIN	      S3C2410_RTCREG(0x74)
-#define S3C2410_RTCHOUR	      S3C2410_RTCREG(0x78)
-#define S3C2410_RTCDATE	      S3C2410_RTCREG(0x7c)
-#define S3C2410_RTCDAY	      S3C2410_RTCREG(0x80)
-#define S3C2410_RTCMON	      S3C2410_RTCREG(0x84)
-#define S3C2410_RTCYEAR	      S3C2410_RTCREG(0x88)
+#define S3C2410_RTCRST		S3C2410_RTCREG(0x6c)
 
+#define S3C2410_RTCSEC		S3C2410_RTCREG(0x70)
+#define S3C2410_RTCMIN		S3C2410_RTCREG(0x74)
+#define S3C2410_RTCHOUR		S3C2410_RTCREG(0x78)
+#define S3C2410_RTCDATE		S3C2410_RTCREG(0x7c)
+#define S3C2410_RTCDAY		S3C2410_RTCREG(0x80)
+#define S3C2410_RTCMON		S3C2410_RTCREG(0x84)
+#define S3C2410_RTCYEAR		S3C2410_RTCREG(0x88)
 
 #endif /* __ASM_ARCH_REGS_RTC_H */
-- 
1.7.5.4
