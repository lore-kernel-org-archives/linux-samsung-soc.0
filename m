From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Fix compilation error.
Date: Wed,  7 Mar 2012 11:39:19 +0530
Message-ID: <1331100559-28849-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:62476 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751920Ab2CGGQI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Mar 2012 01:16:08 -0500
Received: by dadp12 with SMTP id p12so7512450dad.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Mar 2012 22:16:07 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Commit 734b5bb7375 ("Merge branch 'next/soc-exynos5250-arch-wip' into f=
or-next")
on for-next branch of Kukjin's tree gives the following build errors:

arch/arm/mach-exynos/clock-exynos4.c:1328:2: error: =E2=80=98clk_sclk_m=
mc0=E2=80=99
undeclared here (not in a function)
arch/arm/mach-exynos/clock-exynos4.c:1329:2: error: =E2=80=98clk_sclk_m=
mc1=E2=80=99
undeclared here (not in a function)
arch/arm/mach-exynos/clock-exynos4.c:1330:2: error: =E2=80=98clk_sclk_m=
mc2=E2=80=99
undeclared here (not in a function)
arch/arm/mach-exynos/clock-exynos4.c:1331:2: error: =E2=80=98clk_sclk_m=
mc3=E2=80=99
undeclared here (not in a function)

This commit fixes the same.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/clock-exynos4.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-exyno=
s/clock-exynos4.c
index d72a1fe..bcb59e7 100644
--- a/arch/arm/mach-exynos/clock-exynos4.c
+++ b/arch/arm/mach-exynos/clock-exynos4.c
@@ -1325,10 +1325,10 @@ static struct clk_lookup exynos4_clk_lookup[] =3D=
 {
 	CLKDEV_INIT("exynos4210-uart.1", "clk_uart_baud0", &exynos4_clk_sclk_=
uart1.clk),
 	CLKDEV_INIT("exynos4210-uart.2", "clk_uart_baud0", &exynos4_clk_sclk_=
uart2.clk),
 	CLKDEV_INIT("exynos4210-uart.3", "clk_uart_baud0", &exynos4_clk_sclk_=
uart3.clk),
-	CLKDEV_INIT("exynos4-sdhci.0", "mmc_busclk.2", &clk_sclk_mmc0.clk),
-	CLKDEV_INIT("exynos4-sdhci.1", "mmc_busclk.2", &clk_sclk_mmc1.clk),
-	CLKDEV_INIT("exynos4-sdhci.2", "mmc_busclk.2", &clk_sclk_mmc2.clk),
-	CLKDEV_INIT("exynos4-sdhci.3", "mmc_busclk.2", &clk_sclk_mmc3.clk),
+	CLKDEV_INIT("exynos4-sdhci.0", "mmc_busclk.2", &exynos4_clk_sclk_mmc0=
=2Eclk),
+	CLKDEV_INIT("exynos4-sdhci.1", "mmc_busclk.2", &exynos4_clk_sclk_mmc1=
=2Eclk),
+	CLKDEV_INIT("exynos4-sdhci.2", "mmc_busclk.2", &exynos4_clk_sclk_mmc2=
=2Eclk),
+	CLKDEV_INIT("exynos4-sdhci.3", "mmc_busclk.2", &exynos4_clk_sclk_mmc3=
=2Eclk),
 	CLKDEV_INIT("dma-pl330.0", "apb_pclk", &exynos4_clk_pdma0),
 	CLKDEV_INIT("dma-pl330.1", "apb_pclk", &exynos4_clk_pdma1),
 	CLKDEV_INIT("s3c64xx-spi.0", "spi_busclk0", &exynos4_clk_sclk_spi0.cl=
k),
--=20
1.7.4.1
