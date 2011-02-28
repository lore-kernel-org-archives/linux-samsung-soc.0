From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 6/6] ARM: S5PV210: Add PWM backlight support on SMDKV210
Date: Mon, 28 Feb 2011 13:14:33 +0900
Message-ID: <AANLkTinfgwTtxbkL1t+ris36AvyfTA0zcKhB1HG0e5Qe@mail.gmail.com>
References: <1298694546-16816-1-git-send-email-banajit.g@samsung.com>
	<1298694546-16816-7-git-send-email-banajit.g@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:48363 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752209Ab1B1EOd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Feb 2011 23:14:33 -0500
Received: by yxs7 with SMTP id 7so1397762yxs.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Feb 2011 20:14:33 -0800 (PST)
In-Reply-To: <1298694546-16816-7-git-send-email-banajit.g@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Banajit Goswami <banajit.g@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

Hi,

On Sat, Feb 26, 2011 at 1:29 PM, Banajit Goswami <banajit.g@samsung.com=
> wrote:
> This patch adds support for LCD backlight control using PWM timer
> for Samsung's SMDKV210 board.
>
> Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
> ---
> =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0 =A0 | =A0 =A01 +
> =A0arch/arm/mach-s5pv210/mach-smdkv210.c | =A0 46 +++++++++++++++++++=
++++++++++++++
> =A02 files changed, 47 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kc=
onfig
> index 53aabef..d7fd031 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -130,6 +130,7 @@ config MACH_SMDKV210
> =A0 =A0 =A0 =A0select SAMSUNG_DEV_ADC
> =A0 =A0 =A0 =A0select SAMSUNG_DEV_IDE
> =A0 =A0 =A0 =A0select SAMSUNG_DEV_KEYPAD
> + =A0 =A0 =A0 select SAMSUNG_DEV_PWM
> =A0 =A0 =A0 =A0select SAMSUNG_DEV_TS
> =A0 =A0 =A0 =A0select S5PV210_SETUP_FB_24BPP
> =A0 =A0 =A0 =A0select S5PV210_SETUP_I2C1
> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5=
pv210/mach-smdkv210.c
> index bc9fdb5..8833e7b 100644
> --- a/arch/arm/mach-s5pv210/mach-smdkv210.c
> +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
> @@ -18,6 +18,7 @@
> =A0#include <linux/fb.h>
> =A0#include <linux/gpio.h>
> =A0#include <linux/delay.h>
> +#include <linux/pwm_backlight.h>
>
> =A0#include <asm/mach/arch.h>
> =A0#include <asm/mach/map.h>
> @@ -43,6 +44,7 @@
> =A0#include <plat/keypad.h>
> =A0#include <plat/pm.h>
> =A0#include <plat/fb.h>
> +#include <plat/gpio-cfg.h>
>
> =A0/* Following are default values for UCON, ULCON and UFCON UART reg=
isters */
> =A0#define SMDKV210_UCON_DEFAULT =A0(S3C2410_UCON_TXILEVEL | =A0 =A0 =
=A0 =A0\
> @@ -208,6 +210,45 @@ static struct s3c_fb_platdata smdkv210_lcd0_pdat=
a __initdata =3D {
> =A0 =A0 =A0 =A0.setup_gpio =A0 =A0 =3D s5pv210_fb_gpio_setup_24bpp,
> =A0};
>
> +static int smdkv210_backlight_init(struct device *dev)
> +{
> + =A0 =A0 =A0 int ret;
> +
> + =A0 =A0 =A0 ret =3D gpio_request(S5PV210_GPD0(3), "Backlight");
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "failed to request GPD =
for PWM-OUT 3\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Configure GPIO pin with S5PV210_GPD_0_3_TOUT_3 */
> + =A0 =A0 =A0 s3c_gpio_cfgpin(S5PV210_GPD0(3), (0x2 << 12));

what's (0x2 << 12)? Do you mean S3C_GPIO_SFN(2)?
please use the macro and other patches are same usage.

> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static void smdkv210_backlight_exit(struct device *dev)
> +{
> + =A0 =A0 =A0 s3c_gpio_cfgpin(S5PV210_GPD0(3), S3C_GPIO_OUTPUT);
> + =A0 =A0 =A0 gpio_free(S5PV210_GPD0(3));
> +}
> +
> +static struct platform_pwm_backlight_data smdkv210_backlight_data =3D=
 {
> + =A0 =A0 =A0 .pwm_id =A0 =A0 =A0 =A0 =3D 3,
> + =A0 =A0 =A0 .max_brightness =3D 255,
> + =A0 =A0 =A0 .dft_brightness =3D 255,
> + =A0 =A0 =A0 .pwm_period_ns =A0=3D 78770,
> + =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =3D smdkv210_backlight_init,
> + =A0 =A0 =A0 .exit =A0 =A0 =A0 =A0 =A0 =3D smdkv210_backlight_exit,
> +};
> +
> +static struct platform_device smdkv210_backlight_device =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "pwm-backlight",
> + =A0 =A0 =A0 .dev =A0 =A0 =A0 =A0 =A0 =A0=3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &s3c_device=
_timer[3].dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =A0=3D &smdkv210_backlig=
ht_data,
> + =A0 =A0 =A0 },
> +};
> +
> =A0static struct platform_device *smdkv210_devices[] __initdata =3D {
> =A0 =A0 =A0 =A0&s3c_device_adc,
> =A0 =A0 =A0 =A0&s3c_device_cfcon,
> @@ -229,6 +270,11 @@ static struct platform_device *smdkv210_devices[=
] __initdata =3D {
> =A0 =A0 =A0 =A0&samsung_device_keypad,
> =A0 =A0 =A0 =A0&smdkv210_dm9000,
> =A0 =A0 =A0 =A0&smdkv210_lcd_lte480wv,
> + =A0 =A0 =A0 &s3c_device_timer[0],
> + =A0 =A0 =A0 &s3c_device_timer[1],
> + =A0 =A0 =A0 &s3c_device_timer[2],
> + =A0 =A0 =A0 &s3c_device_timer[3],

Why do you register timer[0...2] at here? it's only use the timer[3]
at this patch.
Other patches are same usage.

Thank you,
Kyungmin Park

> + =A0 =A0 =A0 &smdkv210_backlight_device,
> =A0};
>
> =A0static void __init smdkv210_dm9000_init(void)
> --
> 1.6.5.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
