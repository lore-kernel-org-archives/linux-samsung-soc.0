From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH 1/2] ARM: EXYNOS: Add EHCI AHB burst function
Date: Wed, 29 Feb 2012 22:23:56 +0900
Message-ID: <000701ccf6e5$63bb6170$2b322450$%han@samsung.com>
References: <1330519283-4722-1-git-send-email-sangwook.lee@linaro.org>
 <1330519283-4722-2-git-send-email-sangwook.lee@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48753 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757735Ab2B2NX6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 08:23:58 -0500
In-reply-to: <1330519283-4722-2-git-send-email-sangwook.lee@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangwook Lee' <sangwook.lee@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, gregkh@suse.de, kgene.kim@samsung.com, stern@rowland.harvard.edu, jy0922.shim@samsung.com, patches@linaro.org, linaro-dev@lists.linaro.org, linux@arm.linux.org.uk, 'Jingoo Han' <jg1.han@samsung.com>

Hi, Sangwook.

I know what you want to add.
I'll send new patch which can enable EHCI burst mode.
This new patch will not use platform data callback and different machine directory
file to include EHCI INSNREG00 definitions.
Also, comment will be modified properly.


Thank you.

Best regards,
Jingoo Han.

> -----Original Message-----
> From: Sangwook Lee [mailto:sangwook.lee@linaro.org]
> Sent: Wednesday, February 29, 2012 9:41 PM
> To: linux-samsung-soc@vger.kernel.org; linux-usb@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Cc: ben-linux@fluff.org; gregkh@suse.de; kgene.kim@samsung.com; stern@rowland.harvard.edu;
> jg1.han@samsung.com; jy0922.shim@samsung.com; patches@linaro.org; linaro-dev@lists.linaro.org;
> linux@arm.linux.org.uk; Sangwook Lee
> Subject: [PATCH 1/2] ARM: EXYNOS: Add EHCI AHB burst function
> 
> Enable burst transfer from AHB for EHCI.
> This fixes data transfer of USB Ethernet with EHCI.
> Without this patch, scp hardly works.
> 
> Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
> ---
>  arch/arm/mach-exynos/setup-usb-phy.c      |    6 ++++++
>  arch/arm/plat-samsung/devs.c              |    2 ++
>  arch/arm/plat-samsung/include/plat/ehci.h |   19 +++++++++++++++++++
>  3 files changed, 27 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-exynos/setup-usb-phy.c
> index 41743d2..5a20460 100644
> --- a/arch/arm/mach-exynos/setup-usb-phy.c
> +++ b/arch/arm/mach-exynos/setup-usb-phy.c
> @@ -18,6 +18,7 @@
>  #include <mach/regs-usb-phy.h>
>  #include <plat/cpu.h>
>  #include <plat/usb-phy.h>
> +#include <plat/ehci.h>
> 
>  static atomic_t host_usage;
> 
> @@ -149,3 +150,8 @@ int s5p_usb_phy_exit(struct platform_device *pdev, int type)
> 
>  	return -EINVAL;
>  }
> +
> +void s5p_ehci_burst_enable(struct platform_device *pdev, void __iomem *base)
> +{
> +	writel(EHCI_INSNREG00_ENABLE_BURST, base + EHCI_INSNREG00);
> +}
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index f10768e..8fd1bd3 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -1402,6 +1402,8 @@ void __init s5p_ehci_set_platdata(struct s5p_ehci_platdata *pd)
>  		npd->phy_init = s5p_usb_phy_init;
>  	if (!npd->phy_exit)
>  		npd->phy_exit = s5p_usb_phy_exit;
> +	if (!npd->burst_enable)
> +		npd->burst_enable = s5p_ehci_burst_enable;
>  }
>  #endif /* CONFIG_S5P_DEV_USB_EHCI */
> 
> diff --git a/arch/arm/plat-samsung/include/plat/ehci.h b/arch/arm/plat-samsung/include/plat/ehci.h
> index 5f28cae..9c866b7 100644
> --- a/arch/arm/plat-samsung/include/plat/ehci.h
> +++ b/arch/arm/plat-samsung/include/plat/ehci.h
> @@ -14,8 +14,27 @@
>  struct s5p_ehci_platdata {
>  	int (*phy_init)(struct platform_device *pdev, int type);
>  	int (*phy_exit)(struct platform_device *pdev, int type);
> +	void (*burst_enable)(struct platform_device *pdev, void __iomem *base);
>  };
> 
>  extern void s5p_ehci_set_platdata(struct s5p_ehci_platdata *pd);
> +extern void s5p_ehci_burst_enable(struct platform_device *pdev,
> +	void __iomem *base);
> +
> +/* EHCI EXYNOS specific register */
> +#define EHCI_INSNREG00			0x90
> +
> +/*
> + * EHCI INSNREG00 Specific fields
> + * Enable AHB master to use burst transfer from 4 to 16
> + */
> +#define EHCI_INSNREG00_ENABLE_INCR16	(1 << 25)
> +#define EHCI_INSNREG00_ENABLE_INCR8	(1 << 24)
> +#define EHCI_INSNREG00_ENABLE_INCR4	(1 << 23)
> +/* Force AHB master to start burst transfer only for 4,8,16 alignment */
> +#define EHCI_INSNREG00_ENABLE_INCRX_ALIGN (1 << 22)
> +#define EHCI_INSNREG00_ENABLE_BURST	\
> +	(EHCI_INSNREG00_ENABLE_INCR16 | EHCI_INSNREG00_ENABLE_INCR8 |	\
> +	EHCI_INSNREG00_ENABLE_INCR4 | EHCI_INSNREG00_ENABLE_INCRX_ALIGN)
> 
>  #endif /* __PLAT_SAMSUNG_EHCI_H */
> --
> 1.7.4.1
