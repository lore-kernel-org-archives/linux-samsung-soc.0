From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: EXYNOS: Move G2D clock entries to
 clock-exynos4210.c file
Date: Fri, 13 Jul 2012 22:38:13 +0900
Message-ID: <118701cd60fc$c06e6da0$414b48e0$%kim@samsung.com>
References: <1337314071-15305-1-git-send-email-sachin.kamat@linaro.org>
 <1337314071-15305-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:30292 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756673Ab2GMNiQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 09:38:16 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7300F6PPVRO9T0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jul 2012 22:38:15 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M73006TZPVQLT90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jul 2012 22:38:14 +0900 (KST)
In-reply-to: <1337314071-15305-2-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> G2D clock registers are different in Exynos4210 and Exynos4X12 SoCs.
> Hence moving the SoC specific G2D clock entries from common clock file
> (clock-exynos4.c) to Exynos4210 specific clock file (clock-exynos4210.c).
> 
Yeah, I agree but there are small comments.

[snip]

> +static struct clksrc_clk exynos4_clk_mout_g2d0 = {

In this case, 'exynos4210_clk_mout_g2d0' is clearer, it is static though.

> +	.clk	= {
> +		.name		= "mout_g2d0",
> +	},
> +	.sources = &exynos4_clkset_mout_g2d0,
> +	.reg_src = { .reg = EXYNOS4_CLKSRC_IMAGE, .shift = 0, .size = 1 },
> +};
> +
> +static struct clksrc_clk exynos4_clk_mout_g2d1 = {

Same as above, exynos4210_clk_mout_g2d1.

> +	.clk	= {
> +		.name		= "mout_g2d1",
> +	},
> +	.sources = &exynos4_clkset_mout_g2d1,
> +	.reg_src = { .reg = EXYNOS4_CLKSRC_IMAGE, .shift = 4, .size = 1 },
> +};
> +
> +static struct clk *exynos4_clkset_mout_g2d_list[] = {

Same, exynos4210_clkset_mout_g2d_list[]

> +	[0] = &exynos4_clk_mout_g2d0.clk,

exynos4210_clk_mout_g2d0.clk

> +	[1] = &exynos4_clk_mout_g2d1.clk,

exynos4210_clk_mout_g2d1.clk

> +};
> +
> +static struct clksrc_sources exynos4_clkset_mout_g2d = {

Same, exynos4210_clkset_mout_g2d

> +	.sources	= exynos4_clkset_mout_g2d_list,

exynos4210_clkset_mout_g2d_list

> +	.nr_sources	= ARRAY_SIZE(exynos4_clkset_mout_g2d_list),

exynos4210_clkset_mout_g2d_list

> +};
> +
>  static int exynos4_clksrc_mask_lcd1_ctrl(struct clk *clk, int enable)
>  {
>  	return s5p_gatectrl(EXYNOS4210_CLKSRC_MASK_LCD1, clk, enable);
> @@ -74,6 +100,13 @@ static struct clksrc_clk clksrcs[] = {
>  		.sources = &exynos4_clkset_group,
>  		.reg_src = { .reg = EXYNOS4210_CLKSRC_LCD1, .shift =
> 0, .size = 4 },
>  		.reg_div = { .reg = EXYNOS4210_CLKDIV_LCD1, .shift =
> 0, .size = 4 },
> +	}, {
> +		.clk	= {
> +			.name		= "sclk_fimg2d",
> +		},
> +		.sources = &exynos4_clkset_mout_g2d,

exynos4210_clkset_mout_g2d

[snip]

Could you please re-submit this after re-working on top of my
next/devel-samsung.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
