From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH v6 6/7] arm64: exynos7: Enable ARMv8 based Exynos7 (SoC) support
Date: Fri, 07 Nov 2014 10:50:54 +0530
Message-ID: <1415337655-31003-7-git-send-email-a.kesavan@samsung.com>
References: <1415337655-31003-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:34528 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751724AbaKGFVs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Nov 2014 00:21:48 -0500
In-reply-to: <1415337655-31003-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de, tomasz.figa@gmail.com, kesavan.abhilash@gmail.com, Alim Akhtar <alim.akhtar@samsung.com>

From: Alim Akhtar <alim.akhtar@samsung.com>

This patch adds the necessary Kconfig entries to enable
support for the ARMv8 based Exynos7 SoC. It also enables
RTC, WDT and Pinctrl for Exynos7.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Reviewed-by: Thomas Abraham <thomas.ab@samsung.com>
Tested-by: Thomas Abraham <thomas.ab@samsung.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/Kconfig |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 66b0b51..8196889 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -148,6 +148,23 @@ config ARCH_THUNDER
 	help
 	  This enables support for Cavium's Thunder Family of SoCs.
 
+config ARCH_EXYNOS
+	bool
+	help
+	  This enables support for Samsung Exynos SoC family
+
+config ARCH_EXYNOS7
+	bool "ARMv8 based Samsung Exynos7"
+	select ARCH_EXYNOS
+	select COMMON_CLK_SAMSUNG
+	select HAVE_S3C2410_WATCHDOG if WATCHDOG
+	select HAVE_S3C_RTC if RTC_CLASS
+	select PINCTRL
+	select PINCTRL_EXYNOS
+
+	help
+	  This enables support for Samsung Exynos7 SoC family
+
 config ARCH_VEXPRESS
 	bool "ARMv8 software model (Versatile Express)"
 	select ARCH_REQUIRE_GPIOLIB
-- 
1.7.9.5
