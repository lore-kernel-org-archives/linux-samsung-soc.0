From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Samsung: Move fimc plat. device from board files to
 plat-samsung
Date: Fri, 14 Oct 2011 16:13:50 +0900
Message-ID: <085e01cc8a40$d31a54c0$794efe40$%kim@samsung.com>
References: <039b01cc8730$594ab530$0be01f90$%kim@samsung.com>
 <1318433485-1757-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39907 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755080Ab1JNHNw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Oct 2011 03:13:52 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LT1007JCO2SQG30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Oct 2011 16:13:51 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LT100EGLO32RB00@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 14 Oct 2011 16:13:51 +0900 (KST)
In-reply-to: <1318433485-1757-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com, 'Kyungmin Park' <kyungmin.park@samsung.com>

Sylwester Nawrocki wrote:
> 
> Move the platform device definitions from boards code to plat-samsung
> to avoid multiple instances when multiple board support is compiled in.
> The boards should select at least S5P_DEV_FIMC0 to enable FIMC support.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> Hi Kgene,
> 
> To decrease overall diff size, if it's not too late yet, you might want to
> squash parts of this patch with previous commits:
> 
Hi Sylwester,

Sorry it's late to rebase following which are included in
next-samsung-devel-2 branch and already it has been sent to arm-soc.

> 0513218 ARM: S5PV210: Add support for M-5MOLS image sensor on
> UNIVERSAL_C210
> 39aefab ARM: S5PV210: Add support for NOON010PC30 sensor on GONI board
> 
> Here is the optional new patch summary:
> 
> ARM: Samsung: Add fimc platform device for s5p-fimc media device driver
> 
> The s5p-fimc driver now creates an aggregate media device which is bound
> to "s5p-fimc-md" platform device. This patch adds such a platform device
> instance to be registered by each board that requires FIMC device support.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> Sorry for the noise.
> 
> Regards,
> Sylwester
> ---
>  arch/arm/mach-exynos4/mach-universal_c210.c |    5 -----
>  arch/arm/mach-s5pv210/mach-goni.c           |    5 -----
>  arch/arm/plat-samsung/devs.c                |    5 +++++
>  arch/arm/plat-samsung/include/plat/devs.h   |    1 +
>  4 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-
> exynos4/mach-universal_c210.c
> index 18cf5c7..2096c8b 100644
> --- a/arch/arm/mach-exynos4/mach-universal_c210.c
> +++ b/arch/arm/mach-exynos4/mach-universal_c210.c
> @@ -920,11 +920,6 @@ static struct s5p_platform_fimc fimc_md_platdata = {
>  	.num_clients	= ARRAY_SIZE(universal_camera_sensors),
>  };
> 
> -struct platform_device s5p_device_fimc_md = {
> -	.name	= "s5p-fimc-md",
> -	.id	= -1,
> -};
> -
>  static struct gpio universal_camera_gpios[] = {
>  	{ GPIO_CAM_LEVEL_EN(1),	GPIOF_OUT_INIT_HIGH,
> "CAM_LVL_EN1" },
>  	{ GPIO_CAM_LEVEL_EN(2),	GPIOF_OUT_INIT_LOW,
> "CAM_LVL_EN2" },
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
b/arch/arm/mach-s5pv210/mach-
> goni.c
> index 01e4867..61da205 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c
> @@ -849,11 +849,6 @@ struct s5p_platform_fimc goni_fimc_md_platdata
> __initdata = {
>  	.num_clients	= ARRAY_SIZE(goni_camera_sensors),
>  };
> 
> -struct platform_device s5p_device_fimc_md = {
> -	.name		= "s5p-fimc-md",
> -	.id		= -1,
> -};
> -
>  static struct platform_device *goni_devices[] __initdata = {
>  	&s3c_device_fb,
>  	&s5p_device_onenand,
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index cb6fd9e..4ca8b57 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -204,6 +204,11 @@ struct platform_device s5p_device_fimc0 = {
>  		.coherent_dma_mask	= DMA_BIT_MASK(32),
>  	},
>  };
> +
> +struct platform_device s5p_device_fimc_md = {
> +	.name	= "s5p-fimc-md",
> +	.id	= -1,
> +};
>  #endif /* CONFIG_S5P_DEV_FIMC0 */
> 
>  #ifdef CONFIG_S5P_DEV_FIMC1
> diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-
> samsung/include/plat/devs.h
> index 8f19241..ab633c9 100644
> --- a/arch/arm/plat-samsung/include/plat/devs.h
> +++ b/arch/arm/plat-samsung/include/plat/devs.h
> @@ -77,6 +77,7 @@ extern struct platform_device s5p_device_fimc0;
>  extern struct platform_device s5p_device_fimc1;
>  extern struct platform_device s5p_device_fimc2;
>  extern struct platform_device s5p_device_fimc3;
> +extern struct platform_device s5p_device_fimc_md;
>  extern struct platform_device s5p_device_fimd0;
>  extern struct platform_device s5p_device_hdmi;
>  extern struct platform_device s5p_device_i2c_hdmiphy;
> --
> 1.7.7

Applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
