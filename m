From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH 3/3] ARM: Exynos5: add FIMD AUXDATA entry for exynos5 DT
Date: Wed, 27 Feb 2013 14:17:11 +0530
Message-ID: <CAGm_ybisARCE0xVZ-cpo4Y58hO5zSMkzZsy_fv4-VpRv0ivGOw@mail.gmail.com>
References: <1361877940-8559-1-git-send-email-l.krishna@samsung.com>
	<1361877940-8559-4-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:64357 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755697Ab3B0IrO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 03:47:14 -0500
Received: by mail-we0-f173.google.com with SMTP id r5so237759wey.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Feb 2013 00:47:12 -0800 (PST)
In-Reply-To: <1361877940-8559-4-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, sunil joshi <joshi@samsung.com>

Hi Leela,

On Tue, Feb 26, 2013 at 4:55 PM, Leela Krishna Amudala
<l.krishna@samsung.com> wrote:
> Adds the FIMD AUXDATA entry for Exynos5
>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/mach-exynos/include/mach/map.h | 1 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c  | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
> index 1df6abb..5e3f789 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -178,6 +178,7 @@
>  #define EXYNOS4_PA_MIPI_CSIS1          0x11890000
>
>  #define EXYNOS4_PA_FIMD0               0x11C00000
> +#define EXYNOS5_PA_FIMD1               0x14400000
>
>  #define EXYNOS4_PA_HSMMC(x)            (0x12510000 + ((x) * 0x10000))
>  #define EXYNOS4_PA_DWMCI               0x12550000
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
> index e99d3d8..14b3ec1 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -104,6 +104,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
>         OF_DEV_AUXDATA("samsung,mfc-v6", 0x11000000, "s5p-mfc-v6", NULL),
>         OF_DEV_AUXDATA("samsung,exynos5250-tmu", 0x10060000,
>                                 "exynos-tmu", NULL),
> +       OF_DEV_AUXDATA("samsung,exynos5-fimd", EXYNOS5_PA_FIMD1,
> +                               "exynos5-fb.1", NULL),
 please refer to the discussion at https://patchwork.kernel.org/patch/2144861/
>         {},
>  };
>
> --
> 1.8.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
