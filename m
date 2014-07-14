From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: Re: [PATCH 2/2] phy: Kconfig: Update config for Exynos USB DRD
Date: Mon, 14 Jul 2014 16:44:01 +0530
Message-ID: <CAFp+6iE7XOHMtv1bJ8x7ABSf5r34cwsoYB5wUauz+dTqoDC0gQ@mail.gmail.com>
References: <1405332522-6162-1-git-send-email-sachin.kamat@samsung.com>
	<1405332522-6162-2-git-send-email-sachin.kamat@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f45.google.com ([209.85.192.45]:50223 "EHLO
	mail-qg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752252AbaGNLOD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 07:14:03 -0400
In-Reply-To: <1405332522-6162-2-git-send-email-sachin.kamat@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, kishon <kishon@ti.com>, Doug Anderson <dianders@chromium.org>, Sachin Kamat <spk.linux@gmail.com>

On Mon, Jul 14, 2014 at 3:38 PM, Sachin Kamat <sachin.kamat@samsung.com> wrote:
> USB DWC3 driver on Exynos platform does not work without its
> corresponding phy driver. Hence make the PHY driver depend on
> Exynos DWC3 driver and default it to yes to make things easier
> for the end user.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
> Reviewed-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/phy/Kconfig |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index c412ca4..c730e85 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -161,8 +161,10 @@ config PHY_EXYNOS5_USBDRD
>         tristate "Exynos5 SoC series USB DRD PHY driver"
>         depends on ARCH_EXYNOS5 && OF
>         depends on HAS_IOMEM
> +       depends on USB_DWC3_EXYNOS
>         select GENERIC_PHY
>         select MFD_SYSCON
> +       default y
>         help
>           Enable USB DRD PHY support for Exynos 5 SoC series.
>           This driver provides PHY interface for USB 3.0 DRD controller
> --
> 1.7.9.5

Tested on Exynos5800 and Exynos5250, with exynos_defconfig patch :
http://www.spinics.net/lists/linux-samsung-soc/msg33994.html

Tested-by: Vivek Gautam <gautam.vivek@samsung.com>



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
