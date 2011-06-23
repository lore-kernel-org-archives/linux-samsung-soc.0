From: "K, Mythri P" <mythripk@ti.com>
Subject: Re: [PATCH V4 5/5] ARM: EXYNOS4: Add platform data for EXYNOS4 FIMD
 and LTE480WV platform-lcd
Date: Thu, 23 Jun 2011 14:33:43 +0530
Message-ID: <BANLkTin7J=fBbp+4Ti_a2D6bgU15sVZHzg@mail.gmail.com>
References: <11291403.110251308714504687.JavaMail.weblogic@epml08>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog110.obsmtp.com ([74.125.149.203]:38131 "EHLO
	na3sys009aog110.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758774Ab1FWJEE convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jun 2011 05:04:04 -0400
In-Reply-To: <11291403.110251308714504687.JavaMail.weblogic@epml08>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jg1.han@samsung.com
Cc: Kukjin Kim <kgene.kim@samsung.com>, Paul Mundt <lethal@linux-sh.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, Jong-Hun Han <jonghun.han@samsung.com>, ANAND KUMAR N <anand.kn@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, THOMAS P ABRAHAM <thomas.ab@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kmpark@infradead.org>, In-Ki Dae <inki.dae@samsung.com>, ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>

2011/6/22 JinGoo Han <jg1.han@samsung.com>:
> From: Jonghun Han <jonghun.han@samsung.com>
>
> This patch adds support EXYNOS4 FIMD0 and LTE480WV LCD pannel.
>
> Signed-off-by: Jonghun Han <jonghun.han@samsung.com>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/mach-smdkc210.c | =A0114 +++++++++++++++++++=
++++++++++++++
> =A0arch/arm/mach-exynos4/mach-smdkv310.c | =A0114 +++++++++++++++++++=
++++++++++++++
> =A02 files changed, 228 insertions(+), 0 deletions(-)
>
<<snip>>
> +static void lcd_lte480wv_set_power(struct plat_lcd_data *pd,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
unsigned int power)
> +{
> + =A0 =A0 =A0 if (power) {
> +#if !defined(CONFIG_BACKLIGHT_PWM)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_request(EXYNOS4_GPD0(1), "GPD0");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_direction_output(EXYNOS4_GPD0(1), =
1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_free(EXYNOS4_GPD0(1));
> +#endif
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* fire nRESET on power up */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_request(EXYNOS4_GPX0(6), "GPX0");
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_direction_output(EXYNOS4_GPX0(6), =
1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mdelay(100);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_set_value(EXYNOS4_GPX0(6), 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mdelay(10);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_set_value(EXYNOS4_GPX0(6), 1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mdelay(10);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_free(EXYNOS4_GPX0(6));
> + =A0 =A0 =A0 } else {
> +#if !defined(CONFIG_BACKLIGHT_PWM)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_request(EXYNOS4_GPD0(1), "GPD0");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_direction_output(EXYNOS4_GPD0(1), =
0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_free(EXYNOS4_GPD0(1));
> +#endif
> + =A0 =A0 =A0 }
> +}
> +

have you considered using gpio_request_one instead ? It simplifies the
three step API.

<<snip>>

> + =A0 =A0 =A0 if (power) {
> +#if !defined(CONFIG_BACKLIGHT_PWM)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_request(EXYNOS4_GPD0(1), "GPD0");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_direction_output(EXYNOS4_GPD0(1), =
1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_free(EXYNOS4_GPD0(1));
> +#endif
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* fire nRESET on power up */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_request(EXYNOS4_GPX0(6), "GPX0");
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_direction_output(EXYNOS4_GPX0(6), =
1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mdelay(100);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_set_value(EXYNOS4_GPX0(6), 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mdelay(10);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_set_value(EXYNOS4_GPX0(6), 1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mdelay(10);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_free(EXYNOS4_GPX0(6));
> + =A0 =A0 =A0 } else {
> +#if !defined(CONFIG_BACKLIGHT_PWM)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_request(EXYNOS4_GPD0(1), "GPD0");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_direction_output(EXYNOS4_GPD0(1), =
0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_free(EXYNOS4_GPD0(1));
> +#endif
> + =A0 =A0 =A0 }
> +}

same comment as above.

<<snip>>



--=20
Thanks and regards,
Mythri.
