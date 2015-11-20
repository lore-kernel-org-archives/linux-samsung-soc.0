From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 2/2] arm64: EXYNOS: Consolidate ARCH_EXYNOS7 symbol into
 ARCH_EXYNOS
Date: Fri, 20 Nov 2015 09:12:41 +0900
Message-ID: <1447978361-18010-3-git-send-email-k.kozlowski@samsung.com>
References: <1447978361-18010-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:13512 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161066AbbKTAON (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2015 19:14:13 -0500
In-reply-to: <1447978361-18010-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@linaro.org>, devicetree@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

The ARMv8 Exynos family SoCs in Linux kernel are currently:
 - Exynos5433 (controlled by ARCH_EXYNOS),
 - Exynos7 (controlled by ARCH_EXYNOS7).

It duplicates Kconfig symbols unnecessarily, so consolidate them into
one ARCH_EXYNOS. Future SoCs could fall also under the ARCH_EXYNOS
symbol.

The commit should not bring any visible functional change.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Tested-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

---

Changes since v1:
1. Minor cleanups after Tomasz's comments.
2. Added tags: Chanwoo's, Pankaj's, Alim's and Tomasz's.
---
 arch/arm64/Kconfig.platforms        | 11 ++---------
 arch/arm64/boot/dts/exynos/Makefile |  2 +-
 arch/arm64/configs/defconfig        |  2 +-
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 4043c35962cc..64f1116640bc 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -13,21 +13,14 @@ config ARCH_BERLIN
 	  This enables support for Marvell Berlin SoC Family
 
 config ARCH_EXYNOS
-	bool
-	help
-	  This enables support for Samsung Exynos SoC family
-
-config ARCH_EXYNOS7
-	bool "ARMv8 based Samsung Exynos7"
-	select ARCH_EXYNOS
+	bool "ARMv8 based Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select PINCTRL_EXYNOS
-
 	help
-	  This enables support for Samsung Exynos7 SoC family
+	  This enables support for ARMv8 based Samsung Exynos SoC family.
 
 config ARCH_LAYERSCAPE
 	bool "ARMv8 based Freescale Layerscape SoC family"
diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 20310e5b6d6f..50c9b9383cfa 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -1,4 +1,4 @@
-dtb-$(CONFIG_ARCH_EXYNOS7) += exynos7-espresso.dtb
+dtb-$(CONFIG_ARCH_EXYNOS) += exynos7-espresso.dtb
 
 always		:= $(dtb-y)
 subdir-y	:= $(dts-dirs)
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index bdd7aa358d2a..a396fa7c69a5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -33,7 +33,7 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_IOSCHED_DEADLINE is not set
 CONFIG_ARCH_BCM_IPROC=y
 CONFIG_ARCH_BERLIN=y
-CONFIG_ARCH_EXYNOS7=y
+CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_LAYERSCAPE=y
 CONFIG_ARCH_HISI=y
 CONFIG_ARCH_MEDIATEK=y
-- 
1.9.1
