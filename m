From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V3] ARM: SAMSUNG: Delete the unnecessary variable
Date: Fri, 23 Nov 2012 16:51:08 +0530
Message-ID: <CAAgF-BecOUxS42-C5RfsU4fZvTsma_Jxc4gMKJGNzsK_pXgkTA@mail.gmail.com>
References: <1352177618-16460-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:37182 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753854Ab2KWLVK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 06:21:10 -0500
Received: by mail-lb0-f174.google.com with SMTP id gi11so4130637lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Nov 2012 03:21:08 -0800 (PST)
In-Reply-To: <1352177618-16460-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, olofj@google.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

cc'ing Mark Brown

On Tue, Nov 6, 2012 at 10:23 AM, Padmavathi Venna <padma.v@samsung.com> wrote:
> As the RCLK src clks are registered with clkdev using generic
> connection id , these clk names need not to be passed through
> platform data. So it is deleted.
>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>
> Changes since V2:
>         - Rebased on 3.7-rc3
>
>  include/linux/platform_data/asoc-s3c.h |    6 ------
>  1 files changed, 0 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/platform_data/asoc-s3c.h b/include/linux/platform_data/asoc-s3c.h
> index aa9875f..8827259 100644
> --- a/include/linux/platform_data/asoc-s3c.h
> +++ b/include/linux/platform_data/asoc-s3c.h
> @@ -38,12 +38,6 @@ struct samsung_i2s {
>  #define QUIRK_NEED_RSTCLR      (1 << 3)
>         /* Quirks of the I2S controller */
>         u32 quirks;
> -
> -       /*
> -        * Array of clock names that can be used to generate I2S signals.
> -        * Also corresponds to clocks of I2SMOD[10]
> -        */
> -       const char **src_clk;
>         dma_addr_t idma_addr;
>  };
>
> --
> 1.7.4.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
