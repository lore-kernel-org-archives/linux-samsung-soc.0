From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v2 2/2] phy: Kconfig: Update config for Exynos USB DRD
Date: Thu, 10 Jul 2014 15:51:54 +0900
Message-ID: <003a01cf9c0b$6f8eda40$4eac8ec0$%han@samsung.com>
References: <1404906569-28026-1-git-send-email-sachin.kamat@samsung.com>
 <1404906569-28026-2-git-send-email-sachin.kamat@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58944 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751507AbaGJGv6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jul 2014 02:51:58 -0400
In-reply-to: <1404906569-28026-2-git-send-email-sachin.kamat@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, kishon@ti.com, dianders@chromium.org, gautam.vivek@samsung.com, spk.linux@gmail.com, tomasz.figa@gmail.com, 'Jingoo Han' <jg1.han@samsung.com>

On Wednesday, July 09, 2014 8:49 PM, Sachin Kamat wrote:
> 
> USB DWC3 driver on Exynos platform does not work without its
> corresponding phy driver. Hence make the PHY driver depend on
> Exynos DWC3 driver and default it to yes to make things easier
> for the end user.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
> No changes since v1.
> ---
>  drivers/phy/Kconfig |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 128f8b92b55c..ee6c80a5392a 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -152,8 +152,10 @@ config PHY_EXYNOS5_USBDRD
>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>  	depends on ARCH_EXYNOS5 && OF
>  	depends on HAS_IOMEM
> +	depends on USB_DWC3_EXYNOS
>  	select GENERIC_PHY
>  	select MFD_SYSCON
> +	default y
>  	help
>  	  Enable USB DRD PHY support for Exynos 5 SoC series.
>  	  This driver provides PHY interface for USB 3.0 DRD controller
> --
> 1.7.9.5
