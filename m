From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 1/2] clk: samsung: Use CONFIG_ARCH_EXYNOS instead of
 CONFIG_ARCH_EXYNOS5433
Date: Wed, 18 Mar 2015 09:42:31 +0900
Message-ID: <1426639352-6255-2-git-send-email-cw00.choi@samsung.com>
References: <1426639352-6255-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1426639352-6255-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, arnd@arndb.de, inki.dae@samsung.com, chanho61.park@samsung.com, cw00.choi@samsung.com, jonghwa3.lee@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

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
