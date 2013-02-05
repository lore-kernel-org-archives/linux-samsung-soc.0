From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH v3 4/5] ARM: dts: adds FIMD AUXDATA node entry for exynos4 DT
Date: Tue, 5 Feb 2013 11:09:53 +0530
Message-ID: <CAGm_ybiwNw9trsRvXSjnTCx=1SRp7drfAUUw1EMG+K02RAJm2A@mail.gmail.com>
References: <1359718376-21947-1-git-send-email-vikas.sajjan@linaro.org>
	<1359718376-21947-5-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:64240 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751147Ab3BEFjy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 00:39:54 -0500
Received: by mail-wg0-f47.google.com with SMTP id dr13so5236322wgb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Feb 2013 21:39:53 -0800 (PST)
In-Reply-To: <1359718376-21947-5-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org

Hi,

any more comments for the below patch.

On Fri, Feb 1, 2013 at 5:02 PM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> This patch adds the FIMD AUXDATA node
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  arch/arm/mach-exynos/mach-exynos4-dt.c |    4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
> index 2a2c96a..9536657 100644
> --- a/arch/arm/mach-exynos/mach-exynos4-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
> @@ -13,6 +13,7 @@
>
>  #include <linux/of_platform.h>
>  #include <linux/serial_core.h>
> +#include <linux/fb.h>
>
>  #include <asm/mach/arch.h>
>  #include <asm/hardware/gic.h>
> @@ -80,6 +81,9 @@ static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
>         OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_MDMA1, "dma-pl330.2", NULL),
>         OF_DEV_AUXDATA("samsung,exynos4210-tmu", EXYNOS4_PA_TMU,
>                                 "exynos-tmu", NULL),
> +       OF_DEV_AUXDATA("samsung,exynos4-fimd", EXYNOS4_PA_FIMD0,
> +                       "exynos4-fb.0", NULL),
> +
>         {},
>  };
>
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
