From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v5 13/14] clocksource: samsung-pwm: Drop unnecessary includes
Date: Fri, 12 Apr 2013 21:17:29 +0200
Message-ID: <1365794250-14436-14-git-send-email-t.figa@samsung.com>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:11262 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752571Ab3DLTTf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Apr 2013 15:19:35 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ML500GETPOMAD40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 13 Apr 2013 04:19:35 +0900 (KST)
In-reply-to: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, tomasz.figa@gmail.com, heiko@sntech.de, robherring2@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, Tomasz Figa <t.figa@samsung.com>

This patch removes unneccessary header inclusions from the samsung-pwm
clocksource driver.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clocksource/samsung_pwm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clocksource/samsung_pwm.c b/drivers/clocksource/samsung_pwm.c
index 99c376d..b816b65 100644
--- a/drivers/clocksource/samsung_pwm.c
+++ b/drivers/clocksource/samsung_pwm.c
@@ -24,14 +24,8 @@
 
 #include <clocksource/samsung_pwm.h>
 
-#include <asm/smp_twd.h>
-#include <asm/mach/time.h>
-#include <asm/mach/arch.h>
 #include <asm/sched_clock.h>
 
-#include <plat/devs.h>
-#include <plat/samsung-time.h>
-
 /*
  * PWM master driver
  */
-- 
1.8.1.5
