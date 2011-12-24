From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] s5p-g2d: add G2D to plat-s5p and mach-exynos4
Date: Sat, 24 Dec 2011 12:12:51 +0900
Message-ID: <089501ccc1e9$ec09aea0$c41d0be0$%kim@samsung.com>
References: <1323446682-25252-1-git-send-email-k.debski@samsung.com>
 <1323446682-25252-2-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63772 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751756Ab1LXDMz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Dec 2011 22:12:55 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWO00ESAU99J970@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Dec 2011 12:12:53 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWO00AFXU9F7I40@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 24 Dec 2011 12:12:53 +0900 (KST)
In-reply-to: <1323446682-25252-2-git-send-email-k.debski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kamil Debski' <k.debski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com

Kamil Debski wrote:
> 
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/include/mach/map.h   |    3 +++
>  arch/arm/plat-s5p/Kconfig                 |    5 +++++
>  arch/arm/plat-samsung/devs.c              |   28
++++++++++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/devs.h |    1 +
>  4 files changed, 37 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-
> exynos/include/mach/map.h
> index 03e2c99..e3321aa 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -31,6 +31,8 @@
>  #define EXYNOS4_PA_FIMC2		0x11820000
>  #define EXYNOS4_PA_FIMC3		0x11830000
> 
> +#define EXYNOS4_PA_G2D			0x12800000
> +
>  #define EXYNOS4_PA_I2S0			0x03830000
>  #define EXYNOS4_PA_I2S1			0xE3100000
>  #define EXYNOS4_PA_I2S2			0xE2A00000
> @@ -156,6 +158,7 @@
>  #define S5P_PA_FIMC1			EXYNOS4_PA_FIMC1
>  #define S5P_PA_FIMC2			EXYNOS4_PA_FIMC2
>  #define S5P_PA_FIMC3			EXYNOS4_PA_FIMC3
> +#define S5P_PA_G2D			EXYNOS4_PA_G2D
>  #define S5P_PA_FIMD0			EXYNOS4_PA_FIMD0
>  #define S5P_PA_HDMI			EXYNOS4_PA_HDMI
>  #define S5P_PA_IIC_HDMIPHY		EXYNOS4_PA_IIC_HDMIPHY
> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> index 9b9968f..5e6333c 100644
> --- a/arch/arm/plat-s5p/Kconfig
> +++ b/arch/arm/plat-s5p/Kconfig
> @@ -79,6 +79,11 @@ config S5P_DEV_FIMC3
>  	help
>  	  Compile in platform device definitions for FIMC controller 3
> 
> +config S5P_DEV_G2D
> +	bool
> +	help
> +	  Compile in platform device definitions for G2D device
> +
>  config S5P_DEV_FIMD0
>  	bool
>  	help
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index 4ca8b57..ec4848d 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -265,6 +265,34 @@ struct platform_device s5p_device_fimc3 = {
>  };
>  #endif /* CONFIG_S5P_DEV_FIMC3 */
> 
> +/* G2D */
> +
> +#ifdef CONFIG_S5P_DEV_G2D
> +static struct resource s5p_g2d_resource[] = {
> +        [0] = {
> +                .start  = S5P_PA_G2D,
> +                .end    = S5P_PA_G2D + SZ_4K - 1,
> +                .flags  = IORESOURCE_MEM,
> +        },
> +        [1] = {
> +                .start  = IRQ_2D,
> +                .end    = IRQ_2D,
> +                .flags  = IORESOURCE_IRQ,
> +        },
> +};
> +
> +struct platform_device s5p_device_g2d = {
> +        .name           = "s5p-g2d",
> +        .id             = 0,
> +        .num_resources  = ARRAY_SIZE(s5p_g2d_resource),
> +        .resource       = s5p_g2d_resource,
> +        .dev            = {
> +                .dma_mask               = &samsung_device_dma_mask,
> +                .coherent_dma_mask      = DMA_BIT_MASK(32),
> +        },
> +};
> +#endif /* CONFIG_S5P_DEV_G2D */
> +
>  /* FIMD0 */
> 
>  #ifdef CONFIG_S5P_DEV_FIMD0
> diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-
> samsung/include/plat/devs.h
> index ab633c9..d4e92e2 100644
> --- a/arch/arm/plat-samsung/include/plat/devs.h
> +++ b/arch/arm/plat-samsung/include/plat/devs.h
> @@ -78,6 +78,7 @@ extern struct platform_device s5p_device_fimc1;
>  extern struct platform_device s5p_device_fimc2;
>  extern struct platform_device s5p_device_fimc3;
>  extern struct platform_device s5p_device_fimc_md;
> +extern struct platform_device s5p_device_g2d;
>  extern struct platform_device s5p_device_fimd0;
>  extern struct platform_device s5p_device_hdmi;
>  extern struct platform_device s5p_device_i2c_hdmiphy;
> --
> 1.7.0.4

Hi Kamil,

Please fix following with checkpatch.

ERROR: trailing whitespace
#47: FILE: arch/arm/plat-s5p/Kconfig:86:
+^I  $

ERROR: code indent should use tabs where possible
#63: FILE: arch/arm/plat-samsung/devs.c:272:
+        [0] = {$

WARNING: please, no spaces at the start of a line
#63: FILE: arch/arm/plat-samsung/devs.c:272:
+        [0] = {$

ERROR: code indent should use tabs where possible
#64: FILE: arch/arm/plat-samsung/devs.c:273:
+                .start  = S5P_PA_G2D,$

WARNING: please, no spaces at the start of a line
#64: FILE: arch/arm/plat-samsung/devs.c:273:
+                .start  = S5P_PA_G2D,$

ERROR: code indent should use tabs where possible
#65: FILE: arch/arm/plat-samsung/devs.c:274:
+                .end    = S5P_PA_G2D + SZ_4K - 1,$

WARNING: please, no spaces at the start of a line
#65: FILE: arch/arm/plat-samsung/devs.c:274:
+                .end    = S5P_PA_G2D + SZ_4K - 1,$

ERROR: code indent should use tabs where possible
#66: FILE: arch/arm/plat-samsung/devs.c:275:
+                .flags  = IORESOURCE_MEM,$

WARNING: please, no spaces at the start of a line
#66: FILE: arch/arm/plat-samsung/devs.c:275:
+                .flags  = IORESOURCE_MEM,$

ERROR: code indent should use tabs where possible
#67: FILE: arch/arm/plat-samsung/devs.c:276:
+        },$

WARNING: please, no spaces at the start of a line
#67: FILE: arch/arm/plat-samsung/devs.c:276:
+        },$

ERROR: code indent should use tabs where possible
#68: FILE: arch/arm/plat-samsung/devs.c:277:
+        [1] = {$

WARNING: please, no spaces at the start of a line
#68: FILE: arch/arm/plat-samsung/devs.c:277:
+        [1] = {$

ERROR: code indent should use tabs where possible
#69: FILE: arch/arm/plat-samsung/devs.c:278:
+                .start  = IRQ_2D,$

WARNING: please, no spaces at the start of a line
#69: FILE: arch/arm/plat-samsung/devs.c:278:
+                .start  = IRQ_2D,$

ERROR: code indent should use tabs where possible
#70: FILE: arch/arm/plat-samsung/devs.c:279:
+                .end    = IRQ_2D,$

WARNING: please, no spaces at the start of a line
#70: FILE: arch/arm/plat-samsung/devs.c:279:
+                .end    = IRQ_2D,$

ERROR: code indent should use tabs where possible
#71: FILE: arch/arm/plat-samsung/devs.c:280:
+                .flags  = IORESOURCE_IRQ,$

WARNING: please, no spaces at the start of a line
#71: FILE: arch/arm/plat-samsung/devs.c:280:
+                .flags  = IORESOURCE_IRQ,$

ERROR: code indent should use tabs where possible
#72: FILE: arch/arm/plat-samsung/devs.c:281:
+        },$

WARNING: please, no spaces at the start of a line
#72: FILE: arch/arm/plat-samsung/devs.c:281:
+        },$

ERROR: code indent should use tabs where possible
#76: FILE: arch/arm/plat-samsung/devs.c:285:
+        .name           = "s5p-g2d",$

WARNING: please, no spaces at the start of a line
#76: FILE: arch/arm/plat-samsung/devs.c:285:
+        .name           = "s5p-g2d",$

ERROR: code indent should use tabs where possible
#77: FILE: arch/arm/plat-samsung/devs.c:286:
+        .id             = 0,$

WARNING: please, no spaces at the start of a line
#77: FILE: arch/arm/plat-samsung/devs.c:286:
+        .id             = 0,$

ERROR: code indent should use tabs where possible
#78: FILE: arch/arm/plat-samsung/devs.c:287:
+        .num_resources  = ARRAY_SIZE(s5p_g2d_resource),$

WARNING: please, no spaces at the start of a line
#78: FILE: arch/arm/plat-samsung/devs.c:287:
+        .num_resources  = ARRAY_SIZE(s5p_g2d_resource),$

ERROR: code indent should use tabs where possible
#79: FILE: arch/arm/plat-samsung/devs.c:288:
+        .resource       = s5p_g2d_resource,$

WARNING: please, no spaces at the start of a line
#79: FILE: arch/arm/plat-samsung/devs.c:288:
+        .resource       = s5p_g2d_resource,$

ERROR: code indent should use tabs where possible
#80: FILE: arch/arm/plat-samsung/devs.c:289:
+        .dev            = {$

WARNING: please, no spaces at the start of a line
#80: FILE: arch/arm/plat-samsung/devs.c:289:
+        .dev            = {$

ERROR: code indent should use tabs where possible
#81: FILE: arch/arm/plat-samsung/devs.c:290:
+                .dma_mask               = &samsung_device_dma_mask,$

WARNING: please, no spaces at the start of a line
#81: FILE: arch/arm/plat-samsung/devs.c:290:
+                .dma_mask               = &samsung_device_dma_mask,$

ERROR: code indent should use tabs where possible
#82: FILE: arch/arm/plat-samsung/devs.c:291:
+                .coherent_dma_mask      = DMA_BIT_MASK(32),$

WARNING: please, no spaces at the start of a line
#82: FILE: arch/arm/plat-samsung/devs.c:291:
+                .coherent_dma_mask      = DMA_BIT_MASK(32),$

ERROR: code indent should use tabs where possible
#83: FILE: arch/arm/plat-samsung/devs.c:292:
+        },$

WARNING: please, no spaces at the start of a line
#83: FILE: arch/arm/plat-samsung/devs.c:292:
+        },$

total: 19 errors, 19 warnings, 67 lines checked

NOTE: whitespace errors detected, you may wish to use scripts/cleanpatch or
      scripts/cleanfile

PATCH 13 s5p-g2d add G2D to plat-s5p and mach-exynos4.txt has style
problems, please review.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
