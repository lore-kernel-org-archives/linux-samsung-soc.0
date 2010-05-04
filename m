From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v2 1/2] ARM: S5PV210: Add S5PV210 GPIO support
Date: Tue, 4 May 2010 12:18:32 +0900
Message-ID: <t2n9c9fda241005032018odc1eb6beia07c6252f25ded2b@mail.gmail.com>
References: <1272940641-31220-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:47319 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750958Ab0EDDSd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 May 2010 23:18:33 -0400
Received: by vws19 with SMTP id 19so2456952vws.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 May 2010 20:18:32 -0700 (PDT)
In-Reply-To: <1272940641-31220-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi,

On Tue, May 4, 2010 at 11:37 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> This patch adds GPIOlib support for S5PV210.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-s5pv210/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
> =A0arch/arm/mach-s5pv210/gpio.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0495 ++++++++++++++++++++++++
> =A0arch/arm/mach-s5pv210/include/mach/gpio.h =A0 =A0 =A0| =A0 97 ++++=
+-
> =A0arch/arm/mach-s5pv210/include/mach/regs-gpio.h | =A0 77 ++++
> =A04 files changed, 667 insertions(+), 4 deletions(-)
> =A0create mode 100644 arch/arm/mach-s5pv210/gpio.c
> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/regs-gpio.h
>
> diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/M=
akefile
> index 7469d10..cb959ea 100644
> --- a/arch/arm/mach-s5pv210/Makefile
> +++ b/arch/arm/mach-s5pv210/Makefile
> @@ -12,7 +12,7 @@ obj- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0:=3D
>
> =A0# Core support for S5PV210 system
>
> -obj-$(CONFIG_CPU_S5PV210) =A0 =A0 =A0+=3D cpu.o init.o clock.o
> +obj-$(CONFIG_CPU_S5PV210) =A0 =A0 =A0+=3D cpu.o init.o clock.o gpio.=
o
>
> =A0# machine support
>
> diff --git a/arch/arm/mach-s5pv210/gpio.c b/arch/arm/mach-s5pv210/gpi=
o.c
> new file mode 100644
> index 0000000..88f4802
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/gpio.c
> @@ -0,0 +1,495 @@
> +/* linux/arch/arm/mach-s5pv210/gpio.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * S5PV210 - GPIOlib support
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/irq.h>
> +#include <linux/io.h>
> +#include <mach/map.h>
> +#include <mach/gpio.h>
> +#include <mach/regs-gpio.h>
> +#include <plat/gpio-core.h>
> +#include <plat/gpio-cfg.h>
> +#include <plat/gpio-cfg-helpers.h>
> +
> +static struct s3c_gpio_cfg gpio_cfg =3D {
> + =A0 =A0 =A0 .cfg_eint =A0 =A0 =A0 =3D 0xf,

What's the purpose of 'cfg_eint'? As I know no place to use it.

> + =A0 =A0 =A0 .set_config =A0 =A0 =3D s3c_gpio_setcfg_s3c64xx_4bit,
> + =A0 =A0 =A0 .set_pull =A0 =A0 =A0 =3D s3c_gpio_setpull_updown,
> + =A0 =A0 =A0 .get_pull =A0 =A0 =A0 =3D s3c_gpio_getpull_updown,
> +};
> +
> +static struct s3c_gpio_cfg gpio_cfg_noint =3D {
> + =A0 =A0 =A0 .set_config =A0 =A0 =3D s3c_gpio_setcfg_s3c64xx_4bit,
> + =A0 =A0 =A0 .set_pull =A0 =A0 =A0 =3D s3c_gpio_setpull_updown,
> + =A0 =A0 =A0 .get_pull =A0 =A0 =A0 =3D s3c_gpio_getpull_updown,
> +};
> +
> +static struct s3c_gpio_chip s5pv210_gpio_4bit[] =3D {
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPA0_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PA0(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_A0_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPA0",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPA1_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PA1(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_A1_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPA1",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPB_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PB(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_B_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPB",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPC0_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PC0(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_C0_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPC0",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPC1_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PC1(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_C1_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPC1",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPD0_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PD0(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_D0_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPD0",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPD1_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PD1(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_D1_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPD1",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPE0_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PE0(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_E0_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPE0",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPE1_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PE1(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_E1_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPE1",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPF0_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PF0(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_F0_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPF0",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPF1_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PF1(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_F1_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPF1",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPF2_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PF2(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_F2_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPF2",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPF3_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PF3(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_F3_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPF3",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPG0_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PG0(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_G0_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPG0",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPG1_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PG1(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_G1_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPG1",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPG2_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PG2(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_G2_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPG2",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPG3_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PG3(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_G3_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPG3",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPH0_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PH0(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_H0_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPH0",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPH1_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PH1(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_H1_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPH1",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPH2_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PH2(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_H2_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPH2",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPH3_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PH3(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_H3_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPH3",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPI_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PI(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_I_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPI",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPJ0_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PJ0(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_J0_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPJ0",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPJ1_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PJ1(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_J1_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPJ1",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPJ2_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PJ2(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_J2_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPJ2",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPJ3_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PJ3(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_J3_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPJ3",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_GPJ4_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_G=
PJ4(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_J4_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPJ4",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP01_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P01(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP01_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP01",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP02_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P02(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP02_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP02",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP03_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P03(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP03_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP03",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP04_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P04(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP04_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP04",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP05_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P05(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP05_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP05",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP06_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P06(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP06_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP06",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {

=46rom MP06 to end is there any possibility to use GPIO interrupt? If
not, how about to remove it. It consumes the memory and increase code
itself. It's only function pin instead of GPIOs.

Thank you,
Kyungmin Park

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP07_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P07(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP07_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP07",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP10_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P10(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP10_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP10",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP11_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P11(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP11_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP11",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP12_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P12(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP12_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP12",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP13_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P13(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP13_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP13",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP14_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P14(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP14_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP14",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP15_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P15(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP15_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP15",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP16_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P16(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP16_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP16",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP17_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P17(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP17_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP17",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP18_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P18(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP18_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP18",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP20_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P20(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP20_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP20",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP21_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P21(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP21_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP21",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP22_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P22(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP22_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP22",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP23_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P23(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP23_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP23",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP24_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P24(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP24_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP24",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP25_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P25(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP25_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP25",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP26_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P26(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP26_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP26",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP27_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P27(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP27_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP27",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_MP28_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_M=
P28(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_MP28_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "MP28",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_ETC0_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_E=
TC0(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_ETC0_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "ETC0",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_ETC1_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_E=
TC1(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_ETC1_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "ETC1",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_ETC2_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_E=
TC2(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_ETC2_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "ETC2",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_ETC4_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_noint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PV210_E=
TC4(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PV210_G=
PIO_ETC4_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "ETC4",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 },
> +};
> +
> +static __init int s5pv210_gpiolib_init(void)
> +{
> + =A0 =A0 =A0 samsung_gpiolib_add_4bit_chips(s5pv210_gpio_4bit,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0ARRAY_SIZE(s5pv210_gpio_4bit));
> +
> + =A0 =A0 =A0 return 0;
> +}
> +core_initcall(s5pv210_gpiolib_init);
> diff --git a/arch/arm/mach-s5pv210/include/mach/gpio.h b/arch/arm/mac=
h-s5pv210/include/mach/gpio.h
> index 533b020..ddbbfc3 100644
> --- a/arch/arm/mach-s5pv210/include/mach/gpio.h
> +++ b/arch/arm/mach-s5pv210/include/mach/gpio.h
> @@ -47,6 +47,39 @@
> =A0#define S5PV210_GPIO_J3_NR =A0 =A0 (8)
> =A0#define S5PV210_GPIO_J4_NR =A0 =A0 (5)
>
> +#define S5PV210_GPIO_MP01_NR =A0 (8)
> +#define S5PV210_GPIO_MP02_NR =A0 (4)
> +#define S5PV210_GPIO_MP03_NR =A0 (8)
> +#define S5PV210_GPIO_MP04_NR =A0 (8)
> +#define S5PV210_GPIO_MP05_NR =A0 (8)
> +#define S5PV210_GPIO_MP06_NR =A0 (8)
> +#define S5PV210_GPIO_MP07_NR =A0 (8)
> +
> +#define S5PV210_GPIO_MP10_NR =A0 (8)
> +#define S5PV210_GPIO_MP11_NR =A0 (8)
> +#define S5PV210_GPIO_MP12_NR =A0 (8)
> +#define S5PV210_GPIO_MP13_NR =A0 (8)
> +#define S5PV210_GPIO_MP14_NR =A0 (8)
> +#define S5PV210_GPIO_MP15_NR =A0 (8)
> +#define S5PV210_GPIO_MP16_NR =A0 (8)
> +#define S5PV210_GPIO_MP17_NR =A0 (8)
> +#define S5PV210_GPIO_MP18_NR =A0 (7)
> +
> +#define S5PV210_GPIO_MP20_NR =A0 (8)
> +#define S5PV210_GPIO_MP21_NR =A0 (8)
> +#define S5PV210_GPIO_MP22_NR =A0 (8)
> +#define S5PV210_GPIO_MP23_NR =A0 (8)
> +#define S5PV210_GPIO_MP24_NR =A0 (8)
> +#define S5PV210_GPIO_MP25_NR =A0 (8)
> +#define S5PV210_GPIO_MP26_NR =A0 (8)
> +#define S5PV210_GPIO_MP27_NR =A0 (8)
> +#define S5PV210_GPIO_MP28_NR =A0 (7)
> +
> +#define S5PV210_GPIO_ETC0_NR =A0 (6)
> +#define S5PV210_GPIO_ETC1_NR =A0 (8)
> +#define S5PV210_GPIO_ETC2_NR =A0 (8)
> +#define S5PV210_GPIO_ETC4_NR =A0 (6)
> +
> =A0/* GPIO bank numbers */
>
> =A0/* CONFIG_S3C_GPIO_SPACE allows the user to select extra
> @@ -85,6 +118,35 @@ enum s5p_gpio_number {
> =A0 =A0 =A0 =A0S5PV210_GPIO_J2_START =A0 =3D S5PV210_GPIO_NEXT(S5PV21=
0_GPIO_J1),
> =A0 =A0 =A0 =A0S5PV210_GPIO_J3_START =A0 =3D S5PV210_GPIO_NEXT(S5PV21=
0_GPIO_J2),
> =A0 =A0 =A0 =A0S5PV210_GPIO_J4_START =A0 =3D S5PV210_GPIO_NEXT(S5PV21=
0_GPIO_J3),
> + =A0 =A0 =A0 S5PV210_GPIO_MP01_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_J4),
> + =A0 =A0 =A0 S5PV210_GPIO_MP02_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP01),
> + =A0 =A0 =A0 S5PV210_GPIO_MP03_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP02),
> + =A0 =A0 =A0 S5PV210_GPIO_MP04_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP03),
> + =A0 =A0 =A0 S5PV210_GPIO_MP05_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP04),
> + =A0 =A0 =A0 S5PV210_GPIO_MP06_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP05),
> + =A0 =A0 =A0 S5PV210_GPIO_MP07_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP06),
> + =A0 =A0 =A0 S5PV210_GPIO_MP10_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP07),
> + =A0 =A0 =A0 S5PV210_GPIO_MP11_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP10),
> + =A0 =A0 =A0 S5PV210_GPIO_MP12_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP11),
> + =A0 =A0 =A0 S5PV210_GPIO_MP13_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP12),
> + =A0 =A0 =A0 S5PV210_GPIO_MP14_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP13),
> + =A0 =A0 =A0 S5PV210_GPIO_MP15_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP14),
> + =A0 =A0 =A0 S5PV210_GPIO_MP16_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP15),
> + =A0 =A0 =A0 S5PV210_GPIO_MP17_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP16),
> + =A0 =A0 =A0 S5PV210_GPIO_MP18_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP17),
> + =A0 =A0 =A0 S5PV210_GPIO_MP20_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP18),
> + =A0 =A0 =A0 S5PV210_GPIO_MP21_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP20),
> + =A0 =A0 =A0 S5PV210_GPIO_MP22_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP21),
> + =A0 =A0 =A0 S5PV210_GPIO_MP23_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP22),
> + =A0 =A0 =A0 S5PV210_GPIO_MP24_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP23),
> + =A0 =A0 =A0 S5PV210_GPIO_MP25_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP24),
> + =A0 =A0 =A0 S5PV210_GPIO_MP26_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP25),
> + =A0 =A0 =A0 S5PV210_GPIO_MP27_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP26),
> + =A0 =A0 =A0 S5PV210_GPIO_MP28_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP27),
> + =A0 =A0 =A0 S5PV210_GPIO_ETC0_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_MP28),
> + =A0 =A0 =A0 S5PV210_GPIO_ETC1_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_ETC0),
> + =A0 =A0 =A0 S5PV210_GPIO_ETC2_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_ETC1),
> + =A0 =A0 =A0 S5PV210_GPIO_ETC4_START =3D S5PV210_GPIO_NEXT(S5PV210_G=
PIO_ETC2),
> =A0};
>
> =A0/* S5PV210 GPIO number definitions */
> @@ -115,13 +177,42 @@ enum s5p_gpio_number {
> =A0#define S5PV210_GPJ2(_nr) =A0 =A0 =A0(S5PV210_GPIO_J2_START + (_nr=
))
> =A0#define S5PV210_GPJ3(_nr) =A0 =A0 =A0(S5PV210_GPIO_J3_START + (_nr=
))
> =A0#define S5PV210_GPJ4(_nr) =A0 =A0 =A0(S5PV210_GPIO_J4_START + (_nr=
))
> +#define S5PV210_MP01(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP01_START + (_nr=
))
> +#define S5PV210_MP02(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP02_START + (_nr=
))
> +#define S5PV210_MP03(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP03_START + (_nr=
))
> +#define S5PV210_MP04(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP04_START + (_nr=
))
> +#define S5PV210_MP05(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP05_START + (_nr=
))
> +#define S5PV210_MP06(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP06_START + (_nr=
))
> +#define S5PV210_MP07(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP07_START + (_nr=
))
> +#define S5PV210_MP10(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP10_START + (_nr=
))
> +#define S5PV210_MP11(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP11_START + (_nr=
))
> +#define S5PV210_MP12(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP12_START + (_nr=
))
> +#define S5PV210_MP13(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP13_START + (_nr=
))
> +#define S5PV210_MP14(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP14_START + (_nr=
))
> +#define S5PV210_MP15(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP15_START + (_nr=
))
> +#define S5PV210_MP16(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP16_START + (_nr=
))
> +#define S5PV210_MP17(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP17_START + (_nr=
))
> +#define S5PV210_MP18(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP18_START + (_nr=
))
> +#define S5PV210_MP20(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP20_START + (_nr=
))
> +#define S5PV210_MP21(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP21_START + (_nr=
))
> +#define S5PV210_MP22(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP22_START + (_nr=
))
> +#define S5PV210_MP23(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP23_START + (_nr=
))
> +#define S5PV210_MP24(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP24_START + (_nr=
))
> +#define S5PV210_MP25(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP25_START + (_nr=
))
> +#define S5PV210_MP26(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP26_START + (_nr=
))
> +#define S5PV210_MP27(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP27_START + (_nr=
))
> +#define S5PV210_MP28(_nr) =A0 =A0 =A0(S5PV210_GPIO_MP28_START + (_nr=
))
> +#define S5PV210_ETC0(_nr) =A0 =A0 =A0(S5PV210_GPIO_ETC0_START + (_nr=
))
> +#define S5PV210_ETC1(_nr) =A0 =A0 =A0(S5PV210_GPIO_ETC1_START + (_nr=
))
> +#define S5PV210_ETC2(_nr) =A0 =A0 =A0(S5PV210_GPIO_ETC2_START + (_nr=
))
> +#define S5PV210_ETC4(_nr) =A0 =A0 =A0(S5PV210_GPIO_ETC4_START + (_nr=
))
>
> =A0/* the end of the S5PV210 specific gpios */
> -#define S5PV210_GPIO_END =A0 =A0 =A0 (S5PV210_GPJ4(S5PV210_GPIO_J4_N=
R) + 1)
> +#define S5PV210_GPIO_END =A0 =A0 =A0 (S5PV210_ETC4(S5PV210_GPIO_ETC4=
_NR) + 1)
> =A0#define S3C_GPIO_END =A0 =A0 =A0 =A0 =A0 S5PV210_GPIO_END
>
> -/* define the number of gpios we need to the one after the GPJ4() ra=
nge */
> -#define ARCH_NR_GPIOS =A0 =A0 =A0 =A0 =A0(S5PV210_GPJ4(S5PV210_GPIO_=
J4_NR) + =A0 =A0 \
> +/* define the number of gpios we need to the one after the ETC4() ra=
nge */
> +#define ARCH_NR_GPIOS =A0 =A0 =A0 =A0 =A0(S5PV210_ETC4(S5PV210_GPIO_=
ETC4_NR) + =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CONFI=
G_SAMSUNG_GPIO_EXTRA + 1)
>
> =A0#include <asm-generic/gpio.h>
> diff --git a/arch/arm/mach-s5pv210/include/mach/regs-gpio.h b/arch/ar=
m/mach-s5pv210/include/mach/regs-gpio.h
> new file mode 100644
> index 0000000..c78bbeb
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/include/mach/regs-gpio.h
> @@ -0,0 +1,77 @@
> +/* linux/arch/arm/mach-s5pv210/include/mach/regs-gpio.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * S5PV210 - GPIO register definitions
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_REGS_GPIO_H
> +#define __ASM_ARCH_REGS_GPIO_H __FILE__
> +
> +#include <mach/map.h>
> +
> +/* Base addresses for each of the banks */
> +
> +#define S5PV210_GPA0_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x000)
> +#define S5PV210_GPA1_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x020)
> +#define S5PV210_GPB_BASE =A0 =A0 =A0 (S5P_VA_GPIO + 0x040)
> +#define S5PV210_GPC0_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x060)
> +#define S5PV210_GPC1_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x080)
> +#define S5PV210_GPD0_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x0A0)
> +#define S5PV210_GPD1_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x0C0)
> +#define S5PV210_GPE0_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x0E0)
> +#define S5PV210_GPE1_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x100)
> +#define S5PV210_GPF0_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x120)
> +#define S5PV210_GPF1_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x140)
> +#define S5PV210_GPF2_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x160)
> +#define S5PV210_GPF3_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x180)
> +#define S5PV210_GPG0_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x1A0)
> +#define S5PV210_GPG1_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x1C0)
> +#define S5PV210_GPG2_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x1E0)
> +#define S5PV210_GPG3_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x200)
> +#define S5PV210_GPH0_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0xC00)
> +#define S5PV210_GPH1_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0xC20)
> +#define S5PV210_GPH2_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0xC40)
> +#define S5PV210_GPH3_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0xC60)
> +#define S5PV210_GPI_BASE =A0 =A0 =A0 (S5P_VA_GPIO + 0x220)
> +#define S5PV210_GPJ0_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x240)
> +#define S5PV210_GPJ1_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x260)
> +#define S5PV210_GPJ2_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x280)
> +#define S5PV210_GPJ3_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x2A0)
> +#define S5PV210_GPJ4_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x2C0)
> +#define S5PV210_MP01_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x2E0)
> +#define S5PV210_MP02_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x300)
> +#define S5PV210_MP03_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x320)
> +#define S5PV210_MP04_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x340)
> +#define S5PV210_MP05_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x360)
> +#define S5PV210_MP06_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x380)
> +#define S5PV210_MP07_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x3A0)
> +#define S5PV210_MP10_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x3C0)
> +#define S5PV210_MP11_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x3E0)
> +#define S5PV210_MP12_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x400)
> +#define S5PV210_MP13_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x420)
> +#define S5PV210_MP14_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x440)
> +#define S5PV210_MP15_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x460)
> +#define S5PV210_MP16_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x480)
> +#define S5PV210_MP17_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x4A0)
> +#define S5PV210_MP18_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x4C0)
> +#define S5PV210_MP20_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x4E0)
> +#define S5PV210_MP21_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x500)
> +#define S5PV210_MP22_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x520)
> +#define S5PV210_MP23_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x540)
> +#define S5PV210_MP24_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x560)
> +#define S5PV210_MP25_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x580)
> +#define S5PV210_MP26_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x5A0)
> +#define S5PV210_MP27_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x5C0)
> +#define S5PV210_MP28_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x5E0)
> +#define S5PV210_ETC0_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x600)
> +#define S5PV210_ETC1_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x620)
> +#define S5PV210_ETC2_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x640)
> +#define S5PV210_ETC4_BASE =A0 =A0 =A0(S5P_VA_GPIO + 0x660)
> +
> +#endif /* __ASM_ARCH_REGS_GPIO_H */
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
