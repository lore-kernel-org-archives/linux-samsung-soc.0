From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 20/22] clocksource/drivers/exynos_mct: Fix Kconfig and add COMPILE_TEST option
Date: Mon,  2 Nov 2015 13:56:48 +0100
Message-ID: <1446469011-22710-20-git-send-email-daniel.lezcano@linaro.org>
References: <1446469011-22710-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446469011-22710-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: john.stultz@linaro.org, linux-kernel@vger.kernel.org, arnd@arndb.de, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "moderated list:ARM
	SUB-ARCHITECT..." <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Let the platform's Kconfig to select the clock instead of having a reverse
dependency from the driver to the platform options.

Add the COMPILE_TEST option for the compilation test coverage. Due to the
non portable 'delay' code, this driver is only compilable on ARM.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/Kconfig | 1 +
 drivers/clocksource/Kconfig  | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 3a10f1a..ff10539 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -27,6 +27,7 @@ menuconfig ARCH_EXYNOS
 	select SRAM
 	select THERMAL
 	select MFD_SYSCON
+	select CLKSRC_EXYNOS_MCT
 	help
 	  Support for SAMSUNG EXYNOS SoCs (EXYNOS4/5)
 
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 916c36d..d829cbe 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -213,8 +213,8 @@ config CLKSRC_METAG_GENERIC
 	  This option enables support for the Meta per-thread timers.
 
 config CLKSRC_EXYNOS_MCT
-	def_bool y if ARCH_EXYNOS
-	depends on !ARM64
+	bool "Exynos multi core timer driver" if COMPILE_TEST
+	depends on ARM
 	help
 	  Support for Multi Core Timer controller on Exynos SoCs.
 
-- 
1.9.1
