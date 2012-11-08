From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: EXYNOS: Add missing static storage class
 specifiers in clock-exynos5.c
Date: Thu, 08 Nov 2012 13:53:14 +0900
Message-ID: <0cf001cdbd6c$f5edc350$e1c949f0$%kim@samsung.com>
References: <1352282991-19449-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53576 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754540Ab2KHExP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 23:53:15 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD500HNVK8QO8L0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Nov 2012 13:53:14 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD500ANAK8QRD60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Nov 2012 13:53:14 +0900 (KST)
In-reply-to: <1352282991-19449-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Fixes the following warnings:
> arch/arm/mach-exynos/clock-exynos5.c:300:19: warning:
> symbol 'exynos5_clk_mout_mpll' was not declared. Should it be static?
> arch/arm/mach-exynos/clock-exynos5.c:475:12: warning:
> symbol 'exynos5_clkset_aclk_top_list' was not declared. Should it be
> static?
> arch/arm/mach-exynos/clock-exynos5.c:480:23: warning:
> symbol 'exynos5_clkset_aclk' was not declared. Should it be static?
> arch/arm/mach-exynos/clock-exynos5.c:494:12: warning:
> symbol 'exynos5_clkset_aclk_333_166_list' was not declared. Should it be
> static?
> arch/arm/mach-exynos/clock-exynos5.c:499:23: warning:
> symbol 'exynos5_clkset_aclk_333_166' was not declared. Should it be
static?
> arch/arm/mach-exynos/clock-exynos5.c:989:12: warning:
> symbol 'exynos5_clkset_group_list' was not declared. Should it be static?
> arch/arm/mach-exynos/clock-exynos5.c:1002:23: warning:
> symbol 'exynos5_clkset_group' was not declared. Should it be static?
> arch/arm/mach-exynos/clock-exynos5.c:1218:19: warning:
> symbol 'exynos5_clk_sclk_fimd1' was not declared. Should it be static?
> arch/arm/mach-exynos/clock-exynos5.c:1499:20: warning:
> symbol 'exynos5_clock_syscore_ops' was not declared. Should it be static?
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos/clock-exynos5.c |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-
> exynos/clock-exynos5.c
> index a88e0d9..e48d7c2 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -297,7 +297,7 @@ static struct clksrc_sources exynos5_clk_src_mpll = {
>  	.nr_sources	= ARRAY_SIZE(exynos5_clk_src_mpll_list),
>  };
> 
> -struct clksrc_clk exynos5_clk_mout_mpll = {
> +static struct clksrc_clk exynos5_clk_mout_mpll = {
>  	.clk = {
>  		.name		= "mout_mpll",
>  	},
> @@ -472,12 +472,12 @@ static struct clksrc_clk exynos5_clk_pclk_acp = {
> 
>  /* Core list of CMU_TOP side */
> 
> -struct clk *exynos5_clkset_aclk_top_list[] = {
> +static struct clk *exynos5_clkset_aclk_top_list[] = {
>  	[0] = &exynos5_clk_mout_mpll_user.clk,
>  	[1] = &exynos5_clk_mout_bpll_user.clk,
>  };
> 
> -struct clksrc_sources exynos5_clkset_aclk = {
> +static struct clksrc_sources exynos5_clkset_aclk = {
>  	.sources	= exynos5_clkset_aclk_top_list,
>  	.nr_sources	= ARRAY_SIZE(exynos5_clkset_aclk_top_list),
>  };
> @@ -491,12 +491,12 @@ static struct clksrc_clk exynos5_clk_aclk_400 = {
>  	.reg_div = { .reg = EXYNOS5_CLKDIV_TOP0, .shift = 24, .size = 3 },
>  };
> 
> -struct clk *exynos5_clkset_aclk_333_166_list[] = {
> +static struct clk *exynos5_clkset_aclk_333_166_list[] = {
>  	[0] = &exynos5_clk_mout_cpll.clk,
>  	[1] = &exynos5_clk_mout_mpll_user.clk,
>  };
> 
> -struct clksrc_sources exynos5_clkset_aclk_333_166 = {
> +static struct clksrc_sources exynos5_clkset_aclk_333_166 = {
>  	.sources	= exynos5_clkset_aclk_333_166_list,
>  	.nr_sources	= ARRAY_SIZE(exynos5_clkset_aclk_333_166_list),
>  };
> @@ -986,7 +986,7 @@ static struct clk exynos5_clk_fimd1 = {
>  	.ctrlbit	= (1 << 0),
>  };
> 
> -struct clk *exynos5_clkset_group_list[] = {
> +static struct clk *exynos5_clkset_group_list[] = {
>  	[0] = &clk_ext_xtal_mux,
>  	[1] = NULL,
>  	[2] = &exynos5_clk_sclk_hdmi24m,
> @@ -999,7 +999,7 @@ struct clk *exynos5_clkset_group_list[] = {
>  	[9] = &exynos5_clk_mout_cpll.clk,
>  };
> 
> -struct clksrc_sources exynos5_clkset_group = {
> +static struct clksrc_sources exynos5_clkset_group = {
>  	.sources	= exynos5_clkset_group_list,
>  	.nr_sources	= ARRAY_SIZE(exynos5_clkset_group_list),
>  };
> @@ -1215,7 +1215,7 @@ static struct clksrc_clk exynos5_clk_sclk_spi2 = {
>  	.reg_div = { .reg = EXYNOS5_CLKDIV_PERIC2, .shift = 8, .size = 8 },
>  };
> 
> -struct clksrc_clk exynos5_clk_sclk_fimd1 = {
> +static struct clksrc_clk exynos5_clk_sclk_fimd1 = {
>  	.clk	= {
>  		.name		= "sclk_fimd",
>  		.devname	= "exynos5-fb.1",
> @@ -1496,7 +1496,7 @@ static void exynos5_clock_resume(void)
>  #define exynos5_clock_resume NULL
>  #endif
> 
> -struct syscore_ops exynos5_clock_syscore_ops = {
> +static struct syscore_ops exynos5_clock_syscore_ops = {
>  	.suspend	= exynos5_clock_suspend,
>  	.resume		= exynos5_clock_resume,
>  };
> --
> 1.7.4.1

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
