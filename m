From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] clocksource: exynos_mct: Remove unused header includes
Date: Mon, 18 Feb 2019 11:09:58 +0100
Message-ID: <1550484598-1952-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The driver does not use sched.h and platform_device.h.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clocksource/exynos_mct.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 7a244b681876..33fc4038da06 100644
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
2.7.4
