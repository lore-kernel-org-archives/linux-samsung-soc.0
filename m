From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] ARM: exynos: Make ARCH_EXYNOS3 a default option
Date: Mon, 29 Apr 2019 19:36:19 +0200
Message-ID: <20190429173620.5078-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

By default for ARMv7 Exynos platform we select all flavors.  One kernel
image simplifies testing and maintenance.  However Exynos3 was not
selected by default so far (thus it lacked in multi_v7 kernel).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-exynos/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 1c518b8ee520..21ad78d79d8d 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -49,6 +49,7 @@ config S5P_DEV_MFC
 
 config ARCH_EXYNOS3
 	bool "SAMSUNG EXYNOS3"
+	default y
 	select ARM_CPU_SUSPEND if PM
 	help
 	  Samsung EXYNOS3 (Cortex-A7) SoC based systems
-- 
2.17.1
