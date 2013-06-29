From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH V2 1/3] phy: Add driver for Exynos DP PHY
Date: Sat, 29 Jun 2013 14:30:09 +0530
Message-ID: <51CEA219.8030001@ti.com>
References: <001f01ce73cf$46d8c940$d48a5bc0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <001f01ce73cf$46d8c940$d48a5bc0$@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-fbdev@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Donghwa Lee' <dh09.lee@samsung.com>, 'Felipe Balbi' <balbi@ti.com>, 'Inki Dae' <inki.dae@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Jean-Christophe PLAGNIOL-VILLARD' <plagnioj@jcrosoft.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Friday 28 June 2013 12:45 PM, Jingoo Han wrote:
> Add a PHY provider driver for the Samsung Exynos SoC DP PHY.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>   .../phy/samsung,exynos5250-dp-video-phy.txt        |    7 ++
>   drivers/phy/Kconfig                                |    8 ++
>   drivers/phy/Makefile                               |    3 +-
>   drivers/phy/phy-exynos-dp-video.c                  |  122 ++++++++++++++++++++
>   4 files changed, 139 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos5250-dp-video-phy.txt
>   create mode 100644 drivers/phy/phy-exynos-dp-video.c
>
> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos5250-dp-video-phy.txt
> b/Documentation/devicetree/bindings/phy/samsung,exynos5250-dp-video-phy.txt
> new file mode 100644
> index 0000000..d1771ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos5250-dp-video-phy.txt
> @@ -0,0 +1,7 @@
> +Samsung EXYNOS SoC series DP PHY
> +-------------------------------------------------
> +
> +Required properties:
> +- compatible : should be "samsung,exynos5250-dp-video-phy";
> +- reg : offset and length of the DP PHY register set;
> +- #phy-cells : from the generic phy bindings, must be 0;
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 5f85909..6d10e3b 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -11,3 +11,11 @@ menuconfig GENERIC_PHY
>   	  devices present in the kernel. This layer will have the generic
>   	  API by which phy drivers can create PHY using the phy framework and
>   	  phy users can obtain reference to the PHY.
> +
> +if GENERIC_PHY
> +
> +config PHY_EXYNOS_DP_VIDEO
> +	tristate "EXYNOS SoC series DP PHY driver"
> +	help
> +	  Support for DP PHY found on Samsung EXYNOS SoCs.
> +endif
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index 9e9560f..d8d861c 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -2,4 +2,5 @@
>   # Makefile for the phy drivers.
>   #
>
> -obj-$(CONFIG_GENERIC_PHY)	+= phy-core.o
> +obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
> +obj-$(CONFIG_PHY_EXYNOS_DP_VIDEO)	+= phy-exynos-dp-video.o
> diff --git a/drivers/phy/phy-exynos-dp-video.c b/drivers/phy/phy-exynos-dp-video.c
> new file mode 100644
> index 0000000..9a3d6f1
> --- /dev/null
> +++ b/drivers/phy/phy-exynos-dp-video.c
> @@ -0,0 +1,122 @@
> +/*
> + * Samsung EXYNOS SoC series DP PHY driver
> + *
> + * Copyright (C) 2013 Samsung Electronics Co., Ltd.
> + * Author: Jingoo Han <jg1.han@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +
> +/* DPTX_PHY_CONTROL register */
> +#define EXYNOS_DPTX_PHY_ENABLE		(1 << 0)
> +
> +struct exynos_dp_video_phy {
> +	spinlock_t slock;

I think spinlock is not needed at all since the PHY ops is already protected
by a mutex.
> +	struct phy *phys;

_phys_ no longer need to part of this structure.
> +	void __iomem *regs;
> +};

Thanks
Kishon
