From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Add I2S SFR base addresses
Date: Thu, 26 Jul 2012 10:11:40 +0530
Message-ID: <CAK9yfHxngNLMmO6Jhu3eAPYqb84asgz0A7OnLu7QfuNUbSpYxQ@mail.gmail.com>
References: <1343217938-30351-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:43455 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750868Ab2GZEll (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jul 2012 00:41:41 -0400
Received: by vbbff1 with SMTP id ff1so1292183vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jul 2012 21:41:40 -0700 (PDT)
In-Reply-To: <1343217938-30351-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rcsekar@samsung.com, sbkim73@samsung.com, sangsu4u.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, olofj@google.com, thutt@chromium.org, joshi@samsung.com

On 25 July 2012 17:35, Padmavathi Venna <padma.v@samsung.com> wrote:
> The base address of I2S 0 controller is similar in exynos4 and exynos5
> platforms. So this patch defines a common macro for the I2S controller
> 0 base address in both the platforms and use the same macro.
>
> This patch also defines the I2S controller 1,2 base addresses in exynos5
> and correct the I2S controller 1 base address in exynos4
>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  arch/arm/mach-exynos/dev-audio.c        |    2 +-
>  arch/arm/mach-exynos/include/mach/map.h |    6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/dev-audio.c b/arch/arm/mach-exynos/dev-audio.c
> index b33a5b6..5dbc9a2 100644
> --- a/arch/arm/mach-exynos/dev-audio.c
> +++ b/arch/arm/mach-exynos/dev-audio.c
> @@ -62,7 +62,7 @@ static struct s3c_audio_pdata i2sv5_pdata = {
>  };
>
>  static struct resource exynos4_i2s0_resource[] = {
> -       [0] = DEFINE_RES_MEM(EXYNOS4_PA_I2S0, SZ_256),
> +       [0] = DEFINE_RES_MEM(EXYNOS_PA_I2S0, SZ_256),
>         [1] = DEFINE_RES_DMA(DMACH_I2S0_TX),
>         [2] = DEFINE_RES_DMA(DMACH_I2S0_RX),
>         [3] = DEFINE_RES_DMA(DMACH_I2S0S_TX),
> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
> index c72b675..5cf7d91 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -39,9 +39,11 @@
>
>  #define EXYNOS4_PA_G2D                 0x12800000
>
> -#define EXYNOS4_PA_I2S0                        0x03830000
> -#define EXYNOS4_PA_I2S1                        0xE3100000
> +#define EXYNOS_PA_I2S0                 0x03830000
> +#define EXYNOS4_PA_I2S1                        0xE2100000
>  #define EXYNOS4_PA_I2S2                        0xE2A00000

As per the TRM, these addresses (I2S1 and I2S2) are 0x13960000 and
0x13970000 respectively on Exynos4412 SoC.
Please verify.


> +#define EXYNOS5_PA_I2S1                        0x12D60000
> +#define EXYNOS5_PA_I2S2                        0x12D70000
>
>  #define EXYNOS4_PA_PCM0                        0x03840000
>  #define EXYNOS4_PA_PCM1                        0x13980000
> --
> 1.7.4.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
With warm regards,
Sachin
