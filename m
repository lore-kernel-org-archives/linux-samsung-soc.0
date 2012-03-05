From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH v2 1/2] ARM: EXYNOS: Add USB HOST register definitions
Date: Mon, 05 Mar 2012 10:18:00 +0900
Message-ID: <006001ccfa6d$ce97b5d0$6bc72170$%han@samsung.com>
References: <000701ccf76d$8316b0a0$894411e0$%han@samsung.com>
 <201203011624.04551.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:46221 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752019Ab2CEBSD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Mar 2012 20:18:03 -0500
In-reply-to: <201203011624.04551.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, linaro-dev@lists.linaro.org, 'Joonyoung Shim' <jy0922.shim@samsung.com>, patches@linaro.org, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Sangwook Lee' <sangwook.lee@linaro.org>, 'Alan Stern' <stern@rowland.harvard.edu>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Jingoo Han' <jg1.han@samsung.com>

> -----Original Message-----
> From: Heiko Stubner
> Sent: Friday, March 02, 2012 12:24 AM
> To: linux-arm-kernel@lists.infradead.org
> Cc: Jingoo Han; linux-usb@vger.kernel.org; linux-samsung-soc@vger.ker=
nel.org; 'Kukjin Kim'; linaro-
> dev@lists.linaro.org; 'Joonyoung Shim'; patches@linaro.org; 'Greg Kro=
ah-Hartman'; 'Sangwook Lee'; 'Alan
> Stern'; 'Thomas Abraham'
> Subject: Re: [PATCH v2 1/2] ARM: EXYNOS: Add USB HOST register defini=
tions
>=20
> Am Donnerstag, 1. M=E4rz 2012, 06:38:20 schrieb Jingoo Han:
> > This patch adds USB HOST register definitions. The definition for
> > EHCI INSNREG00 regiser and corresponding bit field definitions are
> > added.
> >
> > Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > ---
> > v2: change the definition name from EHCI_ENA_xxx to EHCI_INSNREG00_=
ENA_xxx.
> >
> > arch/arm/mach-exynos/include/mach/regs-usb-host.h |   24
> > +++++++++++++++++++++ 1 files changed, 24 insertions(+), 0 deletion=
s(-)
> >  create mode 100644 arch/arm/mach-exynos/include/mach/regs-usb-host=
=2Eh
> Isn't the general idea to depopulate the mach directories and make dr=
ivers
> buildable across architectures?
>=20
> The definitions are only used in drivers/usb/host/ehci-s5p.c [in the =
second
> patch], so there should be no need to add another arch-header and the=
y could
> simply be included in the driver itself or if necessary a
> drivers/usb/host/ehci-s5p.h=20
Hi, Heiko St=FCbner.

OK, I will move the register definitions from arch/arm/mach-exynos/incl=
ude/mach to
drivers/usb/host/ehci-s5p.c.

Thank you for your suggestion.

>=20
>=20
> Heiko
>=20
> > diff --git a/arch/arm/mach-exynos/include/mach/regs-usb-host.h
> > b/arch/arm/mach-exynos/include/mach/regs-usb-host.h new file mode 1=
00644
> > index 0000000..572b7d4
> > --- /dev/null
> > +++ b/arch/arm/mach-exynos/include/mach/regs-usb-host.h
> > @@ -0,0 +1,24 @@
> > +/*
> > + * Copyright (C) 2012 Samsung Electronics Co.Ltd
> > + *		http://www.samsung.com
> > + *
> > + * EXYNOS - USB HOST register definitions
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#ifndef __REGS_USB_HOST_H
> > +#define __REGS_USB_HOST_H __FILE__
> > +
> > +#define EHCI_INSNREG00(base)			(base + 0x90)
> > +#define EHCI_INSNREG00_ENA_INCR16		(0x1 << 25)
> > +#define EHCI_INSNREG00_ENA_INCR8		(0x1 << 24)
> > +#define EHCI_INSNREG00_ENA_INCR4		(0x1 << 23)
> > +#define EHCI_INSNREG00_ENA_INCRX_ALIGN		(0x1 << 22)
> > +#define EHCI_INSNREG00_ENABLE_DMA_BURST	\
> > +	(EHCI_INSNREG00_ENA_INCR16 | EHCI_INSNREG00_ENA_INCR8 |	\
> > +	 EHCI_INSNREG00_ENA_INCR4 | EHCI_INSNREG00_ENA_INCRX_ALIGN)
> > +
> > +#endif /* __REGS_USB_HOST_H */
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
