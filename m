From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v3 05/12] clocksource: samsung-time: Use local register definitions
Date: Sat,  9 Mar 2013 21:23:14 +0100
Message-ID: <1362860601-18464-6-git-send-email-tomasz.figa@gmail.com>
References: <1362860601-18464-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:51220 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751519Ab3CIUXs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 Mar 2013 15:23:48 -0500
Received: by mail-we0-f173.google.com with SMTP id x51so2199833wey.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Mar 2013 12:23:47 -0800 (PST)
In-Reply-To: <1362860601-18464-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, Mark Rutland <mark.rutland@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Rob Herring <robherring2@gmail.com>

This patch copies PWM timer register definitions to samsung-time.c. The
original header in plat is being kept for now, since it is also used by
other code that also needs to be reworked to be multiplatform-friendly.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/clocksource/samsung-time.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/samsung-time.c b/drivers/clocksource/samsung-time.c
index 03955fb..259ce25 100644
--- a/drivers/clocksource/samsung-time.c
+++ b/drivers/clocksource/samsung-time.c
@@ -26,7 +26,41 @@
 
 #include <mach/map.h>
 #include <plat/devs.h>
-#include <plat/regs-timer.h>
+
+#define S3C_TIMERREG(x) (S3C_VA_TIMER + (x))
+#define S3C_TIMERREG2(tmr,reg) S3C_TIMERREG((reg)+0x0c+((tmr)*0x0c))
+
+#define S3C2410_TCON	      S3C_TIMERREG(0x08)
+#define S3C64XX_TINT_CSTAT    S3C_TIMERREG(0x44)
+
+/* for each timer, we have an count buffer, an compare buffer and
+ * an observation buffer
+*/
+
+/* WARNING - timer 4 has no buffer reg, and it's observation is at +4 */
+
+#define S3C2410_TCNTB(tmr)    S3C_TIMERREG2(tmr, 0x00)
+#define S3C2410_TCMPB(tmr)    S3C_TIMERREG2(tmr, 0x04)
+
+#define S3C2410_TCON_T4RELOAD	  (1<<22)
+#define S3C2410_TCON_T4MANUALUPD  (1<<21)
+#define S3C2410_TCON_T4START	  (1<<20)
+
+#define S3C2410_TCON_T3RELOAD	  (1<<19)
+#define S3C2410_TCON_T3MANUALUPD  (1<<17)
+#define S3C2410_TCON_T3START	  (1<<16)
+
+#define S3C2410_TCON_T2RELOAD	  (1<<15)
+#define S3C2410_TCON_T2MANUALUPD  (1<<13)
+#define S3C2410_TCON_T2START	  (1<<12)
+
+#define S3C2410_TCON_T1RELOAD	  (1<<11)
+#define S3C2410_TCON_T1MANUALUPD  (1<<9)
+#define S3C2410_TCON_T1START	  (1<<8)
+
+#define S3C2410_TCON_T0RELOAD	  (1<<3)
+#define S3C2410_TCON_T0MANUALUPD  (1<<1)
+#define S3C2410_TCON_T0START	  (1<<0)
 
 static struct clk *tin_event;
 static struct clk *tin_source;
-- 
1.8.1.5
