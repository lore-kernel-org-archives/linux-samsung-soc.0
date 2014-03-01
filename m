From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] clocksource: exynos_mct: silence a static checker warning
Date: Sat, 1 Mar 2014 16:57:14 +0300
Message-ID: <20140301135714.GD23929@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:21745 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752566AbaCAN6C (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 1 Mar 2014 08:58:02 -0500
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org

My guess is we aren't going to have a 2 digit cpuid here any time soon
but the static checkers don't know that and complain that the snprintf()
could overflow.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index ed49b25fa552..a6ee6d7cd63f 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -408,7 +408,7 @@ static int exynos4_local_timer_setup(struct clock_event_device *evt)
 	mevt = container_of(evt, struct mct_clock_event_device, evt);
 
 	mevt->base = EXYNOS4_MCT_L_BASE(cpu);
-	sprintf(mevt->name, "mct_tick%d", cpu);
+	snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d", cpu);
 
 	evt->name = mevt->name;
 	evt->cpumask = cpumask_of(cpu);
