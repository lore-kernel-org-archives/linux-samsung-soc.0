From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Add USB HOST register definitions
Date: Thu, 01 Mar 2012 09:00:10 +0530
Message-ID: <4F4EED42.2010700@linaro.org>
References: <000101ccf6ef$f4efbab0$decf3010$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:43505 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756962Ab2CADaV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 22:30:21 -0500
Received: by dado14 with SMTP id o14so252329dad.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Feb 2012 19:30:21 -0800 (PST)
In-Reply-To: <000101ccf6ef$f4efbab0$decf3010$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-usb@vger.kernel.org, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Sangwook Lee' <sangwook.lee@linaro.org>, 'Alan Stern' <stern@rowland.harvard.edu>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, patches@linaro.org, linaro-dev@lists.linaro.org, 'Thomas Abraham' <thomas.abraham@linaro.org>

On 02/29/2012 08:09 PM, Jingoo Han wrote:
> This patch adds USB HOST register definitions. The definition for
> EHCI INSNREG00 regiser and corresponding bit field definitions are
> added.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  arch/arm/mach-exynos/include/mach/regs-usb-host.h |   23 +++++++++++++++++++++
>  1 files changed, 23 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-exynos/include/mach/regs-usb-host.h
> 
> diff --git a/arch/arm/mach-exynos/include/mach/regs-usb-host.h b/arch/arm/mach-exynos/include/mach/regs-usb-host.h
> new file mode 100644
> index 0000000..1a60f27
> --- /dev/null
> +++ b/arch/arm/mach-exynos/include/mach/regs-usb-host.h
> @@ -0,0 +1,23 @@
> +/*
> + * Copyright (C) 2012 Samsung Electronics Co.Ltd
> + *		http://www.samsung.com
> + *
> + * EXYNOS - USB HOST register definitions
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef __REGS_USB_HOST_H
> +#define __REGS_USB_HOST_H __FILE__
> +
> +#define EHCI_INSNREG00(base)		(base + 0x90)
> +#define EHCI_ENA_INCR16			(0x1 << 25)
> +#define EHCI_ENA_INCR8			(0x1 << 24)
> +#define EHCI_ENA_INCR4			(0x1 << 23)
> +#define EHCI_ENA_INCRX_ALIGN		(0x1 << 22)
> +#define EHCI_ENABLE_DMA_INCR		(EHCI_ENA_INCR16 | EHCI_ENA_INCR8| \
> +					 EHCI_ENA_INCR4 | EHCI_ENA_INCRX_ALIGN)
> +
As per the definition of bit-fields in other registers, it would be good
to prepend the complete register name before the bit-field defines.

EHCI_INSNREG00_ENA_INCR16 ...

Considering the similarity of this patchset with the earlier patchset
from Sangwook, IMO, it would be appropriate to give him due credit in
both these patches.

> +#endif /* __REGS_USB_HOST_H */


-- 
Tushar Behera
