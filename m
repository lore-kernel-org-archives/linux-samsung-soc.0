From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 1/2] ARM: EXYNOS: Add USB HOST register definitions
Date: Thu, 1 Mar 2012 16:24:03 +0100
Message-ID: <201203011624.04551.heiko@sntech.de>
References: <000701ccf76d$8316b0a0$894411e0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:51891 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966209Ab2CAPYO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Mar 2012 10:24:14 -0500
In-Reply-To: <000701ccf76d$8316b0a0$894411e0$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Jingoo Han <jg1.han@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, linaro-dev@lists.linaro.org, 'Joonyoung Shim' <jy0922.shim@samsung.com>, patches@linaro.org, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Sangwook Lee' <sangwook.lee@linaro.org>, 'Alan Stern' <stern@rowland.harvard.edu>, 'Thomas Abraham' <thomas.abraham@linaro.org>

Am Donnerstag, 1. M=E4rz 2012, 06:38:20 schrieb Jingoo Han:
> This patch adds USB HOST register definitions. The definition for
> EHCI INSNREG00 regiser and corresponding bit field definitions are
> added.
>=20
> Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
> v2: change the definition name from EHCI_ENA_xxx to EHCI_INSNREG00_EN=
A_xxx.
>=20
> arch/arm/mach-exynos/include/mach/regs-usb-host.h |   24
> +++++++++++++++++++++ 1 files changed, 24 insertions(+), 0 deletions(=
-)
>  create mode 100644 arch/arm/mach-exynos/include/mach/regs-usb-host.h
Isn't the general idea to depopulate the mach directories and make driv=
ers=20
buildable across architectures?

The definitions are only used in drivers/usb/host/ehci-s5p.c [in the se=
cond=20
patch], so there should be no need to add another arch-header and they =
could=20
simply be included in the driver itself or if necessary a=20
drivers/usb/host/ehci-s5p.h .


Heiko

> diff --git a/arch/arm/mach-exynos/include/mach/regs-usb-host.h
> b/arch/arm/mach-exynos/include/mach/regs-usb-host.h new file mode 100=
644
> index 0000000..572b7d4
> --- /dev/null
> +++ b/arch/arm/mach-exynos/include/mach/regs-usb-host.h
> @@ -0,0 +1,24 @@
> +/*
> + * Copyright (C) 2012 Samsung Electronics Co.Ltd
> + *		http://www.samsung.com
> + *
> + * EXYNOS - USB HOST register definitions
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef __REGS_USB_HOST_H
> +#define __REGS_USB_HOST_H __FILE__
> +
> +#define EHCI_INSNREG00(base)			(base + 0x90)
> +#define EHCI_INSNREG00_ENA_INCR16		(0x1 << 25)
> +#define EHCI_INSNREG00_ENA_INCR8		(0x1 << 24)
> +#define EHCI_INSNREG00_ENA_INCR4		(0x1 << 23)
> +#define EHCI_INSNREG00_ENA_INCRX_ALIGN		(0x1 << 22)
> +#define EHCI_INSNREG00_ENABLE_DMA_BURST	\
> +	(EHCI_INSNREG00_ENA_INCR16 | EHCI_INSNREG00_ENA_INCR8 |	\
> +	 EHCI_INSNREG00_ENA_INCR4 | EHCI_INSNREG00_ENA_INCRX_ALIGN)
> +
> +#endif /* __REGS_USB_HOST_H */
