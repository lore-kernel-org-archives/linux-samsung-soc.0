From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 1/7] clocksource: exynos_mct: Add the support for ARM64
Date: Wed, 24 Aug 2016 22:49:05 +0900
Message-ID: <1472046551-703-2-git-send-email-cw00.choi@samsung.com>
References: <1472046551-703-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1472046551-703-1-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: k.kozlowski@samsung.com, kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: inki.dae@samsung.com, jonghwa3.lee@samsung.com, s.nawrocki@samsung.com, jy0922.shim@samsung.com, a.hajda@samsung.com, jaewon02.kim@samsung.com, Daniel Lezcano <daniel.lezcano@linaro.org>, sw0312.kim@samsung.com, krzk@kernel.org, jh80.chung@samsung.com, cw00.choi@samsung.com, human.hwang@samsung.com, chanwoo@kernel.org, ingi2.kim@samsung.com, m.szyprowski@samsung.com, Thomas Gleixner <tglx@linutronix.de>, beomho.seo@samsung.com, ideal.song@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds the support for ARM 64bit. The delay_timer is only supported
on ARM 32bit.

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clocksource/Kconfig      | 2 +-
 drivers/clocksource/exynos_mct.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 567788664723..ec443c318c77 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -351,7 +351,7 @@ config CLKSRC_METAG_GENERIC
 
 config CLKSRC_EXYNOS_MCT
 	bool "Exynos multi core timer driver" if COMPILE_TEST
-	depends on ARM
+	depends on ARM || ARM64
 	help
 	  Support for Multi Core Timer controller on Exynos SoCs.
 
diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 41840d02c331..8f3488b80896 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -223,6 +223,7 @@ static u64 notrace exynos4_read_sched_clock(void)
 	return exynos4_read_count_32();
 }
 
+#if defined(CONFIG_ARM)
 static struct delay_timer exynos4_delay_timer;
 
 static cycles_t exynos4_read_current_timer(void)
@@ -231,14 +232,17 @@ static cycles_t exynos4_read_current_timer(void)
 			 "cycles_t needs to move to 32-bit for ARM64 usage");
 	return exynos4_read_count_32();
 }
+#endif
 
 static int __init exynos4_clocksource_init(void)
 {
 	exynos4_mct_frc_start();
 
+#if defined(CONFIG_ARM)
 	exynos4_delay_timer.read_current_timer = &exynos4_read_current_timer;
 	exynos4_delay_timer.freq = clk_rate;
 	register_current_timer_delay(&exynos4_delay_timer);
+#endif
 
 	if (clocksource_register_hz(&mct_frc, clk_rate))
 		panic("%s: can't register clocksource\n", mct_frc.name);
-- 
1.9.1
