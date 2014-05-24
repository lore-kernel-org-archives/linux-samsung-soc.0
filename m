From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH V2 1/2] ARM: EXYNOS: Update secondary boot addr for secure mode
Date: Sat, 24 May 2014 10:18:42 +0530
Message-ID: <CAK9yfHwdjaF1oS5Bv1346PsDfYLRoCUtkJyrN8bVqHVHh5+aPw@mail.gmail.com>
References: <1400557810-28428-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:33744 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750736AbaEXEsn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 May 2014 00:48:43 -0400
Received: by mail-ob0-f173.google.com with SMTP id wm4so6265193obc.32
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2014 21:48:42 -0700 (PDT)
In-Reply-To: <1400557810-28428-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>

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

 Kukjin,
This series is required for properly booting A15 cores on Arndale octa.
Please apply them.


-- 
With warm regards,
Sachin
