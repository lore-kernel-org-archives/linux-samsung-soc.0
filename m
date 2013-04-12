From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v5 08/14] clocksource: samsung-pwm: Synchronize register
 accesses
Date: Fri, 12 Apr 2013 21:17:24 +0200
Message-ID: <1365794250-14436-9-git-send-email-t.figa@samsung.com>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37951 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752571Ab3DLTSy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Apr 2013 15:18:54 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ML5003W3PNHM310@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 13 Apr 2013 04:18:53 +0900 (KST)
In-reply-to: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, tomasz.figa@gmail.com, heiko@sntech.de, robherring2@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, Tomasz Figa <t.figa@samsung.com>

Since the registers of PWM block are shared between two drivers, it is
required to synchronize accesses to them. This patch introduces
necessary synchronization using spin_{un,}lock_irq{save,restore} and
a shared spinlock.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clocksource/samsung_pwm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clocksource/samsung_pwm.c b/drivers/clocksource/samsung_pwm.c
index 841d03c..bddf9aa 100644
--- a/drivers/clocksource/samsung_pwm.c
+++ b/drivers/clocksource/samsung_pwm.c
@@ -299,6 +299,9 @@ static void samsung_timer_resume(void);
 static void samsung_time_stop(enum samsung_timer_mode mode)
 {
 	unsigned long tcon;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pwm->slock, flags);
 
 	tcon = __raw_readl(S3C2410_TCON);
 
@@ -328,11 +331,16 @@ static void samsung_time_stop(enum samsung_timer_mode mode)
 		break;
 	}
 	__raw_writel(tcon, S3C2410_TCON);
+
+	spin_unlock_irqrestore(&pwm->slock, flags);
 }
 
 static void samsung_time_setup(enum samsung_timer_mode mode, unsigned long tcnt)
 {
 	unsigned long tcon;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pwm->slock, flags);
 
 	tcon = __raw_readl(S3C2410_TCON);
 
@@ -372,11 +380,16 @@ static void samsung_time_setup(enum samsung_timer_mode mode, unsigned long tcnt)
 	__raw_writel(tcnt, S3C2410_TCNTB(mode));
 	__raw_writel(tcnt, S3C2410_TCMPB(mode));
 	__raw_writel(tcon, S3C2410_TCON);
+
+	spin_unlock_irqrestore(&pwm->slock, flags);
 }
 
 static void samsung_time_start(enum samsung_timer_mode mode, bool periodic)
 {
 	unsigned long tcon;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pwm->slock, flags);
 
 	tcon  = __raw_readl(S3C2410_TCON);
 
@@ -436,6 +449,8 @@ static void samsung_time_start(enum samsung_timer_mode mode, bool periodic)
 		break;
 	}
 	__raw_writel(tcon, S3C2410_TCON);
+
+	spin_unlock_irqrestore(&pwm->slock, flags);
 }
 
 static int samsung_set_next_event(unsigned long cycles,
-- 
1.8.1.5
