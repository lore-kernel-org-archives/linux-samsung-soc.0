From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 1/2] clk: samsung: Don't build ARMv8 clock drivers on ARMv7
Date: Mon, 16 Nov 2015 10:36:14 +0900
Message-ID: <1447637775-9887-2-git-send-email-k.kozlowski@samsung.com>
References: <1447637775-9887-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:41736 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752508AbbKPBgg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 15 Nov 2015 20:36:36 -0500
In-reply-to: <1447637775-9887-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@linaro.org>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Currently the Exynos5433 (ARMv8 SoC) clock driver depends on ARCH_EXYNOS
so it is built also on ARMv7. This does not bring any kind of benefit.
There won't be a single kernel image for ARMv7 and ARMv8 SoCs (like
multi_v7 for ARMv7).

Instead build clock drivers only for respective SoC's architecture.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/samsung/Kconfig  | 13 +++++++++++++
 drivers/clk/samsung/Makefile |  4 ++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 84196ecdaa12..5f138fc4d84d 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -2,6 +2,7 @@ config COMMON_CLK_SAMSUNG
 	bool
 	select COMMON_CLK
 
+# ARMv7 SoCs:
 config S3C2410_COMMON_CLK
 	bool
 	select COMMON_CLK_SAMSUNG
@@ -24,3 +25,15 @@ config S3C2443_COMMON_CLK
 	bool
 	select COMMON_CLK_SAMSUNG
 
+# ARMv8 SoCs:
+config EXYNOS5433_COMMON_CLK
+	bool
+	depends on ARM64 || COMPILE_TEST
+	default ARCH_EXYNOS
+	select COMMON_CLK_SAMSUNG
+
+config EXYNOS7_COMMON_CLK
+	bool
+	depends on ARM64 || COMPILE_TEST
+	default ARCH_EXYNOS
+	select COMMON_CLK_SAMSUNG
diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index 5f6833ea355d..a31332a24ef4 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -10,11 +10,11 @@ obj-$(CONFIG_SOC_EXYNOS5250)	+= clk-exynos5250.o
 obj-$(CONFIG_SOC_EXYNOS5260)	+= clk-exynos5260.o
 obj-$(CONFIG_SOC_EXYNOS5410)	+= clk-exynos5410.o
 obj-$(CONFIG_SOC_EXYNOS5420)	+= clk-exynos5420.o
-obj-$(CONFIG_ARCH_EXYNOS)	+= clk-exynos5433.o
+obj-$(CONFIG_EXYNOS5433_COMMON_CLK)	+= clk-exynos5433.o
 obj-$(CONFIG_SOC_EXYNOS5440)	+= clk-exynos5440.o
 obj-$(CONFIG_ARCH_EXYNOS)	+= clk-exynos-audss.o
 obj-$(CONFIG_ARCH_EXYNOS)	+= clk-exynos-clkout.o
-obj-$(CONFIG_ARCH_EXYNOS7)	+= clk-exynos7.o
+obj-$(CONFIG_EXYNOS7_COMMON_CLK)	+= clk-exynos7.o
 obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
 obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
 obj-$(CONFIG_S3C2412_COMMON_CLK)+= clk-s3c2412.o
-- 
1.9.1
