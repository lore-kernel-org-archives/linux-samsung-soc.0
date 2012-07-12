From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: Convert S3C24XX I2S driver to gpiolib API
Date: Thu, 12 Jul 2012 15:56:36 +0200
Message-ID: <4FFED794.9050800@gmail.com>
References: <1341059876-29460-1-git-send-email-sylvester.nawrocki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:37937 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932387Ab2GLN4k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 09:56:40 -0400
Received: by eaak11 with SMTP id k11so760097eaa.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jul 2012 06:56:39 -0700 (PDT)
In-Reply-To: <1341059876-29460-1-git-send-email-sylvester.nawrocki@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, sbkim73@samsung.com, lrg@ti.com, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>

Hello,

On 06/30/2012 02:37 PM, Sylwester Nawrocki wrote:
> The s3c2410_gpio* calls are obsolete and have been scheduled for
> removal since several kernel releases. Remove them and use common
> gpiolib API.
> This patch is a prerequisite for removal of the S3C24XX SoC specific
> arch/arm/plat-samsung/include/gpio-fns.h header.
> 
> Cc: Ben Dooks<ben-linux@fluff.org>
> Signed-off-by: Sylwester Nawrocki<sylvester.nawrocki@gmail.com>
> ---
>   sound/soc/samsung/s3c24xx-i2s.c |   10 +++-------
>   1 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
> index c4aa4d4..0aae3a3 100644
> --- a/sound/soc/samsung/s3c24xx-i2s.c
> +++ b/sound/soc/samsung/s3c24xx-i2s.c
> @@ -23,7 +23,6 @@
>   #include<sound/soc.h>
>   #include<sound/pcm_params.h>
> 
> -#include<mach/regs-gpio.h>
>   #include<mach/dma.h>
>   #include<plat/regs-iis.h>
> 
> @@ -391,12 +390,9 @@ static int s3c24xx_i2s_probe(struct snd_soc_dai *dai)
>   	}
>   	clk_enable(s3c24xx_i2s.iis_clk);
> 
> -	/* Configure the I2S pins in correct mode */
> -	s3c2410_gpio_cfgpin(S3C2410_GPE0, S3C2410_GPE0_I2SLRCK);
> -	s3c2410_gpio_cfgpin(S3C2410_GPE1, S3C2410_GPE1_I2SSCLK);
> -	s3c2410_gpio_cfgpin(S3C2410_GPE2, S3C2410_GPE2_CDCLK);
> -	s3c2410_gpio_cfgpin(S3C2410_GPE3, S3C2410_GPE3_I2SSDI);
> -	s3c2410_gpio_cfgpin(S3C2410_GPE4, S3C2410_GPE4_I2SSDO);
> +	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
> +	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
> +			      S3C_GPIO_PULL_NONE);
> 
>   	writel(S3C2410_IISCON_IISEN, s3c24xx_i2s.regs + S3C2410_IISCON);
> 
> --

These are the only two patches (out of 15) that are now needed to remove
some obsolete s3c2410_gpio_* API. 1/2 was tested on Micro2440 board
and 2/2 is an identical change which wasn't tested on a real H/W since 
I don't have any s3c2412 based board. I'm a bit lost through which tree
should these be merged. Could someone please pick these patches up ?

--

Thanks,
Sylwester
