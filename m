From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V3 2/2] ARM: EXYNOS: Enable platform support for I2S controllers
Date: Fri, 23 Nov 2012 16:44:53 +0530
Message-ID: <CAAgF-Bdu7BWM8PeyfoPnMkeR4Ju=p4y9Lr5AP-JLiRcNm1E5XQ@mail.gmail.com>
References: <1352177084-16339-1-git-send-email-padma.v@samsung.com>
	<1352177084-16339-3-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:33951 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755407Ab2KWLOy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 06:14:54 -0500
Received: by mail-lb0-f174.google.com with SMTP id gi11so4127007lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Nov 2012 03:14:53 -0800 (PST)
In-Reply-To: <1352177084-16339-3-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

cc'ing Mark Brown

On Tue, Nov 6, 2012 at 10:14 AM, Padmavathi Venna <padma.v@samsung.com> wrote:
> Add AUXDATA entries for i2s controller driver so as to set the device
> name for clock lookups
>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  arch/arm/mach-exynos/mach-exynos5-dt.c |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
> index ed37273..93e63ec 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -86,6 +86,12 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
>                                 "exynos5-hdmi", NULL),
>         OF_DEV_AUXDATA("samsung,exynos5-mixer", 0x14450000,
>                                 "exynos5-mixer", NULL),
> +       OF_DEV_AUXDATA("samsung,samsung-i2s", EXYNOS5_PA_I2S0,
> +                               "samsung-i2s.0", NULL),
> +       OF_DEV_AUXDATA("samsung,samsung-i2s", EXYNOS5_PA_I2S1,
> +                               "samsung-i2s.1", NULL),
> +       OF_DEV_AUXDATA("samsung,samsung-i2s", EXYNOS5_PA_I2S2,
> +                               "samsung-i2s.2", NULL),
>         {},
>  };
>
> --
> 1.7.4.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
