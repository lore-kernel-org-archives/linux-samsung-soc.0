From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 1/3] ARM: EXYNOS: Enable MDMA driver
Date: Wed, 01 Feb 2012 08:21:41 +0530
Message-ID: <4F28A8BD.9000601@linaro.org>
References: <1328025437-5396-1-git-send-email-kgene.kim@samsung.com> <1328025437-5396-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:63375 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753207Ab2BACvr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 21:51:47 -0500
Received: by iacb35 with SMTP id b35so805886iac.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2012 18:51:47 -0800 (PST)
In-Reply-To: <1328025437-5396-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Boojin Kim <boojin.kim@samsung.com>

On 01/31/2012 09:27 PM, Kukjin Kim wrote:
> From: Boojin Kim <boojin.kim@samsung.com>
> 
> This patch adds MDMA platform data and enables
> MDMA for DMA memcpy operation for EXYNOS SoCs.
> 
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-exynos/clock-exynos4.c           |    9 ++++++
>  arch/arm/mach-exynos/dma.c                     |   35 ++++++++++++++++++++++++
>  arch/arm/mach-exynos/include/mach/irqs.h       |    2 +
>  arch/arm/mach-exynos/include/mach/map.h        |    3 +-
>  arch/arm/plat-samsung/include/plat/dma-pl330.h |    8 +++++
>  5 files changed, 56 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-exynos/clock-exynos4.c
> index 411b366b..ffcc46b 100644
> --- a/arch/arm/mach-exynos/clock-exynos4.c
> +++ b/arch/arm/mach-exynos/clock-exynos4.c
> @@ -783,6 +783,13 @@ static struct clk exynos4_clk_pdma1 = {
>  	.ctrlbit	= (1 << 1),
>  };
>  
> +static struct clk exynos4_clk_mdma1 = {

exynos4_clk_mdma ?

> +	.name		= "dma",
> +	.devname	= "dma-pl330.2",
> +	.enable		= exynos4_clk_ip_image_ctrl,
> +	.ctrlbit	= ((1 << 8) | (1 << 5) | (1 << 2)),
> +};
> +
>  struct clk *exynos4_clkset_group_list[] = {
>  	[0] = &clk_ext_xtal_mux,
>  	[1] = &clk_xusbxti,
> @@ -1301,6 +1308,7 @@ static struct clksrc_clk *exynos4_sysclks[] = {
>  static struct clk *exynos4_clk_cdev[] = {
>  	&exynos4_clk_pdma0,
>  	&exynos4_clk_pdma1,
> +	&exynos4_clk_mdma,
>  };
>  
>  static struct clksrc_clk *exynos4_clksrc_cdev[] = {
> @@ -1329,6 +1337,7 @@ static struct clk_lookup exynos4_clk_lookup[] = {
>  	CLKDEV_INIT("s3c-sdhci.3", "mmc_busclk.2", &exynos4_clk_sclk_mmc3.clk),
>  	CLKDEV_INIT("dma-pl330.0", "apb_pclk", &exynos4_clk_pdma0),
>  	CLKDEV_INIT("dma-pl330.1", "apb_pclk", &exynos4_clk_pdma1),
> +	CLKDEV_INIT("dma-pl330.2", "apb_pclk", &exynos4_clk_mdma),
>  	CLKDEV_INIT("s3c64xx-spi.0", "spi_busclk0", &exynos4_clk_sclk_spi0.clk),
>  	CLKDEV_INIT("s3c64xx-spi.1", "spi_busclk0", &exynos4_clk_sclk_spi1.clk),
>  	CLKDEV_INIT("s3c64xx-spi.2", "spi_busclk0", &exynos4_clk_sclk_spi2.clk),


-- 
Tushar Behera
