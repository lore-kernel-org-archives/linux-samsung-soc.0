From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 1/2] ARM: EXYNOS: Add USB HOST register definitions
Date: Thu, 1 Mar 2012 21:15:41 +0100
Message-ID: <201203012115.42915.heiko@sntech.de>
References: <000701ccf76d$8316b0a0$894411e0$%han@samsung.com> <201203011624.04551.heiko@sntech.de> <CADPsn1ZfXqmOVtw5OdfbXv=xZ3EREbPqCRnpnsYHbhkvx=nb5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:47868 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S964939Ab2CAUPs convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Mar 2012 15:15:48 -0500
In-Reply-To: <CADPsn1ZfXqmOVtw5OdfbXv=xZ3EREbPqCRnpnsYHbhkvx=nb5Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangwook Lee <sangwook.lee@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Jingoo Han <jg1.han@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linaro-dev@lists.linaro.org, Joonyoung Shim <jy0922.shim@samsung.com>, patches@linaro.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Thomas Abraham <thomas.abraham@linaro.org>

Am Donnerstag 01 M=E4rz 2012, 17:10:52 schrieb Sangwook Lee:
> On 1 March 2012 15:24, Heiko St=FCbner <heiko@sntech.de> wrote:
> > Am Donnerstag, 1. M=E4rz 2012, 06:38:20 schrieb Jingoo Han:
> > > This patch adds USB HOST register definitions. The definition for
> > > EHCI INSNREG00 regiser and corresponding bit field definitions ar=
e
> > > added.
> > >=20
> > > Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
> > > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > > ---
> > > v2: change the definition name from EHCI_ENA_xxx to
> >=20
> > EHCI_INSNREG00_ENA_xxx.
> >=20
> > > arch/arm/mach-exynos/include/mach/regs-usb-host.h |   24
> > > +++++++++++++++++++++ 1 files changed, 24 insertions(+), 0 deleti=
ons(-)
> > >=20
> > >  create mode 100644 arch/arm/mach-exynos/include/mach/regs-usb-ho=
st.h
> >=20
> > Isn't the general idea to depopulate the mach directories and make
> > drivers buildable across architectures?
> >=20
> > The definitions are only used in drivers/usb/host/ehci-s5p.c [in th=
e
> > second patch], so there should be no need to add another arch-heade=
r and
> > they could
> > simply be included in the driver itself or if necessary a
> > drivers/usb/host/ehci-s5p.h .
>=20
>  I found out some code related to this burst function.
>=20
>  the snip from ehci-s5pv210.c, 2.6.35 kernel
>=20
>         /* Mark hardware accessible again as we are out of D3 state b=
y now
> */
>         set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
> #if defined(CONFIG_ARCH_S5PV210) || defined(CONFIG_ARCH_S5P6450)
>         ehci_writel(ehci, 0x000F0000, (void __iomem *)ehci->caps + 0x=
90);
> #endif
>=20
> #if defined(CONFIG_ARCH_S5PV310)
>         ehci_writel(ehci, 0x03C00000, (void __iomem *)ehci->caps + 0x=
90);
> #endif
>         if (ehci_readl(ehci, &ehci->regs->configured_flag) =3D=3D FLA=
G_CF) {
>=20
> From this code, this burst function seems to be depending on CPUs,
> The driver by itself is not good idea because echi-s5p.c will have de=
fined.

The current driver in mainline does not contain these ifdefs and this a=
lso=20
should not change. What would happen in the code above if ARCH_S5PV210 =
and=20
ARCH_S5PV310 are selected?

As providing support for more than one SoC in a kernel image is one of =
the=20
current targets, architecture dependant stuff like the code above shoul=
d=20
probably be detected at runtime and definitly not compile-time.

> Which is the better place to pus this CPU specific definition either
> drivers/usb/host/ehci-s5p.h is
> or mach/xx.h or  include/linux/usb/xxx.h ?  I am not clear about this=
=2E

As I understand it, drivers should be compileable even if the underlyin=
g=20
architecture is not selected and hence mustn't depend on architecure co=
de.

Use-cases are for example compile-testing all usb-host drivers at once =
during=20
some sort of rework, or the multi-arch kernel mentioned above.

But I really do not see why these defines you're adding cannot simply l=
ive=20
inside the ehci-s5p.c . For example take a look at=20
drivers/usb/gadget/s3c-hsudc.c . This driver also contains its private =
defines=20
without the need for another header.


> > > diff --git a/arch/arm/mach-exynos/include/mach/regs-usb-host.h
> > > b/arch/arm/mach-exynos/include/mach/regs-usb-host.h new file mode
> > > 100644 index 0000000..572b7d4
> > > --- /dev/null
> > > +++ b/arch/arm/mach-exynos/include/mach/regs-usb-host.h
> > > @@ -0,0 +1,24 @@
> > > +/*
> > > + * Copyright (C) 2012 Samsung Electronics Co.Ltd
> > > + *           http://www.samsung.com
> > > + *
> > > + * EXYNOS - USB HOST register definitions
> > > + *
> > > + * This program is free software; you can redistribute it and/or
> > > modify + * it under the terms of the GNU General Public License
> > > version 2 as + * published by the Free Software Foundation.
> > > + */
> > > +
> > > +#ifndef __REGS_USB_HOST_H
> > > +#define __REGS_USB_HOST_H __FILE__
> > > +
> > > +#define EHCI_INSNREG00(base)                 (base + 0x90)
> > > +#define EHCI_INSNREG00_ENA_INCR16            (0x1 << 25)
> > > +#define EHCI_INSNREG00_ENA_INCR8             (0x1 << 24)
> > > +#define EHCI_INSNREG00_ENA_INCR4             (0x1 << 23)
> > > +#define EHCI_INSNREG00_ENA_INCRX_ALIGN               (0x1 << 22)
> > > +#define EHCI_INSNREG00_ENABLE_DMA_BURST      \
> > > +     (EHCI_INSNREG00_ENA_INCR16 | EHCI_INSNREG00_ENA_INCR8 | \
> > > +      EHCI_INSNREG00_ENA_INCR4 | EHCI_INSNREG00_ENA_INCRX_ALIGN)
> > > +
> > > +#endif /* __REGS_USB_HOST_H */
> >=20
> > --
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-samsung-soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
