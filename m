From: Tushar Behera <tushar.behera@linaro.org>
Subject: Merge error in for-next branch in kgene/linux-samsung.git
Date: Fri, 09 Mar 2012 15:19:14 +0530
Message-ID: <4F59D21A.4000605@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:45016 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751945Ab2CIJtW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 04:49:22 -0500
Received: by dajr28 with SMTP id r28so1324517daj.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Mar 2012 01:49:21 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>

Hi Kukjin,

Need to fix following merge error in your for-next branch.


diff --git a/arch/arm/mach-exynos/clock-exynos4.c
b/arch/arm/mach-exynos/clock-exynos4.c
index af48ad1..4f7ed78 100644
--- a/arch/arm/mach-exynos/clock-exynos4.c
+++ b/arch/arm/mach-exynos/clock-exynos4.c
@@ -1333,10 +1333,10 @@ static struct clk_lookup exynos4_clk_lookup[] = {
        CLKDEV_INIT("exynos4210-uart.1", "clk_uart_baud0",
&exynos4_clk_sclk_uart1.clk),
        CLKDEV_INIT("exynos4210-uart.2", "clk_uart_baud0",
&exynos4_clk_sclk_uart2.clk),
        CLKDEV_INIT("exynos4210-uart.3", "clk_uart_baud0",
&exynos4_clk_sclk_uart3.clk),
-+      CLKDEV_INIT("exynos4-sdhci.0", "mmc_busclk.2",
&exynos4_clk_sclk_mmc0.clk),
-+      CLKDEV_INIT("exynos4-sdhci.1", "mmc_busclk.2",
&exynos4_clk_sclk_mmc1.clk),
-+      CLKDEV_INIT("exynos4-sdhci.2", "mmc_busclk.2",
&exynos4_clk_sclk_mmc2.clk),
-+      CLKDEV_INIT("exynos4-sdhci.3", "mmc_busclk.2",
&exynos4_clk_sclk_mmc3.clk),
+       CLKDEV_INIT("exynos4-sdhci.0", "mmc_busclk.2",
&exynos4_clk_sclk_mmc0.clk),
+       CLKDEV_INIT("exynos4-sdhci.1", "mmc_busclk.2",
&exynos4_clk_sclk_mmc1.clk),
+       CLKDEV_INIT("exynos4-sdhci.2", "mmc_busclk.2",
&exynos4_clk_sclk_mmc2.clk),
+       CLKDEV_INIT("exynos4-sdhci.3", "mmc_busclk.2",
&exynos4_clk_sclk_mmc3.clk),
        CLKDEV_INIT("dma-pl330.0", "apb_pclk", &exynos4_clk_pdma0),
        CLKDEV_INIT("dma-pl330.1", "apb_pclk", &exynos4_clk_pdma1),
        CLKDEV_INIT("dma-pl330.2", "apb_pclk", &exynos4_clk_mdma1),



-- 
Tushar Behera
