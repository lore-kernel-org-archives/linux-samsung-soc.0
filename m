From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH V2 1/2] ARM: EXYNOS: Update secondary boot addr for secure mode
Date: Fri, 23 May 2014 09:42:01 +0530
Message-ID: <CAHbNUh2i8_ib-K6981G=g16MocKWM08iVyMLO3a5w9kJz177+A@mail.gmail.com>
References: <1400557810-28428-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:49715 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814AbaEWEMC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 00:12:02 -0400
Received: by mail-oa0-f46.google.com with SMTP id i4so5037202oah.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2014 21:12:01 -0700 (PDT)
In-Reply-To: <1400557810-28428-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Sachin Kamat <sachin.kamat@linaro.org>

On 20 May 2014 09:20, Tushar Behera <tushar.behera@linaro.org> wrote:
> From: Sachin Kamat <sachin.kamat@linaro.org>
>
> Almost all Exynos-series of SoCs that run in secure mode don't need
> additional offset for every CPU, with Exynos4412 being the only
> exception.
>
> Tested on Origen-Quad (Exynos4412) and Arndale-Octa (Exynos5420).
>
> While at it, fix the coding style (space around *).
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> Changes for V2:
> * Changed the condition statement as per review comment
> * Fixed coding style
>
>  arch/arm/mach-exynos/firmware.c |    9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>

Kukjin,

Would you please pick this patch and patch 2/2 for this merge window?

[PATCH RESEND 2/2] ARM: dts: Add secure firmware support for Arndale-octa

> diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
> index 739bdc8..7d18103 100644
> --- a/arch/arm/mach-exynos/firmware.c
> +++ b/arch/arm/mach-exynos/firmware.c
> @@ -50,8 +50,13 @@ static int exynos_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
>
>         boot_reg = sysram_ns_base_addr + 0x1c;
>
> -       if (!soc_is_exynos4212())
> -               boot_reg += 4*cpu;
> +       /*
> +        * Almost all Exynos-series of SoCs that run in secure mode don't need
> +        * additional offset for every CPU, with Exynos4412 being the only
> +        * exception.
> +        */
> +       if (soc_is_exynos4412())
> +               boot_reg += 4 * cpu;
>
>         __raw_writel(boot_addr, boot_reg);
>         return 0;
> --
> 1.7.9.5
>



-- 
Tushar Behera
