From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: EXYNOS: reorder inclusions of
 <linux/platform_data/xxx.h>
Date: Tue, 06 Nov 2012 20:54:10 +0900
Message-ID: <0bfe01cdbc15$6f024fd0$4d06ef70$%kim@samsung.com>
References: <000801cdbbcd$f6ac01d0$e4040570$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:30398 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751903Ab2KFLyM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Nov 2012 06:54:12 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD2002MEEE5UZJ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 20:54:10 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD200BU4EEAFH90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 20:54:10 +0900 (KST)
In-reply-to: <000801cdbbcd$f6ac01d0$e4040570$%han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Jingoo Han wrote:
> 
> This patch reorders inclusions of <linux/platform_data/xxx.h>
> and puts the inclusions with the same kind for readability,
> according to alphabetical ordering.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  arch/arm/mach-exynos/dev-audio.c           |    2 +-
>  arch/arm/mach-exynos/dev-ohci.c            |    2 +-
>  arch/arm/mach-exynos/mach-nuri.c           |    6 +++---
>  arch/arm/mach-exynos/mach-origen.c         |    6 +++---
>  arch/arm/mach-exynos/mach-smdk4x12.c       |    2 +-
>  arch/arm/mach-exynos/mach-smdkv310.c       |    6 +++---
>  arch/arm/mach-exynos/mach-universal_c210.c |    4 ++--
>  7 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/dev-audio.c b/arch/arm/mach-exynos/dev-
> audio.c
> index ae321c7..a1cb42c 100644
> --- a/arch/arm/mach-exynos/dev-audio.c
> +++ b/arch/arm/mach-exynos/dev-audio.c
> @@ -14,9 +14,9 @@
>  #include <linux/platform_device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/gpio.h>
> +#include <linux/platform_data/asoc-s3c.h>
> 
>  #include <plat/gpio-cfg.h>
> -#include <linux/platform_data/asoc-s3c.h>
> 
>  #include <mach/map.h>
>  #include <mach/dma.h>
> diff --git a/arch/arm/mach-exynos/dev-ohci.c b/arch/arm/mach-exynos/dev-
> ohci.c
> index 14ed795..4244d02 100644
> --- a/arch/arm/mach-exynos/dev-ohci.c
> +++ b/arch/arm/mach-exynos/dev-ohci.c
> @@ -12,10 +12,10 @@
> 
>  #include <linux/dma-mapping.h>
>  #include <linux/platform_device.h>
> +#include <linux/platform_data/usb-exynos.h>
> 
>  #include <mach/irqs.h>
>  #include <mach/map.h>
> -#include <linux/platform_data/usb-exynos.h>
> 
>  #include <plat/devs.h>
>  #include <plat/usb-phy.h>
> diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-
> nuri.c
> index 1e8511f..27d4ed8 100644
> --- a/arch/arm/mach-exynos/mach-nuri.c
> +++ b/arch/arm/mach-exynos/mach-nuri.c
> @@ -25,7 +25,10 @@
>  #include <linux/mmc/host.h>
>  #include <linux/fb.h>
>  #include <linux/pwm_backlight.h>
> +#include <linux/platform_data/i2c-s3c2410.h>
> +#include <linux/platform_data/mipi-csis.h>
>  #include <linux/platform_data/s3c-hsotg.h>
> +#include <linux/platform_data/usb-ehci-s5p.h>
>  #include <drm/exynos_drm.h>
> 
>  #include <video/platform_lcd.h>
> @@ -45,14 +48,11 @@
>  #include <plat/devs.h>
>  #include <plat/fb.h>
>  #include <plat/sdhci.h>
> -#include <linux/platform_data/usb-ehci-s5p.h>
>  #include <plat/clock.h>
>  #include <plat/gpio-cfg.h>
> -#include <linux/platform_data/i2c-s3c2410.h>
>  #include <plat/mfc.h>
>  #include <plat/fimc-core.h>
>  #include <plat/camport.h>
> -#include <linux/platform_data/mipi-csis.h>
> 
>  #include <mach/map.h>
> 
> diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-
> exynos/mach-origen.c
> index d8dc6d7..c931ce1 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
> @@ -23,7 +23,10 @@
>  #include <linux/mfd/max8997.h>
>  #include <linux/lcd.h>
>  #include <linux/rfkill-gpio.h>
> +#include <linux/platform_data/i2c-s3c2410.h>
>  #include <linux/platform_data/s3c-hsotg.h>
> +#include <linux/platform_data/usb-ehci-s5p.h>
> +#include <linux/platform_data/usb-exynos.h>
> 
>  #include <asm/mach/arch.h>
>  #include <asm/hardware/gic.h>
> @@ -36,8 +39,6 @@
>  #include <plat/cpu.h>
>  #include <plat/devs.h>
>  #include <plat/sdhci.h>
> -#include <linux/platform_data/i2c-s3c2410.h>
> -#include <linux/platform_data/usb-ehci-s5p.h>
>  #include <plat/clock.h>
>  #include <plat/gpio-cfg.h>
>  #include <plat/backlight.h>
> @@ -45,7 +46,6 @@
>  #include <plat/mfc.h>
>  #include <plat/hdmi.h>
> 
> -#include <linux/platform_data/usb-exynos.h>
>  #include <mach/map.h>
> 
>  #include <drm/exynos_drm.h>
> diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-
> exynos/mach-smdk4x12.c
> index 17b9ca4..a1555a7 100644
> --- a/arch/arm/mach-exynos/mach-smdk4x12.c
> +++ b/arch/arm/mach-exynos/mach-smdk4x12.c
> @@ -21,6 +21,7 @@
>  #include <linux/pwm_backlight.h>
>  #include <linux/regulator/machine.h>
>  #include <linux/serial_core.h>
> +#include <linux/platform_data/i2c-s3c2410.h>
>  #include <linux/platform_data/s3c-hsotg.h>
> 
>  #include <asm/mach/arch.h>
> @@ -34,7 +35,6 @@
>  #include <plat/devs.h>
>  #include <plat/fb.h>
>  #include <plat/gpio-cfg.h>
> -#include <linux/platform_data/i2c-s3c2410.h>
>  #include <plat/keypad.h>
>  #include <plat/mfc.h>
>  #include <plat/regs-serial.h>
> diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-
> exynos/mach-smdkv310.c
> index 4f0ac53..063cb94 100644
> --- a/arch/arm/mach-exynos/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos/mach-smdkv310.c
> @@ -20,7 +20,10 @@
>  #include <linux/input.h>
>  #include <linux/pwm.h>
>  #include <linux/pwm_backlight.h>
> +#include <linux/platform_data/i2c-s3c2410.h>
>  #include <linux/platform_data/s3c-hsotg.h>
> +#include <linux/platform_data/usb-ehci-s5p.h>
> +#include <linux/platform_data/usb-exynos.h>
> 
>  #include <asm/mach/arch.h>
>  #include <asm/hardware/gic.h>
> @@ -35,16 +38,13 @@
>  #include <plat/fb.h>
>  #include <plat/keypad.h>
>  #include <plat/sdhci.h>
> -#include <linux/platform_data/i2c-s3c2410.h>
>  #include <plat/gpio-cfg.h>
>  #include <plat/backlight.h>
>  #include <plat/mfc.h>
> -#include <linux/platform_data/usb-ehci-s5p.h>
>  #include <plat/clock.h>
>  #include <plat/hdmi.h>
> 
>  #include <mach/map.h>
> -#include <linux/platform_data/usb-exynos.h>
> 
>  #include <drm/exynos_drm.h>
>  #include "common.h"
> diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-
> exynos/mach-universal_c210.c
> index 34fd5c6..9e3340f 100644
> --- a/arch/arm/mach-exynos/mach-universal_c210.c
> +++ b/arch/arm/mach-exynos/mach-universal_c210.c
> @@ -23,6 +23,8 @@
>  #include <linux/i2c-gpio.h>
>  #include <linux/i2c/mcs.h>
>  #include <linux/i2c/atmel_mxt_ts.h>
> +#include <linux/platform_data/i2c-s3c2410.h>
> +#include <linux/platform_data/mipi-csis.h>
>  #include <linux/platform_data/s3c-hsotg.h>
>  #include <drm/exynos_drm.h>
> 
> @@ -35,7 +37,6 @@
>  #include <plat/clock.h>
>  #include <plat/cpu.h>
>  #include <plat/devs.h>
> -#include <linux/platform_data/i2c-s3c2410.h>
>  #include <plat/gpio-cfg.h>
>  #include <plat/fb.h>
>  #include <plat/mfc.h>
> @@ -43,7 +44,6 @@
>  #include <plat/fimc-core.h>
>  #include <plat/s5p-time.h>
>  #include <plat/camport.h>
> -#include <linux/platform_data/mipi-csis.h>
> 
>  #include <mach/map.h>
> 
> --
> 1.7.1

Looks OK to me, will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
