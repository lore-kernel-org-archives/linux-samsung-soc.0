From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH 6/8] arm: exynos: config exynos5 hdmi-hpd gpio
Date: Thu, 4 Oct 2012 17:15:53 +0900
Message-ID: <CAH9JG2U=Rv4t7j5vwn=MBhJJRLO4sYotRitxfc9HqLhH=u=tMw@mail.gmail.com>
References: <1349367268-32553-1-git-send-email-rahul.sharma@samsung.com>
	<1349367268-32553-7-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:54425 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964799Ab2JDIPz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Oct 2012 04:15:55 -0400
Received: by mail-we0-f174.google.com with SMTP id t9so156191wey.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Oct 2012 01:15:53 -0700 (PDT)
In-Reply-To: <1349367268-32553-7-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, fahad.k@samsung.com, l.krishna@samsung.com, r.sh.open@gmail.com

On 10/5/12, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> This patch adds support for the configuration of exynos5 hdmi-hpd gpio.
> It sets the gpio fucntion to EINT which is required for recieving
> external hpd interrupt in drm hdmi driver.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  arch/arm/mach-exynos/mach-exynos5-dt.c |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c
> b/arch/arm/mach-exynos/mach-exynos5-dt.c
> index 003963c..9a6d569 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -11,6 +11,7 @@
>
>  #include <linux/of_platform.h>
>  #include <linux/serial_core.h>
> +#include <linux/gpio.h>
>
>  #include <asm/mach/arch.h>
>  #include <asm/hardware/gic.h>
> @@ -18,6 +19,7 @@
>
>  #include <plat/cpu.h>
>  #include <plat/regs-serial.h>
> +#include <plat/gpio-cfg.h>
>
>  #include "common.h"
>
> @@ -81,10 +83,17 @@ static void __init exynos5250_dt_map_io(void)
>  	s3c24xx_init_clocks(24000000);
>  }
>
> +static void smdk_hpd_setup(void)
> +{
> +	s3c_gpio_cfgpin(EXYNOS5_GPX3(7), S3C_GPIO_SFN(0xf));
> +	s3c_gpio_setpull(EXYNOS5_GPX3(7), S3C_GPIO_PULL_DOWN);
> +}
these should be described at dts file instead of here. and name is not
good. smdk...

Thank you,
Kyungmin Park
> +
>  static void __init exynos5250_dt_machine_init(void)
>  {
>  	of_platform_populate(NULL, of_default_bus_match_table,
>  				exynos5250_auxdata_lookup, NULL);
> +	smdk_hpd_setup();
>  }
>
>  static char const *exynos5250_dt_compat[] __initdata = {
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
