From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 1/4] ARM: EXYNOS: Update & move usb-phy types to
 generic include layer
Date: Wed, 19 Dec 2012 13:48:39 -0800
Message-ID: <CAD=FV=Ved4TSr7v413u5_o2cBrfegGrpKe1V2qKwQ36v-MQTHA@mail.gmail.com>
References: <1355841786-13307-1-git-send-email-gautam.vivek@samsung.com>
 <1355841786-13307-2-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355841786-13307-2-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Vivek,

On Tue, Dec 18, 2012 at 6:43 AM, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Updating the names of usb-phy types to more generic names:
> USB_PHY_TYPE_DEIVCE & USB_PHY_TYPE_HOST; and further update
> its dependencies.

Since you're changing the name, I would have expected to see a removal
of the old enum type in this patch.  I don't see it.  After applying
all of your patches I find that S5P_USB_PHY_HOST and
S5P_USB_PHY_DEVICE are still defined and used.

$ git grep S5P_USB_PHY_HOST
arch/arm/mach-exynos/setup-usb-phy.c:   else if (type == S5P_USB_PHY_HOST)
arch/arm/mach-exynos/setup-usb-phy.c:   else if (type == S5P_USB_PHY_HOST)
arch/arm/plat-samsung/include/plat/usb-phy.h:   S5P_USB_PHY_HOST,

I believe that those usages of the old enum should also be switched
over and the old enum removed.

> Signed-off-by: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/usb/host/ehci-s5p.c         |    9 +++++----
>  drivers/usb/host/ohci-exynos.c      |    9 +++++----
>  include/linux/usb/samsung_usb_phy.h |   16 ++++++++++++++++
>  3 files changed, 26 insertions(+), 8 deletions(-)
>  create mode 100644 include/linux/usb/samsung_usb_phy.h
>
> diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
> index 319dcfa..46ca5ef 100644
> --- a/drivers/usb/host/ehci-s5p.c
> +++ b/drivers/usb/host/ehci-s5p.c
> @@ -17,6 +17,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/of_gpio.h>
>  #include <linux/platform_data/usb-ehci-s5p.h>
> +#include <linux/usb/samsung_usb_phy.h>
>  #include <plat/usb-phy.h>
>
>  #define EHCI_INSNREG00(base)                   (base + 0x90)
> @@ -164,7 +165,7 @@ static int s5p_ehci_probe(struct platform_device *pdev)
>         }
>
>         if (pdata->phy_init)
> -               pdata->phy_init(pdev, S5P_USB_PHY_HOST);
> +               pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
>
>         ehci = hcd_to_ehci(hcd);
>         ehci->caps = hcd->regs;
> @@ -198,7 +199,7 @@ static int s5p_ehci_remove(struct platform_device *pdev)
>         usb_remove_hcd(hcd);
>
>         if (pdata && pdata->phy_exit)
> -               pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
> +               pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
>
>         clk_disable_unprepare(s5p_ehci->clk);
>
> @@ -229,7 +230,7 @@ static int s5p_ehci_suspend(struct device *dev)
>         rc = ehci_suspend(hcd, do_wakeup);
>
>         if (pdata && pdata->phy_exit)
> -               pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
> +               pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
>
>         clk_disable_unprepare(s5p_ehci->clk);
>
> @@ -246,7 +247,7 @@ static int s5p_ehci_resume(struct device *dev)
>         clk_prepare_enable(s5p_ehci->clk);
>
>         if (pdata && pdata->phy_init)
> -               pdata->phy_init(pdev, S5P_USB_PHY_HOST);
> +               pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
>
>         /* DMA burst Enable */
>         writel(EHCI_INSNREG00_ENABLE_DMA_BURST, EHCI_INSNREG00(hcd->regs));
> diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
> index aa3b884..804fb62 100644
> --- a/drivers/usb/host/ohci-exynos.c
> +++ b/drivers/usb/host/ohci-exynos.c
> @@ -15,6 +15,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_data/usb-exynos.h>
> +#include <linux/usb/samsung_usb_phy.h>
>  #include <plat/usb-phy.h>
>
>  struct exynos_ohci_hcd {
> @@ -153,7 +154,7 @@ static int exynos_ohci_probe(struct platform_device *pdev)
>         }
>
>         if (pdata->phy_init)
> -               pdata->phy_init(pdev, S5P_USB_PHY_HOST);
> +               pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
>
>         ohci = hcd_to_ohci(hcd);
>         ohci_hcd_init(ohci);
> @@ -184,7 +185,7 @@ static int exynos_ohci_remove(struct platform_device *pdev)
>         usb_remove_hcd(hcd);
>
>         if (pdata && pdata->phy_exit)
> -               pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
> +               pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
>
>         clk_disable_unprepare(exynos_ohci->clk);
>
> @@ -229,7 +230,7 @@ static int exynos_ohci_suspend(struct device *dev)
>         clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
>
>         if (pdata && pdata->phy_exit)
> -               pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
> +               pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
>
>         clk_disable_unprepare(exynos_ohci->clk);
>
> @@ -249,7 +250,7 @@ static int exynos_ohci_resume(struct device *dev)
>         clk_prepare_enable(exynos_ohci->clk);
>
>         if (pdata && pdata->phy_init)
> -               pdata->phy_init(pdev, S5P_USB_PHY_HOST);
> +               pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
>
>         ohci_resume(hcd, false);
>
> diff --git a/include/linux/usb/samsung_usb_phy.h b/include/linux/usb/samsung_usb_phy.h
> new file mode 100644
> index 0000000..9167826
> --- /dev/null
> +++ b/include/linux/usb/samsung_usb_phy.h
> @@ -0,0 +1,16 @@
> +/*
> + * Copyright (C) 2012 Samsung Electronics Co.Ltd
> + *             http://www.samsung.com/
> + *
> + * Defines phy types for samsung usb phy controllers - HOST or DEIVCE.
> + *
> + * This program is free software; you can redistribute  it and/or modify it
> + * under  the terms of  the GNU General  Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */
> +
> +enum samsung_usb_phy_type {
> +       USB_PHY_TYPE_DEVICE,
> +       USB_PHY_TYPE_HOST,
> +};
> --
> 1.7.6.5
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
