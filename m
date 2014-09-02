From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH v2 7/7] arm64: exynos7: Enable ARMv8 based Exynos7 (SoC) support
Date: Tue, 02 Sep 2014 21:05:43 +0530
Message-ID: <1409672143-8574-8-git-send-email-ch.naveen@samsung.com>
References: <1409672143-8574-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:15645 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754079AbaIBPoJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Sep 2014 11:44:09 -0400
In-reply-to: <1409672143-8574-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: naveenkrishna.ch@gmail.com, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, t.figa@samsung.com, kgene.kim@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>

From: Alim Akhtar <alim.akhtar@samsung.com>

This patch adds the necessary Kconfig entries to enable
support for the ARMv8 based Exynos7 SoC.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/Kconfig |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fd4e81a..b4d1dc2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -134,6 +134,18 @@ source "kernel/Kconfig.freezer"
 
 menu "Platform selection"
 
+config ARCH_EXYNOS
+	bool
+	help
+	  This enables support for Samsung Exynos SoC family
+
+config ARCH_EXYNOS7
+	bool "ARMv8 based Samsung Exynos7"
+	select ARCH_EXYNOS
+	select COMMON_CLK_SAMSUNG
+	help
+	  This enables support for Samsung Exynos7 SoC family
+
 config ARCH_VEXPRESS
 	bool "ARMv8 software model (Versatile Express)"
 	select ARCH_REQUIRE_GPIOLIB
-- 
1.7.9.5
