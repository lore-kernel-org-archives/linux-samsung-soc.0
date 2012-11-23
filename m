From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V3] ARM: EXYNOS5: Add I2S SFR base addresse
Date: Fri, 23 Nov 2012 16:54:30 +0530
Message-ID: <CAAgF-BdZZtm-p4-3ohCXmznsHG3PgGvfZ4RuJXBjg8D6OD2vDg@mail.gmail.com>
References: <1352176605-16153-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:57719 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755806Ab2KWLYc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 06:24:32 -0500
Received: by mail-la0-f46.google.com with SMTP id p5so4251582lag.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Nov 2012 03:24:31 -0800 (PST)
In-Reply-To: <1352176605-16153-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, olofj@google.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

cc'ing Mark Brown

On Tue, Nov 6, 2012 at 10:06 AM, Padmavathi Venna <padma.v@samsung.com> wrote:
> This patch adds I2S controller0,1,2 base addresses
>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>
> Changes since V2:
>         - Rebased on 3.7-rc3
>
> Changes since V1:
>         - Rebased on 3.6-rc6
>         - Reverted Exynos4 I2S1,2 address changes that are added in V1
>           as Exynos4 based boards have different I2S base addresses.
>
>  arch/arm/mach-exynos/include/mach/map.h |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
> index ef4958b..4192d23 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -42,6 +42,9 @@
>  #define EXYNOS4_PA_I2S0                        0x03830000
>  #define EXYNOS4_PA_I2S1                        0xE3100000
>  #define EXYNOS4_PA_I2S2                        0xE2A00000
> +#define EXYNOS5_PA_I2S0                        0x03830000
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
