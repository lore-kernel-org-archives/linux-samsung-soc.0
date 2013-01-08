From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: EXYNOS: skip the clock initialization for exynos5440
Date: Mon, 7 Jan 2013 21:14:08 -0800
Message-ID: <CAOesGMjaaGtGh8SOJVUWU+nJ2kJ9ZfhA=ieutmZRuNYu=2W2gw@mail.gmail.com>
References: <1356996838-21796-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:40328 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750766Ab3AHFOJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jan 2013 00:14:09 -0500
Received: by mail-ie0-f181.google.com with SMTP id 16so34489iea.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Jan 2013 21:14:08 -0800 (PST)
In-Reply-To: <1356996838-21796-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Hi,

On Mon, Dec 31, 2012 at 3:33 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Since exynos5440 can support only common clk stuff, so this
> patch skips legacy exynos5 clock initialization.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-exynos/common.c |    7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index d6d0dc6..1a89824 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -424,11 +424,18 @@ static void __init exynos5_init_clocks(int xtal)
>  {
>         printk(KERN_DEBUG "%s: initializing clocks\n", __func__);
>
> +       /* EXYNOS5440 can support only common clock framework */
> +
> +       if (soc_is_exynos5440())
> +               return;
> +
> +#ifdef CONFIG_SOC_EXYNOS5250

Why are you adding an ifdef here, when the return above will take care
of returning early for 5440?


-Olof
