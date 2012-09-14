From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V2] ARM: EXYNOS5: Add bus clock and set parent clock for
 FIMD
Date: Fri, 14 Sep 2012 13:27:17 +0900
Message-ID: <001101cd9231$3927b9d0$ab772d70$%han@samsung.com>
References: <1347450536-21843-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33669 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750702Ab2INE1T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Sep 2012 00:27:19 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAB0070TOD86FH0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Sep 2012 13:27:17 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.119.56])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAB0097QODHFF10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Sep 2012 13:27:17 +0900 (KST)
In-reply-to: <1347450536-21843-1-git-send-email-l.krishna@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Leela Krishna Amudala' <l.krishna@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, 'Jingoo Han' <jg1.han@samsung.com>

On Wednesday, September 12, 2012 8:49 PM Leela Krishna Amudala wrote
> 
> This patch adds the bus clock for FIMD and changes the device name for lcd clock
> also sets mout_mpll_user as parent clock to fimd
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/mach-exynos/clock-exynos5.c       |   34 +++++++++++++++++++--------
>  arch/arm/plat-samsung/include/plat/clock.h |    2 +
>  2 files changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
> index 774533c..205d19f 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -891,6 +891,13 @@ static struct clk exynos5_clk_mdma1 = {

[.....]

> 
> +struct clksrc_clk exynos5_clk_sclk_fimd = {

Replace 'exynos5_clk_sclk_fimd' with 'exynos5_clk_sclk_fimd1'.
This is because 'exynos5_clk_sclk_fimd0' can be added for other
Exynos5 SoCs later.

Best regards,
Jingoo Han

> +	.clk	= {
> +		.name	        = "sclk_fimd",
> +		.devname        = "exynos5-fb.1",
> +		.enable         = exynos5_clksrc_mask_disp1_0_ctrl,
> +		.ctrlbit        = (1 << 0),
> +	},
> +	.sources = &exynos5_clkset_group,
> +	.reg_src = { .reg = EXYNOS5_CLKSRC_DISP1_0, .shift = 0, .size = 4 },
> +	.reg_div = { .reg = EXYNOS5_CLKDIV_DISP1_0, .shift = 0, .size = 4 },
> +};
> +
