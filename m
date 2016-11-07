From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v7 1/2] soc: samsung: add exynos chipid driver support
Date: Mon, 07 Nov 2016 09:35:19 +0100
Message-ID: <2804574.ikPKivcpT9@wuerfel>
References: <1478347427-28409-1-git-send-email-pankaj.dubey@samsung.com> <1478347427-28409-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:57365 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752406AbcKGIgC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 03:36:02 -0500
In-Reply-To: <1478347427-28409-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, geert+renesas@glider.be, Linus Walleij <linus.walleij@linaro.org>, krzk@kernel.org, javier@osg.samsung.com, kgene@kernel.org, thomas.ab@samsung.com, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, m.szyprowski@samsung.com

On Saturday, November 5, 2016 5:33:46 PM CET Pankaj Dubey wrote:
> Exynos SoCs have Chipid, for identification of product IDs
> and SoC revisions. This patch intends to provide initialization
> code for all these functionalities, at the same time it provides some
> sysfs entries for accessing these information to user-space.
> 
> This driver uses existing binding for exynos-chipid.
> 
> CC: Grant Likely <grant.likely@linaro.org>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  drivers/soc/samsung/Kconfig         |   5 ++
>  drivers/soc/samsung/Makefile        |   1 +
>  drivers/soc/samsung/exynos-chipid.c | 148 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 154 insertions(+)
>  create mode 100644 drivers/soc/samsung/exynos-chipid.c
> 
> diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
> index 2455339..f9ab858 100644
> --- a/drivers/soc/samsung/Kconfig
> +++ b/drivers/soc/samsung/Kconfig
> @@ -14,4 +14,9 @@ config EXYNOS_PM_DOMAINS
>  	bool "Exynos PM domains" if COMPILE_TEST
>  	depends on PM_GENERIC_DOMAINS || COMPILE_TEST
>  
> +config EXYNOS_CHIPID
> +	bool "Exynos Chipid controller driver" if COMPILE_TEST
> +	depends on (ARM && ARCH_EXYNOS) || ((ARM || ARM64) && COMPILE_TEST)
> +	select SOC_BUS
> +

Please add a help text.

Why is this not enabled for ARM64 EXYNOS?

> +	exynos_chipid_base = of_iomap(np, 0);
> +
> +	if (!exynos_chipid_base)
> +		return PTR_ERR(exynos_chipid_base);
> +
> +	product_id  = __raw_readl(exynos_chipid_base);
> +	revision = product_id & EXYNOS_REV_MASK;
> +	iounmap(exynos_chipid_base);

Never use __raw_readl/__raw_writel in device drivers, they are not endian
safe, and we just removed all instances for Exynos a while back.

> +	return 0;
> +}
> +early_initcall(exynos_chipid_early_init);
> 

Why is this early? Please add a code comment if it's really needed to be
an early_initcall, otherwise make it a device_initcall.

	Arnd
