From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 1/2] ARM: EXYNOS: Add clock support for Gscaler
Date: Wed, 01 Aug 2012 15:24:38 +0900
Message-ID: <033101cd6fae$53b4c180$fb1e4480$%kim@samsung.com>
References: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com>
 <1342789723-3949-2-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45501 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753710Ab2HAGYk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Aug 2012 02:24:40 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8200J5HCFPKS50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Aug 2012 15:24:38 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8200G51CH2GE60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Aug 2012 15:24:38 +0900 (KST)
In-reply-to: <1342789723-3949-2-git-send-email-shaik.ameer@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Shaik Ameer Basha' <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: sy0816.kang@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, sachin.kamat@linaro.org, joshi@samsung.com, shaik.samsung@gmail.com

Shaik Ameer Basha wrote:
> 
> Add required clock support for Gscaler for exynos5
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> Signed-off-by: Prathyush K <prathyush.k@samsung.com>
> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
> ---
>  arch/arm/mach-exynos/clock-exynos5.c |  100
> ++++++++++++++++++++++++++++++++++
>  1 files changed, 100 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-
> exynos/clock-exynos5.c
> index 774533c..49a76b1 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -552,6 +552,81 @@ static struct clksrc_clk exynos5_clk_aclk_66 = {
>  	.reg_div = { .reg = EXYNOS5_CLKDIV_TOP0, .shift = 0, .size = 3 },
>  };
> 
> +/* for aclk_300_gscl_mid */

No need above comment which is certain.

> +static struct clksrc_clk exynos5_clk_mout_aclk_300_gscl_mid = {
> +	.clk = {
> +		.name		= "mout_aclk_300_gscl_mid",
> +	},
> +	.sources = &exynos5_clkset_aclk,
> +	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP0, .shift = 24, .size = 1 },
> +};
> +
> +/* for aclk_300_gscl_mid1 */

Same as above.

> +static struct clk *exynos5_clkset_aclk_300_gscl_mid1_list[] = {
> +	[0] = &exynos5_clk_sclk_vpll.clk,
> +	[1] = &exynos5_clk_mout_cpll.clk,
> +};

In this case, the above sources can be used for gscl_mid1 and disp1_mid as
well. So how about exynos5_clkset_mid1_list?

> +
> +static struct clksrc_sources exynos5_clkset_aclk_300_gscl_mid1 = {
> +	.sources	= exynos5_clkset_aclk_300_gscl_mid1_list,
> +	.nr_sources	=
ARRAY_SIZE(exynos5_clkset_aclk_300_gscl_mid1_list),
> +};

If so, need to update this.

> +
> +

no need double empty lines.

> +static struct clksrc_clk exynos5_clk_mout_aclk_300_gscl_mid1 = {
> +	.clk    = {
> +		.name		= "mout_aclk_300_gscl_mid1",
> +	},
> +	.sources = &exynos5_clkset_aclk_300_gscl_mid1,
> +	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP1, .shift = 12, .size = 1 },
> +};
> +
> +/* for aclk_300_gscl */

no need useless comment.

> +static struct clk *exynos5_clkset_aclk_300_gscl_list[] = {
> +	[0] = &exynos5_clk_mout_aclk_300_gscl_mid.clk,
> +	[1] = &exynos5_clk_mout_aclk_300_gscl_mid1.clk,
> +};
> +
> +static struct clksrc_sources exynos5_clkset_aclk_300_gscl = {
> +	.sources	= exynos5_clkset_aclk_300_gscl_list,
> +	.nr_sources	= ARRAY_SIZE(exynos5_clkset_aclk_300_gscl_list),
> +};
> +
> +static struct clksrc_clk exynos5_clk_mout_aclk_300_gscl = {
> +	.clk    = {
            ^^^^
Tap please.

> +		.name		= "mout_aclk_300_gscl",
> +	},
> +	.sources = &exynos5_clkset_aclk_300_gscl,
> +	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP0, .shift = 25, .size = 1 },
> +};
> +
> +static struct clksrc_clk exynos5_clk_dout_aclk_300_gscl = {
> +	.clk    = {
            ^^^^
Same as above.

> +		.name		= "dout_aclk_300_gscl",
> +		.parent		= &exynos5_clk_mout_aclk_300_gscl.clk,
> +	},
> +	.reg_div = { .reg = EXYNOS5_CLKDIV_TOP1, .shift = 12, .size = 3 },
> +};

And I think, we don't need to define above 'clksrc_clk's?

+static struct clksrc_clk exynos5_clk_mdout_aclk_300_gscl = {
+	.clk    = {
+		.name		= "mdout_aclk_300_gscl",
+	},
+	.sources = &exynos5_clkset_aclk_300_gscl,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP0, .shift = 25, .size = 1 },
> +	.reg_div = { .reg = EXYNOS5_CLKDIV_TOP1, .shift = 12, .size = 3 },
+};

[...]

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
