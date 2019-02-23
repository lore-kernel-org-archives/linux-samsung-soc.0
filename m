From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 04/18] clocksource/drivers/exynos_mct: Clear timer interrupt when shutdown
Date: Sat, 23 Feb 2019 14:06:52 +0100
Message-ID: <20190223130707.16704-4-daniel.lezcano@linaro.org>
References: <b5d75b05-b78c-535c-2b35-9a1f5a3a853f@linaro.org>
 <20190223130707.16704-1-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190223130707.16704-1-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Stuart Menefy <stuart.menefy@mathembedded.com>, stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS
        ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS
        ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Stuart Menefy <stuart.menefy@mathembedded.com>

When shutting down the timer, ensure that after we have stopped the
timer any pending interrupts are cleared. This fixes a problem when
suspending, as interrupts are disabled before the timer is stopped,
so the timer interrupt may still be asserted, preventing the system
entering a low power state when the wfi is executed.

Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: <stable@vger.kernel.org> # v4.3+
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
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
2.17.1
