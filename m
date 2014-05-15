From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v3 1/3] phy: Add exynos-simple-phy driver
Date: Thu, 15 May 2014 15:31:15 +0200
Message-ID: <1584926.JkD1mqdaNu@amdc1032>
References: <1400095043-685-1-git-send-email-rahul.sharma@samsung.com>
 <1400095043-685-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32936 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753394AbaEONba (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 09:31:30 -0400
In-reply-to: <1400095043-685-2-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, t.stanislaws@samsung.com, devicetree@vger.kernel.org, kgene.kim@samsung.com, kishon@ti.com, kyungmin.park@samsung.com, robh+dt@kernel.org, grant.likely@linaro.org, sylvester.nawrocki@gmail.com, joshi@samsung.com


Hi,

On Thursday, May 15, 2014 12:47:21 AM Rahul Sharma wrote:
> From: Tomasz Stanislawski <t.stanislaws@samsung.com>
> 
> Add exynos-simple-phy driver to support a single register
> PHY interfaces present on Exynos4 SoC.
> 
> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> 
> ---
>  .../devicetree/bindings/phy/samsung-phy.txt        |   56 ++++++
>  drivers/phy/Kconfig                                |    5 +
>  drivers/phy/Makefile                               |    1 +
>  drivers/phy/exynos-simple-phy.c                    |  189 ++++++++++++++++++++
>  include/dt-bindings/phy/exynos-simple-phy.h        |   27 +++
>  5 files changed, 278 insertions(+)
>  create mode 100644 drivers/phy/exynos-simple-phy.c
>  create mode 100644 include/dt-bindings/phy/exynos-simple-phy.h

[...]

> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 16a2f06..2a13e0d 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -178,4 +178,9 @@ config PHY_XGENE
>  	help
>  	  This option enables support for APM X-Gene SoC multi-purpose PHY.
>  
> +config EXYNOS_SIMPLE_PHY
> +	tristate "Exynos Simple PHY driver"

Please limit this driver to EXYNOS platforms with:

	depends on ARCH_EXYNOS 

or (optionally)

	depends on ARCH_EXYNOS || COMPILE_TEST

Moreover the generic PHY dependency is missing.  It can be fixed with:

	select GENERIC_PHY

> +	help
> +	  Support for 1-bit PHY controllers on SoCs from Exynos family.
> +
>  endmenu

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
