From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] clk: samsung: Allow modular build of the Audio Subsystem
 CLKCON driver
Date: Fri, 08 Jul 2016 16:15:00 +0200
Message-ID: <1467987300-31450-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: b.zolnierkie@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Any clock dependencies can be properly handled with deferred probing
so we can remove core_initcall and switch to a proper loadable platform
driver module.
This change has been tested on Exynos4412 Odroid U3 based board.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/Kconfig            |  9 +++++++++
 drivers/clk/samsung/Makefile           |  2 +-
 drivers/clk/samsung/clk-exynos-audss.c | 12 +-----------
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 20c5fe9..addc652 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -9,6 +9,15 @@ config EXYNOS_ARM64_COMMON_CLK
 	bool "Samsung Exynos ARMv8-family clock controller support" if COMPILE_TEST
 	depends on COMMON_CLK_SAMSUNG
 
+config EXYNOS_AUDSS_CLK_CON
+	tristate "Samsung Exynos AUDSS clock controller support"
+	depends on COMMON_CLK_SAMSUNG
+	default y if ARCH_EXYNOS
+	help
+	  Support for the Audio Subsystem CLKCON clock controller present
+	  on some Exynos SoC variants. Choose M or Y here if you want to
+	  use audio devices such as I2S, PCM, etc.
+
 # For S3C24XX platforms, select following symbols:
 config S3C2410_COMMON_CLK
 	bool "Samsung S3C2410 clock controller support" if COMPILE_TEST
diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index fc367d4..57f4dc6 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -12,7 +12,7 @@ obj-$(CONFIG_SOC_EXYNOS5410)	+= clk-exynos5410.o
 obj-$(CONFIG_SOC_EXYNOS5420)	+= clk-exynos5420.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos5433.o
 obj-$(CONFIG_SOC_EXYNOS5440)	+= clk-exynos5440.o
-obj-$(CONFIG_ARCH_EXYNOS)	+= clk-exynos-audss.o
+obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
 obj-$(CONFIG_ARCH_EXYNOS)	+= clk-exynos-clkout.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
 obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index 4e9584d..bdf8b97 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -273,17 +273,7 @@ static struct platform_driver exynos_audss_clk_driver = {
 	.remove = exynos_audss_clk_remove,
 };
 
-static int __init exynos_audss_clk_init(void)
-{
-	return platform_driver_register(&exynos_audss_clk_driver);
-}
-core_initcall(exynos_audss_clk_init);
-
-static void __exit exynos_audss_clk_exit(void)
-{
-	platform_driver_unregister(&exynos_audss_clk_driver);
-}
-module_exit(exynos_audss_clk_exit);
+module_platform_driver(exynos_audss_clk_driver);
 
 MODULE_AUTHOR("Padmavathi Venna <padma.v@samsung.com>");
 MODULE_DESCRIPTION("Exynos Audio Subsystem Clock Controller");
-- 
1.9.1

