From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 02/11] clocksource/drivers/exynos_mct: Change exynos4_mct_tick_clear return type to void
Date: Tue,  2 Jun 2015 14:31:47 +0200
Message-ID: <1433248316-26320-2-git-send-email-daniel.lezcano@linaro.org>
References: <556DA1E5.1030601@linaro.org>
 <1433248316-26320-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:35439 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755639AbbFBMcf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jun 2015 08:32:35 -0400
Received: by wgme6 with SMTP id e6so138640297wgm.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Jun 2015 05:32:34 -0700 (PDT)
In-Reply-To: <1433248316-26320-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: tglx@linutronix.de, mingo@kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, "open list:CLOCKSOURCE, CLOC..." <linux-kernel@vger.kernel.org>, "moderated list:ARM/SAMSUNG
	EXYNO..." <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>

From: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Return value of exynos4_mct_tick_clear() was never checked so it can
be safely changed to void.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/exynos_mct.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 83564c9..87c2e55 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -413,7 +413,7 @@ static inline void exynos4_tick_set_mode(enum clock_event_mode mode,
 	}
 }
 
-static int exynos4_mct_tick_clear(struct mct_clock_event_device *mevt)
+static void exynos4_mct_tick_clear(struct mct_clock_event_device *mevt)
 {
 	struct clock_event_device *evt = &mevt->evt;
 
@@ -426,12 +426,8 @@ static int exynos4_mct_tick_clear(struct mct_clock_event_device *mevt)
 		exynos4_mct_tick_stop(mevt);
 
 	/* Clear the MCT tick interrupt */
-	if (readl_relaxed(reg_base + mevt->base + MCT_L_INT_CSTAT_OFFSET) & 1) {
+	if (readl_relaxed(reg_base + mevt->base + MCT_L_INT_CSTAT_OFFSET) & 1)
 		exynos4_mct_write(0x1, mevt->base + MCT_L_INT_CSTAT_OFFSET);
-		return 1;
-	} else {
-		return 0;
-	}
 }
 
 static irqreturn_t exynos4_mct_tick_isr(int irq, void *dev_id)
-- 
1.9.1
