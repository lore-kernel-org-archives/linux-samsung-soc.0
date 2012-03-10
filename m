From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCHv3 1/3] ARM: Exynos: JPEG board definition
Date: Sat, 10 Mar 2012 02:50:23 -0800
Message-ID: <4F5B31EF.40704@samsung.com>
References: <1328095165-31628-1-git-send-email-andrzej.p@samsung.com> <1328095165-31628-2-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:32942 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754572Ab2CJKu1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Mar 2012 05:50:27 -0500
Received: by iagz16 with SMTP id z16so3664371iag.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Mar 2012 02:50:26 -0800 (PST)
In-Reply-To: <1328095165-31628-2-git-send-email-andrzej.p@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On 02/01/12 03:19, Andrzej Pietrasiewicz wrote:
> ARM: Exynos: JPEG board definition
>
Please adding comments in detail next time.

> Signed-off-by: Andrzej Pietrasiewicz<andrzej.p@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> ---
>   arch/arm/mach-exynos/clock.c              |    5 +++++
>   arch/arm/mach-exynos/include/mach/map.h   |    3 +++
>   arch/arm/plat-s5p/Kconfig                 |    5 +++++
>   arch/arm/plat-samsung/devs.c              |   18 ++++++++++++++++++
>   arch/arm/plat-samsung/include/plat/devs.h |    1 +
>   5 files changed, 32 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/clock.c b/arch/arm/mach-exynos/clock.c
> index 5a8c42e..e5d446a 100644
> --- a/arch/arm/mach-exynos/clock.c
> +++ b/arch/arm/mach-exynos/clock.c
> @@ -470,6 +470,11 @@ static struct clk init_clocks_off[] = {
>   		.enable		= exynos4_clk_ip_cam_ctrl,
>   		.ctrlbit	= (1<<  5),
>   	}, {
> +		.name           = "jpeg",
> +		.id             = 0,
> +		.enable         = exynos4_clk_ip_cam_ctrl,
> +		.ctrlbit        = (1<<  6),

Please use tab...

> +	}, {
>   		.name		= "fimc",
>   		.devname	= "exynos4-fimc.0",
>   		.enable		= exynos4_clk_ip_cam_ctrl,
> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
> index 7df9e74..5a9e656 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -31,6 +31,8 @@
>   #define EXYNOS4_PA_FIMC2		0x11820000
>   #define EXYNOS4_PA_FIMC3		0x11830000
>
> +#define EXYNOS4_PA_JPEG			0x11840000
> +
>   #define EXYNOS4_PA_G2D			0x12800000
>
>   #define EXYNOS4_PA_I2S0			0x03830000
> @@ -164,6 +166,7 @@
>   #define S5P_PA_FIMC1			EXYNOS4_PA_FIMC1
>   #define S5P_PA_FIMC2			EXYNOS4_PA_FIMC2
>   #define S5P_PA_FIMC3			EXYNOS4_PA_FIMC3
> +#define S5P_PA_JPEG			EXYNOS4_PA_JPEG
>   #define S5P_PA_G2D			EXYNOS4_PA_G2D
>   #define S5P_PA_FIMD0			EXYNOS4_PA_FIMD0
>   #define S5P_PA_HDMI			EXYNOS4_PA_HDMI
> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> index e7fec78..7a30869 100644
> --- a/arch/arm/plat-s5p/Kconfig
> +++ b/arch/arm/plat-s5p/Kconfig
> @@ -80,6 +80,11 @@ config S5P_DEV_FIMC3
>   	help
>   	  Compile in platform device definitions for FIMC controller 3
>
> +config S5P_DEV_JPEG
> +	bool
> +	help
> +	  Compile in platform device definitions for JPEG codec
> +
>   config S5P_DEV_G2D
>   	bool
>   	help
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index 145580a..1121372 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -295,6 +295,24 @@ struct platform_device s5p_device_g2d = {
>   };
>   #endif /* CONFIG_S5P_DEV_G2D */
>
> +#ifdef CONFIG_S5P_DEV_JPEG
> +static struct resource s5p_jpeg_resource[] = {
> +	[0] = DEFINE_RES_MEM(S5P_PA_JPEG, SZ_4K),
> +	[1] = DEFINE_RES_IRQ(IRQ_JPEG),
> +};
> +
> +struct platform_device s5p_device_jpeg = {
> +	.name		= "s5p-jpeg",
> +	.id		= 0,
> +	.num_resources	= ARRAY_SIZE(s5p_jpeg_resource),
> +	.resource	= s5p_jpeg_resource,
> +	.dev		= {
> +		.dma_mask		=&samsung_device_dma_mask,
> +		.coherent_dma_mask	= DMA_BIT_MASK(32),
> +	},
> +};
> +#endif /*  CONFIG_S5P_DEV_JPEG */
> +
>   /* FIMD0 */
>
>   #ifdef CONFIG_S5P_DEV_FIMD0
> diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
> index bb45848..5e7972d 100644
> --- a/arch/arm/plat-samsung/include/plat/devs.h
> +++ b/arch/arm/plat-samsung/include/plat/devs.h
> @@ -79,6 +79,7 @@ extern struct platform_device s5p_device_fimc1;
>   extern struct platform_device s5p_device_fimc2;
>   extern struct platform_device s5p_device_fimc3;
>   extern struct platform_device s5p_device_fimc_md;
> +extern struct platform_device s5p_device_jpeg;
>   extern struct platform_device s5p_device_g2d;
>   extern struct platform_device s5p_device_fimd0;
>   extern struct platform_device s5p_device_hdmi;

Applied and I fixed when I apply this.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
