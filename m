From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v3 resend2] s3c/s3c24xx: arm: leds: Make s3c24xx LEDS
 driver use gpiolib
Date: Tue, 13 Dec 2011 13:06:57 -0800
Message-ID: <1323810417.3837.25.camel@joe2Laptop>
References: <4EE7B41C.5080006@solonet.org.ua>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from perches-mx.perches.com ([206.117.179.246]:41844 "EHLO
	labridge.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751334Ab1LMVG7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Dec 2011 16:06:59 -0500
In-Reply-To: <4EE7B41C.5080006@solonet.org.ua>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Denis Kuzmenko <linux@solonet.org.ua>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Richard Purdie <rpurdie@rpsys.net>

On Tue, 2011-12-13 at 22:22 +0200, Denis Kuzmenko wrote:
> Make s3c24xx LEDS driver use gpiolib. Fix error disabling pull during probe.
[]
> diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
[]
> @@ -45,23 +45,35 @@ static void s3c24xx_led_set(struct led_classdev *led_cdev,
> +	/*
> +	 * ensure value is 0 or 1 to use it with bitwise XOR (^)
> +	 * (only 100% brightness is supported)
> +	 */
> +	value = value ? 1 : 0;

Maybe value = !!value;

> +		/* no point in having a pull-up as we are always driving */
> +		s3c_gpio_setpull(pdata->gpio, S3C_GPIO_PULL_NONE);
> +		ret = gpio_direction_output(pdata->gpio,
> +				!!(pdata->flags & S3C24XX_LEDF_ACTLOW));

akin to this use.
