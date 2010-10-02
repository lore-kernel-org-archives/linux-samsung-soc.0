From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: S5PC100: Cleanup the GPIOlib code
Date: Sat, 2 Oct 2010 11:13:51 +0900
Message-ID: <AANLkTimCGD3b6oBQ2LbS=VxC-FBSBp3adMN4q_KgseZz@mail.gmail.com>
References: <1285937894-2864-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:35300 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751375Ab0JBCNx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Oct 2010 22:13:53 -0400
Received: by wwj40 with SMTP id 40so2119109wwj.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Oct 2010 19:13:52 -0700 (PDT)
In-Reply-To: <1285937894-2864-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi,

There's some comments.
At least the s5p series use the same .config =3D &gpio_cfg, so move it
to common code and then can delete it at each SOC gpiolib.

Please also check the other team how modified it since there's some
comments from G  "why do you set each config at for loop. just put it
at each configuration as is.

Thank you,
Kyungmin Park

> -               .base   =3D S5PC100_GPA0_BASE,
> -               .config =3D &gpio_cfg,

On Fri, Oct 1, 2010 at 9:58 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> This patch clean up the GPIO code and removes useless GPIO addresses.
> It can be calculated with offset, the 'base' member of s3c_gpio_chip
> is also initialized in the init function.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-s5pc100/gpiolib.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
172 ++++++++++--------------
> =A0arch/arm/mach-s5pc100/include/mach/regs-gpio.h | =A0 37 -----
> =A02 files changed, 69 insertions(+), 140 deletions(-)
>
> diff --git a/arch/arm/mach-s5pc100/gpiolib.c b/arch/arm/mach-s5pc100/=
gpiolib.c
> index def4ff8..20856eb 100644
> --- a/arch/arm/mach-s5pc100/gpiolib.c
> +++ b/arch/arm/mach-s5pc100/gpiolib.c
> @@ -1,5 +1,7 @@
> -/*
> - * arch/arm/plat-s5pc100/gpiolib.c
> +/* linux/arch/arm/mach-s5pc100/gpiolib.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> =A0*
> =A0* =A0Copyright 2009 Samsung Electronics Co
> =A0* =A0Kyungmin Park <kyungmin.park@samsung.com>
> @@ -80,217 +82,150 @@ static struct s3c_gpio_cfg gpio_cfg_noint =3D {
> =A0 =A0 =A0 =A0.get_pull =A0 =A0 =A0 =3D s3c_gpio_getpull_updown,
> =A0};
>
> +/*
> + * GPIO bank's base address given the index of the bank in the
> + * list of all gpio banks.
> + */
> +#define S5PC100_BANK_BASE(bank_nr) =A0 =A0 (S5P_VA_GPIO + ((bank_nr)=
 * 0x20))
> +
> +/*
> + * Following are the gpio banks in S5PC100.
> + *
> + * The 'config' member when left to NULL, is initialized to the defa=
ult
> + * structure gpio_cfg in the init function below.
> + *
> + * The 'base' member is also initialized in the init function below.
> + * Note: The initialization of 'base' member of s3c_gpio_chip struct=
ure
> + * uses the above macro and depends on the banks being listed in ord=
er here.
> + */
> =A0static struct s3c_gpio_chip s5pc100_gpio_chips[] =3D {
> =A0 =A0 =A0 =A0{
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPA0_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPA0(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_A0_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPA0",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPA1_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPA1(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_A1_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPA1",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPB_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPB(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_B_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPB",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPC_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPC(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_C_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPC",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPD_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPD(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_D_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPD",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPE0_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPE0(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_E0_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPE0",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPE1_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPE1(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_E1_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPE1",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPF0_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPF0(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_F0_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPF0",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPF1_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPF1(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_F1_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPF1",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPF2_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPF2(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_F2_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPF2",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPF3_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPF3(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_F3_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPF3",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPG0_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPG0(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_G0_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPG0",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPG1_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPG1(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_G1_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPG1",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPG2_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPG2(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_G2_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPG2",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPG3_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPG3(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_G3_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPG3",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPH0_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_eint,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .irq_base =3D IRQ_EINT(0),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_G=
PH0(0),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PC100_G=
PIO_H0_NR,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPH0",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .to_irq =3D samsung_gpi=
olib_to_irq,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> - =A0 =A0 =A0 }, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPH1_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_eint,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .irq_base =3D IRQ_EINT(8),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_G=
PH1(0),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PC100_G=
PIO_H1_NR,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPH1",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .to_irq =3D samsung_gpi=
olib_to_irq,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> - =A0 =A0 =A0 }, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPH2_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_eint,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .irq_base =3D IRQ_EINT(16),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_G=
PH2(0),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PC100_G=
PIO_H2_NR,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPH2",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .to_irq =3D samsung_gpi=
olib_to_irq,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> - =A0 =A0 =A0 }, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPH3_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_eint,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .irq_base =3D IRQ_EINT(24),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_G=
PH3(0),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PC100_G=
PIO_H3_NR,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPH3",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .to_irq =3D samsung_gpi=
olib_to_irq,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> - =A0 =A0 =A0 }, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPI_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPI(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_I_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPI",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPJ0_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPJ0(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_J0_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPJ0",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPJ1_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPJ1(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_J1_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPJ1",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPJ2_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPJ2(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_J2_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPJ2",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPJ3_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPJ3(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_J3_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPJ3",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPJ4_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPJ4(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_J4_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPJ4",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPK0_BASE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.config =3D &gpio_cfg_noint,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPK0(0),
> @@ -298,7 +233,6 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] =
=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPK0",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPK1_BASE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.config =3D &gpio_cfg_noint,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPK1(0),
> @@ -306,7 +240,6 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] =
=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPK1",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPK2_BASE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.config =3D &gpio_cfg_noint,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPK2(0),
> @@ -314,7 +247,6 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] =
=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPK2",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPK3_BASE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.config =3D &gpio_cfg_noint,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPK3(0),
> @@ -322,7 +254,6 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] =
=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPK3",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPL0_BASE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.config =3D &gpio_cfg_noint,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPL0(0),
> @@ -330,7 +261,6 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] =
=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPL0",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPL1_BASE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.config =3D &gpio_cfg_noint,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPL1(0),
> @@ -338,7 +268,6 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] =
=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPL1",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPL2_BASE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.config =3D &gpio_cfg_noint,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPL2(0),
> @@ -346,7 +275,6 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] =
=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPL2",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPL3_BASE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.config =3D &gpio_cfg_noint,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPL3(0),
> @@ -354,34 +282,72 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[=
] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPL3",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_GPL4_BASE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.config =3D &gpio_cfg_noint,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S5PC100_=
GPL4(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D S5PC100_=
GPIO_L4_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPL4",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D (S5P_VA_GPIO + 0xC00),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_eint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .irq_base =3D IRQ_EINT(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_G=
PH0(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PC100_G=
PIO_H0_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPH0",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .to_irq =3D samsung_gpi=
olib_to_irq,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D (S5P_VA_GPIO + 0xC20),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_eint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .irq_base =3D IRQ_EINT(8),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_G=
PH1(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PC100_G=
PIO_H1_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPH1",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .to_irq =3D samsung_gpi=
olib_to_irq,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D (S5P_VA_GPIO + 0xC40),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_eint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .irq_base =3D IRQ_EINT(16),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_G=
PH2(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PC100_G=
PIO_H2_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPH2",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .to_irq =3D samsung_gpi=
olib_to_irq,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D (S5P_VA_GPIO + 0xC60),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &gpio_cfg_eint,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .irq_base =3D IRQ_EINT(24),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D S5PC100_G=
PH3(0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D S5PC100_G=
PIO_H3_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPH3",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .to_irq =3D samsung_gpi=
olib_to_irq,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> =A0 =A0 =A0 =A0},
> =A0};
>
> =A0static __init int s5pc100_gpiolib_init(void)
> =A0{
> - =A0 =A0 =A0 struct s3c_gpio_chip *chip;
> - =A0 =A0 =A0 int nr_chips;
> + =A0 =A0 =A0 struct s3c_gpio_chip *chip =3D s5pc100_gpio_chips;
> + =A0 =A0 =A0 int nr_chips =3D ARRAY_SIZE(s5pc100_gpio_chips);
> =A0 =A0 =A0 =A0int gpioint_group =3D 0;
> + =A0 =A0 =A0 int i;
>
> - =A0 =A0 =A0 chip =3D s5pc100_gpio_chips;
> - =A0 =A0 =A0 nr_chips =3D ARRAY_SIZE(s5pc100_gpio_chips);
> -
> - =A0 =A0 =A0 for (; nr_chips > 0; nr_chips--, chip++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chip->config =3D=3D &gpio_cfg) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* gpio interrupts */
> + =A0 =A0 =A0 for (i =3D 0; i < nr_chips; i++, chip++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chip->config =3D=3D NULL) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->config =3D &gpio_=
cfg;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->group =3D gpioin=
t_group++;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chip->base =3D=3D NULL)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->base =3D S5PC100_=
BANK_BASE(i);
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 samsung_gpiolib_add_4bit_chips(s5pc100_gpio_chips,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0ARRAY_SIZE(s5pc100_gpio_chips));
> + =A0 =A0 =A0 samsung_gpiolib_add_4bit_chips(s5pc100_gpio_chips, nr_c=
hips);
>
> =A0 =A0 =A0 =A0return 0;
> =A0}
> diff --git a/arch/arm/mach-s5pc100/include/mach/regs-gpio.h b/arch/ar=
m/mach-s5pc100/include/mach/regs-gpio.h
> index 6abe481..8d3b1ba 100644
> --- a/arch/arm/mach-s5pc100/include/mach/regs-gpio.h
> +++ b/arch/arm/mach-s5pc100/include/mach/regs-gpio.h
> @@ -11,43 +11,6 @@
>
> =A0#include <mach/map.h>
>
> -/* S5PC100 */
> -#define S5PC100_GPIO_BASE =A0 =A0 =A0S5P_VA_GPIO
> -#define S5PC100_GPA0_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0000)
> -#define S5PC100_GPA1_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0020)
> -#define S5PC100_GPB_BASE =A0 =A0 =A0 (S5PC100_GPIO_BASE + 0x0040)
> -#define S5PC100_GPC_BASE =A0 =A0 =A0 (S5PC100_GPIO_BASE + 0x0060)
> -#define S5PC100_GPD_BASE =A0 =A0 =A0 (S5PC100_GPIO_BASE + 0x0080)
> -#define S5PC100_GPE0_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x00A0)
> -#define S5PC100_GPE1_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x00C0)
> -#define S5PC100_GPF0_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x00E0)
> -#define S5PC100_GPF1_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0100)
> -#define S5PC100_GPF2_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0120)
> -#define S5PC100_GPF3_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0140)
> -#define S5PC100_GPG0_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0160)
> -#define S5PC100_GPG1_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0180)
> -#define S5PC100_GPG2_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x01A0)
> -#define S5PC100_GPG3_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x01C0)
> -#define S5PC100_GPH0_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0C00)
> -#define S5PC100_GPH1_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0C20)
> -#define S5PC100_GPH2_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0C40)
> -#define S5PC100_GPH3_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0C60)
> -#define S5PC100_GPI_BASE =A0 =A0 =A0 (S5PC100_GPIO_BASE + 0x01E0)
> -#define S5PC100_GPJ0_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0200)
> -#define S5PC100_GPJ1_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0220)
> -#define S5PC100_GPJ2_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0240)
> -#define S5PC100_GPJ3_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0260)
> -#define S5PC100_GPJ4_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0280)
> -#define S5PC100_GPK0_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x02A0)
> -#define S5PC100_GPK1_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x02C0)
> -#define S5PC100_GPK2_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x02E0)
> -#define S5PC100_GPK3_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0300)
> -#define S5PC100_GPL0_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0320)
> -#define S5PC100_GPL1_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0340)
> -#define S5PC100_GPL2_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0360)
> -#define S5PC100_GPL3_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x0380)
> -#define S5PC100_GPL4_BASE =A0 =A0 =A0(S5PC100_GPIO_BASE + 0x03A0)
> -
> =A0#define S5PC100EINT30CON =A0 =A0 =A0 =A0 =A0 =A0 =A0 (S5P_VA_GPIO =
+ 0xE00)
> =A0#define S5P_EINT_CON(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0(S5PC100EINT30CON + ((x) * 0x4))
>
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
