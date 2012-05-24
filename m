From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/6] ARM: Exynos5: Add spi clock support
Date: Thu, 24 May 2012 16:30:04 +0900
Message-ID: <006b01cd397f$09784840$1c68d8c0$%kim@samsung.com>
References: <1337334392-6441-1-git-send-email-thomas.abraham@linaro.org>
 <1337334392-6441-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:29756 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751263Ab2EXHaG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 May 2012 03:30:06 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4I00013NHKVKG0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 May 2012 16:30:05 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4I0093LNI4J520@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 May 2012 16:30:04 +0900 (KST)
In-reply-to: <1337334392-6441-3-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, jaswinder.singh@linaro.org, 'Kyoungil Kim' <ki0351.kim@samsung.com>

Thomas Abraham wrote:
> 
> Add support for clock instances for each spi controller.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> Acked-by: Jaswinder Singh <jaswinder.singh@linaro.org>
> ---
>  arch/arm/mach-exynos/clock-exynos5.c           |   98
> ++++++++++++++++++++++++
>  arch/arm/mach-exynos/include/mach/regs-clock.h |    4 +
>  2 files changed, 102 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-
> exynos/clock-exynos5.c
> index 5aa460b..ad6c959 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -82,6 +82,11 @@ static int exynos5_clksrc_mask_peric0_ctrl(struct clk
> *clk, int enable)
>  	return s5p_gatectrl(EXYNOS5_CLKSRC_MASK_PERIC0, clk, enable);
>  }
> 
> +static int exynos5_clksrc_mask_peric1_ctrl(struct clk *clk, int enable)
> +{
> +	return s5p_gatectrl(EXYNOS5_CLKSRC_MASK_PERIC1, clk, enable);
> +}
> +
>  static int exynos5_clk_ip_acp_ctrl(struct clk *clk, int enable)
>  {
>  	return s5p_gatectrl(EXYNOS5_CLKGATE_IP_ACP, clk, enable);
> @@ -692,6 +697,24 @@ static struct clk exynos5_init_clocks_off[] = {
>  		.enable		= exynos5_clk_ip_peric_ctrl,
>  		.ctrlbit	= (1 << 14),
>  	}, {
> +		.name		= "spi",
> +		.devname	= "exynos4210-spi.0",
> +		.parent		= &exynos5_clk_aclk_66.clk,
> +		.enable		= exynos5_clk_ip_peric_ctrl,
> +		.ctrlbit	= (1 << 16),
> +	}, {
> +		.name		= "spi",
> +		.devname	= "exynos4210-spi.1",
> +		.parent		= &exynos5_clk_aclk_66.clk,
> +		.enable		= exynos5_clk_ip_peric_ctrl,
> +		.ctrlbit	= (1 << 17),
> +	}, {
> +		.name		= "spi",
> +		.devname	= "exynos4210-spi.2",
> +		.parent		= &exynos5_clk_aclk_66.clk,
> +		.enable		= exynos5_clk_ip_peric_ctrl,
> +		.ctrlbit	= (1 << 18),
> +	}, {
>  		.name		= SYSMMU_CLOCK_NAME,
>  		.devname	= SYSMMU_CLOCK_DEVNAME(mfc_l, 0),
>  		.enable		= &exynos5_clk_ip_mfc_ctrl,
> @@ -985,6 +1008,72 @@ static struct clksrc_clk exynos5_clk_sclk_mmc3 = {
>  	.reg_div = { .reg = EXYNOS5_CLKDIV_FSYS2, .shift = 24, .size = 8 },
>  };
> 
> +static struct clksrc_clk exynos5_clk_mdout_spi0 = {

See the previous comments and below url.

http://lists.infradead.org/pipermail/linux-arm-kernel/2012-February/083153.h
tml

[...]

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
