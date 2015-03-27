From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [RFC PATCH v2 2/2] ARM: EXYNOS: Make sure that the Exynos5420 MDMA0 clock is enabled during suspend
Date: Fri, 27 Mar 2015 20:38:51 +0100
Message-ID: <1427485131-18561-2-git-send-email-javier.martinez@collabora.co.uk>
References: <1427485131-18561-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427485131-18561-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Steve Capper <steve.capper@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Commit ae43b3289186 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power
Management support v12") added pm support for the pl330 dma driver but
it makes the clock for the Exynos5420 MDMA0 DMA controller to be gated
during suspend and this clock needs to remain enabled in order to make
the system resume from a system suspend state.

To make sure that the clock is enabled during suspend, enable it prior
to entering a suspend state and disable it once the system has resumed.

Thanks to Abhilash Kesavan for figuring out that this was the issue.

Fixes: ae43b32 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power Management support v12")
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

The patch is an RFC because I'm not sure if this is the proper fix or if
is just fixing a symptom rather than the cause. Any suggestions are more
than welcomed.

Changes since v1:
  - Call clk_put() after disabling the clock. Suggested by Sylwester Nawrocki.
  - Use only IS_ERR() instead IS_ERR_OR_NULL(). Suggested by Sylwester Nawrocki.

 arch/arm/mach-exynos/suspend.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 1521eaf99265..8a297fc1fa76 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -16,6 +16,7 @@
 #include <linux/init.h>
 #include <linux/suspend.h>
 #include <linux/syscore_ops.h>
+#include <linux/clk.h>
 #include <linux/cpu_pm.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -79,6 +80,7 @@ static const struct exynos_pm_data *pm_data;
 
 static int exynos5420_cpu_state;
 static unsigned int exynos_pmu_spare3;
+static struct clk *clk;
 
 /*
  * GIC wake-up support
@@ -374,6 +376,16 @@ static void exynos5420_pm_prepare(void)
 {
 	unsigned int tmp;
 
+	/*
+	 * Exynos5420 requires the MDMA0 controller clock to be
+	 * ungated on suspend in order to be resumed correctly.
+	 */
+	clk = clk_get(NULL, "mdma0");
+	if (IS_ERR(clk))
+		pr_warn("Failed to get mdma0 clk (%ld)\n", PTR_ERR(clk));
+	else
+		clk_prepare_enable(clk);
+
 	/* Set wake-up mask registers */
 	exynos_pm_set_wakeup_mask();
 
@@ -516,6 +528,11 @@ static void exynos5420_pm_resume(void)
 {
 	unsigned long tmp;
 
+	if (!IS_ERR(clk)) {
+		clk_disable_unprepare(clk);
+		clk_put(clk);
+	}
+
 	/* Restore the CPU0 low power state register */
 	tmp = pmu_raw_readl(EXYNOS5_ARM_CORE0_SYS_PWR_REG);
 	pmu_raw_writel(tmp | S5P_CORE_LOCAL_PWR_EN,
-- 
2.1.4
