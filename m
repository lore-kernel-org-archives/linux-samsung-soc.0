From: Stuart Menefy <stuart.menefy@mathembedded.com>
Subject: [PATCH 2/2] clocksource: exynos_mct: Clear timer interrupt when shutdown
Date: Sun, 10 Feb 2019 22:51:14 +0000
Message-ID: <20190210225114.20110-3-stuart.menefy@mathembedded.com>
References: <20190210225114.20110-1-stuart.menefy@mathembedded.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190210225114.20110-1-stuart.menefy@mathembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Stuart Menefy <stuart.menefy@mathembedded.com>
List-Id: linux-samsung-soc@vger.kernel.org

When shutting down the timer, ensure that after we have stopped the
timer any pending interrupts are cleared. This fixes a problem when
suspending, as interrupts are disabled before the timer is stopped,
so the timer interrupt may still be asserted, preventing the system
entering a low power state when the wfi is executed.

Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
---
 drivers/clocksource/exynos_mct.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 1e325f89d408..d55c30f6981d 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -411,6 +411,7 @@ static int set_state_shutdown(struct clock_event_device *evt)
 
 	mevt = container_of(evt, struct mct_clock_event_device, evt);
 	exynos4_mct_tick_stop(mevt);
+	exynos4_mct_tick_clear(mevt);
 	return 0;
 }
 
-- 
2.13.6
