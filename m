From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/2] clk: samsung: fix several typos to fix boot on s3c2410
Date: Mon, 23 Jun 2014 23:16:33 +0200
Message-ID: <1492854.pz7FvnzIM4@diego>
References: <1403555350-14895-1-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:38585 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753830AbaFWVPU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 17:15:20 -0400
In-Reply-To: <1403555350-14895-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am Montag, 23. Juni 2014, 23:29:09 schrieb Vasily Khoruzhick:
> There's a several typos in a driver: 2410 instead of S3C2410
> and wrong argument to ARRAY_SIZE(). They prevent s3c2410
> from properly booting.
> 
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>

Thanks for catching these.
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/clk/samsung/clk-s3c2410.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-s3c2410.c
> b/drivers/clk/samsung/clk-s3c2410.c index ba07168..bd9a873 100644
> --- a/drivers/clk/samsung/clk-s3c2410.c
> +++ b/drivers/clk/samsung/clk-s3c2410.c
> @@ -378,7 +378,7 @@ void __init s3c2410_common_clk_init(struct device_node
> *np, unsigned long xti_f, if (!np)
>  		s3c2410_common_clk_register_fixed_ext(ctx, xti_f);
> 
> -	if (current_soc == 2410) {
> +	if (current_soc == S3C2410) {
>  		if (_get_rate("xti") == 12 * MHZ) {
>  			s3c2410_plls[mpll].rate_table = pll_s3c2410_12mhz_tbl;
>  			s3c2410_plls[upll].rate_table = pll_s3c2410_12mhz_tbl;
> @@ -432,7 +432,7 @@ void __init s3c2410_common_clk_init(struct device_node
> *np, unsigned long xti_f, samsung_clk_register_fixed_factor(ctx,
> s3c2410_ffactor,
>  				ARRAY_SIZE(s3c2410_ffactor));
>  		samsung_clk_register_alias(ctx, s3c2410_aliases,
> -			ARRAY_SIZE(s3c2410_common_aliases));
> +			ARRAY_SIZE(s3c2410_aliases));
>  		break;
>  	case S3C2440:
>  		samsung_clk_register_mux(ctx, s3c2440_muxes,
