From: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC][PATCH 4/5] ARM: S5P64x0: Adding OTG PHY control code
Date: Wed, 22 Jun 2011 13:56:25 +0530
Message-ID: <BANLkTikDDBQjE2RCeeBB50vokSTcnCO46A@mail.gmail.com>
References: <0LN400HTOZEQDIL0@mailout1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0LN400HTOZEQDIL0-cPDsiUgaCBdqW5MlFJXMulaTQe2KTcn/@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tmarri-qTEPVZfXA3Y@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Tue, Jun 21, 2011 at 4:19 PM, PRAVEEN PANERI <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> =
wrote:
>
>
>
> Hi,
>
> On Tue, Jun 21, 2011 at 12:33:46PM +0530, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org wrote:
> > From: Praveen Paneri
> >
> > A generic method to initialize and exit OTG PHY which can be
> > used for all the samsung SoCs.
> > OTG platdata structure added in platform to pass required
> > platform specific functions and data to the driver.
> >
> > Signed-off-by: Praveen Paneri
> > ---
> >=A0=A0arch/arm/mach-s5p64x0/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0=A0=A0=A01 +
> >=A0=A0arch/arm/mach-s5p64x0/include/mach/map.h |=A0=A0=A0=A04 +
> >=A0=A0arch/arm/mach-s5p64x0/setup-otg-phy.c=A0=A0=A0=A0|=A0=A0 89 ++=
++++++++++++++++++++++++++++
> >=A0=A0arch/arm/plat-s5p/include/plat/otg.h=A0=A0=A0=A0 |=A0=A0 29 ++=
++++++++
> >=A0=A04 files changed, 123 insertions(+), 0 deletions(-)
> >=A0=A0create mode 100644 arch/arm/mach-s5p64x0/setup-otg-phy.c
> >=A0=A0create mode 100644 arch/arm/plat-s5p/include/plat/otg.h
> >
> > diff --git a/arch/arm/mach-s5p64x0/Makefile b/arch/arm/mach-s5p64x0=
/Makefile
> > index ae6bf6f..611fb3a 100644
> > --- a/arch/arm/mach-s5p64x0/Makefile
> > +++ b/arch/arm/mach-s5p64x0/Makefile
> > @@ -28,3 +28,4 @@ obj-y +=3D dev-audio.o
> >=A0=A0obj-$(CONFIG_S3C64XX_DEV_SPI) +=3D dev-spi.o
> >
> >=A0=A0obj-$(CONFIG_S5P64X0_SETUP_I2C1) +=3D setup-i2c1.o
> > +obj-$(CONFIG_S3C_DEV_DWC_OTG) +=3D setup-otg-phy.o
> > diff --git a/arch/arm/mach-s5p64x0/include/mach/map.h b/arch/arm/ma=
ch-s5p64x0/include/mach/map.h
> > index 95c9125..717c279 100644
> > --- a/arch/arm/mach-s5p64x0/include/mach/map.h
> > +++ b/arch/arm/mach-s5p64x0/include/mach/map.h
> > @@ -44,6 +44,8 @@
> >=A0=A0#define S5P64X0_PA_SPI1 0xEC500000
> >
> >=A0=A0#define S5P64X0_PA_HSOTG 0xED100000
> > +#define S5P64X0_PA_USB_HSPHY 0xED200000
> > +#define S5P64X0_VA_USB_HSPHY S3C_ADDR_CPU(0x00100000)
> >
> >=A0=A0#define S5P64X0_PA_HSMMC(x) (0xED800000 + ((x) * 0x100000))
> >
> > @@ -71,6 +73,8 @@
> >=A0=A0#define S5P_PA_TIMER S5P64X0_PA_TIMER
> >
> >=A0=A0#define SAMSUNG_PA_ADC S5P64X0_PA_ADC
> > +#define S3C_PA_USB_HSOTG S5P64X0_PA_HSOTG
> > +#define S3C_VA_USB_HSPHY=A0=A0=A0=A0=A0=A0=A0=A0S5P64X0_VA_USB_HSP=
HY
> >
> >=A0=A0/* UART */
> >
> > diff --git a/arch/arm/mach-s5p64x0/setup-otg-phy.c b/arch/arm/mach-=
s5p64x0/setup-otg-phy.c
>
> drivers should not live in arch/arm/*, why don't you move this to
> drivers/usb/otg where the PHYs are staying right now ?
PHY init/exit code can vary across SoCs. Wouldn't it be better to have =
it in the
SoC specific location?
>
> > new file mode 100644
> > index 0000000..c351554
> > --- /dev/null
> > +++ b/arch/arm/mach-s5p64x0/setup-otg-phy.c
> > @@ -0,0 +1,89 @@
> > +/*
> > + * Copyright (C) 2011 Samsung Electronics Co.Ltd
> > + * Author: Praveen Paneri
> > + * based on arch/arm/mach-exynos4/setup-usb-phy.c
> > + * written by Joonyoung Shim
> > + *
> > + *=A0=A0This program is free software; you can redistribute=A0=A0i=
t and/or modify it
> > + *=A0=A0under=A0=A0the terms of=A0=A0the GNU General=A0=A0Public L=
icense as published by the
> > + *=A0=A0Free Software Foundation;=A0=A0either version 2 of the=A0=A0=
License, or (at your
> > + *=A0=A0option) any later version.
> > + *
> > + */
> > +
> > +#include
> > +#include
> > +#include
> > +#include
> > +#include
> > +#include
> > +#include
> > +#include
> > +#include
> > +
> > +struct clk *otg_clk;
> > +static int s5p64x0_otg_phy_init(struct platform_device *pdev)
> > +{
> > + int err;
> > +
> > + otg_clk =3D clk_get(&pdev->dev, "otg");
> > + if (IS_ERR(otg_clk)) {
> > + dev_err(&pdev->dev, "Failed to get otg clock\n");
> > + return PTR_ERR(otg_clk);
> > + }
> > +
> > + err =3D clk_enable(otg_clk);
> > + if (err) {
> > + clk_put(otg_clk);
> > + return err;
> > + }
> > +
> > + if (gpio_is_valid(S5P6440_GPN(1))) {
> > + err =3D gpio_request(S5P6440_GPN(1), "GPN");
> > + if (err)
> > + printk(KERN_ERR "failed to request GPN1\n");
> > + gpio_direction_output(S5P6440_GPN(1), 1);
> > + }
> > +
> > + writel(readl(S5P64X0_OTHERS)&~S5P64X0_OTHERS_USB_SIG_MASK,
> > + S5P64X0_OTHERS);
> > + writel(0x0, S3C_PHYPWR);=A0=A0=A0=A0=A0=A0=A0=A0 /* Power up */
> > + writel(S3C_PHYCLK_CLKSEL_12M, S3C_PHYCLK);
> > + writel(S3C_RSTCON_PHY, S3C_RSTCON);
> > +
> > + udelay(50);
> > + writel(0x0, S3C_RSTCON);
> > + udelay(50);
> > +
> > + return 0;
> > +}
> > +
> > +static int s5p64x0_otg_phy_exit(struct platform_device *pdev)
> > +{
> > + writel(readl(S3C_PHYPWR)|(0x1F<<1), S3C_PHYPWR);
> > + writel(readl(S5P64X0_OTHERS)&~S5P64X0_OTHERS_USB_SIG_MASK,
> > + S5P64X0_OTHERS);
> > +
> > + gpio_free(S5P6440_GPN(1));
> > +
> > + clk_disable(otg_clk);
> > + clk_put(otg_clk);
> > +
> > + return 0;
> > +}
> > +
> > +int s5p_usb_phy_init(struct platform_device *pdev, int type)
> > +{
> > + if (type =3D=3D S5P_USB_PHY_DEVICE)
> > + return s5p64x0_otg_phy_init(pdev);
> > +
> > + return -EINVAL;
> > +}
> > +
> > +int s5p_usb_phy_exit(struct platform_device *pdev, int type)
> > +{
> > + if (type =3D=3D S5P_USB_PHY_DEVICE)
> > + return s5p64x0_otg_phy_exit(pdev);
> > +
> > + return -EINVAL;
> > +}
>
> no way to make this a real driver instead of set a exported functions=
 ??
>
> --
> balbi
>
paneri
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
