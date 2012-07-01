From: Juergen Beisert <jbe@pengutronix.de>
Subject: Re: [PATCH 01/10] ARM: S3C24XX: Free the backlight gpio requested in Mini2440 board code
Date: Sun, 1 Jul 2012 19:36:28 +0200
Message-ID: <201207011936.28536.jbe@pengutronix.de>
References: <1341058142-30438-1-git-send-email-sylvester.nawrocki@gmail.com> <1341058142-30438-2-git-send-email-sylvester.nawrocki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:37983 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750864Ab2GARgj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Jul 2012 13:36:39 -0400
In-Reply-To: <1341058142-30438-2-git-send-email-sylvester.nawrocki@gmail.com>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Sylwester Nawrocki wrote:
> The backlight gpio must not be left requested in the board
> code, otherwise s3c24xx_led driver can't successfully claim it.
> So request the backlight gpio, configure it to proper state and
> gpio_free right away.
>
> This change is required for converting the s3c24xx_led driver
> to the gpiolib API.
>
> Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> ---
>  arch/arm/mach-s3c24xx/mach-mini2440.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c
> b/arch/arm/mach-s3c24xx/mach-mini2440.c index f092b18..bd6d252 100644
> --- a/arch/arm/mach-s3c24xx/mach-mini2440.c
> +++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
> @@ -634,8 +634,8 @@ static void __init mini2440_init(void)
>  	s3c_gpio_cfgpin(S3C2410_GPC(0), S3C2410_GPC0_LEND);
>
>  	/* Turn the backlight early on */
> -	WARN_ON(gpio_request(S3C2410_GPG(4), "backlight"));
> -	gpio_direction_output(S3C2410_GPG(4), 1);
> +	WARN_ON(gpio_request_one(S3C2410_GPG(4), GPIOF_OUT_INIT_HIGH, NULL));
> +	gpio_free(S3C2410_GPG(4));
>
>  	/* remove pullup on optional PWM backlight -- unused on 3.5 and 7"s */
>  	s3c_gpio_setpull(S3C2410_GPB(1), S3C_GPIO_PULL_UP);

Acked-by: jbe@pengutronix.de

-- 
Pengutronix e.K.                              | Juergen Beisert             |
Linux Solutions for Science and Industry      | http://www.pengutronix.de/  |
