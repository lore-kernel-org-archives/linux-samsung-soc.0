From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v3 1/9] ARM: S3C24XX: cpufreq-utils: don't write raw values to MPLLCON when using ccf
Date: Mon, 12 May 2014 00:05:56 +0200
Message-ID: <2418280.1MnoLGQICj@phil>
References: <3427359.fjFAW0MSIR@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:60831 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755478AbaEKWCW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 May 2014 18:02:22 -0400
In-Reply-To: <3427359.fjFAW0MSIR@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: t.figa@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The s3c24xx cpufreq driver needs to change the mpll speed and was doing
this by writing raw values from a translation table into the MPLLCON
register.

Change this to use a regular clk_set_rate call when using the common
clock framework and only write the raw value in the samsung_clock case.

The s3c cpufreq driver does already aquire the mpll, so simply add a reference
to struct s3c_cpufreq_config to let set_fvco access it.

While struct clk is opaque the differenciation between samsung clock and
common clock is kept, as the samsung-clock mpll clk does not implement a
real set_rate.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-s3c24xx/cpufreq-utils.c              | 8 ++++++++
 arch/arm/plat-samsung/include/plat/cpu-freq-core.h | 1 +
 drivers/cpufreq/s3c24xx-cpufreq.c                  | 1 +
 3 files changed, 10 insertions(+)

diff --git a/arch/arm/mach-s3c24xx/cpufreq-utils.c b/arch/arm/mach-s3c24xx/cpufreq-utils.c
index 2a0aa56..c1b7508 100644
--- a/arch/arm/mach-s3c24xx/cpufreq-utils.c
+++ b/arch/arm/mach-s3c24xx/cpufreq-utils.c
@@ -14,6 +14,7 @@
 #include <linux/errno.h>
 #include <linux/cpufreq.h>
 #include <linux/io.h>
+#include <linux/clk.h>
 
 #include <mach/map.h>
 #include <mach/regs-clock.h>
@@ -60,5 +61,12 @@ void s3c2410_cpufreq_setrefresh(struct s3c_cpufreq_config *cfg)
  */
 void s3c2410_set_fvco(struct s3c_cpufreq_config *cfg)
 {
+#ifdef CONFIG_SAMSUNG_CLOCK
 	__raw_writel(cfg->pll.driver_data, S3C2410_MPLLCON);
+#endif
+
+#ifdef CONFIG_COMMON_CLK
+	if (!IS_ERR(cfg->mpll))
+		clk_set_rate(cfg->mpll, cfg->pll.frequency);
+#endif
 }
diff --git a/arch/arm/plat-samsung/include/plat/cpu-freq-core.h b/arch/arm/plat-samsung/include/plat/cpu-freq-core.h
index 7231c8e..72d4178 100644
--- a/arch/arm/plat-samsung/include/plat/cpu-freq-core.h
+++ b/arch/arm/plat-samsung/include/plat/cpu-freq-core.h
@@ -119,6 +119,7 @@ struct s3c_plltab {
 struct s3c_cpufreq_config {
 	struct s3c_freq		freq;
 	struct s3c_freq		max;
+	struct clk		*mpll;
 	struct cpufreq_frequency_table pll;
 	struct s3c_clkdivs	divs;
 	struct s3c_cpufreq_info *info;	/* for core, not drivers */
diff --git a/drivers/cpufreq/s3c24xx-cpufreq.c b/drivers/cpufreq/s3c24xx-cpufreq.c
index be1b2b5..227ebf7 100644
--- a/drivers/cpufreq/s3c24xx-cpufreq.c
+++ b/drivers/cpufreq/s3c24xx-cpufreq.c
@@ -141,6 +141,7 @@ static int s3c_cpufreq_calcdivs(struct s3c_cpufreq_config *cfg)
 
 static void s3c_cpufreq_setfvco(struct s3c_cpufreq_config *cfg)
 {
+	cfg->mpll = _clk_mpll;
 	(cfg->info->set_fvco)(cfg);
 }
 
-- 
1.9.0
