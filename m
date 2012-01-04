From: Heiko =?windows-1252?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 1/4] ARM: SAMSUNG: cleanup of rtc register definitions
Date: Wed, 4 Jan 2012 15:15:44 +0100
Message-ID: <201201041515.45025.heiko@sntech.de>
References: <201112211014.30695.heiko@sntech.de> <201201041512.55126.heiko@sntech.de> <201201041514.57688.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:55074 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755647Ab2ADOP6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jan 2012 09:15:58 -0500
In-Reply-To: <201201041514.57688.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rtc-linux@googlegroups.com

regs-rtc.h uses a mixture of tabs and spaces and also (x<<y)
to format bits. So, before adding new stuff clean up the formatting
and also add spaces to the bit definitions (i.e. (x << y) )

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-samsung/include/plat/regs-rtc.h |   78 ++++++++++---------------
 1 files changed, 32 insertions(+), 46 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/regs-rtc.h b/arch/arm/plat-samsung/include/plat/regs-rtc.h
index 30b7cc1..a7d944f 100644
--- a/arch/arm/plat-samsung/include/plat/regs-rtc.h
+++ b/arch/arm/plat-samsung/include/plat/regs-rtc.h
@@ -18,51 +18,37 @@
 #define S3C2410_INTP_ALM	(1 << 1)
 #define S3C2410_INTP_TIC	(1 << 0)
 
-#define S3C2410_RTCCON	      S3C2410_RTCREG(0x40)
-#define S3C2410_RTCCON_RTCEN  (1<<0)
-#define S3C2410_RTCCON_CLKSEL (1<<1)
-#define S3C2410_RTCCON_CNTSEL (1<<2)
-#define S3C2410_RTCCON_CLKRST (1<<3)
-#define S3C64XX_RTCCON_TICEN  (1<<8)
-
-#define S3C64XX_RTCCON_TICMSK (0xF<<7)
-#define S3C64XX_RTCCON_TICSHT (7)
-
-#define S3C2410_TICNT	      S3C2410_RTCREG(0x44)
-#define S3C2410_TICNT_ENABLE  (1<<7)
-
-#define S3C2410_RTCALM	      S3C2410_RTCREG(0x50)
-#define S3C2410_RTCALM_ALMEN  (1<<6)
-#define S3C2410_RTCALM_YEAREN (1<<5)
-#define S3C2410_RTCALM_MONEN  (1<<4)
-#define S3C2410_RTCALM_DAYEN  (1<<3)
-#define S3C2410_RTCALM_HOUREN (1<<2)
-#define S3C2410_RTCALM_MINEN  (1<<1)
-#define S3C2410_RTCALM_SECEN  (1<<0)
-
-#define S3C2410_RTCALM_ALL \
-  S3C2410_RTCALM_ALMEN | S3C2410_RTCALM_YEAREN | S3C2410_RTCALM_MONEN |\
-  S3C2410_RTCALM_DAYEN | S3C2410_RTCALM_HOUREN | S3C2410_RTCALM_MINEN |\
-  S3C2410_RTCALM_SECEN
-
-
-#define S3C2410_ALMSEC	      S3C2410_RTCREG(0x54)
-#define S3C2410_ALMMIN	      S3C2410_RTCREG(0x58)
-#define S3C2410_ALMHOUR	      S3C2410_RTCREG(0x5c)
-
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
-
+#define S3C2410_RTCCON		S3C2410_RTCREG(0x40)
+#define S3C2410_RTCCON_RTCEN	(1 << 0)
+#define S3C2410_RTCCON_CNTSEL	(1 << 2)
+#define S3C2410_RTCCON_CLKRST	(1 << 3)
+#define S3C64XX_RTCCON_TICEN	(1 << 8)
+
+#define S3C2410_TICNT		S3C2410_RTCREG(0x44)
+#define S3C2410_TICNT_ENABLE	(1 << 7)
+
+#define S3C2410_RTCALM		S3C2410_RTCREG(0x50)
+#define S3C2410_RTCALM_ALMEN	(1 << 6)
+#define S3C2410_RTCALM_YEAREN	(1 << 5)
+#define S3C2410_RTCALM_MONEN	(1 << 4)
+#define S3C2410_RTCALM_DAYEN	(1 << 3)
+#define S3C2410_RTCALM_HOUREN	(1 << 2)
+#define S3C2410_RTCALM_MINEN	(1 << 1)
+#define S3C2410_RTCALM_SECEN	(1 << 0)
+
+#define S3C2410_ALMSEC		S3C2410_RTCREG(0x54)
+#define S3C2410_ALMMIN		S3C2410_RTCREG(0x58)
+#define S3C2410_ALMHOUR		S3C2410_RTCREG(0x5c)
+
+#define S3C2410_ALMDATE		S3C2410_RTCREG(0x60)
+#define S3C2410_ALMMON		S3C2410_RTCREG(0x64)
+#define S3C2410_ALMYEAR		S3C2410_RTCREG(0x68)
+
+#define S3C2410_RTCSEC		S3C2410_RTCREG(0x70)
+#define S3C2410_RTCMIN		S3C2410_RTCREG(0x74)
+#define S3C2410_RTCHOUR		S3C2410_RTCREG(0x78)
+#define S3C2410_RTCDATE		S3C2410_RTCREG(0x7c)
+#define S3C2410_RTCMON		S3C2410_RTCREG(0x84)
+#define S3C2410_RTCYEAR		S3C2410_RTCREG(0x88)
 
 #endif /* __ASM_ARCH_REGS_RTC_H */
-- 
1.7.5.4
