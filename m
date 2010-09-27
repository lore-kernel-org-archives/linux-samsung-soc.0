From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: S5PV210: Add Torbreck board support
Date: Mon, 27 Sep 2010 19:39:41 +0900
Message-ID: <AANLkTim7+DGPtyDxCnbX+xOy3z+LVgGYVaJdxdiaHbW-@mail.gmail.com>
References: <1285463130-14227-1-git-send-email-chlrbgh0@gmail.com>
	<AANLkTik5SkqjEz5Ymtg6RvwfrU0i8XzhPQq3Un7gMbP=@mail.gmail.com>
	<AANLkTik1YAd8W75DzrDmfhFYG-JE8__Tu4uq83RKsioC@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:52059 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753014Ab0I0Kjn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Sep 2010 06:39:43 -0400
Received: by wyb28 with SMTP id 28so3696728wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Sep 2010 03:39:42 -0700 (PDT)
In-Reply-To: <AANLkTik1YAd8W75DzrDmfhFYG-JE8__Tu4uq83RKsioC@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?7LWc6rec7Zi4?= <chlrbgh0@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, kgene.kim@samsung.com, Hyunchul Ko <ghcstop@gmail.com>

On Mon, Sep 27, 2010 at 7:10 PM, =EC=B5=9C=EA=B7=9C=ED=98=B8 <chlrbgh0@=
gmail.com> wrote:
> Hi,
> Thank you for your interesting.
>
> On Mon, Sep 27, 2010 at 11:58 AM, Kyungmin Park <kmpark@infradead.org=
>
> wrote:
>>
>> Hi,
>>
>> Looks good to me except minor fixup.
>>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>>
>> On Sun, Sep 26, 2010 at 10:05 AM, Kyuho Choi <chlrbgh0@gmail.com> wr=
ote:
>> > This patch adds to support Torbreck board of aESOP community using
>> > Samsung S5PV210 SoC.
>> >
>> > Signed-off-by: Kyuho Choi <chlrbgh0@gmail.com>
>> > Signed-off-by: Hyunchul Ko <ghcstop@gmail.com>
>> > ---
>> > =C2=A0arch/arm/mach-s5pv210/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 18 +++++
>> > =C2=A0arch/arm/mach-s5pv210/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 =C2=A01 +
>> > =C2=A0arch/arm/mach-s5pv210/mach-torbreck.c | =C2=A0133
>> > +++++++++++++++++++++++++++++++++
>> > =C2=A03 files changed, 152 insertions(+), 0 deletions(-)
>> > =C2=A0create mode 100644 arch/arm/mach-s5pv210/mach-torbreck.c
>> >
>> > diff --git a/arch/arm/mach-s5pv210/Kconfig
>> > b/arch/arm/mach-s5pv210/Kconfig
>> > index d3a3895..c5ec466 100644
>> > --- a/arch/arm/mach-s5pv210/Kconfig
>> > +++ b/arch/arm/mach-s5pv210/Kconfig
>> > @@ -139,6 +139,24 @@ config MACH_SMDKV210
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0help
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machine support for Samsung SMDK=
V210
>> >
>> > +config MACH_TORBRECK
>> > + =C2=A0 =C2=A0 =C2=A0 bool "Torbreck"
>> > + =C2=A0 =C2=A0 =C2=A0 select CPU_S5PV210
>> > + =C2=A0 =C2=A0 =C2=A0 select ARCH_SPARSEMEM_ENABLE
>> > + =C2=A0 =C2=A0 =C2=A0 select S3C_DEV_HSMMC
>> > + =C2=A0 =C2=A0 =C2=A0 select S3C_DEV_HSMMC1
>> > + =C2=A0 =C2=A0 =C2=A0 select S3C_DEV_HSMMC2
>> > + =C2=A0 =C2=A0 =C2=A0 select S3C_DEV_HSMMC3
>> > + =C2=A0 =C2=A0 =C2=A0 select S3C_DEV_I2C1
>> > + =C2=A0 =C2=A0 =C2=A0 select S3C_DEV_I2C2
>> > + =C2=A0 =C2=A0 =C2=A0 select S3C_DEV_RTC
>> > + =C2=A0 =C2=A0 =C2=A0 select S3C_DEV_WDT
>> > + =C2=A0 =C2=A0 =C2=A0 select S5PV210_SETUP_I2C1
>> > + =C2=A0 =C2=A0 =C2=A0 select S5PV210_SETUP_I2C2
>> > + =C2=A0 =C2=A0 =C2=A0 select S5PV210_SETUP_SDHCI
>> > + =C2=A0 =C2=A0 =C2=A0 help
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Machine support for aESOP Torbreck
>> Just question. Does it TDROID board?
>
>
> No, Torbreck is aESOP community's co-work board. It's not=C2=A0TDORID=
=2E
Then can I get the schematics or information for this board?
e.g., LCD resolution. SD/MMC configuration USB, and so on.

Thank you,
Kyungmin Park
>
>>
>> > +
>> > =C2=A0endmenu
>> >
>> > =C2=A0endif
>> > diff --git a/arch/arm/mach-s5pv210/Makefile
>> > b/arch/arm/mach-s5pv210/Makefile
>> > index 05048c5..927c2b7 100644
>> > --- a/arch/arm/mach-s5pv210/Makefile
>> > +++ b/arch/arm/mach-s5pv210/Makefile
>> > @@ -21,6 +21,7 @@ obj-$(CONFIG_MACH_AQUILA) =C2=A0 =C2=A0 +=3D mac=
h-aquila.o
>> > =C2=A0obj-$(CONFIG_MACH_SMDKV210) =C2=A0 =C2=A0+=3D mach-smdkv210.=
o
>> > =C2=A0obj-$(CONFIG_MACH_SMDKC110) =C2=A0 =C2=A0+=3D mach-smdkc110.=
o
>> > =C2=A0obj-$(CONFIG_MACH_GONI) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0+=3D mach-goni.o
>> > +obj-$(CONFIG_MACH_TORBRECK) =C2=A0 =C2=A0+=3D mach-torbreck.o
>> >
>> > =C2=A0# device support
>> >
>> > diff --git a/arch/arm/mach-s5pv210/mach-torbreck.c
>> > b/arch/arm/mach-s5pv210/mach-torbreck.c
>> > new file mode 100644
>> > index 0000000..3142250
>> > --- /dev/null
>> > +++ b/arch/arm/mach-s5pv210/mach-torbreck.c
>> > @@ -0,0 +1,133 @@
>> > +/* linux/arch/arm/mach-s5pv210/mach-torbreck.c
>> > + *
>> > + * Copyright (c) 2010 aESOP Community
>> > + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.aesop.or.=
kr/
>> > + *
>> > + * This program is free software; you can redistribute it and/or =
modify
>> > + * it under the terms of the GNU General Public License version 2=
 as
>> > + * published by the Free Software Foundation.
>> > +*/
>> > +
>> > +#include <linux/kernel.h>
>> > +#include <linux/types.h>
>> > +#include <linux/i2c.h>
>> > +#include <linux/init.h>
>> > +#include <linux/serial_core.h>
>> > +
>> > +#include <asm/mach/arch.h>
>> > +#include <asm/mach/map.h>
>> > +#include <asm/setup.h>
>> > +#include <asm/mach-types.h>
>> > +
>> > +#include <mach/map.h>
>> > +#include <mach/regs-clock.h>
>> > +
>> > +#include <plat/regs-serial.h>
>> > +#include <plat/s5pv210.h>
>> > +#include <plat/devs.h>
>> > +#include <plat/cpu.h>
>> > +#include <plat/iic.h>
>> > +
>> > +/* Following are default values for UCON, ULCON and UFCON UART
>> > registers */
>> > +#define TORBRECK_UCON_DEFAULT =C2=A0(S3C2410_UCON_TXILEVEL | =C2=A0=
 =C2=A0 =C2=A0 =C2=A0\
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S3C2410_UCON_RXILEVEL | =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S3C2410_UCON_TXIRQMODE | =C2=
=A0 =C2=A0 =C2=A0 \
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S3C2410_UCON_RXIRQMODE | =C2=
=A0 =C2=A0 =C2=A0 \
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S3C2410_UCON_RXFIFO_TOI | =
=C2=A0 =C2=A0 =C2=A0\
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S3C2443_UCON_RXERR_IRQEN)
>> > +
>> > +#define TORBRECK_ULCON_DEFAULT S3C2410_LCON_CS8
>> > +
>> > +#define TORBRECK_UFCON_DEFAULT (S3C2410_UFCON_FIFOMODE | =C2=A0 =C2=
=A0 =C2=A0 \
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S5PV210_UFCON_TXTRIG4 | =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S5PV210_UFCON_RXTRIG4)
>>
>> Any reason to use TRIG4? just use the full trigger e.g., 256.
>
>
> Okay, I'll fix it.
>
>>
>> > +
>> > +static struct s3c2410_uartcfg torbreck_uartcfgs[] __initdata =3D =
{
>> > + =C2=A0 =C2=A0 =C2=A0 [0] =3D {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hwport =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D 0,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D 0,
>> There's no code for flags, please remove it all.
>
>
> Okay, I'll remove it.
>
>>
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ucon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D TORBRECK_UCON_DEFAULT,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ulcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_ULCON_DEFAULT,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ufcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_UFCON_DEFAULT,
>> > + =C2=A0 =C2=A0 =C2=A0 },
>> > + =C2=A0 =C2=A0 =C2=A0 [1] =3D {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hwport =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D 1,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D 0,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ucon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D TORBRECK_UCON_DEFAULT,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ulcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_ULCON_DEFAULT,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ufcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_UFCON_DEFAULT,
>> > + =C2=A0 =C2=A0 =C2=A0 },
>> > + =C2=A0 =C2=A0 =C2=A0 [2] =3D {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hwport =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D 2,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D 0,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ucon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D TORBRECK_UCON_DEFAULT,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ulcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_ULCON_DEFAULT,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ufcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_UFCON_DEFAULT,
>> > + =C2=A0 =C2=A0 =C2=A0 },
>> > + =C2=A0 =C2=A0 =C2=A0 [3] =3D {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hwport =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D 3,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D 0,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ucon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D TORBRECK_UCON_DEFAULT,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ulcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_ULCON_DEFAULT,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ufcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_UFCON_DEFAULT,
>> > + =C2=A0 =C2=A0 =C2=A0 },
>> > +};
>> > +
>> > +static struct platform_device *torbreck_devices[] __initdata =3D =
{
>> > + =C2=A0 =C2=A0 =C2=A0 &s5pv210_device_iis0,
>> > + =C2=A0 =C2=A0 =C2=A0 &s3c_device_cfcon,
>> > + =C2=A0 =C2=A0 =C2=A0 &s3c_device_hsmmc0,
>> > + =C2=A0 =C2=A0 =C2=A0 &s3c_device_hsmmc1,
>> > + =C2=A0 =C2=A0 =C2=A0 &s3c_device_hsmmc2,
>> > + =C2=A0 =C2=A0 =C2=A0 &s3c_device_hsmmc3,
>> > + =C2=A0 =C2=A0 =C2=A0 &s3c_device_i2c0,
>> > + =C2=A0 =C2=A0 =C2=A0 &s3c_device_i2c1,
>> > + =C2=A0 =C2=A0 =C2=A0 &s3c_device_i2c2,
>> > + =C2=A0 =C2=A0 =C2=A0 &s3c_device_rtc,
>> > + =C2=A0 =C2=A0 =C2=A0 &s3c_device_wdt,
>> > +};
>> > +
>> > +static struct i2c_board_info torbreck_i2c_devs0[] __initdata =3D =
{
>> > + =C2=A0 =C2=A0 =C2=A0 /* To Be Updated */
>> > +};
>> > +
>> > +static struct i2c_board_info torbreck_i2c_devs1[] __initdata =3D =
{
>> > + =C2=A0 =C2=A0 =C2=A0 /* To Be Updated */
>> > +};
>> > +
>> > +static struct i2c_board_info torbreck_i2c_devs2[] __initdata =3D =
{
>> > + =C2=A0 =C2=A0 =C2=A0 /* To Be Updated */
>> > +};
>> > +
>> > +static void __init torbreck_map_io(void)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 s5p_init_io(NULL, 0, S5P_VA_CHIPID);
>> > + =C2=A0 =C2=A0 =C2=A0 s3c24xx_init_clocks(24000000);
>> > + =C2=A0 =C2=A0 =C2=A0 s3c24xx_init_uarts(torbreck_uartcfgs,
>> > ARRAY_SIZE(torbreck_uartcfgs));
>> > +}
>> > +
>> > +static void __init torbreck_machine_init(void)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 s3c_i2c0_set_platdata(NULL);
>> > + =C2=A0 =C2=A0 =C2=A0 s3c_i2c1_set_platdata(NULL);
>> > + =C2=A0 =C2=A0 =C2=A0 s3c_i2c2_set_platdata(NULL);
>> > + =C2=A0 =C2=A0 =C2=A0 i2c_register_board_info(0, torbreck_i2c_dev=
s0,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ARRAY_SIZE(torbreck_i2c_devs0));
>> > + =C2=A0 =C2=A0 =C2=A0 i2c_register_board_info(1, torbreck_i2c_dev=
s1,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ARRAY_SIZE(torbreck_i2c_devs1));
>> > + =C2=A0 =C2=A0 =C2=A0 i2c_register_board_info(2, torbreck_i2c_dev=
s2,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ARRAY_SIZE(torbreck_i2c_devs2));
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 platform_add_devices(torbreck_devices,
>> > ARRAY_SIZE(torbreck_devices));
>> > +}
>> > +
>> > +MACHINE_START(TORBRECK, "TORBRECK")
>> > + =C2=A0 =C2=A0 =C2=A0 /* Maintainer: Hyunchul Ko <ghcstop@gmail.c=
om> */
>> > + =C2=A0 =C2=A0 =C2=A0 .phys_io =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D S3C=
_PA_UART & 0xfff00000,
>> > + =C2=A0 =C2=A0 =C2=A0 .io_pg_offst =C2=A0 =C2=A0=3D (((u32)S3C_VA=
_UART) >> 18) & 0xfffc,
>> > + =C2=A0 =C2=A0 =C2=A0 .boot_params =C2=A0 =C2=A0=3D S5P_PA_SDRAM =
+ 0x100,
>> > + =C2=A0 =C2=A0 =C2=A0 .init_irq =C2=A0 =C2=A0 =C2=A0 =3D s5pv210_=
init_irq,
>> > + =C2=A0 =C2=A0 =C2=A0 .map_io =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D tor=
breck_map_io,
>> > + =C2=A0 =C2=A0 =C2=A0 .init_machine =C2=A0 =3D torbreck_machine_i=
nit,
>> > + =C2=A0 =C2=A0 =C2=A0 .timer =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 &s3c24xx_timer,
>> > +MACHINE_END
>> > --
>> > 1.5.6.3
>> >
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe
>> > linux-samsung-soc" in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info=
=2Ehtml
>> >
>
> Thanks,
> Kyuho Choi
