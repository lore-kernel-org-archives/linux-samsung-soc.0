From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 1/6] clk: samsung: Use CONFIG_ARCH_EXYNOS instead of
 CONFIG_ARCH_EXYNOS5433
Date: Fri, 03 Apr 2015 09:29:06 +0900
Message-ID: <1428020951-30428-2-git-send-email-cw00.choi@samsung.com>
References: <1428020951-30428-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:20557 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751751AbbDCA3Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Apr 2015 20:29:16 -0400
In-reply-to: <1428020951-30428-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, cw00.choi@samsung.com, jonghwa3.lee@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

This patch removes the CONFIG_ARCH_EXYNOS5433 and then use only the
CONFIG_ARCH_EXYNOS for ARM-64bit Exynos5433 SoC.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index 17e9af7..a17683b 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -10,7 +10,7 @@ obj-$(CONFIG_SOC_EXYNOS5250)	+= clk-exynos5250.o
 obj-$(CONFIG_SOC_EXYNOS5260)	+= clk-exynos5260.o
 obj-$(CONFIG_SOC_EXYNOS5410)	+= clk-exynos5410.o
 obj-$(CONFIG_SOC_EXYNOS5420)	+= clk-exynos5420.o
-obj-$(CONFIG_ARCH_EXYNOS5433)	+= clk-exynos5433.o
+obj-$(CONFIG_ARCH_EXYNOS)	+= clk-exynos5433.o
 obj-$(CONFIG_SOC_EXYNOS5440)	+= clk-exynos5440.o
 obj-$(CONFIG_ARCH_EXYNOS)	+= clk-exynos-audss.o
 obj-$(CONFIG_ARCH_EXYNOS)	+= clk-exynos-clkout.o
-- 
1.8.5.5
