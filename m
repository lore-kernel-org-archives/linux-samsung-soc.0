From: Kyungmin Park <kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [RFC][PATCH 4/5] ARM: S5P64x0: Adding OTG PHY control code
Date: Wed, 22 Jun 2011 13:18:49 +0900
Message-ID: <BANLkTinTo7hhfbXFd4oxiSsjbWSqA-9ugg@mail.gmail.com>
References: <1308639827-2121-1-git-send-email-p.paneri@samsung.com>
	<1308639827-2121-5-git-send-email-p.paneri@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1308639827-2121-5-git-send-email-p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, tmarri-qTEPVZfXA3Y@public.gmane.org, naushad-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jun 21, 2011 at 4:03 PM,  <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> From: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> A generic method to initialize and exit OTG PHY which can be
> used for all the samsung SoCs.
> OTG platdata structure added in platform to pass required
> platform specific functions and data to the driver.
>
> Signed-off-by: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> =A0arch/arm/mach-s5p64x0/Makefile =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
> =A0arch/arm/mach-s5p64x0/include/mach/map.h | =A0 =A04 +
> =A0arch/arm/mach-s5p64x0/setup-otg-phy.c =A0 =A0| =A0 89 ++++++++++++=
++++++++++++++++++
> =A0arch/arm/plat-s5p/include/plat/otg.h =A0 =A0 | =A0 29 ++++++++++
> =A04 files changed, 123 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-s5p64x0/setup-otg-phy.c
> =A0create mode 100644 arch/arm/plat-s5p/include/plat/otg.h
>
> diff --git a/arch/arm/mach-s5p64x0/Makefile b/arch/arm/mach-s5p64x0/M=
akefile
> index ae6bf6f..611fb3a 100644
> --- a/arch/arm/mach-s5p64x0/Makefile
> +++ b/arch/arm/mach-s5p64x0/Makefile
> @@ -28,3 +28,4 @@ obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 +=3D dev-audio.o
> =A0obj-$(CONFIG_S3C64XX_DEV_SPI) =A0+=3D dev-spi.o
>
> =A0obj-$(CONFIG_S5P64X0_SETUP_I2C1) =A0 =A0 =A0 +=3D setup-i2c1.o
> +obj-$(CONFIG_S3C_DEV_DWC_OTG) =A0+=3D setup-otg-phy.o
> diff --git a/arch/arm/mach-s5p64x0/include/mach/map.h b/arch/arm/mach=
-s5p64x0/include/mach/map.h
> index 95c9125..717c279 100644
> --- a/arch/arm/mach-s5p64x0/include/mach/map.h
> +++ b/arch/arm/mach-s5p64x0/include/mach/map.h
> @@ -44,6 +44,8 @@
> =A0#define S5P64X0_PA_SPI1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00xEC500000
>
> =A0#define S5P64X0_PA_HSOTG =A0 =A0 =A0 0xED100000
> +#define S5P64X0_PA_USB_HSPHY =A0 0xED200000
> +#define S5P64X0_VA_USB_HSPHY =A0 S3C_ADDR_CPU(0x00100000)
>
> =A0#define S5P64X0_PA_HSMMC(x) =A0 =A0(0xED800000 + ((x) * 0x100000))
>
> @@ -71,6 +73,8 @@
> =A0#define S5P_PA_TIMER =A0 =A0 =A0 =A0 =A0 S5P64X0_PA_TIMER
>
> =A0#define SAMSUNG_PA_ADC =A0 =A0 =A0 =A0 S5P64X0_PA_ADC
> +#define S3C_PA_USB_HSOTG =A0 =A0 =A0 S5P64X0_PA_HSOTG
> +#define S3C_VA_USB_HSPHY =A0 =A0 =A0 =A0S5P64X0_VA_USB_HSPHY
>
> =A0/* UART */
>
> diff --git a/arch/arm/mach-s5p64x0/setup-otg-phy.c b/arch/arm/mach-s5=
p64x0/setup-otg-phy.c
> new file mode 100644
> index 0000000..c351554
> --- /dev/null
> +++ b/arch/arm/mach-s5p64x0/setup-otg-phy.c
> @@ -0,0 +1,89 @@
> +/*
> + * Copyright (C) 2011 Samsung Electronics Co.Ltd
> + * Author: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> + * based on arch/arm/mach-exynos4/setup-usb-phy.c
> + * written by Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> + *
> + * =A0This program is free software; you can redistribute =A0it and/=
or modify it
> + * =A0under =A0the terms of =A0the GNU General =A0Public License as =
published by the
> + * =A0Free Software Foundation; =A0either version 2 of the =A0Licens=
e, or (at your
> + * =A0option) any later version.
> + *
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <mach/regs-clock.h>
> +#include <mach/gpio.h>
> +#include <plat/regs-usb-hsotg-phy.h>
> +#include <plat/usb-phy.h>
> +
> +struct clk *otg_clk;
> +static int s5p64x0_otg_phy_init(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 int err;
> +
> + =A0 =A0 =A0 otg_clk =3D clk_get(&pdev->dev, "otg");
> + =A0 =A0 =A0 if (IS_ERR(otg_clk)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Failed to get otg =
clock\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return PTR_ERR(otg_clk);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 err =3D clk_enable(otg_clk);
> + =A0 =A0 =A0 if (err) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_put(otg_clk);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return err;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (gpio_is_valid(S5P6440_GPN(1))) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D gpio_request(S5P6440_GPN(1), "G=
PN");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (err)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "failed=
 to request GPN1\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_direction_output(S5P6440_GPN(1), 1=
);
> + =A0 =A0 =A0 }

What's the GPN(1)? I think it's board specific pins. so please replace
it at board file.
> +
> + =A0 =A0 =A0 writel(readl(S5P64X0_OTHERS)&~S5P64X0_OTHERS_USB_SIG_MA=
SK,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P64X0_OTHERS);
> + =A0 =A0 =A0 writel(0x0, S3C_PHYPWR); =A0 =A0 =A0 =A0 /* Power up */
> + =A0 =A0 =A0 writel(S3C_PHYCLK_CLKSEL_12M, S3C_PHYCLK);
> + =A0 =A0 =A0 writel(S3C_RSTCON_PHY, S3C_RSTCON);
> +
> + =A0 =A0 =A0 udelay(50);
> + =A0 =A0 =A0 writel(0x0, S3C_RSTCON);
> + =A0 =A0 =A0 udelay(50);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int s5p64x0_otg_phy_exit(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 writel(readl(S3C_PHYPWR)|(0x1F<<1), S3C_PHYPWR);
> + =A0 =A0 =A0 writel(readl(S5P64X0_OTHERS)&~S5P64X0_OTHERS_USB_SIG_MA=
SK,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P64X0_OTHERS);
> +
> + =A0 =A0 =A0 gpio_free(S5P6440_GPN(1));
ditto
> +
> + =A0 =A0 =A0 clk_disable(otg_clk);
> + =A0 =A0 =A0 clk_put(otg_clk);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +int s5p_usb_phy_init(struct platform_device *pdev, int type)
> +{
> + =A0 =A0 =A0 if (type =3D=3D S5P_USB_PHY_DEVICE)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return s5p64x0_otg_phy_init(pdev);
> +
> + =A0 =A0 =A0 return -EINVAL;
> +}
> +
> +int s5p_usb_phy_exit(struct platform_device *pdev, int type)
> +{
> + =A0 =A0 =A0 if (type =3D=3D S5P_USB_PHY_DEVICE)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return s5p64x0_otg_phy_exit(pdev);
> +
> + =A0 =A0 =A0 return -EINVAL;
> +}
> diff --git a/arch/arm/plat-s5p/include/plat/otg.h b/arch/arm/plat-s5p=
/include/plat/otg.h
> new file mode 100644
> index 0000000..3111dcc
> --- /dev/null
> +++ b/arch/arm/plat-s5p/include/plat/otg.h
> @@ -0,0 +1,29 @@
> +/*
> + * Copyright (C) 2011 Samsung Electronics Co.Ltd
> + * Author: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> + * based on arch/arm/plat-s5p/include/plat/usb-phy.h
> + * written by Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> + *
> + * This program is free software; you can redistribute =A0it and/or =
modify it
> + * under =A0the terms of =A0the GNU General =A0Public License as pub=
lished by the
> + * Free Software Foundation; =A0either version 2 of the =A0License, =
or (at your
> + * option) any later version.
> + */
> +
> +#ifndef __PLAT_S5P_OTG_H
> +#define __PLAT_S5P_OTG_H
> +
> +struct s5p_otg_platdata {
> + =A0 =A0 =A0 int (*phy_init)(struct platform_device *pdev, int type)=
;
> + =A0 =A0 =A0 int (*phy_exit)(struct platform_device *pdev, int type)=
;
> + =A0 =A0 =A0 u32 dev_rx_fifo_size;
> + =A0 =A0 =A0 u32 dev_nptx_fifo_size;
> + =A0 =A0 =A0 u32 host_rx_fifo_size;
> + =A0 =A0 =A0 u32 host_nptx_fifo_size;
> + =A0 =A0 =A0 u32 host_ch_num;
> +
> +};
> +
> +extern void s5p_otg_set_platdata(struct s5p_otg_platdata *pd);
> +
> +#endif /* __PLAT_S5P_OTG_H */
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
