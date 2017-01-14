From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/4] ARM: EXYNOS: Remove Exynos4415 driver (SoC not supported anymore)
Date: Sat, 14 Jan 2017 14:36:39 +0200
Message-ID: <20170114123642.15581-2-krzk@kernel.org>
References: <20170114123642.15581-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170114123642.15581-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-deve
List-Id: linux-samsung-soc@vger.kernel.org

Support for Exynos4415 is going away because there are no internal nor
external users.

Since commit 46dcf0ff0de3 ("ARM: dts: exynos: Remove exynos4415.dtsi"),
the platform cannot be instantiated so remove also the mach code.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-exynos/Kconfig   | 5 -----
 arch/arm/mach-exynos/exynos.c  | 1 -
 arch/arm/mach-exynos/suspend.c | 1 -
 3 files changed, 7 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 0bb63b8d21e7..0a99140b6ba2 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -95,11 +95,6 @@ config SOC_EXYNOS4412
 	default y
 	depends on ARCH_EXYNOS4
 
-config SOC_EXYNOS4415
-	bool "SAMSUNG EXYNOS4415"
-	default y
-	depends on ARCH_EXYNOS4
-
 config SOC_EXYNOS5250
 	bool "SAMSUNG EXYNOS5250"
 	default y
diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 35b832f4bc7e..c404c15ad07f 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -210,7 +210,6 @@ static char const *const exynos_dt_compat[] __initconst = {
 	"samsung,exynos4210",
 	"samsung,exynos4212",
 	"samsung,exynos4412",
-	"samsung,exynos4415",
 	"samsung,exynos5",
 	"samsung,exynos5250",
 	"samsung,exynos5260",
diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 518420241062..25e7c5326259 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -270,7 +270,6 @@ EXYNOS_PMU_IRQ(exynos3250_pmu_irq, "samsung,exynos3250-pmu");
 EXYNOS_PMU_IRQ(exynos4210_pmu_irq, "samsung,exynos4210-pmu");
 EXYNOS_PMU_IRQ(exynos4212_pmu_irq, "samsung,exynos4212-pmu");
 EXYNOS_PMU_IRQ(exynos4412_pmu_irq, "samsung,exynos4412-pmu");
-EXYNOS_PMU_IRQ(exynos4415_pmu_irq, "samsung,exynos4415-pmu");
 EXYNOS_PMU_IRQ(exynos5250_pmu_irq, "samsung,exynos5250-pmu");
 EXYNOS_PMU_IRQ(exynos5420_pmu_irq, "samsung,exynos5420-pmu");
 
-- 
2.9.3
