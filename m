From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: Re: [PATCH 1/2] usb: host: Kconfig: Select PHY drivers for Exynos EHCI/OHCI
Date: Thu, 26 Jun 2014 13:39:50 +0530
Message-ID: <CAFp+6iGOHu2pOcQu+BxVY7yAcchau92GQF7zPiDhRXZyh73YoA@mail.gmail.com>
References: <1403761178-5371-1-git-send-email-sachin.kamat@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f45.google.com ([209.85.216.45]:57427 "EHLO
	mail-qa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755370AbaFZIJw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 04:09:52 -0400
In-Reply-To: <1403761178-5371-1-git-send-email-sachin.kamat@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Felipe Balbi <balbi@ti.com>, Greg KH <gregkh@linuxfoundation.org>, Doug Anderson <dianders@chromium.org>, Sachin Kamat <spk.linux@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>

Hi Sachin,


On Thu, Jun 26, 2014 at 11:09 AM, Sachin Kamat <sachin.kamat@samsung.com> wrote:
> EHCI and OHCI drivers on Exynos platforms do not work without their
> corresponding SoC specific phy drivers. Hence it makes no sense to
> keep these phy drivers as user selectable. Instead select them from
> the respective USB configs to make things easier for the end user.
> While at it enable 5250 phy for Exynos 5420 SoC too.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  drivers/phy/Kconfig      |   37 +++++++------------------------------
>  drivers/usb/host/Kconfig |   10 ++++++----
>  2 files changed, 13 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 16a2f067c242..7fe7ef5f1322 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -121,44 +121,21 @@ config PHY_SUN4I_USB
>           parts, as well as the 2 regular USB 2 host PHYs.
>
>  config PHY_SAMSUNG_USB2
> -       tristate "Samsung USB 2.0 PHY driver"
> +       tristate
>         select GENERIC_PHY
>         select MFD_SYSCON
> -       help
> -         Enable this to support the Samsung USB 2.0 PHY driver for Samsung
> -         SoCs. This driver provides the interface for USB 2.0 PHY. Support for
> -         particular SoCs has to be enabled in addition to this driver. Number
> -         and type of supported phys depends on the SoC.
> +       select PHY_EXYNOS4210_USB2 if CPU_EXYNOS4210
> +       select PHY_EXYNOS4X12_USB2 if (SOC_EXYNOS4212 || SOC_EXYNOS4412)
> +       select PHY_EXYNOS5250_USB2 if (SOC_EXYNOS5250 || SOC_EXYNOS5420)

also || SOC_EXYNOS5800
same controller present on Exynos5800 too.

>
>  config PHY_EXYNOS4210_USB2
> -       bool "Support for Exynos 4210"
> -       depends on PHY_SAMSUNG_USB2
> -       depends on CPU_EXYNOS4210
> -       help
> -         Enable USB PHY support for Exynos 4210. This option requires that
> -         Samsung USB 2.0 PHY driver is enabled and means that support for this
> -         particular SoC is compiled in the driver. In case of Exynos 4210 four
> -         phys are available - device, host, HSIC0 and HSIC1.
> +       bool
>
>  config PHY_EXYNOS4X12_USB2
> -       bool "Support for Exynos 4x12"
> -       depends on PHY_SAMSUNG_USB2
> -       depends on (SOC_EXYNOS4212 || SOC_EXYNOS4412)
> -       help
> -         Enable USB PHY support for Exynos 4x12. This option requires that
> -         Samsung USB 2.0 PHY driver is enabled and means that support for this
> -         particular SoC is compiled in the driver. In case of Exynos 4x12 four
> -         phys are available - device, host, HSIC0 and HSIC1.
> +       bool
>
>  config PHY_EXYNOS5250_USB2
> -       bool "Support for Exynos 5250"
> -       depends on PHY_SAMSUNG_USB2
> -       depends on SOC_EXYNOS5250
> -       help
> -         Enable USB PHY support for Exynos 5250. This option requires that
> -         Samsung USB 2.0 PHY driver is enabled and means that support for this
> -         particular SoC is compiled in the driver. In case of Exynos 5250 four
> -         phys are available - device, host, HSIC0 and HSIC.
> +       bool
>
>  config PHY_EXYNOS5_USBDRD
>         tristate "Exynos5 SoC series USB DRD PHY driver"
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 61b7817bd66b..2938807331de 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -211,10 +211,11 @@ config USB_EHCI_SH
>           If you use the PCI EHCI controller, this option is not necessary.
>
>  config USB_EHCI_EXYNOS
> -       tristate "EHCI support for Samsung S5P/EXYNOS SoC Series"
> -       depends on PLAT_S5P || ARCH_EXYNOS
> -       help
> -       Enable support for the Samsung Exynos SOC's on-chip EHCI controller.
> +       tristate "EHCI support for Samsung S5P/EXYNOS SoC Series"
> +       depends on PLAT_S5P || ARCH_EXYNOS
> +       select PHY_SAMSUNG_USB2 if ARCH_EXYNOS
> +       help
> +         Enable support for the Samsung Exynos SOC's on-chip EHCI controller.
>
>  config USB_EHCI_MV
>         bool "EHCI support for Marvell PXA/MMP USB controller"
> @@ -520,6 +521,7 @@ config USB_OHCI_SH
>  config USB_OHCI_EXYNOS
>         tristate "OHCI support for Samsung S5P/EXYNOS SoC Series"
>         depends on PLAT_S5P || ARCH_EXYNOS
> +       select PHY_SAMSUNG_USB2 if ARCH_EXYNOS
>         help
>          Enable support for the Samsung Exynos SOC's on-chip OHCI controller.
>

rest looks fine.



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
