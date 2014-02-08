From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 01/12] ARM: S3C24XX: cpufreq-utils: don't write raw values
 to MPLLCON when using ccf
Date: Sat, 08 Feb 2014 21:23:24 +0100
Message-ID: <52F6923C.3040103@gmail.com>
References: <201312131356.40755.heiko@sntech.de> <201312131357.19899.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:55505 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751400AbaBHUXj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Feb 2014 15:23:39 -0500
Received: by mail-ea0-f174.google.com with SMTP id b10so2168068eae.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 08 Feb 2014 12:23:37 -0800 (PST)
In-Reply-To: <201312131357.19899.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>
Cc: t.figa@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Heiko,

On 13.12.2013 13:57, Heiko St=C3=BCbner wrote:
> The s3c24xx cpufreq driver needs to change the mpll speed and was doi=
ng
> this by writing raw values from a translation table into the MPLLCON
> register.
>
> Change this to use a regular clk_set_rate call when using the common
> clock framework and only write the raw value in the samsung_clock cas=
e.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   arch/arm/mach-s3c24xx/cpufreq-utils.c |   13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm/mach-s3c24xx/cpufreq-utils.c b/arch/arm/mach-s3=
c24xx/cpufreq-utils.c
> index 2a0aa56..680a031 100644
> --- a/arch/arm/mach-s3c24xx/cpufreq-utils.c
> +++ b/arch/arm/mach-s3c24xx/cpufreq-utils.c
> @@ -14,6 +14,7 @@
>   #include <linux/errno.h>
>   #include <linux/cpufreq.h>
>   #include <linux/io.h>
> +#include <linux/clk.h>
>
>   #include <mach/map.h>
>   #include <mach/regs-clock.h>
> @@ -60,5 +61,17 @@ void s3c2410_cpufreq_setrefresh(struct s3c_cpufreq=
_config *cfg)
>    */
>   void s3c2410_set_fvco(struct s3c_cpufreq_config *cfg)
>   {
> +#ifdef CONFIG_SAMSUNG_CLOCK
>   	__raw_writel(cfg->pll.driver_data, S3C2410_MPLLCON);
> +#endif
> +
> +#ifdef CONFIG_COMMON_CLK
> +	struct clk *mpll =3D clk_get(NULL, "mpll");
> +	if (IS_ERR(mpll))
> +		return;

Wouldn't it be more sensible to get the clock only once, at the time=20
cpufreq is initialized? This would avoid going through the list of all=20
clocks every CPU frequency change and be more semantically correct.

If there is no good place to put this clk_get() then maybe it could be=20
simply called on first call to s3c2410_set_fvco() and the clock saved t=
o=20
a static variable.

Best regards,
Tomasz
