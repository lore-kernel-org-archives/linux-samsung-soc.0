From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v4 13/20] pwm: Add new pwm-samsung driver
Date: Sun, 21 Jul 2013 21:50:47 +0200
Message-ID: <51EC3B97.3040107@gmail.com>
References: <1374278673-25615-1-git-send-email-tomasz.figa@gmail.com> <1374278673-25615-15-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f53.google.com ([209.85.214.53]:53906 "EHLO
	mail-bk0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755934Ab3GUTuw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Jul 2013 15:50:52 -0400
In-Reply-To: <1374278673-25615-15-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>

On 07/20/2013 02:04 AM, Tomasz Figa wrote:
> This patch introduces new Samsung PWM driver, which uses Samsung
> PWM/timer master driver to control shared parts of the hardware.
>
> Signed-off-by: Tomasz Figa<tomasz.figa@gmail.com>
> ---
>   drivers/pwm/Makefile      |   1 +
>   drivers/pwm/pwm-samsung.c | 606 ++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 607 insertions(+)
>   create mode 100644 drivers/pwm/pwm-samsung.c
[...]
> +static const struct samsung_pwm_variant s3c64xx_variant = {
> +	.bits		= 32,
> +	.div_base	= 0,

Initialization to 0 could be omitted, since it is implicit.

> +	.has_tint_cstat	= true,
> +	.tclk_mask	= BIT(7) | BIT(6) | BIT(5),
> +};
> +
> +static const struct samsung_pwm_variant s5p64x0_variant = {
> +	.bits		= 32,
> +	.div_base	= 0,

Ditto.

> +	.has_tint_cstat	= true,
> +};
> +
> +static const struct samsung_pwm_variant s5p_variant = {
> +	.bits		= 32,
> +	.div_base	= 0,

Ditto.

> +	.has_tint_cstat	= true,
> +	.tclk_mask	= BIT(5),
> +};
> +
[...]
> +static int pwm_samsung_remove(struct platform_device *pdev)
> +{
> +	struct samsung_pwm_chip *chip = platform_get_drvdata(pdev);
> +	int ret;
> +
> +	ret = pwmchip_remove(&chip->chip);
> +	if (ret<  0)
> +		return ret;

Since return value of the remove() callback is happily ignored by
the driver core I think there is no point in returning an error
here like this. Wouldn't it be more sensible to just call all the
cleanup functions unconditionally ? At least potentially wrong state
of the clock could be avoided.

> +
> +	clk_disable_unprepare(chip->base_clk);
> +
> +	return 0;
> +}

--
Regards,
Sylwester
