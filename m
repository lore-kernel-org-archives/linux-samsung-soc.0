From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 1/3] h1940: use gpiolib for latch access
Date: Tue, 24 Aug 2010 15:49:51 +0200
Message-ID: <201008241549.51513.marek.vasut@gmail.com>
References: <1282230003-2020-1-git-send-email-anarsoul@gmail.com> <1282230003-2020-2-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:36089 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751607Ab0HXNue convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Aug 2010 09:50:34 -0400
Received: by fxm13 with SMTP id 13so3714173fxm.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Aug 2010 06:50:32 -0700 (PDT)
In-Reply-To: <1282230003-2020-2-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-samsung-soc@vger.kernel.org

Dne =C4=8Ct 19. srpna 2010 17:00:01 Vasily Khoruzhick napsal(a):
> This patch adds gpiolib support for h1940 latch.
> With this patch it's possible to use leds-gpio and uda1380
> drivers (they require gpiolib support for appropriate pins).
> And now it's possible to drop leds-h1940 driver.
>=20
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  arch/arm/mach-s3c2410/h1940-bluetooth.c          |   13 +++-
>  arch/arm/mach-s3c2410/include/mach/h1940-latch.h |   57 +++++-------=
----
>  arch/arm/mach-s3c2410/mach-h1940.c               |   77
> ++++++++++++++++++++-- arch/arm/plat-s3c24xx/Kconfig                 =
   |=20
>   1 +
>  4 files changed, 100 insertions(+), 48 deletions(-)
>=20
> diff --git a/arch/arm/mach-s3c2410/h1940-bluetooth.c
> b/arch/arm/mach-s3c2410/h1940-bluetooth.c index 8cdeb14..8aa2f19 1006=
44
> --- a/arch/arm/mach-s3c2410/h1940-bluetooth.c
> +++ b/arch/arm/mach-s3c2410/h1940-bluetooth.c
> @@ -30,7 +30,7 @@ static void h1940bt_enable(int on)
>  {
>  	if (on) {
>  		/* Power on the chip */
> -		h1940_latch_control(0, H1940_LATCH_BLUETOOTH_POWER);
> +		gpio_set_value(H1940_LATCH_BLUETOOTH_POWER, 1);
>  		/* Reset the chip */
>  		mdelay(10);
>=20
> @@ -43,7 +43,7 @@ static void h1940bt_enable(int on)
>  		mdelay(10);
>  		gpio_set_value(S3C2410_GPH(1), 0);
>  		mdelay(10);
> -		h1940_latch_control(H1940_LATCH_BLUETOOTH_POWER, 0);
> +		gpio_set_value(H1940_LATCH_BLUETOOTH_POWER, 0);
>  	}
>  }
>=20
> @@ -64,7 +64,14 @@ static int __devinit h1940bt_probe(struct
> platform_device *pdev)
>=20
>  	ret =3D gpio_request(S3C2410_GPH(1), dev_name(&pdev->dev));
>  	if (ret) {
> -		dev_err(&pdev->dev, "could not get GPH1\n");\
> +		dev_err(&pdev->dev, "could not get GPH1\n");
> +		return ret;
> +	}
> +
> +	ret =3D gpio_request(H1940_LATCH_BLUETOOTH_POWER, dev_name(&pdev->d=
ev));

This should contain the name of the GPIO, not dev_name I assume.

> +	if (ret) {
> +		gpio_free(S3C2410_GPH(1));

What's this constant (the 1) here ? Maybe some sane #define wont hurt o=
r comment=20
around it.
> +		dev_err(&pdev->dev, "could not get BT_POWER\n");
>  		return ret;
>  	}
>=20
> diff --git a/arch/arm/mach-s3c2410/include/mach/h1940-latch.h
> b/arch/arm/mach-s3c2410/include/mach/h1940-latch.h index d8a8327..735=
86f2
> 100644
> --- a/arch/arm/mach-s3c2410/include/mach/h1940-latch.h
> +++ b/arch/arm/mach-s3c2410/include/mach/h1940-latch.h
> @@ -14,51 +14,30 @@
>  #ifndef __ASM_ARCH_H1940_LATCH_H
>  #define __ASM_ARCH_H1940_LATCH_H
>=20
> +#include <mach/gpio.h>
>=20
> -#ifndef __ASSEMBLY__
> -#define H1940_LATCH		((void __force __iomem *)0xF8000000)
> -#else
> -#define H1940_LATCH		0xF8000000
> -#endif
> -
> -#define H1940_PA_LATCH		(S3C2410_CS2)
> +#define H1940_LATCH_GPIO(x)		(S3C_GPIO_END + (x))
>=20
>  /* SD layer latch */
>=20
> -#define H1940_LATCH_SDQ1		(1<<16)
> -#define H1940_LATCH_LCD_P1		(1<<17)
> -#define H1940_LATCH_LCD_P2		(1<<18)
> -#define H1940_LATCH_LCD_P3		(1<<19)
> -#define H1940_LATCH_MAX1698_nSHUTDOWN	(1<<20)		/* LCD backlight=20
*/
> -#define H1940_LATCH_LED_RED		(1<<21)
> -#define H1940_LATCH_SDQ7		(1<<22)
> -#define H1940_LATCH_USB_DP		(1<<23)
> +#define H1940_LATCH_SDQ1		H1940_LATCH_GPIO(0)
> +#define H1940_LATCH_LCD_P1		H1940_LATCH_GPIO(1)
> +#define H1940_LATCH_LCD_P2		H1940_LATCH_GPIO(2)
> +#define H1940_LATCH_LCD_P3		H1940_LATCH_GPIO(3)
> +#define H1940_LATCH_MAX1698_nSHUTDOWN	H1940_LATCH_GPIO(4)
> +#define H1940_LATCH_LED_RED		H1940_LATCH_GPIO(5)
> +#define H1940_LATCH_SDQ7		H1940_LATCH_GPIO(6)
> +#define H1940_LATCH_USB_DP		H1940_LATCH_GPIO(7)
>=20
>  /* CPU layer latch */
>=20
> -#define H1940_LATCH_UDA_POWER		(1<<24)
> -#define H1940_LATCH_AUDIO_POWER		(1<<25)
> -#define H1940_LATCH_SM803_ENABLE	(1<<26)
> -#define H1940_LATCH_LCD_P4		(1<<27)
> -#define H1940_LATCH_CPUQ5		(1<<28)		/* untraced */
> -#define H1940_LATCH_BLUETOOTH_POWER	(1<<29)		/* active high */
> -#define H1940_LATCH_LED_GREEN		(1<<30)
> -#define H1940_LATCH_LED_FLASH		(1<<31)
> -
> -/* default settings */
> -
> -#define H1940_LATCH_DEFAULT		\
> -	H1940_LATCH_LCD_P4		| \
> -	H1940_LATCH_SM803_ENABLE	| \
> -	H1940_LATCH_SDQ1		| \
> -	H1940_LATCH_LCD_P1		| \
> -	H1940_LATCH_LCD_P2		| \
> -	H1940_LATCH_LCD_P3		| \
> -	H1940_LATCH_MAX1698_nSHUTDOWN   | \
> -	H1940_LATCH_CPUQ5
> -
> -/* control functions */
> -
> -extern void h1940_latch_control(unsigned int clear, unsigned int set=
);
> +#define H1940_LATCH_UDA_POWER		H1940_LATCH_GPIO(8)
> +#define H1940_LATCH_AUDIO_POWER		H1940_LATCH_GPIO(9)
> +#define H1940_LATCH_SM803_ENABLE	H1940_LATCH_GPIO(10)
> +#define H1940_LATCH_LCD_P4		H1940_LATCH_GPIO(11)
> +#define H1940_LATCH_CPUQ5		H1940_LATCH_GPIO(12)
> +#define H1940_LATCH_BLUETOOTH_POWER	H1940_LATCH_GPIO(13)
> +#define H1940_LATCH_LED_GREEN		H1940_LATCH_GPIO(14)
> +#define H1940_LATCH_LED_FLASH		H1940_LATCH_GPIO(15)
>=20
>  #endif /* __ASM_ARCH_H1940_LATCH_H */
> diff --git a/arch/arm/mach-s3c2410/mach-h1940.c
> b/arch/arm/mach-s3c2410/mach-h1940.c index 779b45b..9717790 100644
> --- a/arch/arm/mach-s3c2410/mach-h1940.c
> +++ b/arch/arm/mach-s3c2410/mach-h1940.c
> @@ -42,6 +42,7 @@
>  #include <mach/regs-gpio.h>
>  #include <mach/gpio-fns.h>
>  #include <mach/gpio-nrs.h>
> +#include <mach/gpio.h>
>=20
>  #include <mach/h1940.h>
>  #include <mach/h1940-latch.h>
> @@ -58,6 +59,16 @@
>  #include <plat/mci.h>
>  #include <plat/ts.h>
>=20
> +#ifndef __ASSEMBLY__
> +#define H1940_LATCH		((void __force __iomem *)0xF8000000)
> +#else
> +#define H1940_LATCH		0xF8000000
> +#endif

Is the __ASSEMBLY__ really needed ? You can establish mapping when the =
kernel=20
boots (looks like you're doing that already) but then use __raw_readX=20
__raw_writeX to access that space instead of this stuff above.

Possibly like this:

#define	H1940_VA_LATCH 0xf8000000

some_fn()
{
=2E..
	val =3D __raw_readl(H1940_VA_LATCH + offset);
=2E..
}

Cheers
> +
> +#define H1940_PA_LATCH		(S3C2410_CS2)
> +
> +#define H1940_LATCH_BIT(x)		(1 << ((x) + 16 - S3C_GPIO_END))
> +
>  static struct map_desc h1940_iodesc[] __initdata =3D {
>  	[0] =3D {
>  		.virtual	=3D (unsigned long)H1940_LATCH,
> @@ -99,9 +110,16 @@ static struct s3c2410_uartcfg h1940_uartcfgs[]
> __initdata =3D {
>=20
>  /* Board control latch control */
>=20
> -static unsigned int latch_state =3D H1940_LATCH_DEFAULT;
> +static unsigned int latch_state =3D H1940_LATCH_BIT(H1940_LATCH_LCD_=
P4) |
> +	H1940_LATCH_BIT(H1940_LATCH_SM803_ENABLE)	|
> +	H1940_LATCH_BIT(H1940_LATCH_SDQ1)			|
> +	H1940_LATCH_BIT(H1940_LATCH_LCD_P1)			|
> +	H1940_LATCH_BIT(H1940_LATCH_LCD_P2)			|
> +	H1940_LATCH_BIT(H1940_LATCH_LCD_P3)			|
> +	H1940_LATCH_BIT(H1940_LATCH_MAX1698_nSHUTDOWN)   |
> +	H1940_LATCH_BIT(H1940_LATCH_CPUQ5);
>=20
> -void h1940_latch_control(unsigned int clear, unsigned int set)
> +static void h1940_latch_control(unsigned int clear, unsigned int set=
)
>  {
>  	unsigned long flags;
>=20
> @@ -115,7 +133,50 @@ void h1940_latch_control(unsigned int clear, uns=
igned
> int set) local_irq_restore(flags);
>  }
>=20
> -EXPORT_SYMBOL_GPL(h1940_latch_control);
> +static int h1940_gpiolib_latch_input(struct gpio_chip *chip, unsigne=
d
> offset) +{
> +	return -EINVAL;
> +}
> +
> +
> +static inline int h1940_gpiolib_to_latch(int offset)
> +{
> +	return 1 << (offset + 16);
> +}
> +
> +static void h1940_gpiolib_latch_set(struct gpio_chip *chip,
> +					unsigned offset, int value)
> +{
> +	int latch_bit =3D h1940_gpiolib_to_latch(offset);
> +
> +	h1940_latch_control(value ? 0 : latch_bit,
> +		value ? latch_bit : 0);
> +}
> +
> +static int h1940_gpiolib_latch_output(struct gpio_chip *chip,
> +					unsigned offset, int value)
> +{
> +	h1940_gpiolib_latch_set(chip, offset, value);
> +
> +	return 0;
> +}
> +
> +static int h1940_gpiolib_latch_get(struct gpio_chip *chip,
> +					unsigned offset)
> +{
> +	return (latch_state >> (offset + 16)) & 1;
> +}
> +
> +struct gpio_chip h1940_latch_gpiochip =3D {
> +	.base				=3D H1940_LATCH_GPIO(0),
> +	.owner				=3D THIS_MODULE,
> +	.label				=3D "H1940_LATCH",
> +	.ngpio				=3D 16,
> +	.direction_input	=3D h1940_gpiolib_latch_input,
> +	.direction_output	=3D h1940_gpiolib_latch_output,
> +	.set				=3D h1940_gpiolib_latch_set,
> +	.get				=3D h1940_gpiolib_latch_get,
> +};
>=20
>  static void h1940_udc_pullup(enum s3c2410_udc_cmd_e cmd)
>  {
> @@ -124,10 +185,10 @@ static void h1940_udc_pullup(enum s3c2410_udc_c=
md_e
> cmd) switch (cmd)
>  	{
>  		case S3C2410_UDC_P_ENABLE :
> -			h1940_latch_control(0, H1940_LATCH_USB_DP);
> +			gpio_set_value(H1940_LATCH_USB_DP, 1);
>  			break;
>  		case S3C2410_UDC_P_DISABLE :
> -			h1940_latch_control(H1940_LATCH_USB_DP, 0);
> +			gpio_set_value(H1940_LATCH_USB_DP, 0);
>  			break;
>  		case S3C2410_UDC_P_RESET :
>  			break;
> @@ -302,6 +363,8 @@ static void __init h1940_map_io(void)
>  	memcpy(phys_to_virt(H1940_SUSPEND_RESUMEAT), h1940_pm_return, 1024)=
;
>  #endif
>  	s3c_pm_init();
> +
> +	WARN_ON(gpiochip_add(&h1940_latch_gpiochip));
>  }
>=20
>  static void __init h1940_init_irq(void)
> @@ -334,9 +397,11 @@ static void __init h1940_init(void)
>  	gpio_request(S3C2410_GPC(0), "LCD power");
>  	gpio_request(S3C2410_GPC(5), "LCD power");
>  	gpio_request(S3C2410_GPC(6), "LCD power");
> -
>  	gpio_direction_input(S3C2410_GPC(6));
>=20
> +	gpio_request(H1940_LATCH_USB_DP, "USB pullup");
> +	gpio_direction_output(H1940_LATCH_USB_DP, 0);
> +
>  	platform_add_devices(h1940_devices, ARRAY_SIZE(h1940_devices));
>  }
>=20
> diff --git a/arch/arm/plat-s3c24xx/Kconfig b/arch/arm/plat-s3c24xx/Kc=
onfig
> index 984bf66..5a27b1b 100644
> --- a/arch/arm/plat-s3c24xx/Kconfig
> +++ b/arch/arm/plat-s3c24xx/Kconfig
> @@ -69,6 +69,7 @@ config S3C24XX_GPIO_EXTRA
>  	int
>  	default 128 if S3C24XX_GPIO_EXTRA128
>  	default 64 if S3C24XX_GPIO_EXTRA64
> +	default 16 if ARCH_H1940
>  	default 0
>=20
>  config S3C24XX_GPIO_EXTRA64
