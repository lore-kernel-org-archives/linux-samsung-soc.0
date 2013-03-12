From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH 3/7] ARM: S3C24XX: enable legacy clock code only when SAMSUNG_CLOCK selected
Date: Tue, 12 Mar 2013 01:43:15 +0100
Message-ID: <201303120143.16183.heiko@sntech.de>
References: <201303120141.31262.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:40420 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754446Ab3CLAnS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Mar 2013 20:43:18 -0400
In-Reply-To: <201303120141.31262.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

This enables a smooth transition, as not all S3C24XX SoCs need to be
converted at the same time and can instead simply exchange their
select SAMSUNG_CLOCK with a select COMMON_CLK after the conversion.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-s3c24xx/common-s3c2443.c |    2 ++
 arch/arm/mach-s3c24xx/common.c         |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/common-s3c2443.c b/arch/arm/mach-s3c24xx/common-s3c2443.c
index f6b9f2e..b5bbeb7 100644
--- a/arch/arm/mach-s3c24xx/common-s3c2443.c
+++ b/arch/arm/mach-s3c24xx/common-s3c2443.c
@@ -28,6 +28,7 @@
 #include <plat/cpu-freq.h>
 
 
+#ifdef CONFIG_SAMSUNG_CLOCK
 static int s3c2443_gate(void __iomem *reg, struct clk *clk, int enable)
 {
 	u32 ctrlbit = clk->ctrlbit;
@@ -673,3 +674,4 @@ void __init s3c2443_common_init_clocks(int xtal, pll_fn get_mpll,
 
 	s3c2443_common_setup_clocks(get_mpll);
 }
+#endif
diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/common.c
index d97533d..9131eb2 100644
--- a/arch/arm/mach-s3c24xx/common.c
+++ b/arch/arm/mach-s3c24xx/common.c
@@ -285,6 +285,7 @@ struct s3c24xx_uart_resources s3c2410_uart_resources[] __initdata = {
 
 /* initialise all the clocks */
 
+#ifdef CONFIG_SAMSUNG_CLOCK
 void __init_or_cpufreq s3c24xx_setup_clocks(unsigned long fclk,
 					   unsigned long hclk,
 					   unsigned long pclk)
@@ -297,3 +298,4 @@ void __init_or_cpufreq s3c24xx_setup_clocks(unsigned long fclk,
 	clk_p.rate = pclk;
 	clk_f.rate = fclk;
 }
+#endif
-- 
1.7.2.3
