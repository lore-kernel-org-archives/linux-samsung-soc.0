From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v2 1/2] phy: Kconfig: Re-organize Exynos USB 2.0 PHY configs
Date: Mon, 14 Jul 2014 14:26:18 +0530
Message-ID: <53C39B32.9060001@ti.com>
References: <1404906569-28026-1-git-send-email-sachin.kamat@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:56810 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750737AbaGNI4l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 04:56:41 -0400
In-Reply-To: <1404906569-28026-1-git-send-email-sachin.kamat@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, dianders@chromium.org, gautam.vivek@samsung.com, spk.linux@gmail.com, tomasz.figa@gmail.com, jg1.han@samsung.com

Hi,

On Wednesday 09 July 2014 05:19 PM, Sachin Kamat wrote:
> Since the USB 2.0 PHYs are required with EHCI/OHCI USB drivers and
> USB gadget controller supported by the DWC2 gadget driver, make it
> depend on them and default to ARCH_EXYNOS as they are meant for
> Exynos platforms. Also, make the sub-drivers silent options enabling
> them based on the SoC platforms that they are meant to work with. This
> will make life easier for end users who do not have any way knowing the
> dependencies.

There is a new Exynos PHY in town, Exynos 3250. Can you rebase your patch on
top of that?

Thanks
Kishon
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
> ---
> Changes since v1:
> * Added dependency on DWC2 gadget driver as suggested by Tomasz Figa.
> ---
>  drivers/phy/Kconfig |   35 +++++++++++------------------------
>  1 file changed, 11 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index fcdfe7c0e4a7..128f8b92b55c 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -123,43 +123,30 @@ config PHY_SUN4I_USB
>  config PHY_SAMSUNG_USB2
>  	tristate "Samsung USB 2.0 PHY driver"
>  	depends on HAS_IOMEM
> +	depends on USB_EHCI_EXYNOS || USB_OHCI_EXYNOS || USB_DWC2
>  	select GENERIC_PHY
>  	select MFD_SYSCON
> +	default ARCH_EXYNOS
>  	help
>  	  Enable this to support the Samsung USB 2.0 PHY driver for Samsung
> -	  SoCs. This driver provides the interface for USB 2.0 PHY. Support for
> -	  particular SoCs has to be enabled in addition to this driver. Number
> -	  and type of supported phys depends on the SoC.
> +	  SoCs. This driver provides the interface for USB 2.0 PHY. Support
> +	  for particular PHYs will be enabled based on the SoC type in addition
> +	  to this driver.
>  
>  config PHY_EXYNOS4210_USB2
> -	bool "Support for Exynos 4210"
> +	bool
>  	depends on PHY_SAMSUNG_USB2
> -	depends on CPU_EXYNOS4210
> -	help
> -	  Enable USB PHY support for Exynos 4210. This option requires that
> -	  Samsung USB 2.0 PHY driver is enabled and means that support for this
> -	  particular SoC is compiled in the driver. In case of Exynos 4210 four
> -	  phys are available - device, host, HSIC0 and HSIC1.
> +	default CPU_EXYNOS4210
>  
>  config PHY_EXYNOS4X12_USB2
> -	bool "Support for Exynos 4x12"
> +	bool
>  	depends on PHY_SAMSUNG_USB2
> -	depends on (SOC_EXYNOS4212 || SOC_EXYNOS4412)
> -	help
> -	  Enable USB PHY support for Exynos 4x12. This option requires that
> -	  Samsung USB 2.0 PHY driver is enabled and means that support for this
> -	  particular SoC is compiled in the driver. In case of Exynos 4x12 four
> -	  phys are available - device, host, HSIC0 and HSIC1.
> +	default SOC_EXYNOS4212 || SOC_EXYNOS4412
>  
>  config PHY_EXYNOS5250_USB2
> -	bool "Support for Exynos 5250"
> +	bool
>  	depends on PHY_SAMSUNG_USB2
> -	depends on SOC_EXYNOS5250
> -	help
> -	  Enable USB PHY support for Exynos 5250. This option requires that
> -	  Samsung USB 2.0 PHY driver is enabled and means that support for this
> -	  particular SoC is compiled in the driver. In case of Exynos 5250 four
> -	  phys are available - device, host, HSIC0 and HSIC.
> +	default SOC_EXYNOS5250 || SOC_EXYNOS5420
>  
>  config PHY_EXYNOS5_USBDRD
>  	tristate "Exynos5 SoC series USB DRD PHY driver"
> 
