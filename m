From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH] usb: phy: samsung: let it be built as a module
Date: Wed, 27 Feb 2013 17:31:53 +0530
Message-ID: <CAFp+6iHx0-UX4g3BVwFM1V=4JuJHe0VRE=CTLmEY5qEt1YqNjg@mail.gmail.com>
References: <CAFp+6iEfVSbyGVNhDFc2wW7w=ZMGwVpcc28GAGOgHffCWQRLMQ@mail.gmail.com>
	<1361962133-21296-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f48.google.com ([209.85.214.48]:40790 "EHLO
	mail-bk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751283Ab3B0MBy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 07:01:54 -0500
In-Reply-To: <1361962133-21296-1-git-send-email-balbi@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>, kgene@kernel.org, linux-samsung-soc@vger.kernel.org

Hi Felipe,


On Wed, Feb 27, 2013 at 4:18 PM, Felipe Balbi <balbi@ti.com> wrote:
> There's no reason not to allow samsung PHY
> drivers be built as modules. This patch changes
> Kconfig to allow that.
>
> Signed-off-by: Felipe Balbi <balbi@ti.com>
> ---
>
> Hi,
>
> I will take your patches but I'm planning to add this on top
> as there is no reason not to allow these drivers being built
> as modules.
>

aargh !! my bad :-(
actually missed exporting the symbols in drivers/usb/phy/samsung-usbphy.c
Getting compile errors.
Shall i just update the patch [PATCH v5 0/2] Adding USB 3.0 DRD-phy
support for exynos5250
or send a separate patch on top so that you can squash this change
along with. ;-)

> cheers
>
>  drivers/usb/phy/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
> index 723d7b1..4f696d0 100644
> --- a/drivers/usb/phy/Kconfig
> +++ b/drivers/usb/phy/Kconfig
> @@ -67,7 +67,7 @@ config USB_RCAR_PHY
>           module will be called rcar-phy.
>
>  config SAMSUNG_USB2PHY
> -       bool "Samsung USB 2.0 PHY controller Driver"
> +       tristate "Samsung USB 2.0 PHY controller Driver"
>         select SAMSUNG_USBPHY
>         select USB_OTG_UTILS
>         help
> @@ -75,7 +75,7 @@ config SAMSUNG_USB2PHY
>           driver for Samsung SoCs.
>
>  config SAMSUNG_USB3PHY
> -       bool "Samsung USB 3.0 PHY controller Driver"
> +       tristate "Samsung USB 3.0 PHY controller Driver"
>         select SAMSUNG_USBPHY
>         select USB_OTG_UTILS
>         help
> @@ -83,7 +83,7 @@ config SAMSUNG_USB3PHY
>           for samsung SoCs.
>
>  config SAMSUNG_USBPHY
> -       bool "Samsung USB PHY Driver"
> +       tristate "Samsung USB PHY Driver"
>         help
>           Enable this to support Samsung USB phy helper driver for Samsung SoCs.
>           This driver provides common interface to interact, for Samsung USB 2.0 PHY
> --
> 1.8.1.rc1.5.g7e0651a
>


-- 
Thanks & Regards
Vivek
