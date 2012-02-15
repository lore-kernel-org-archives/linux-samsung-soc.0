From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH RE-SEND 2/3] ARM: EXYNOS: Add apb_pclk clkdev entry for mdma1
Date: Thu, 16 Feb 2012 07:31:32 +0900
Message-ID: <1329345093-16180-3-git-send-email-kgene.kim@samsung.com>
References: <1329345093-16180-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:35140 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753103Ab2BOWbx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Feb 2012 17:31:53 -0500
Received: by mail-pz0-f46.google.com with SMTP id d14so1317203dae.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Feb 2012 14:31:52 -0800 (PST)
In-Reply-To: <1329345093-16180-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Tushar Behera <tushar.behera@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>

From: Tushar Behera <tushar.behera@linaro.org>

Amba core assumes the pclk to be named as apb_pclk. During device probe,
it tries to get that clock and enable that. When PM_RUNTIME is enabled,
dma clock is not explicitly enabled in pl330_probe, which causes device
probe to fail. Adding a clkdev entry for apb_pclk for mdma1 fixes the
problem.

This patch fixes following runtime error.

dma-pl330 dma-pl330.2: PERIPH_ID 0x0, PCELL_ID 0x0 !
dma-pl330: probe of dma-pl330.2 failed with error -22

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos4.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-exynos/clock-exynos4.c
index a61006d..c087622 100644
--- a/arch/arm/mach-exynos/clock-exynos4.c
+++ b/arch/arm/mach-exynos/clock-exynos4.c
@@ -1339,6 +1339,7 @@ static struct clk_lookup exynos4_clk_lookup[] = {
 	CLKDEV_INIT("s3c-sdhci.3", "mmc_busclk.2", &exynos4_clk_sclk_mmc3.clk),
 	CLKDEV_INIT("dma-pl330.0", "apb_pclk", &exynos4_clk_pdma0),
 	CLKDEV_INIT("dma-pl330.1", "apb_pclk", &exynos4_clk_pdma1),
+	CLKDEV_INIT("dma-pl330.2", "apb_pclk", &exynos4_clk_mdma1),
 	CLKDEV_INIT("s3c64xx-spi.0", "spi_busclk0", &exynos4_clk_sclk_spi0.clk),
 	CLKDEV_INIT("s3c64xx-spi.1", "spi_busclk0", &exynos4_clk_sclk_spi1.clk),
 	CLKDEV_INIT("s3c64xx-spi.2", "spi_busclk0", &exynos4_clk_sclk_spi2.clk),
-- 
1.7.4.4
