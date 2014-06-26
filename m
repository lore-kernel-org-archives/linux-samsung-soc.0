From: Tushar Behera <trblinux@gmail.com>
Subject: Re: [PATCH 2/2] usb: dwc3: Kconfig: Select PHY drivers for Exynos
 DWC3
Date: Thu, 26 Jun 2014 11:26:28 +0530
Message-ID: <53ABB60C.5060103@gmail.com>
References: <1403761178-5371-1-git-send-email-sachin.kamat@samsung.com> <1403761178-5371-2-git-send-email-sachin.kamat@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:56526 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752176AbaFZF4e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 01:56:34 -0400
In-Reply-To: <1403761178-5371-2-git-send-email-sachin.kamat@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>, linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, gregkh@linuxfoundation.org, dianders@chromium.org, gautam.vivek@samsung.com, spk.linux@gmail.com, Kishon Vijay Abraham I <kishon@ti.com>

On 06/26/2014 11:09 AM, Sachin Kamat wrote:
> USB DWC3 driver on Exynos platforms does not work without its
> corresponding phy driver. Hence it makes no sense to keep the
> phy driver as user selectable. Instead select it from USB config
> to make things easier for the end user.
> While at it make the config depend on ARCH_EXYNOS5 instead of
> ARCH_EXYNOS as this IP is available only on Exynos5 platforms.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> ---

Reviewed-by: Tushar Behera <tushar.b@samsung.com>

>  drivers/phy/Kconfig      |    8 +-------
>  drivers/usb/dwc3/Kconfig |    3 ++-
>  2 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 7fe7ef5f1322..6be353c9dc4c 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -138,15 +138,9 @@ config PHY_EXYNOS5250_USB2
>  	bool
>  
>  config PHY_EXYNOS5_USBDRD
> -	tristate "Exynos5 SoC series USB DRD PHY driver"
> -	depends on ARCH_EXYNOS5 && OF
> -	depends on HAS_IOMEM
> +	tristate
>  	select GENERIC_PHY
>  	select MFD_SYSCON
> -	help
> -	  Enable USB DRD PHY support for Exynos 5 SoC series.
> -	  This driver provides PHY interface for USB 3.0 DRD controller
> -	  present on Exynos5 SoC series.
>  
>  config PHY_XGENE
>  	tristate "APM X-Gene 15Gbps PHY support"
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 261c3b428220..501477452ad8 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -55,7 +55,8 @@ config USB_DWC3_OMAP
>  
>  config USB_DWC3_EXYNOS
>  	tristate "Samsung Exynos Platform"
> -	depends on ARCH_EXYNOS || COMPILE_TEST
> +	depends on ARCH_EXYNOS5 || COMPILE_TEST
> +	select PHY_EXYNOS5_USBDRD
>  	default USB_DWC3
>  	help
>  	  Recent Exynos5 SoCs ship with one DesignWare Core USB3 IP inside,
> 


-- 
Tushar Behera
