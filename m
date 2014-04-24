From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH] ARM: exynos: register sched_clock callback
Date: Thu, 24 Apr 2014 11:21:26 +0200
Message-ID: <1398331286-2020-1-git-send-email-vincent.guittot@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:34677 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755130AbaDXJW2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 05:22:28 -0400
Received: by mail-we0-f170.google.com with SMTP id w61so1984453wes.15
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2014 02:22:27 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, Vincent Guittot <vincent.guittot@linaro.org>

Use the clocksource mct-frc for sched_clock

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 drivers/clocksource/exynos_mct.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index a6ee6d7..61b0577 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -24,6 +24,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include <linux/clocksource.h>
+#include <linux/sched_clock.h>
 
 #define EXYNOS4_MCTREG(x)		(x)
 #define EXYNOS4_MCT_G_CNT_L		EXYNOS4_MCTREG(0x100)
@@ -192,12 +193,19 @@ struct clocksource mct_frc = {
 	.resume		= exynos4_frc_resume,
 };
 
+static u64 notrace exynos4_read_sched_clock(void)
+{
+	return exynos4_frc_read(&mct_frc);
+}
+
 static void __init exynos4_clocksource_init(void)
 {
 	exynos4_mct_frc_start(0, 0);
 
 	if (clocksource_register_hz(&mct_frc, clk_rate))
 		panic("%s: can't register clocksource\n", mct_frc.name);
+
+	sched_clock_register(exynos4_read_sched_clock, 64, clk_rate);
 }
 
 static void exynos4_mct_comp0_stop(void)
-- 
1.9.1
