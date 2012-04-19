From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 05/12] ARM: Exynos5: Add MDMA0 clock instance
Date: Wed, 18 Apr 2012 18:20:27 -0700
Message-ID: <4F8F685B.3080006@samsung.com>
References: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org> <1334641595-25301-6-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:48272 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752568Ab2DSBU2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Apr 2012 21:20:28 -0400
Received: by pbcun15 with SMTP id un15so9606574pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Apr 2012 18:20:28 -0700 (PDT)
In-Reply-To: <1334641595-25301-6-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, boojin.kim@samsung.com

Thomas Abraham wrote:
> Add clock instance for MDMA0 controller.
> 
> Signed-off-by: Thomas Abraham<thomas.abraham@linaro.org>
> ---
>   arch/arm/mach-exynos/clock-exynos5.c |   11 +++++++++--
>   1 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
> index fb95e9b..0230ba8 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -768,9 +768,14 @@ static struct clk exynos5_clk_pdma = {
>   	.ctrlbit	= (1<<  1),
>   };
> 
> +static struct clk exynos5_clk_mdma0 = {
> +	.name		= "dma",
> +	.enable		= exynos5_clk_ip_acp_ctrl,
> +	.ctrlbit	= (1<<  1),
> +};
> +
>   static struct clk exynos5_clk_mdma1 = {
>   	.name		= "dma",
> -	.devname	= "dma-pl330.2",
>   	.enable		= exynos5_clk_ip_gen_ctrl,
>   	.ctrlbit	= (1<<  4),
>   };
> @@ -1057,6 +1062,7 @@ static struct clksrc_clk *exynos5_sysclks[] = {
> 
>   static struct clk *exynos5_clk_cdev[] = {
>   	&exynos5_clk_pdma,
> +	&exynos5_clk_mdma0,
>   	&exynos5_clk_mdma1,
>   };
> 
> @@ -1082,7 +1088,8 @@ static struct clk_lookup exynos5_clk_lookup[] = {
>   	CLKDEV_INIT("exynos4-sdhci.3", "mmc_busclk.2",&exynos5_clk_sclk_mmc3.clk),
>   	CLKDEV_INIT("dma-pl330.0", "apb_pclk",&exynos5_clk_pdma),
>   	CLKDEV_INIT("dma-pl330.1", "apb_pclk",&exynos5_clk_pdma),
> -	CLKDEV_INIT("dma-pl330.2", "apb_pclk",&exynos5_clk_mdma1),
> +	CLKDEV_INIT("dma-pl330.2", "apb_pclk",&exynos5_clk_mdma0),
> +	CLKDEV_INIT("dma-pl330.3", "apb_pclk",&exynos5_clk_mdma1),
>   };
> 
>   static unsigned long exynos5_epll_get_rate(struct clk *clk)

Well, mdma0 will not be used so we don't need this.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
