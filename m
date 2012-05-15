From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 07/20] ARM: EXYNOS: Add pre-divider and fout mux clocks for
 bpll and mpll
Date: Tue, 15 May 2012 16:09:20 +0900
Message-ID: <07e401cd3269$a65d9c40$f318d4c0$%kim@samsung.com>
References: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org>
 <1335813270-13083-8-git-send-email-thomas.abraham@linaro.org>
 <019601cd2dd9$3da83780$b8f8a680$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62425 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756348Ab2EOHJV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 May 2012 03:09:21 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4100LUXYJ9T950@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 May 2012 16:09:19 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M41003WCYJH8810@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 May 2012 16:09:18 +0900 (KST)
In-reply-to: <019601cd2dd9$3da83780$b8f8a680$%kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, 'Kisoo Yu' <ksoo.yu@samsung.com>

Kukjin Kim wrote:
> 
> Thomas Abraham wrote:
> >
> > From: Kisoo Yu <ksoo.yu@samsung.com>
> >
> > The fout clock of BPLL and MPLL have a selectable source in rev1 of
> > EXYNOS5. The clock options are a fixed divided by 2 clock and the
> > output of the PLL itself. Add support for these new clock instances.
> >
> > Signed-off-by: Kisoo Yu <ksoo.yu@samsung.com>
> > Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> > [kgene.kim@samsung.com: temporary apply this because I
> > don't want to add pll stuff in each clock not commonly]
> 
> As I commented, I won't apply this because pll stuff should be added in
> common file such as plat-s5p/clock.c even though the plat-s5p files moved
> into plat-samsung.
> 
I updated this myself. See below and if any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

From: Kisoo Yu <ksoo.yu@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Add pre-divider and fout mux clocks for bpll and mpll

The fout clock of BPLL and MPLL have a selectable source on EXYNOS5250.
The clock options are a fixed divided by 2 clock and the output of the
PLL itself. Add support for these new clock instances.

Signed-off-by: Kisoo Yu <ksoo.yu@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
[kgene.kim@samsung.com: moved common pll stuff into s5p-clock.c]
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos5.c           |   46 ++++++++++++++++++++++-
 arch/arm/mach-exynos/include/mach/regs-clock.h |    2 +
 arch/arm/plat-samsung/include/plat/s5p-clock.h |    4 ++
 arch/arm/plat-samsung/s5p-clock.c              |   30 +++++++++++++++
 4 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index 3c1af23..22b2e8a 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -165,11 +165,29 @@ static struct clksrc_clk exynos5_clk_sclk_apll = {
 	.reg_div = { .reg = EXYNOS5_CLKDIV_CPU0, .shift = 24, .size = 3 },
 };
 
+static struct clksrc_clk exynos5_clk_mout_bpll_fout = {
+	.clk	= {
+		.name		= "mout_bpll_fout",
+	},
+	.sources = &clk_src_bpll_fout,
+	.reg_src = { .reg = EXYNOS5_PLL_DIV2_SEL, .shift = 0, .size = 1 },
+};
+
+static struct clk *exynos5_clk_src_bpll_list[] = {
+	[0] = &clk_fin_bpll,
+	[1] = &exynos5_clk_mout_bpll_fout.clk,
+};
+
+static struct clksrc_sources exynos5_clk_src_bpll = {
+	.sources	= exynos5_clk_src_bpll_list,
+	.nr_sources	= ARRAY_SIZE(exynos5_clk_src_bpll_list),
+};
+
 static struct clksrc_clk exynos5_clk_mout_bpll = {
 	.clk	= {
 		.name		= "mout_bpll",
 	},
-	.sources = &clk_src_bpll,
+	.sources = &exynos5_clk_src_bpll,
 	.reg_src = { .reg = EXYNOS5_CLKSRC_CDREX, .shift = 0, .size = 1 },
 };
 
@@ -207,11 +225,29 @@ static struct clksrc_clk exynos5_clk_mout_epll = {
 	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP2, .shift = 12, .size = 1 },
 };
 
+static struct clksrc_clk exynos5_clk_mout_mpll_fout = {
+	.clk	= {
+		.name		= "mout_mpll_fout",
+	},
+	.sources = &clk_src_mpll_fout,
+	.reg_src = { .reg = EXYNOS5_PLL_DIV2_SEL, .shift = 4, .size = 1 },
+};
+
+static struct clk *exynos5_clk_src_mpll_list[] = {
+	[0] = &clk_fin_mpll,
+	[1] = &exynos5_clk_mout_mpll_fout.clk,
+};
+
+static struct clksrc_sources exynos5_clk_src_mpll = {
+	.sources	= exynos5_clk_src_mpll_list,
+	.nr_sources	= ARRAY_SIZE(exynos5_clk_src_mpll_list),
+};
+
 struct clksrc_clk exynos5_clk_mout_mpll = {
 	.clk = {
 		.name		= "mout_mpll",
 	},
-	.sources = &clk_src_mpll,
+	.sources = &exynos5_clk_src_mpll,
 	.reg_src = { .reg = EXYNOS5_CLKSRC_CORE1, .shift = 8, .size = 1 },
 };
 
@@ -1036,10 +1072,12 @@ static struct clksrc_clk *exynos5_sysclks[] = {
 	&exynos5_clk_mout_apll,
 	&exynos5_clk_sclk_apll,
 	&exynos5_clk_mout_bpll,
+	&exynos5_clk_mout_bpll_fout,
 	&exynos5_clk_mout_bpll_user,
 	&exynos5_clk_mout_cpll,
 	&exynos5_clk_mout_epll,
 	&exynos5_clk_mout_mpll,
+	&exynos5_clk_mout_mpll_fout,
 	&exynos5_clk_mout_mpll_user,
 	&exynos5_clk_vpllsrc,
 	&exynos5_clk_sclk_vpll,
@@ -1103,7 +1141,9 @@ static struct clk *exynos5_clks[] __initdata = {
 	&exynos5_clk_sclk_hdmi27m,
 	&exynos5_clk_sclk_hdmiphy,
 	&clk_fout_bpll,
+	&clk_fout_bpll_div2,
 	&clk_fout_cpll,
+	&clk_fout_mpll_div2,
 	&exynos5_clk_armclk,
 };
 
@@ -1268,8 +1308,10 @@ void __init_or_cpufreq exynos5_setup_clocks(void)
 
 	clk_fout_apll.ops = &exynos5_fout_apll_ops;
 	clk_fout_bpll.rate = bpll;
+	clk_fout_bpll_div2.rate = bpll >> 1;
 	clk_fout_cpll.rate = cpll;
 	clk_fout_mpll.rate = mpll;
+	clk_fout_mpll_div2.rate = mpll >> 1;
 	clk_fout_epll.rate = epll;
 	clk_fout_vpll.rate = vpll;
 
diff --git a/arch/arm/mach-exynos/include/mach/regs-clock.h b/arch/arm/mach-exynos/include/mach/regs-clock.h
index 7395236..1acf660 100644
--- a/arch/arm/mach-exynos/include/mach/regs-clock.h
+++ b/arch/arm/mach-exynos/include/mach/regs-clock.h
@@ -316,6 +316,8 @@
 #define EXYNOS5_CLKSRC_CDREX			EXYNOS_CLKREG(0x20200)
 #define EXYNOS5_CLKDIV_CDREX			EXYNOS_CLKREG(0x20500)
 
+#define EXYNOS5_PLL_DIV2_SEL			EXYNOS_CLKREG(0x20A24)
+
 #define EXYNOS5_EPLL_LOCK			EXYNOS_CLKREG(0x10030)
 
 #define EXYNOS5_EPLLCON0_LOCKED_SHIFT		(29)
diff --git a/arch/arm/plat-samsung/include/plat/s5p-clock.h b/arch/arm/plat-samsung/include/plat/s5p-clock.h
index 1de4b32..8364b4b 100644
--- a/arch/arm/plat-samsung/include/plat/s5p-clock.h
+++ b/arch/arm/plat-samsung/include/plat/s5p-clock.h
@@ -32,8 +32,10 @@ extern struct clk clk_48m;
 extern struct clk s5p_clk_27m;
 extern struct clk clk_fout_apll;
 extern struct clk clk_fout_bpll;
+extern struct clk clk_fout_bpll_div2;
 extern struct clk clk_fout_cpll;
 extern struct clk clk_fout_mpll;
+extern struct clk clk_fout_mpll_div2;
 extern struct clk clk_fout_epll;
 extern struct clk clk_fout_dpll;
 extern struct clk clk_fout_vpll;
@@ -42,8 +44,10 @@ extern struct clk clk_vpll;
 
 extern struct clksrc_sources clk_src_apll;
 extern struct clksrc_sources clk_src_bpll;
+extern struct clksrc_sources clk_src_bpll_fout;
 extern struct clksrc_sources clk_src_cpll;
 extern struct clksrc_sources clk_src_mpll;
+extern struct clksrc_sources clk_src_mpll_fout;
 extern struct clksrc_sources clk_src_epll;
 extern struct clksrc_sources clk_src_dpll;
 
diff --git a/arch/arm/plat-samsung/s5p-clock.c b/arch/arm/plat-samsung/s5p-clock.c
index 41d3dfd..031a618 100644
--- a/arch/arm/plat-samsung/s5p-clock.c
+++ b/arch/arm/plat-samsung/s5p-clock.c
@@ -67,6 +67,11 @@ struct clk clk_fout_bpll = {
 	.id		= -1,
 };
 
+struct clk clk_fout_bpll_div2 = {
+	.name		= "fout_bpll_div2",
+	.id		= -1,
+};
+
 /* CPLL clock output */
 
 struct clk clk_fout_cpll = {
@@ -82,6 +87,11 @@ struct clk clk_fout_mpll = {
 	.id		= -1,
 };
 
+struct clk clk_fout_mpll_div2 = {
+	.name		= "fout_mpll_div2",
+	.id		= -1,
+};
+
 /* EPLL clock output */
 struct clk clk_fout_epll = {
 	.name		= "fout_epll",
@@ -125,6 +135,16 @@ struct clksrc_sources clk_src_bpll = {
 	.nr_sources	= ARRAY_SIZE(clk_src_bpll_list),
 };
 
+static struct clk *clk_src_bpll_fout_list[] = {
+	[0] = &clk_fout_bpll_div2,
+	[1] = &clk_fout_bpll,
+};
+
+struct clksrc_sources clk_src_bpll_fout = {
+	.sources	= clk_src_bpll_fout_list,
+	.nr_sources	= ARRAY_SIZE(clk_src_bpll_fout_list),
+};
+
 /* Possible clock sources for CPLL Mux */
 static struct clk *clk_src_cpll_list[] = {
 	[0] = &clk_fin_cpll,
@@ -147,6 +167,16 @@ struct clksrc_sources clk_src_mpll = {
 	.nr_sources	= ARRAY_SIZE(clk_src_mpll_list),
 };
 
+static struct clk *clk_src_mpll_fout_list[] = {
+	[0] = &clk_fout_mpll_div2,
+	[1] = &clk_fout_mpll,
+};
+
+struct clksrc_sources clk_src_mpll_fout = {
+	.sources	= clk_src_mpll_fout_list,
+	.nr_sources	= ARRAY_SIZE(clk_src_mpll_fout_list),
+};
+
 /* Possible clock sources for EPLL Mux */
 static struct clk *clk_src_epll_list[] = {
 	[0] = &clk_fin_epll,
-- 
1.7.1
