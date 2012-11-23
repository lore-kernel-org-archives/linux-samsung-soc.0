From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V3 4/5] ARM: S5PV210: Avoid passing the clks through
 platform data
Date: Fri, 23 Nov 2012 16:47:46 +0530
Message-ID: <CAAgF-BdiV9EMef8HiMtwCPR+byV-JDPMkWxVgoyQmDiWLgr27Q@mail.gmail.com>
References: <1352177317-16395-1-git-send-email-padma.v@samsung.com>
	<1352177317-16395-5-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:42979 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755660Ab2KWLRr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 06:17:47 -0500
Received: by mail-lb0-f174.google.com with SMTP id gi11so4128700lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Nov 2012 03:17:46 -0800 (PST)
In-Reply-To: <1352177317-16395-5-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, olofj@google.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

cc'ing Mark Brown.

On Tue, Nov 6, 2012 at 10:18 AM, Padmavathi Venna <padma.v@samsung.com> wrote:
> I2S controller has an internal mux for RCLK source clks. The list
> of source clk names were passed through platform data in non-dt case.
> The variable holding the list of RCLK source clk names is not
> required, as the list of clks need to be registered with clkdev
> using generic connection id. This is required as part of adding DT
> support for I2S controller driver.
>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  arch/arm/mach-s5pv210/dev-audio.c |   16 ----------------
>  1 files changed, 0 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm/mach-s5pv210/dev-audio.c b/arch/arm/mach-s5pv210/dev-audio.c
> index 0a5480b..addfb16 100644
> --- a/arch/arm/mach-s5pv210/dev-audio.c
> +++ b/arch/arm/mach-s5pv210/dev-audio.c
> @@ -20,11 +20,6 @@
>  #include <mach/irqs.h>
>  #include <mach/regs-audss.h>
>
> -static const char *rclksrc[] = {
> -       [0] = "busclk",
> -       [1] = "i2sclk",
> -};
> -
>  static int s5pv210_cfg_i2s(struct platform_device *pdev)
>  {
>         /* configure GPIO for i2s port */
> @@ -52,7 +47,6 @@ static struct s3c_audio_pdata i2sv5_pdata = {
>                 .i2s = {
>                         .quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI
>                                          | QUIRK_NEED_RSTCLR,
> -                       .src_clk = rclksrc,
>                         .idma_addr = S5PV210_AUDSS_INT_MEM,
>                 },
>         },
> @@ -75,18 +69,8 @@ struct platform_device s5pv210_device_iis0 = {
>         },
>  };
>
> -static const char *rclksrc_v3[] = {
> -       [0] = "iis",
> -       [1] = "audio-bus",
> -};
> -
>  static struct s3c_audio_pdata i2sv3_pdata = {
>         .cfg_gpio = s5pv210_cfg_i2s,
> -       .type = {
> -               .i2s = {
> -                       .src_clk = rclksrc_v3,
> -               },
> -       },
>  };
>
>  static struct resource s5pv210_iis1_resource[] = {
> --
> 1.7.4.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
