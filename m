From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 3/5] ARM: Exynos4: Add OF compatibility lookups for
 Exynos4 i2c adapters
Date: Wed, 5 Sep 2012 09:29:36 +0530
Message-ID: <CAJuYYwR3GEHjQ9UVUW_+ycDnqGHR2Wt9J0m2vQnqHi-UPvNZpQ@mail.gmail.com>
References: <1346748609-11115-1-git-send-email-t.figa@samsung.com>
	<1346748609-11115-4-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:37943 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751768Ab2IED7i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Sep 2012 23:59:38 -0400
Received: by lagy9 with SMTP id y9so36134lag.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Sep 2012 20:59:36 -0700 (PDT)
In-Reply-To: <1346748609-11115-4-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, jy0922.shim@samsung.com, kgene.kim@samsung.com

On 4 September 2012 14:20, Tomasz Figa <t.figa@samsung.com> wrote:
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/mach-exynos4-dt.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Acked-by: Thomas Abraham <thomas.abraham@linaro.org>

>
> diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
> index 8dad4ec..5f805b4 100644
> --- a/arch/arm/mach-exynos/mach-exynos4-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
> @@ -55,6 +55,20 @@ static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
>                                 "exynos4-sdhci.3", NULL),
>         OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(0),
>                                 "s3c2440-i2c.0", NULL),
> +       OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(1),
> +                               "s3c2440-i2c.1", NULL),
> +       OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(2),
> +                               "s3c2440-i2c.2", NULL),
> +       OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(3),
> +                               "s3c2440-i2c.3", NULL),
> +       OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(4),
> +                               "s3c2440-i2c.4", NULL),
> +       OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(5),
> +                               "s3c2440-i2c.5", NULL),
> +       OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(6),
> +                               "s3c2440-i2c.6", NULL),
> +       OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(7),
> +                               "s3c2440-i2c.7", NULL),
>         OF_DEV_AUXDATA("samsung,exynos4210-spi", EXYNOS4_PA_SPI0,
>                                 "exynos4210-spi.0", NULL),
>         OF_DEV_AUXDATA("samsung,exynos4210-spi", EXYNOS4_PA_SPI1,
> --
> 1.7.12
>
