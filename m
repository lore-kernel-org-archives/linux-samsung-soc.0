From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 11/18] clocksource/drivers/exynos_mct: Remove unused header includes
Date: Sat, 23 Feb 2019 14:06:59 +0100
Message-ID: <20190223130707.16704-11-daniel.lezcano@linaro.org>
References: <b5d75b05-b78c-535c-2b35-9a1f5a3a853f@linaro.org>
 <20190223130707.16704-1-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190223130707.16704-1-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS
        ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS
        ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

The driver does not use sched.h and platform_device.h.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/exynos_mct.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 33e90c080877..34bd250d46c6 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -10,14 +10,12 @@
  * published by the Free Software Foundation.
 */
 
-#include <linux/sched.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/err.h>
 #include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
-#include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/percpu.h>
 #include <linux/of.h>
-- 
2.17.1
