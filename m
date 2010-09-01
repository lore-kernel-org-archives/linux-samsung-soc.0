From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 01/13] ARM: S5P: Moves initial map for merging S5P64X0
Date: Wed, 1 Sep 2010 18:42:24 +0900
Message-ID: <AANLkTimvMD1V9tMOOFGEacKDS9CZYC8AZYYsA9=A4dAW@mail.gmail.com>
References: <1283324960-21629-1-git-send-email-kgene.kim@samsung.com>
	<1283324960-21629-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:50864 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753740Ab0IAJm0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Sep 2010 05:42:26 -0400
Received: by eyb6 with SMTP id 6so389686eyb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Sep 2010 02:42:24 -0700 (PDT)
In-Reply-To: <1283324960-21629-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

=46or long time you insist to use the S5P prefix, but it's changed to
each SoC name.
anyway good move.

On Wed, Sep 1, 2010 at 4:09 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> This patch moves some initial maps from plat-s5p to machine,
> so that can merge mach-s5p6440 and mach-s5p6450.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-s5p6440/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 37 ++=
++++++++++++++++++++++++---
> =A0arch/arm/mach-s5p6440/include/mach/map.h | =A0 =A07 +-----
> =A0arch/arm/mach-s5p6442/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 27 ++=
+++++++++++++++++--
> =A0arch/arm/mach-s5p6442/include/mach/map.h | =A0 =A06 -----
> =A0arch/arm/mach-s5pc100/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 25 ++=
+++++++++++++++++-
> =A0arch/arm/mach-s5pc100/include/mach/map.h | =A0 11 +++-----
> =A0arch/arm/mach-s5pv210/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 22 ++=
+++++++++++++++-
> =A0arch/arm/mach-s5pv210/include/mach/map.h | =A0 =A08 ------
> =A0arch/arm/mach-s5pv310/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 26 ++=
++++++++++++------
> =A0arch/arm/plat-s5p/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 2=
2 -----------------
> =A010 files changed, 125 insertions(+), 66 deletions(-)
>
> diff --git a/arch/arm/mach-s5p6440/cpu.c b/arch/arm/mach-s5p6440/cpu.=
c
> index 526f33a..a3c33d9 100644
> --- a/arch/arm/mach-s5p6440/cpu.c
> +++ b/arch/arm/mach-s5p6440/cpu.c
> @@ -1,7 +1,7 @@
> =A0/* linux/arch/arm/mach-s5p6440/cpu.c
> =A0*
> - * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> - * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> =A0*
> =A0* This program is free software; you can redistribute it and/or mo=
dify
> =A0* it under the terms of the GNU General Public License version 2 a=
s
> @@ -39,6 +39,32 @@
> =A0#include <plat/s5p6440.h>
> =A0#include <plat/adc-core.h>
>
> +/* Initial IO mappings */
> +
> +static struct map_desc s5p6440_iodesc[] __initdata =3D {
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_GPIO,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5P6440_PA_GPIO),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)VA_VIC0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5P6440_PA_VIC0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_16K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)VA_VIC1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5P6440_PA_VIC1),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_16K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S3C_VA_UART,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S3C_PA_UART),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_512K,

Yes it's just move to each SoCs. but It's too big some SoCs which has
0x400 offset. I think 8K is enough to cover uart.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }
> +};
> +
> =A0static void s5p6440_idle(void)
> =A0{
> =A0 =A0 =A0 =A0unsigned long val;
> @@ -54,15 +80,18 @@ static void s5p6440_idle(void)
> =A0 =A0 =A0 =A0local_irq_enable();
> =A0}
>
> -/* s5p6440_map_io
> +/*
> + * s5p6440_map_io
> =A0*
> =A0* register the standard cpu IO areas
> -*/
> + */
>
> =A0void __init s5p6440_map_io(void)
> =A0{
> =A0 =A0 =A0 =A0/* initialize any device information early */
> =A0 =A0 =A0 =A0s3c_adc_setname("s3c64xx-adc");
> +
> + =A0 =A0 =A0 iotable_init(s5p6440_iodesc, ARRAY_SIZE(s5p6440_iodesc)=
);
> =A0}
>
> =A0void __init s5p6440_init_clocks(int xtal)
> diff --git a/arch/arm/mach-s5p6440/include/mach/map.h b/arch/arm/mach=
-s5p6440/include/mach/map.h
> index 6cc5cbc..11d31fe 100644
> --- a/arch/arm/mach-s5p6440/include/mach/map.h
> +++ b/arch/arm/mach-s5p6440/include/mach/map.h
> @@ -24,23 +24,18 @@
> =A0#define S5P_PA_SYSCON =A0 =A0 =A0 =A0 =A0S5P6440_PA_SYSCON
>
> =A0#define S5P6440_PA_GPIO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE0308000=
)
> -#define S5P_PA_GPIO =A0 =A0 =A0 =A0 =A0 =A0S5P6440_PA_GPIO
>
> =A0#define S5P6440_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE4000000=
)
> -#define S5P_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0S5P6440_PA_VIC0
> +#define S5P6440_PA_VIC1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE4100000)
>
> =A0#define S5P6440_PA_PDMA =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00xE9000000
>
> -#define S5P6440_PA_VIC1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE4100000)
> -#define S5P_PA_VIC1 =A0 =A0 =A0 =A0 =A0 =A0S5P6440_PA_VIC1
> -
> =A0#define S5P6440_PA_TIMER =A0 =A0 =A0 (0xEA000000)
> =A0#define S5P_PA_TIMER =A0 =A0 =A0 =A0 =A0 S5P6440_PA_TIMER
>
> =A0#define S5P6440_PA_RTC =A0 =A0 =A0 =A0 (0xEA100000)
>
> =A0#define S5P6440_PA_WDT =A0 =A0 =A0 =A0 (0xEA200000)
> -#define S5P_PA_WDT =A0 =A0 =A0 =A0 =A0 =A0 S5P6440_PA_WDT
>
> =A0#define S5P6440_PA_UART =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xEC000000=
)
>
> diff --git a/arch/arm/mach-s5p6442/cpu.c b/arch/arm/mach-s5p6442/cpu.=
c
> index a48fb55..d3ab268 100644
> --- a/arch/arm/mach-s5p6442/cpu.c
> +++ b/arch/arm/mach-s5p6442/cpu.c
> @@ -1,7 +1,7 @@
> =A0/* linux/arch/arm/mach-s5p6442/cpu.c
> =A0*
> =A0* Copyright (c) 2010 Samsung Electronics Co., Ltd.
> - * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> =A0*
> =A0* This program is free software; you can redistribute it and/or mo=
dify
> =A0* it under the terms of the GNU General Public License version 2 a=
s
> @@ -47,10 +47,30 @@ static struct map_desc s5p6442_iodesc[] __initdat=
a =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_16K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> =A0 =A0 =A0 =A0}, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_GPIO,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5P6442_PA_GPIO),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)VA_VIC0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5P6442_PA_VIC0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_16K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)VA_VIC1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5P6442_PA_VIC1),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_16K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)VA_VIC2,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(S5P6442_PA_VIC2),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_16K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S3C_VA_UART,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S3C_PA_UART),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_512K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> =A0 =A0 =A0 =A0}
> =A0};
>
> @@ -62,10 +82,11 @@ static void s5p6442_idle(void)
> =A0 =A0 =A0 =A0local_irq_enable();
> =A0}
>
> -/* s5p6442_map_io
> +/*
> + * s5p6442_map_io
> =A0*
> =A0* register the standard cpu IO areas
> -*/
> + */
>
> =A0void __init s5p6442_map_io(void)
> =A0{
> diff --git a/arch/arm/mach-s5p6442/include/mach/map.h b/arch/arm/mach=
-s5p6442/include/mach/map.h
> index 281d256..31fb2e6 100644
> --- a/arch/arm/mach-s5p6442/include/mach/map.h
> +++ b/arch/arm/mach-s5p6442/include/mach/map.h
> @@ -23,16 +23,10 @@
> =A0#define S5P_PA_SYSCON =A0 =A0 =A0 =A0 =A0S5P6442_PA_SYSCON
>
> =A0#define S5P6442_PA_GPIO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE0200000=
)
> -#define S5P_PA_GPIO =A0 =A0 =A0 =A0 =A0 =A0S5P6442_PA_GPIO
>
> =A0#define S5P6442_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE4000000=
)
> -#define S5P_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0S5P6442_PA_VIC0
> -
> =A0#define S5P6442_PA_VIC1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE4100000=
)
> -#define S5P_PA_VIC1 =A0 =A0 =A0 =A0 =A0 =A0S5P6442_PA_VIC1
> -
> =A0#define S5P6442_PA_VIC2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE4200000=
)
> -#define S5P_PA_VIC2 =A0 =A0 =A0 =A0 =A0 =A0S5P6442_PA_VIC2
>
> =A0#define S5P6442_PA_MDMA =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00xE8000000
> =A0#define S5P6442_PA_PDMA =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00xE9000000
> diff --git a/arch/arm/mach-s5pc100/cpu.c b/arch/arm/mach-s5pc100/cpu.=
c
> index 251c92a..d13552c 100644
> --- a/arch/arm/mach-s5pc100/cpu.c
> +++ b/arch/arm/mach-s5pc100/cpu.c
> @@ -1,5 +1,8 @@
> =A0/* linux/arch/arm/mach-s5pc100/cpu.c
> =A0*
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> + *
> =A0* Copyright 2009 Samsung Electronics Co.
> =A0* =A0 =A0 Byungho Min <bhmin@samsung.com>
> =A0*
> @@ -56,11 +59,31 @@ static struct map_desc s5pc100_iodesc[] __initdat=
a =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_16K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> =A0 =A0 =A0 =A0}, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_GPIO,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PC100_PA_GPIO),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)VA_VIC0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PC100_PA_VIC0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_16K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)VA_VIC1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PC100_PA_VIC1),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_16K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)VA_VIC2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5P_PA_VIC2),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PC100_PA_VIC2),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_16K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> =A0 =A0 =A0 =A0}, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S3C_VA_UART,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S3C_PA_UART),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_512K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)S5PC100_VA_OTHERS,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(S5PC100_PA_OTHERS),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_4K,
> diff --git a/arch/arm/mach-s5pc100/include/mach/map.h b/arch/arm/mach=
-s5pc100/include/mach/map.h
> index 01b9134..8751ef4 100644
> --- a/arch/arm/mach-s5pc100/include/mach/map.h
> +++ b/arch/arm/mach-s5pc100/include/mach/map.h
> @@ -44,19 +44,16 @@
> =A0#define S5PC100_PA_OTHERS =A0 =A0 =A0(0xE0200000)
> =A0#define S5PC100_VA_OTHERS =A0 =A0 =A0(S3C_VA_SYS + 0x10000)
>
> -#define S5P_PA_GPIO =A0 =A0 =A0 =A0 =A0 =A0(0xE0300000)
> +#define S5PC100_PA_GPIO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE0300000)
> =A0#define S5PC1XX_VA_GPIO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x=
00500000)
>
> =A0/* Interrupt */
> -#define S5PC100_PA_VIC =A0 =A0 =A0 =A0 (0xE4000000)
> +#define S5PC100_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE4000000)
> +#define S5PC100_PA_VIC1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE4100000)
> +#define S5PC100_PA_VIC2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE4200000)
> =A0#define S5PC100_VA_VIC =A0 =A0 =A0 =A0 S3C_VA_IRQ
> -#define S5PC100_PA_VIC_OFFSET =A00x100000
> =A0#define S5PC100_VA_VIC_OFFSET =A00x10000
> -#define S5PC1XX_PA_VIC(x) =A0 =A0 =A0(S5PC100_PA_VIC + ((x) * S5PC10=
0_PA_VIC_OFFSET))
> =A0#define S5PC1XX_VA_VIC(x) =A0 =A0 =A0(S5PC100_VA_VIC + ((x) * S5PC=
100_VA_VIC_OFFSET))
> -#define S5P_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0S5PC1XX_PA_VIC(0)
> -#define S5P_PA_VIC1 =A0 =A0 =A0 =A0 =A0 =A0S5PC1XX_PA_VIC(1)
> -#define S5P_PA_VIC2 =A0 =A0 =A0 =A0 =A0 =A0S5PC1XX_PA_VIC(2)
>
>
> =A0#define S5PC100_PA_ONENAND =A0 =A0 (0xE7100000)
> diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.=
c
> index b9f4d67..00f9ca1 100644
> --- a/arch/arm/mach-s5pv210/cpu.c
> +++ b/arch/arm/mach-s5pv210/cpu.c
> @@ -1,7 +1,7 @@
> =A0/* linux/arch/arm/mach-s5pv210/cpu.c
> =A0*
> =A0* Copyright (c) 2010 Samsung Electronics Co., Ltd.
> - * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> =A0*
> =A0* This program is free software; you can redistribute it and/or mo=
dify
> =A0* it under the terms of the GNU General Public License version 2 a=
s
> @@ -50,6 +50,21 @@ static struct map_desc s5pv210_iodesc[] __initdata=
 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_1M,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> =A0 =A0 =A0 =A0}, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_GPIO,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PV210_PA_GPIO),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)VA_VIC0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PV210_PA_VIC0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_16K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)VA_VIC1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PV210_PA_VIC1),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_16K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)VA_VIC2,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(S5PV210_PA_VIC2),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_16K,
> @@ -60,6 +75,11 @@ static struct map_desc s5pv210_iodesc[] __initdata=
 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_16K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> =A0 =A0 =A0 =A0}, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S3C_VA_UART,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S3C_PA_UART),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_512K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)S5P_VA_SROMC,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(S5PV210_PA_SROMC),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_4K,
> diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach=
-s5pv210/include/mach/map.h
> index dd4fb6b..cc50541 100644
> --- a/arch/arm/mach-s5pv210/include/mach/map.h
> +++ b/arch/arm/mach-s5pv210/include/mach/map.h
> @@ -26,7 +26,6 @@
> =A0#define S5P_PA_SYSCON =A0 =A0 =A0 =A0 =A0S5PV210_PA_SYSCON
>
> =A0#define S5PV210_PA_GPIO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE0200000=
)
> -#define S5P_PA_GPIO =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_GPIO
>
> =A0/* SPI */
> =A0#define S5PV210_PA_SPI0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00xE1300000
> @@ -72,16 +71,9 @@
> =A0#define S5PV210_PA_HSMMC(x) =A0 =A0(0xEB000000 + ((x) * 0x100000))
>
> =A0#define S5PV210_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2000000=
)
> -#define S5P_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_VIC0
> -
> =A0#define S5PV210_PA_VIC1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2100000=
)
> -#define S5P_PA_VIC1 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_VIC1
> -
> =A0#define S5PV210_PA_VIC2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2200000=
)
> -#define S5P_PA_VIC2 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_VIC2
> -
> =A0#define S5PV210_PA_VIC3 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2300000=
)
> -#define S5P_PA_VIC3 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_VIC3
>
> =A0#define S5PV210_PA_SDRAM =A0 =A0 =A0 (0x20000000)
> =A0#define S5P_PA_SDRAM =A0 =A0 =A0 =A0 =A0 S5PV210_PA_SDRAM
> diff --git a/arch/arm/mach-s5pv310/cpu.c b/arch/arm/mach-s5pv310/cpu.=
c
> index e5b261a..3b9c872 100644
> --- a/arch/arm/mach-s5pv310/cpu.c
> +++ b/arch/arm/mach-s5pv310/cpu.c
> @@ -31,9 +31,14 @@ extern void combiner_cascade_irq(unsigned int comb=
iner_nr, unsigned int irq);
> =A0/* Initial IO mappings */
> =A0static struct map_desc s5pv310_iodesc[] __initdata =3D {
> =A0 =A0 =A0 =A0{
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_COREPERI_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PV310_PA_COREPERI),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_8K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_SYSRAM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PV310_PA_SYSRAM),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_CMU,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PV310_PA_CMU),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_128K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)S5P_VA_COMBINER_BASE,
> @@ -41,19 +46,24 @@ static struct map_desc s5pv310_iodesc[] __initdat=
a =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_4K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> =A0 =A0 =A0 =A0}, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_COREPERI_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PV310_PA_COREPERI),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_8K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)S5P_VA_L2CC,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(S5PV310_PA_L2CC),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_4K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_SYSRAM,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PV310_PA_SYSRAM),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_GPIO,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PV310_PA_GPIO),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_4K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_CMU,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PV310_PA_CMU),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_128K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S3C_VA_UART,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S3C_PA_UART),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_512K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> =A0 =A0 =A0 =A0},
> =A0};
> diff --git a/arch/arm/plat-s5p/cpu.c b/arch/arm/plat-s5p/cpu.c
> index b07a078..57f08ee 100644
> --- a/arch/arm/plat-s5p/cpu.c
> +++ b/arch/arm/plat-s5p/cpu.c
> @@ -89,33 +89,11 @@ static struct map_desc s5p_iodesc[] __initdata =3D=
 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_64K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S3C_VA_UART,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S3C_PA_UART),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_512K,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> -#ifdef CONFIG_ARM_VIC
> - =A0 =A0 =A0 }, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)VA_VIC0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5P_PA_VIC0),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_16K,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> - =A0 =A0 =A0 }, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)VA_VIC1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5P_PA_VIC1),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_16K,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> -#endif
> - =A0 =A0 =A0 }, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)S3C_VA_TIMER,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(S5P_PA_TIMER),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_16K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_GPIO,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5P_PA_GPIO),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> - =A0 =A0 =A0 }, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)S3C_VA_WATCHDOG,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(S3C_PA_WDT),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_4K,
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
