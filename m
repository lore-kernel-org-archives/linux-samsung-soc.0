From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH RESEND v2 1/2] ARM: EXYNOS: Add clock support for Gscaler
Date: Tue, 17 Jul 2012 07:38:42 +0900
Message-ID: <143701cd63a3$c0b81140$422833c0$%kim@samsung.com>
References: <1342416803-30809-1-git-send-email-shaik.ameer@samsung.com>
 <1342416803-30809-2-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:65123 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753322Ab2GPWio (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jul 2012 18:38:44 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M79001B5YVXG180@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Jul 2012 07:38:42 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7900AZPYWIET30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Jul 2012 07:38:42 +0900 (KST)
In-reply-to: <1342416803-30809-2-git-send-email-shaik.ameer@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Shaik Ameer Basha' <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, sachin.kamat@linaro.org, joshi@samsung.com, ameersk@gmail.com, sy0816.kang@samsung.com

Shaik Ameer Basha wrote:
> 
> Add required clock support for Gscaler for exynos5
> 
Hi, 

Cc'ed Sunyoung Kang who knows gscaler well in my team.

> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> Signed-off-by: Prathyush K <prathyush.k@samsung.com>
> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
> ---
>  arch/arm/mach-exynos/clock-exynos5.c |   79
> ++++++++++++++++++++++++++++++++++
>  1 files changed, 79 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-
> exynos/clock-exynos5.c
> index fefa336..c8293a3 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -741,6 +741,26 @@ static struct clk exynos5_init_clocks_off[] = {
>  		.enable		= exynos5_clk_ip_peric_ctrl,
>  		.ctrlbit	= (1 << 14),
>  	}, {
> +		.name		= "gscl",
> +		.devname	= "exynos-gsc.0",
> +		.enable		= exynos5_clk_ip_gscl_ctrl,
> +		.ctrlbit	= (1 << 0),

Sunyoung, I've seen (1 << 15) | (1 << 0) here instead, which one is right?

[snip]

I think, following part should be moved between 

---
static struct clksrc_clk exynos5_clk_aclk_66 = {
[snip]
};

<<<HERE>>>

static struct clk exynos5_init_clocks_off[] = {
---

Please don't put your clock code without any checking the clock code.


> +/* For ACLK_300_gscl_mid */
> +static struct clksrc_clk exynos5_clk_mout_aclk_300_gscl_mid = {
> +	.clk    = {
> +		.name   = "mout_aclk_300_gscl_mid",
> +	},
> +	.sources = &exynos5_clkset_aclk,
> +	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP0, .shift = 24, .size = 1 },
> +};
> +
> +/* For ACLK_300_gscl */
> +struct clk *exynos5_clkset_aclk_300_gscl_list[] = {
> +	[0] = &exynos5_clk_mout_aclk_300_gscl_mid.clk,
> +	[1] = &exynos5_clk_sclk_vpll.clk,

As I know, this is wrong. Its [1] should be
&exynos5_clk_mout_aclk_300_gscl_mid1.clk

> +};
> +
> +struct clksrc_sources exynos5_clkset_aclk_300_gscl = {
> +	.sources        = exynos5_clkset_aclk_300_gscl_list,
> +	.nr_sources     = ARRAY_SIZE(exynos5_clkset_aclk_300_gscl_list),
> +};
> +
> +static struct clksrc_clk exynos5_clk_mout_aclk_300_gscl = {
> +	.clk    = {
> +		.name           = "mout_aclk_300_gscl",
> +	},
> +	.sources = &exynos5_clkset_aclk_300_gscl,
> +	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP0, .shift = 25, .size = 1 },
> +};
> +
> +static struct clksrc_clk exynos5_clk_dout_aclk_300_gscl = {
> +	.clk    = {
> +		.name           = "dout_aclk_300_gscl",
> +		.parent         = &exynos5_clk_mout_aclk_300_gscl.clk,
> +	},
> +	.reg_div = { .reg = EXYNOS5_CLKDIV_TOP1, .shift = 12, .size = 3 },
> +};
> +
> +/* Possible clock sources for aclk_300_gscl_sub Mux */
> +static struct clk *clk_src_gscl_300_list[] = {
> +	[0] = &clk_ext_xtal_mux,
> +	[1] = &exynos5_clk_dout_aclk_300_gscl.clk,
> +};
> +
> +static struct clksrc_sources clk_src_gscl_300 = {
> +	.sources        = clk_src_gscl_300_list,
> +	.nr_sources     = ARRAY_SIZE(clk_src_gscl_300_list),
> +};
> +
> +static struct clksrc_clk exynos5_clk_aclk_300_gscl = {
> +	.clk    = {
> +		.name           = "aclk_300_gscl",
> +	},
> +	.sources = &clk_src_gscl_300,
> +	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP3, .shift = 10, .size = 1 },
> +};
> +

[snip]

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
