From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 03/16] clocksource: samsung_pwm_timer: Get clock from device
 tree
Date: Mon, 26 Aug 2013 19:08:58 +0200
Message-ID: <1377536951-9307-4-git-send-email-t.figa@samsung.com>
References: <1377536951-9307-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:47978 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752505Ab3HZRJs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 13:09:48 -0400
In-reply-to: <1377536951-9307-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

When booting with device tree static clkdev aliases should not be used.
This patch modifies the samsung_pwm_timer driver to use DT-based clock
lookup when booting with device tree.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clocksource/samsung_pwm_timer.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/samsung_pwm_timer.c b/drivers/clocksource/samsung_pwm_timer.c
index ac60f8b..ab29476 100644
--- a/drivers/clocksource/samsung_pwm_timer.c
+++ b/drivers/clocksource/samsung_pwm_timer.c
@@ -368,10 +368,6 @@ static void __init samsung_clocksource_init(void)
 
 static void __init samsung_timer_resources(void)
 {
-	pwm.timerclk = clk_get(NULL, "timers");
-	if (IS_ERR(pwm.timerclk))
-		panic("failed to get timers clock for timer");
-
 	clk_prepare_enable(pwm.timerclk);
 
 	pwm.tcnt_max = (1UL << pwm.variant.bits) - 1;
@@ -416,6 +412,10 @@ void __init samsung_pwm_clocksource_init(void __iomem *base,
 	memcpy(&pwm.variant, variant, sizeof(pwm.variant));
 	memcpy(pwm.irq, irqs, SAMSUNG_PWM_NUM * sizeof(*irqs));
 
+	pwm.timerclk = clk_get(NULL, "timers");
+	if (IS_ERR(pwm.timerclk))
+		panic("failed to get timers clock for timer");
+
 	_samsung_pwm_clocksource_init();
 }
 
@@ -447,6 +447,10 @@ static void __init samsung_pwm_alloc(struct device_node *np,
 		return;
 	}
 
+	pwm.timerclk = of_clk_get_by_name(np, "timers");
+	if (IS_ERR(pwm.timerclk))
+		panic("failed to get timers clock for timer");
+
 	_samsung_pwm_clocksource_init();
 }
 
-- 
1.8.3.2
