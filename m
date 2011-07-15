From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 2/6] ARM: S5P64X0: Add register base and IRQ for Framebuffer
Date: Fri, 15 Jul 2011 11:26:46 +0530
Message-ID: <CAEC9eQMkdT2NdDhSTyDiT7yEVXrk3ELELnTg2u6w7dwqTyWAZA@mail.gmail.com>
References: <1310650036-28836-1-git-send-email-ajaykumar.rs@samsung.com>
	<1310650036-28836-3-git-send-email-ajaykumar.rs@samsung.com>
	<000001cc4217$abe319d0$03a94d70$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f52.google.com ([209.85.161.52]:43145 "EHLO
	mail-fx0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932460Ab1GOF4s convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2011 01:56:48 -0400
Received: by fxd18 with SMTP id 18so2252041fxd.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2011 22:56:47 -0700 (PDT)
In-Reply-To: <000001cc4217$abe319d0$03a94d70$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lethal@linux-sh.org, jg1.han@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>

Hi Marek,

On Thu, Jul 14, 2011 at 4:47 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hello,
>
> On Thursday, July 14, 2011 3:27 PM Ajay Kumar wrote:
>
> > This patch adds:
> > o Framebuffer related register mappings and bit fields.
> > o IRQ number being used.
> >
> > Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> > ---
> > =A0arch/arm/mach-s5p64x0/include/mach/irqs.h =A0 =A0| =A0 =A04 ++++
> > =A0arch/arm/mach-s5p64x0/include/mach/map.h =A0 =A0 | =A0 =A03 +++
> > =A0arch/arm/mach-s5p64x0/include/mach/regs-fb.h | =A0 19 ++++++++++=
+++++++++
> > =A03 files changed, 26 insertions(+), 0 deletions(-)
> > =A0create mode 100644 arch/arm/mach-s5p64x0/include/mach/regs-fb.h
> >
> > diff --git a/arch/arm/mach-s5p64x0/include/mach/irqs.h b/arch/arm/m=
ach-
> > s5p64x0/include/mach/irqs.h
> > index 513abff..09995b8 100644
> > --- a/arch/arm/mach-s5p64x0/include/mach/irqs.h
> > +++ b/arch/arm/mach-s5p64x0/include/mach/irqs.h
> > @@ -85,6 +85,10 @@
> > =A0#define IRQ_S3CUART_RX4 =A0 =A0 =A0 =A0 =A0 =A0 =A0IRQ_S5P_UART_=
RX4
> > =A0#define IRQ_S3CUART_RX5 =A0 =A0 =A0 =A0 =A0 =A0 =A0IRQ_S5P_UART_=
RX5
> >
> > +#define IRQ_LCD_FIFO =A0 =A0 =A0 =A0 IRQ_DISPCON0
> > +#define IRQ_LCD_VSYNC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0IRQ_DISPCON1
> > +#define IRQ_LCD_SYSTEM =A0 =A0 =A0 =A0 =A0 =A0 =A0 IRQ_DISPCON2
> > +
> > =A0/* S5P6450 EINT feature will be added */
> >
> > =A0/*
> > diff --git a/arch/arm/mach-s5p64x0/include/mach/map.h b/arch/arm/ma=
ch-
> > s5p64x0/include/mach/map.h
> > index 95c9125..c5ef50c 100644
> > --- a/arch/arm/mach-s5p64x0/include/mach/map.h
> > +++ b/arch/arm/mach-s5p64x0/include/mach/map.h
> > @@ -47,6 +47,8 @@
> >
> > =A0#define S5P64X0_PA_HSMMC(x) =A0(0xED800000 + ((x) * 0x100000))
> >
> > +#define S5P64X0_PA_FB =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00xEE000000
> > +
> > =A0#define S5P64X0_PA_I2S =A0 =A0 =A0 =A0 =A0 =A0 =A0 0xF2000000
> > =A0#define S5P6450_PA_I2S1 =A0 =A0 =A0 =A0 =A0 =A0 =A00xF2800000
> > =A0#define S5P6450_PA_I2S2 =A0 =A0 =A0 =A0 =A0 =A0 =A00xF2900000
> > @@ -64,6 +66,7 @@
> > =A0#define S3C_PA_IIC1 =A0 =A0 =A0 =A0 =A0S5P6440_PA_IIC1
> > =A0#define S3C_PA_RTC =A0 =A0 =A0 =A0 =A0 S5P64X0_PA_RTC
> > =A0#define S3C_PA_WDT =A0 =A0 =A0 =A0 =A0 S5P64X0_PA_WDT
> > +#define S3C_PA_FB =A0 =A0 =A0 =A0 =A0 =A0S5P64X0_PA_FB
> >
> > =A0#define S5P_PA_CHIPID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P64X0_PA_=
CHIPID
> > =A0#define S5P_PA_SROMC =A0 =A0 =A0 =A0 S5P64X0_PA_SROMC
> > diff --git a/arch/arm/mach-s5p64x0/include/mach/regs-fb.h b/arch/ar=
m/mach-
> > s5p64x0/include/mach/regs-fb.h
> > new file mode 100644
> > index 0000000..cbb8d8c
> > --- /dev/null
> > +++ b/arch/arm/mach-s5p64x0/include/mach/regs-fb.h
> > @@ -0,0 +1,19 @@
> > +/*
> > + * linux/arch/arm/mach-s5p64x0/include/mach/regs-fb.h
> > + *
> > + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> > + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> > + *
> > + * Framebuffer register definitions for Samsung S5P64X0.
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > +*/
> > +
> > +#ifndef __ASM_ARCH_MACH_REGS_FB_H
> > +#define __ASM_ARCH_MACH_REGS_FB_H __FILE__
> > +
> > +#include <plat/regs-fb.h>
> > +
> > +#endif /* __ASM_ARCH_MACH_REGS_FB_H */
>
> This patch reminds me, that the arch/arm/mach-*/include/mach/regs-fb.=
h files
> should be
> completely removed. Most of them simply includes the other header fro=
m
> plat-samsung,
> which can be included directly by the driver.
> plat-s5pc100/include/mach/regs-fb.h contains
> some definitions that are not used at all afair, so it can be dropped=
 as well.

I consider your point.
Soon I will send a consolidating patch for all the boards.
Note: Consolidation patch set is based on S5P64X0 patch-set

>
> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
