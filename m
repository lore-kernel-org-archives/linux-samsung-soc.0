From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 3/3] h1940: implement mmc_power function
Date: Tue, 24 Aug 2010 15:52:42 +0200
Message-ID: <201008241552.42856.marek.vasut@gmail.com>
References: <1282230003-2020-1-git-send-email-anarsoul@gmail.com> <1282230003-2020-4-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:64031 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755282Ab0HXNxY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Aug 2010 09:53:24 -0400
Received: by fxm13 with SMTP id 13so3716175fxm.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Aug 2010 06:53:23 -0700 (PDT)
In-Reply-To: <1282230003-2020-4-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-samsung-soc@vger.kernel.org

Dne =C4=8Ct 19. srpna 2010 17:00:03 Vasily Khoruzhick napsal(a):
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  arch/arm/mach-s3c2410/include/mach/h1940-latch.h |    2 +-
>  arch/arm/mach-s3c2410/mach-h1940.c               |   23
> +++++++++++++++++++-- 2 files changed, 21 insertions(+), 4 deletions(=
-)
>=20
> diff --git a/arch/arm/mach-s3c2410/include/mach/h1940-latch.h
> b/arch/arm/mach-s3c2410/include/mach/h1940-latch.h index 73586f2..ef7=
d8cf
> 100644
> --- a/arch/arm/mach-s3c2410/include/mach/h1940-latch.h
> +++ b/arch/arm/mach-s3c2410/include/mach/h1940-latch.h
> @@ -35,7 +35,7 @@
>  #define H1940_LATCH_AUDIO_POWER		H1940_LATCH_GPIO(9)
>  #define H1940_LATCH_SM803_ENABLE	H1940_LATCH_GPIO(10)
>  #define H1940_LATCH_LCD_P4		H1940_LATCH_GPIO(11)
> -#define H1940_LATCH_CPUQ5		H1940_LATCH_GPIO(12)
> +#define H1940_LATCH_SD_POWER		H1940_LATCH_GPIO(12)
>  #define H1940_LATCH_BLUETOOTH_POWER	H1940_LATCH_GPIO(13)
>  #define H1940_LATCH_LED_GREEN		H1940_LATCH_GPIO(14)
>  #define H1940_LATCH_LED_FLASH		H1940_LATCH_GPIO(15)
> diff --git a/arch/arm/mach-s3c2410/mach-h1940.c
> b/arch/arm/mach-s3c2410/mach-h1940.c index 9717790..c1ccc8e 100644
> --- a/arch/arm/mach-s3c2410/mach-h1940.c
> +++ b/arch/arm/mach-s3c2410/mach-h1940.c
> @@ -116,8 +116,7 @@ static unsigned int latch_state =3D
> H1940_LATCH_BIT(H1940_LATCH_LCD_P4) |
> H1940_LATCH_BIT(H1940_LATCH_LCD_P1)			|
>  	H1940_LATCH_BIT(H1940_LATCH_LCD_P2)			|
>  	H1940_LATCH_BIT(H1940_LATCH_LCD_P3)			|
> -	H1940_LATCH_BIT(H1940_LATCH_MAX1698_nSHUTDOWN)   |
> -	H1940_LATCH_BIT(H1940_LATCH_CPUQ5);
> +	H1940_LATCH_BIT(H1940_LATCH_MAX1698_nSHUTDOWN);
>=20
>  static void h1940_latch_control(unsigned int clear, unsigned int set=
)
>  {
> @@ -259,10 +258,25 @@ static struct platform_device h1940_device_blue=
tooth
> =3D { .id               =3D -1,
>  };
>=20
> +static void h1940_set_mmc_power(unsigned char power_mode, unsigned s=
hort
> vdd) +{
> +	switch (power_mode) {
> +	case MMC_POWER_OFF:
> +		gpio_set_value(H1940_LATCH_SD_POWER, 0);
> +		break;
> +	case MMC_POWER_UP:
> +	case MMC_POWER_ON:
> +		gpio_set_value(H1940_LATCH_SD_POWER, 1);
> +		break;
> +	default:
> +		break;
> +	};
> +}
> +
>  static struct s3c24xx_mci_pdata h1940_mmc_cfg __initdata =3D {
>  	.gpio_detect   =3D S3C2410_GPF(5),
>  	.gpio_wprotect =3D S3C2410_GPH(8),
> -	.set_power     =3D NULL,
> +	.set_power     =3D h1940_set_mmc_power,
>  	.ocr_avail     =3D MMC_VDD_32_33,
>  };
>=20

Can't you implement gpio_power into the s3c24xx mmc driver ? Then you c=
an fix=20
mach-n30 too.

> @@ -402,6 +416,9 @@ static void __init h1940_init(void)
>  	gpio_request(H1940_LATCH_USB_DP, "USB pullup");
>  	gpio_direction_output(H1940_LATCH_USB_DP, 0);
>=20
> +	gpio_request(H1940_LATCH_SD_POWER, "SD power");
> +	gpio_direction_output(H1940_LATCH_SD_POWER, 0);

Please handle possible return values here !
> +
>  	platform_add_devices(h1940_devices, ARRAY_SIZE(h1940_devices));
>  }

Cheers
