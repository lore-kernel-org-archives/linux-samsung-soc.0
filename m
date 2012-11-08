From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: EXYNOS: change the name of USB ohci header
Date: Thu, 08 Nov 2012 14:25:07 +0900
Message-ID: <0d0601cdbd71$6aa959d0$3ffc0d70$%kim@samsung.com>
References: <000901cdbbcf$5d81e270$1885a750$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:60030 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751104Ab2KHFZK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Nov 2012 00:25:10 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD5000IELPI7AL0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Nov 2012 14:25:08 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD500BD9LPVUTA0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Nov 2012 14:25:08 +0900 (KST)
In-reply-to: <000901cdbbcf$5d81e270$1885a750$%han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>, balbi@ti.com
Cc: linux-samsung-soc@vger.kernel.org

Jingoo Han wrote:
> 
> This patch changes the name of USB ohci header from 'usb-exynos.h'
> to 'usb-ohci-exynos.h'. This is because this header file has
> the platdata for only Exynos ohci.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  arch/arm/mach-exynos/dev-ohci.c                    |    2 +-
>  arch/arm/mach-exynos/mach-origen.c                 |    2 +-
>  arch/arm/mach-exynos/mach-smdkv310.c               |    2 +-
>  drivers/usb/host/ohci-exynos.c                     |    2 +-
>  .../{usb-exynos.h => usb-ohci-exynos.h}            |    0
>  5 files changed, 4 insertions(+), 4 deletions(-)
>  rename include/linux/platform_data/{usb-exynos.h => usb-ohci-exynos.h}
> (100%)
> 
> diff --git a/arch/arm/mach-exynos/dev-ohci.c b/arch/arm/mach-exynos/dev-
> ohci.c
> index 4244d02..d5bc129 100644
> --- a/arch/arm/mach-exynos/dev-ohci.c
> +++ b/arch/arm/mach-exynos/dev-ohci.c
> @@ -12,7 +12,7 @@
> 
>  #include <linux/dma-mapping.h>
>  #include <linux/platform_device.h>
> -#include <linux/platform_data/usb-exynos.h>
> +#include <linux/platform_data/usb-ohci-exynos.h>
> 
>  #include <mach/irqs.h>
>  #include <mach/map.h>
> diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-
> exynos/mach-origen.c
> index c931ce1..2bbfa8e 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
> @@ -26,7 +26,7 @@
>  #include <linux/platform_data/i2c-s3c2410.h>
>  #include <linux/platform_data/s3c-hsotg.h>
>  #include <linux/platform_data/usb-ehci-s5p.h>
> -#include <linux/platform_data/usb-exynos.h>
> +#include <linux/platform_data/usb-ohci-exynos.h>
> 
>  #include <asm/mach/arch.h>
>  #include <asm/hardware/gic.h>
> diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-
> exynos/mach-smdkv310.c
> index 063cb94..c70eaad 100644
> --- a/arch/arm/mach-exynos/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos/mach-smdkv310.c
> @@ -23,7 +23,7 @@
>  #include <linux/platform_data/i2c-s3c2410.h>
>  #include <linux/platform_data/s3c-hsotg.h>
>  #include <linux/platform_data/usb-ehci-s5p.h>
> -#include <linux/platform_data/usb-exynos.h>
> +#include <linux/platform_data/usb-ohci-exynos.h>
> 
>  #include <asm/mach/arch.h>
>  #include <asm/hardware/gic.h>
> diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-
> exynos.c
> index 20a5008..acf9a4b 100644
> --- a/drivers/usb/host/ohci-exynos.c
> +++ b/drivers/usb/host/ohci-exynos.c
> @@ -14,7 +14,7 @@
>  #include <linux/clk.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> -#include <linux/platform_data/usb-exynos.h>
> +#include <linux/platform_data/usb-ohci-exynos.h>
>  #include <plat/usb-phy.h>
> 
>  struct exynos_ohci_hcd {
> diff --git a/include/linux/platform_data/usb-exynos.h
> b/include/linux/platform_data/usb-ohci-exynos.h
> similarity index 100%
> rename from include/linux/platform_data/usb-exynos.h
> rename to include/linux/platform_data/usb-ohci-exynos.h
> --
> 1.7.1

Looks OK to me, but I need ack from Felipe Balbi?

Felipe, are you OK on this? If so, I'd like to pick this up in my tree.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
