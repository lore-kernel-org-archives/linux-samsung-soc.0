From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 9/9] clockevents/drivers/exynos_mct: Implement ->set_state_oneshot_stopped()
Date: Thu, 25 Feb 2016 14:37:17 +0100
Message-ID: <1456407438-6131-9-git-send-email-daniel.lezcano@linaro.org>
References: <56CF00F6.9010301@linaro.org>
 <1456407438-6131-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:36434 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932982AbcBYNiF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Feb 2016 08:38:05 -0500
Received: by mail-wm0-f41.google.com with SMTP id g62so29021394wme.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Feb 2016 05:38:04 -0800 (PST)
In-Reply-To: <1456407438-6131-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: tglx@linutronix.de
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "open list:CLOCKSOURCE, CLOC..." <linux-kernel@vger.kernel.org>, "moderated list:ARM/SAMSUNG
	EXYNO..." <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>

From: Viresh Kumar <viresh.kumar@linaro.org>

set_state_oneshot_stopped() is called by the clkevt core, when the next
event is required at an expiry time of 'KTIME_MAX'. This normally
happens with NO_HZ_{IDLE|FULL} in both LOWRES/HIGHRES modes.

This patch makes the clockevent device to stop on such an event, to
avoid spurious interrupts, as explained by: commit 8fff52fd5093
("clockevents: Introduce CLOCK_EVT_STATE_ONESHOT_STOPPED state").

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/exynos_mct.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index ff44082..be09bc0 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -313,6 +313,7 @@ static struct clock_event_device mct_comp_device = {
 	.set_state_periodic	= mct_set_state_periodic,
 	.set_state_shutdown	= mct_set_state_shutdown,
 	.set_state_oneshot	= mct_set_state_shutdown,
+	.set_state_oneshot_stopped = mct_set_state_shutdown,
 	.tick_resume		= mct_set_state_shutdown,
 };
 
@@ -452,6 +453,7 @@ static int exynos4_local_timer_setup(struct mct_clock_event_device *mevt)
 	evt->set_state_periodic = set_state_periodic;
 	evt->set_state_shutdown = set_state_shutdown;
 	evt->set_state_oneshot = set_state_shutdown;
+	evt->set_state_oneshot_stopped = set_state_shutdown;
 	evt->tick_resume = set_state_shutdown;
 	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
 	evt->rating = 450;
-- 
1.9.1
