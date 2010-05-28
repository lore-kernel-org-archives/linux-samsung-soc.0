From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH 01/15] ARM: SAMSUNG: Add GPIO configuration for a range
 of pins
Date: Fri, 28 May 2010 13:53:24 +0400
Message-ID: <4BFF9294.60305@ru.mvista.com>
References: <1275026212-27510-1-git-send-email-ben-linux@fluff.org> <1275026212-27510-2-git-send-email-ben-linux@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:63372 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754655Ab0E1JyP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 May 2010 05:54:15 -0400
Received: by wya21 with SMTP id 21so9800wya.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 May 2010 02:54:14 -0700 (PDT)
In-Reply-To: <1275026212-27510-2-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hello.

Ben Dooks wrote:

> Add s3c_gpio_cfgpin_range() to configure a range of pins to the given
> value. This is useful for a number of blocks where the pins are in order
> and saves multiple calls to s3c_gpio_cfgpin().

> Signed-off-by: Ben Dooks <ben-linux@fluff.org>

    A little kerneldoc correction:

[...]

> diff --git a/arch/arm/plat-samsung/include/plat/gpio-cfg.h b/arch/arm/plat-samsung/include/plat/gpio-cfg.h
> index 34efdd2..8ec9936 100644
> --- a/arch/arm/plat-samsung/include/plat/gpio-cfg.h
> +++ b/arch/arm/plat-samsung/include/plat/gpio-cfg.h
> @@ -89,6 +89,19 @@ extern int s3c_gpio_cfgpin(unsigned int pin, unsigned int to);
>   */
>  extern unsigned s3c_gpio_getcfg(unsigned int pin);
>  
> +/**
> + * s3c_gpio_cfgpin_range() - Change the GPIO function for configuring pin range
> + * @start: The pin number to start at
> + * @number: The number of pins to configure from @start.

    You call the parameter 'nr'.

> + * @cfg: The configuration for the pin's function
> + *
> + * Call s3c_gpio_cfgpin() for the @number pins starting at @start.
> + *
> + * @sa s3c_gpio_cfgpin.
> + */
> +extern int s3c_gpio_cfgpin_range(unsigned int start, unsigned int nr,
> +				 unsigned int cfg);
> +
>  /* Define values for the pull-{up,down} available for each gpio pin.
>   *
>   * These values control the state of the weak pull-{up,down} resistors

WBR, Sergei
