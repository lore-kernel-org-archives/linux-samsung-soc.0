From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH v5] ARM: s3c244x: Fix mess with gpio {set,get}_pull callbacks
Date: Wed, 1 Dec 2010 12:17:41 +0200
Message-ID: <201012011217.41602.anarsoul@gmail.com>
References: <4CF55785.5090403@metafoo.de> <1291147949-18812-1-git-send-email-anarsoul@gmail.com> <001301cb9129$15f1b5c0$41d52140$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:42480 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752623Ab0LAKSI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 05:18:08 -0500
Received: by eye27 with SMTP id 27so3348832eye.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Dec 2010 02:18:07 -0800 (PST)
In-Reply-To: <001301cb9129$15f1b5c0$41d52140$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Lars-Peter Clausen' <lars@metafoo.de>, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Abdoulaye Walsimou GAYE' <awg@embtoolkit.org>

On Wednesday 01 December 2010 09:26:31 Kukjin Kim wrote:

> How about following...
> 
> +void __init s3c2440_map_io(void)
> +{
> +	s3c24xx_gpiocfg_default.set_pull = s3c_gpio_setpull_1up;
> +	s3c24xx_gpiocfg_default.get_pull = s3c_gpio_getpull_1up;
> +
> +	s3c244x_map_io();
> +}

What's difference except order?
 
> Yeah, however, in my opinion, need to add following during gpiolib_init().
> 
> @@ -222,6 +222,11 @@ static __init int s3c24xx_gpiolib_init(void)
>                 if (!chip->config)
>                         chip->config = &s3c24xx_gpiocfg_default;
> 
> +               if (!chip->config->set_pull)
> +                       chip->config->set_pull = s3c_gpio_setpull_1up;
> +               if (!chip->config->get_pull)
> +                       chip->config->get_pull = s3c_gpio_getpull_1up;
> +
>                 s3c_gpiolib_add(chip);
>         }

Pull callbacks are soc-specific, s3c24xx_gpiolib_init is common for all socs, 
so we can't do like this.

Btw, I've sent v6 version of patch, it still with empty line issues, should I 
resend v7 version or maintainers can fixup it at their side? :)

Regards
Vasily
