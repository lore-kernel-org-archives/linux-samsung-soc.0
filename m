From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v2 05/12] clocksource: samsung-time: Use local register definitions
Date: Sat, 16 Feb 2013 17:43:57 +0100
Message-ID: <1361033044-27629-6-git-send-email-tomasz.figa@gmail.com>
References: <1361033044-27629-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f169.google.com ([209.85.215.169]:43746 "EHLO
	mail-ea0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753669Ab3BPQo7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Feb 2013 11:44:59 -0500
Received: by mail-ea0-f169.google.com with SMTP id d13so1882932eaa.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 16 Feb 2013 08:44:58 -0800 (PST)
In-Reply-To: <1361033044-27629-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, Mark Rutland <mark.rutland@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>

This patch copies PWM timer register definitions to samsung-time.c. The
original header in plat is being kept for now, since it is also used by
other code that also needs to be reworked to be multiplatform-friendly.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/clocksource/samsung-time.c | 106 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/samsung-time.c b/drivers/clocksource/samsung-time.c
index 66bd695..670f3c6 100644
--- a/drivers/clocksource/samsung-time.c
+++ b/drivers/clocksource/samsung-time.c
@@ -26,7 +26,111 @@
 
 #include <mach/map.h>
 #include <plat/devs.h>
-#include <plat/regs-timer.h>
+
+#define S3C_TIMERREG(x) (S3C_VA_TIMER + (x))
+#define S3C_TIMERREG2(tmr,reg) S3C_TIMERREG((reg)+0x0c+((tmr)*0x0c))
+
+#define S3C2410_TCFG0	      S3C_TIMERREG(0x00)
+#define S3C2410_TCFG1	      S3C_TIMERREG(0x04)
+#define S3C2410_TCON	      S3C_TIMERREG(0x08)
+
+#define S3C64XX_TINT_CSTAT    S3C_TIMERREG(0x44)
+
+#define S3C2410_TCFG_PRESCALER0_MASK (255<<0)
+#define S3C2410_TCFG_PRESCALER1_MASK (255<<8)
+#define S3C2410_TCFG_PRESCALER1_SHIFT (8)
+#define S3C2410_TCFG_DEADZONE_MASK   (255<<16)
+#define S3C2410_TCFG_DEADZONE_SHIFT  (16)
+
+#define S3C2410_TCFG1_MUX4_DIV2	  (0<<16)
+#define S3C2410_TCFG1_MUX4_DIV4	  (1<<16)
+#define S3C2410_TCFG1_MUX4_DIV8	  (2<<16)
+#define S3C2410_TCFG1_MUX4_DIV16  (3<<16)
+#define S3C2410_TCFG1_MUX4_TCLK1  (4<<16)
+#define S3C2410_TCFG1_MUX4_MASK	  (15<<16)
+#define S3C2410_TCFG1_MUX4_SHIFT  (16)
+
+#define S3C2410_TCFG1_MUX3_DIV2	  (0<<12)
+#define S3C2410_TCFG1_MUX3_DIV4	  (1<<12)
+#define S3C2410_TCFG1_MUX3_DIV8	  (2<<12)
+#define S3C2410_TCFG1_MUX3_DIV16  (3<<12)
+#define S3C2410_TCFG1_MUX3_TCLK1  (4<<12)
+#define S3C2410_TCFG1_MUX3_MASK	  (15<<12)
+
+
+#define S3C2410_TCFG1_MUX2_DIV2	  (0<<8)
+#define S3C2410_TCFG1_MUX2_DIV4	  (1<<8)
+#define S3C2410_TCFG1_MUX2_DIV8	  (2<<8)
+#define S3C2410_TCFG1_MUX2_DIV16  (3<<8)
+#define S3C2410_TCFG1_MUX2_TCLK1  (4<<8)
+#define S3C2410_TCFG1_MUX2_MASK	  (15<<8)
+
+
+#define S3C2410_TCFG1_MUX1_DIV2	  (0<<4)
+#define S3C2410_TCFG1_MUX1_DIV4	  (1<<4)
+#define S3C2410_TCFG1_MUX1_DIV8	  (2<<4)
+#define S3C2410_TCFG1_MUX1_DIV16  (3<<4)
+#define S3C2410_TCFG1_MUX1_TCLK0  (4<<4)
+#define S3C2410_TCFG1_MUX1_MASK	  (15<<4)
+
+#define S3C2410_TCFG1_MUX0_DIV2	  (0<<0)
+#define S3C2410_TCFG1_MUX0_DIV4	  (1<<0)
+#define S3C2410_TCFG1_MUX0_DIV8	  (2<<0)
+#define S3C2410_TCFG1_MUX0_DIV16  (3<<0)
+#define S3C2410_TCFG1_MUX0_TCLK0  (4<<0)
+#define S3C2410_TCFG1_MUX0_MASK	  (15<<0)
+
+#define S3C2410_TCFG1_MUX_DIV2	  (0<<0)
+#define S3C2410_TCFG1_MUX_DIV4	  (1<<0)
+#define S3C2410_TCFG1_MUX_DIV8	  (2<<0)
+#define S3C2410_TCFG1_MUX_DIV16   (3<<0)
+#define S3C2410_TCFG1_MUX_TCLK    (4<<0)
+#define S3C2410_TCFG1_MUX_MASK	  (15<<0)
+
+#define S3C64XX_TCFG1_MUX_DIV1	  (0<<0)
+#define S3C64XX_TCFG1_MUX_DIV2	  (1<<0)
+#define S3C64XX_TCFG1_MUX_DIV4	  (2<<0)
+#define S3C64XX_TCFG1_MUX_DIV8    (3<<0)
+#define S3C64XX_TCFG1_MUX_DIV16   (4<<0)
+#define S3C64XX_TCFG1_MUX_TCLK    (5<<0)  /* 3 sets of TCLK */
+#define S3C64XX_TCFG1_MUX_MASK	  (15<<0)
+
+#define S3C2410_TCFG1_SHIFT(x)	  ((x) * 4)
+
+/* for each timer, we have an count buffer, an compare buffer and
+ * an observation buffer
+*/
+
+/* WARNING - timer 4 has no buffer reg, and it's observation is at +4 */
+
+#define S3C2410_TCNTB(tmr)    S3C_TIMERREG2(tmr, 0x00)
+#define S3C2410_TCMPB(tmr)    S3C_TIMERREG2(tmr, 0x04)
+#define S3C2410_TCNTO(tmr)    S3C_TIMERREG2(tmr, (((tmr) == 4) ? 0x04 : 0x08))
+
+#define S3C2410_TCON_T4RELOAD	  (1<<22)
+#define S3C2410_TCON_T4MANUALUPD  (1<<21)
+#define S3C2410_TCON_T4START	  (1<<20)
+
+#define S3C2410_TCON_T3RELOAD	  (1<<19)
+#define S3C2410_TCON_T3INVERT	  (1<<18)
+#define S3C2410_TCON_T3MANUALUPD  (1<<17)
+#define S3C2410_TCON_T3START	  (1<<16)
+
+#define S3C2410_TCON_T2RELOAD	  (1<<15)
+#define S3C2410_TCON_T2INVERT	  (1<<14)
+#define S3C2410_TCON_T2MANUALUPD  (1<<13)
+#define S3C2410_TCON_T2START	  (1<<12)
+
+#define S3C2410_TCON_T1RELOAD	  (1<<11)
+#define S3C2410_TCON_T1INVERT	  (1<<10)
+#define S3C2410_TCON_T1MANUALUPD  (1<<9)
+#define S3C2410_TCON_T1START	  (1<<8)
+
+#define S3C2410_TCON_T0DEADZONE	  (1<<4)
+#define S3C2410_TCON_T0RELOAD	  (1<<3)
+#define S3C2410_TCON_T0INVERT	  (1<<2)
+#define S3C2410_TCON_T0MANUALUPD  (1<<1)
+#define S3C2410_TCON_T0START	  (1<<0)
 
 static struct clk *tin_event;
 static struct clk *tin_source;
-- 
1.8.1.2
