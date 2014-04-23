From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 1/9] ARM: S3C24XX: cpufreq-utils: don't write raw values
 to MPLLCON when using ccf
Date: Thu, 24 Apr 2014 00:42:19 +0400
Message-ID: <535825AB.8060802@cogentembedded.com>
References: <2104342.rkElQpXtvM@phil> <5855371.5GIoOu8EnE@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:42449 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754033AbaDWUmV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Apr 2014 16:42:21 -0400
Received: by mail-la0-f43.google.com with SMTP id c6so1274971lan.30
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2014 13:42:20 -0700 (PDT)
In-Reply-To: <5855371.5GIoOu8EnE@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>
Cc: t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org

Hello.

On 04/23/2014 11:34 PM, Heiko St=FCbner wrote:

> The s3c24xx cpufreq driver needs to change the mpll speed and was doi=
ng
> this by writing raw values from a translation table into the MPLLCON
> register.

> Change this to use a regular clk_set_rate call when using the common
> clock framework and only write the raw value in the samsung_clock cas=
e.

> To not needing to create additional infrastructure for this, the mpll=
 clock
> is requested at the first call to s3c2410_set_fvco().

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   arch/arm/mach-s3c24xx/cpufreq-utils.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)

> diff --git a/arch/arm/mach-s3c24xx/cpufreq-utils.c b/arch/arm/mach-s3=
c24xx/cpufreq-utils.c
> index 2a0aa56..d5e797b 100644
> --- a/arch/arm/mach-s3c24xx/cpufreq-utils.c
> +++ b/arch/arm/mach-s3c24xx/cpufreq-utils.c
[...]
> @@ -60,5 +61,18 @@ void s3c2410_cpufreq_setrefresh(struct s3c_cpufreq=
_config *cfg)
>    */
>   void s3c2410_set_fvco(struct s3c_cpufreq_config *cfg)
>   {
> +#ifdef CONFIG_SAMSUNG_CLOCK
>   	__raw_writel(cfg->pll.driver_data, S3C2410_MPLLCON);
> +#endif
> +
> +#ifdef CONFIG_COMMON_CLK
> +	static struct clk *mpll;
> +
> +	if (!mpll)

    You are testing uninitialized variable. This check wouldn't make mu=
ch=20
sense even if the variable was initialized.

> +		mpll =3D clk_get(NULL, "mpll")
> +	if (IS_ERR(mpll))
> +		return;
> +
> +	clk_set_rate(mpll, cfg->pll.frequency);
> +#endif
>   }

WBR, Sergei
