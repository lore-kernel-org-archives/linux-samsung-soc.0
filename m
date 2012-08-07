From: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/5] usb: phy: samsung: Introducing usb phy driver for hsotg
Date: Tue, 7 Aug 2012 09:27:45 +0530
Message-ID: <CAD6zSYMsHUeR9=ERx=XO5OXvx2SK8C2xX1WX5qXbmXBpfCuO_w@mail.gmail.com>
References: <1343826351-8756-1-git-send-email-p.paneri@samsung.com>
	<CAD6zSYMkrPLuV+8ev4pz8M7qW8pFo2Q12jmW-pHqvdVREuW=Tw@mail.gmail.com>
	<CAH9JG2Wo83_rO6fEazWij9wo=w7atdCqeuqJUmCPJYeYQ4t5dw@mail.gmail.com>
	<201208061123.18065.heiko@sntech.de>
	<CAD6zSYPyRGgxVXFhcLSqjOpERq-jLrsqnjYNXM3jKsjymiLaTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD6zSYPyRGgxVXFhcLSqjOpERq-jLrsqnjYNXM3jKsjymiLaTA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Mon, Aug 6, 2012 at 3:21 PM, Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> w=
rote:
> Hi,
>
> On Mon, Aug 6, 2012 at 2:53 PM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wro=
te:
>> Am Montag, 6. August 2012, 10:23:52 schrieb Kyungmin Park:
>>> Hi Praveen,
>>>
>>> On 8/6/12, Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>> > Hi Heiko,
>>> >
>>> > On Mon, Aug 6, 2012 at 3:24 AM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>=
 wrote:
>>> >> Hi Praveen,
>>> >>
>>> >> Am Mittwoch, 1. August 2012, 15:05:47 schrieb Praveen Paneri:
>>> >>> This driver uses usb_phy interface to interact with s3c-hsotg. =
Supports
>>> >>> phy_init and phy_shutdown functions to enable/disable phy. Test=
ed with
>>> >>> smdk6410 and smdkv310. More SoCs can be brought under later.
>>> >>
>>> >> Looks cool.
>>> >
>>> > Thanks
>>> >
>>> >> From what I've seen the phy controllers on newer Samsung SoCs ar=
e still
>>> >> somewhat similar to the one on my s3c2416/2450 machines. So hope=
fully at
>>> >> some
>>> >> point after the driver has settled, I'll find the time to add su=
pport
>>> >> for these to the phy driver.
>>> >
>>> > Yes! that's great.
>>> >
>>> >> Out of curiosity, what does the "sec" in sec_usbphy for?
>>> >
>>> > Its Samsung Electronics Co. :)
>>>
>>> I'm also prefer to use 'samsung' or 'exynos'. Since I didn't see th=
e
>>> 'sec' prefix for samsung drivers.
>>
>> I'd second that. All new generic samsung drivers look like this (i.e=
=2E gpio-
>> samsung, pwm-samsung).
On the second thought I am thinking 'sec' is shorter and cooler. I
know that it has not
been used anywhere else but there is always a first time :-P The
shorter string helps in
writing the code; especially when we have 80 character restriction. If
you go through
this driver itself you will realize this. Also there was a suggestion
some time back to
use 'sec' instead of 'samsung'.
This is just my view about it. Please comment.

Praveen

>>
>> Just checked the datasheets again. This general phy type is used in =
some form
>> down to the S3C2443, so I'd prefer something with samsung in the nam=
e :-)
> Yes! That makes sense. I will change the name to samsung_usbphy
>
> Praveen
>>
>>
>> Heiko
>>
>>>
>>> Thank you,
>>> Kyungmin Park
>>>
>>> > Praveen
>>> >
>>> >>> Signed-off-by: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> >>
>>> >> Acked-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>>> >>
>>> >>
>>> >> Heiko
>>> >>
>>> >>> ---
>>> >>>
>>> >>>  .../devicetree/bindings/usb/samsung-usbphy.txt     |    9 +
>>> >>>  drivers/usb/phy/Kconfig                            |    8 +
>>> >>>  drivers/usb/phy/Makefile                           |    1 +
>>> >>>  drivers/usb/phy/sec_usbphy.c                       |  354
>>> >>>
>>> >>> ++++++++++++++++++++ drivers/usb/phy/sec_usbphy.h
>>> >>>
>>> >>>  48 +++
>>> >>>  include/linux/platform_data/s3c-hsotg.h            |    5 +
>>> >>>  6 files changed, 425 insertions(+), 0 deletions(-)
>>> >>>  create mode 100644
>>> >>>
>>> >>> Documentation/devicetree/bindings/usb/samsung-usbphy.txt create=
 mode
>>> >>> 100644 drivers/usb/phy/sec_usbphy.c
>>> >>>
>>> >>>  create mode 100644 drivers/usb/phy/sec_usbphy.h
>>> >>>
>>> >>> diff --git a/Documentation/devicetree/bindings/usb/samsung-usbp=
hy.txt
>>> >>> b/Documentation/devicetree/bindings/usb/samsung-usbphy.txt new =
file
>>> >>> mode 100644
>>> >>> index 0000000..fefd9c8
>>> >>> --- /dev/null
>>> >>> +++ b/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
>>> >>> @@ -0,0 +1,9 @@
>>> >>> +* Samsung's usb phy transceiver
>>> >>> +
>>> >>> +The Samsung's phy transceiver is used for controlling usb otg =
phy for
>>> >>> +s3c-hsotg usb device controller.
>>> >>> +
>>> >>> +Required properties:
>>> >>> +- compatible : should be "samsung,exynos4210-usbphy"
>>> >>> +- reg : base physical address of the phy registers and length =
of
>>> >>> memory mapped +      region.
>>> >>> diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
>>> >>> index e7cf84f..abbebe2 100644
>>> >>> --- a/drivers/usb/phy/Kconfig
>>> >>> +++ b/drivers/usb/phy/Kconfig
>>> >>> @@ -15,3 +15,11 @@ config USB_ISP1301
>>> >>>
>>> >>>         To compile this driver as a module, choose M here: the
>>> >>>         module will be called isp1301.
>>> >>>
>>> >>> +
>>> >>> +config SEC_USBPHY
>>> >>> +       bool "Samsung USB PHY controller Driver"
>>> >>> +       depends on USB_S3C_HSOTG
>>> >>> +       select USB_OTG_UTILS
>>> >>> +       help
>>> >>> +         Enable this to support Samsung USB phy controller for=
 samsung
>>> >>> +         SoCs.
>>> >>> diff --git a/drivers/usb/phy/Makefile b/drivers/usb/phy/Makefil=
e
>>> >>> index eca095b..6bb66f0 100644
>>> >>> --- a/drivers/usb/phy/Makefile
>>> >>> +++ b/drivers/usb/phy/Makefile
>>> >>> @@ -5,3 +5,4 @@
>>> >>>
>>> >>>  ccflags-$(CONFIG_USB_DEBUG) :=3D -DDEBUG
>>> >>>
>>> >>>  obj-$(CONFIG_USB_ISP1301)            +=3D isp1301.o
>>> >>>
>>> >>> +obj-$(CONFIG_SEC_USBPHY)             +=3D sec_usbphy.o
>>> >>> diff --git a/drivers/usb/phy/sec_usbphy.c
>>> >>> b/drivers/usb/phy/sec_usbphy.c new file mode 100644
>>> >>> index 0000000..33119eb
>>> >>> --- /dev/null
>>> >>> +++ b/drivers/usb/phy/sec_usbphy.c
>>> >>> @@ -0,0 +1,354 @@
>>> >>> +/* linux/drivers/usb/phy/sec_usbphy.c
>>> >>> + *
>>> >>> + * Copyright (c) 2012 Samsung Electronics Co., Ltd.
>>> >>> + *              http://www.samsung.com
>>> >>> + *
>>> >>> + * Author: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> >>> + *
>>> >>> + * Samsung USB2.0 High-speed OTG transceiver, talks to S3C HS =
OTG
>>> >>> controller + *
>>> >>> + * This program is free software; you can redistribute it and/=
or
>>> >>> modify + * it under the terms of the GNU General Public License
>>> >>> version 2 as + * published by the Free Software Foundation.
>>> >>> + *
>>> >>> + * This program is distributed in the hope that it will be use=
ful,
>>> >>> + * but WITHOUT ANY WARRANTY; without even the implied warranty=
 of
>>> >>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See t=
he
>>> >>> + * GNU General Public License for more details.
>>> >>> + *
>>> >>> + * You should have received a copy of the GNU General Public L=
icense
>>> >>> + * along with this program; if not, write to the Free Software
>>> >>> + * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
>>> >>> +*/
>>> >>> +
>>> >>> +#include <linux/module.h>
>>> >>> +#include <linux/platform_device.h>
>>> >>> +#include <linux/clk.h>
>>> >>> +#include <linux/delay.h>
>>> >>> +#include <linux/err.h>
>>> >>> +#include <linux/io.h>
>>> >>> +#include <linux/of.h>
>>> >>> +#include <linux/usb/otg.h>
>>> >>> +#include <linux/platform_data/s3c-hsotg.h>
>>> >>> +
>>> >>> +#include "sec_usbphy.h"
>>> >>> +
>>> >>> +enum sec_cpu_type {
>>> >>> +     TYPE_S3C64XX,
>>> >>> +     TYPE_EXYNOS4210,
>>> >>> +};
>>> >>> +
>>> >>> +/*
>>> >>> + * struct sec_usbphy - transceiver driver state
>>> >>> + * @phy: transceiver structure
>>> >>> + * @plat: platform data
>>> >>> + * @dev: The parent device supplied to the probe function
>>> >>> + * @clk: usb phy clock
>>> >>> + * @regs: usb phy register memory base
>>> >>> + * @cpu_type: machine identifier
>>> >>> + */
>>> >>> +struct sec_usbphy {
>>> >>> +     struct usb_phy  phy;
>>> >>> +     struct s3c_usbphy_plat *plat;
>>> >>> +     struct device   *dev;
>>> >>> +     struct clk      *clk;
>>> >>> +     void __iomem    *regs;
>>> >>> +     int             cpu_type;
>>> >>> +};
>>> >>> +
>>> >>> +#define phy_to_sec(x)                container_of((x), struct
>>> >>> sec_usbphy, phy)
>>> >>> +
>>> >>> +/*
>>> >>> + * Enables or disables the phy clock
>>> >>> + * returns 0 on success else the error
>>> >>> + */
>>> >>> +static int sec_usbphy_clk_control(struct sec_usbphy *sec, bool=
 on)
>>> >>> +{
>>> >>> +     if (on) {
>>> >>> +             if (!sec->clk) {
>>> >>> +                     sec->clk =3D clk_get(sec->dev, "otg");
>>> >>> +                     if (IS_ERR(sec->clk)) {
>>> >>> +                             dev_err(sec->dev, "Failed to get =
otg
>>> >>> clock\n");
>>> >>> +                             return PTR_ERR(sec->clk);
>>> >>> +                     }
>>> >>> +             }
>>> >>> +             clk_enable(sec->clk);
>>> >>> +     } else {
>>> >>> +             clk_disable(sec->clk);
>>> >>> +             clk_put(sec->clk);
>>> >>> +     }
>>> >>> +
>>> >>> +     return 0;
>>> >>> +}
>>> >>> +
>>> >>> +/*
>>> >>> + * Returns reference clock frequency
>>> >>> + */
>>> >>> +static int sec_usbphy_get_refclk_freq(struct sec_usbphy *sec)
>>> >>> +{
>>> >>> +     struct clk *ref_clk;
>>> >>> +     int refclk_freq =3D 0;
>>> >>> +
>>> >>> +     ref_clk =3D clk_get(sec->dev, "xusbxti");
>>> >>> +     if (IS_ERR(ref_clk)) {
>>> >>> +             dev_err(sec->dev, "Failed to get reference clock\=
n");
>>> >>> +             return PTR_ERR(ref_clk);
>>> >>> +     }
>>> >>> +
>>> >>> +     switch (clk_get_rate(ref_clk)) {
>>> >>> +     case 12 * MHZ:
>>> >>> +             refclk_freq |=3D S3C_PHYCLK_CLKSEL_12M;
>>> >>> +             break;
>>> >>> +     case 24 * MHZ:
>>> >>> +             refclk_freq |=3D S3C_PHYCLK_CLKSEL_24M;
>>> >>> +             break;
>>> >>> +     default:
>>> >>> +     case 48 * MHZ:
>>> >>> +             /* default reference clock */
>>> >>> +             refclk_freq |=3D S3C_PHYCLK_CLKSEL_48M;
>>> >>> +             break;
>>> >>> +     }
>>> >>> +     clk_put(ref_clk);
>>> >>> +
>>> >>> +     return refclk_freq;
>>> >>> +}
>>> >>> +
>>> >>> +static void sec_usbphy_enable(struct sec_usbphy *sec)
>>> >>> +{
>>> >>> +     void __iomem *regs =3D sec->regs;
>>> >>> +     u32 phypwr;
>>> >>> +     u32 phyclk;
>>> >>> +     u32 rstcon;
>>> >>> +
>>> >>> +     /* set clock frequency for PLL */
>>> >>> +     phyclk =3D sec_usbphy_get_refclk_freq(sec);
>>> >>> +     phypwr =3D readl(regs + S3C_PHYPWR);
>>> >>> +     rstcon =3D readl(regs + S3C_RSTCON);
>>> >>> +
>>> >>> +     switch (sec->cpu_type) {
>>> >>> +     case TYPE_S3C64XX:
>>> >>> +             phyclk &=3D ~(S3C_PHYCLK_COMMON_ON_N);
>>> >>> +             phypwr &=3D ~S3C_PHYPWR_NORMAL_MASK;
>>> >>> +             rstcon |=3D S3C_RSTCON_PHY;
>>> >>> +             break;
>>> >>> +     case TYPE_EXYNOS4210:
>>> >>> +             phypwr &=3D ~EXYNOS4_PHYPWR_NORMAL_MASK;
>>> >>> +             rstcon |=3D S3C_RSTCON_PHY;
>>> >>> +     default:
>>> >>> +             break;
>>> >>> +     }
>>> >>> +
>>> >>> +     writel(phyclk, regs + S3C_PHYCLK);
>>> >>> +     /* set to normal of PHY0 */
>>> >>> +     writel(phypwr, regs + S3C_PHYPWR);
>>> >>> +     /* reset all ports of PHY and Link */
>>> >>> +     writel(rstcon, regs + S3C_RSTCON);
>>> >>> +     udelay(10);
>>> >>> +     rstcon &=3D ~S3C_RSTCON_PHY;
>>> >>> +     writel(rstcon, regs + S3C_RSTCON);
>>> >>> +}
>>> >>> +
>>> >>> +static void sec_usbphy_disable(struct sec_usbphy *sec)
>>> >>> +{
>>> >>> +     void __iomem *regs =3D sec->regs;
>>> >>> +     u32 phypwr;
>>> >>> +
>>> >>> +     phypwr =3D readl(regs + S3C_PHYPWR);
>>> >>> +
>>> >>> +     switch (sec->cpu_type) {
>>> >>> +     case TYPE_S3C64XX:
>>> >>> +             phypwr |=3D S3C_PHYPWR_NORMAL_MASK;
>>> >>> +             break;
>>> >>> +     case TYPE_EXYNOS4210:
>>> >>> +             phypwr |=3D EXYNOS4_PHYPWR_NORMAL_MASK;
>>> >>> +     default:
>>> >>> +             break;
>>> >>> +     }
>>> >>> +
>>> >>> +     /* unset to normal of PHY0 */
>>> >>> +     writel(phypwr, regs + S3C_PHYPWR);
>>> >>> +}
>>> >>> +
>>> >>> +/*
>>> >>> + * The function passed to the usb driver for phy initializatio=
n
>>> >>> + */
>>> >>> +static int sec_usbphy_init(struct usb_phy *phy)
>>> >>> +{
>>> >>> +     struct sec_usbphy *sec;
>>> >>> +     int ret =3D 0;
>>> >>> +
>>> >>> +     sec =3D phy_to_sec(phy);
>>> >>> +
>>> >>> +     /* Enable the phy clock */
>>> >>> +     ret =3D sec_usbphy_clk_control(sec, true);
>>> >>> +     if (ret) {
>>> >>> +             dev_err(sec->dev, "phy clock enable failed\n");
>>> >>> +             return ret;
>>> >>> +     }
>>> >>> +
>>> >>> +     /* Disable phy isolation */
>>> >>> +     if (sec->plat && sec->plat->pmu_isolation)
>>> >>> +             sec->plat->pmu_isolation(false);
>>> >>> +
>>> >>> +     /* Initialize usb phy registers */
>>> >>> +     sec_usbphy_enable(sec);
>>> >>> +     return ret;
>>> >>> +}
>>> >>> +
>>> >>> +/*
>>> >>> + * The function passed to the usb driver for phy shutdown
>>> >>> + */
>>> >>> +static void sec_usbphy_shutdown(struct usb_phy *phy)
>>> >>> +{
>>> >>> +     struct sec_usbphy *sec;
>>> >>> +
>>> >>> +     sec =3D phy_to_sec(phy);
>>> >>> +
>>> >>> +     /* De-initialize usb phy registers */
>>> >>> +     sec_usbphy_disable(sec);
>>> >>> +
>>> >>> +     /* Enable phy isolation */
>>> >>> +     if (sec->plat && sec->plat->pmu_isolation)
>>> >>> +             sec->plat->pmu_isolation(true);
>>> >>> +
>>> >>> +     /* Disable the phy clock */
>>> >>> +     sec_usbphy_clk_control(sec, false);
>>> >>> +}
>>> >>> +
>>> >>> +static const struct of_device_id sec_usbphy_dt_match[];
>>> >>> +
>>> >>> +static inline int sec_usbphy_get_driver_data(struct platform_d=
evice
>>> >>> *pdev)
>>> >>> +{
>>> >>> +#ifdef CONFIG_OF
>>> >>> +     int data;
>>> >>> +     if (pdev->dev.of_node) {
>>> >>> +             const struct of_device_id *match;
>>> >>> +             match =3D of_match_node(sec_usbphy_dt_match,
>>> >>> pdev->dev.of_node);
>>> >>> +             data =3D (int) match->data;
>>> >>> +             return data;
>>> >>> +     }
>>> >>> +#endif
>>> >>> +     return platform_get_device_id(pdev)->driver_data;
>>> >>> +}
>>> >>> +
>>> >>> +static int __devinit sec_usbphy_probe(struct platform_device *=
pdev)
>>> >>> +{
>>> >>> +     struct sec_usbphy *sec;
>>> >>> +     struct s3c_usbphy_plat *pdata;
>>> >>> +     struct device *dev =3D &pdev->dev;
>>> >>> +     struct resource *phy_mem;
>>> >>> +     void __iomem    *phy_base;
>>> >>> +     int     ret;
>>> >>> +
>>> >>> +     pdata =3D pdev->dev.platform_data;
>>> >>> +     if (!pdata) {
>>> >>> +             dev_err(&pdev->dev, "%s: no platform data defined=
\n",
>>> >>> __func__);
>>> >>> +             return -EINVAL;
>>> >>> +     }
>>> >>> +
>>> >>> +     phy_mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0=
);
>>> >>> +     if (!phy_mem) {
>>> >>> +             dev_err(dev, "%s: missing mem resource\n", __func=
__);
>>> >>> +             return -ENODEV;
>>> >>> +     }
>>> >>> +
>>> >>> +     phy_base =3D devm_request_and_ioremap(dev, phy_mem);
>>> >>> +     if (!phy_base) {
>>> >>> +             dev_err(dev, "%s: register mapping failed\n", __f=
unc__);
>>> >>> +             return -ENXIO;
>>> >>> +     }
>>> >>> +
>>> >>> +     sec =3D devm_kzalloc(dev, sizeof(*sec), GFP_KERNEL);
>>> >>> +     if (!sec)
>>> >>> +             return -ENOMEM;
>>> >>> +
>>> >>> +     sec->dev                =3D &pdev->dev;
>>> >>> +     sec->plat               =3D pdata;
>>> >>> +     sec->regs               =3D phy_base;
>>> >>> +     sec->phy.dev            =3D sec->dev;
>>> >>> +     sec->phy.label          =3D "sec-usbphy";
>>> >>> +     sec->phy.init           =3D sec_usbphy_init;
>>> >>> +     sec->phy.shutdown       =3D sec_usbphy_shutdown;
>>> >>> +     sec->cpu_type           =3D sec_usbphy_get_driver_data(pd=
ev);
>>> >>> +
>>> >>> +     ret =3D usb_add_phy(&sec->phy, USB_PHY_TYPE_USB2);
>>> >>> +     if (ret)
>>> >>> +             goto err;
>>> >>> +
>>> >>> +     platform_set_drvdata(pdev, sec);
>>> >>> +
>>> >>> +     dev_info(&pdev->dev, "Initialized samsung USB OTG PHY mod=
ule\n");
>>> >>> +err:
>>> >>> +     return ret;
>>> >>> +}
>>> >>> +
>>> >>> +static int __exit sec_usbphy_remove(struct platform_device *pd=
ev)
>>> >>> +{
>>> >>> +     struct sec_usbphy *sec =3D platform_get_drvdata(pdev);
>>> >>> +
>>> >>> +     usb_remove_phy(&sec->phy);
>>> >>> +
>>> >>> +     if (sec->clk) {
>>> >>> +             clk_put(sec->clk);
>>> >>> +             sec->clk =3D NULL;
>>> >>> +     }
>>> >>> +
>>> >>> +     return 0;
>>> >>> +}
>>> >>> +
>>> >>> +#ifdef CONFIG_OF
>>> >>> +static const struct of_device_id sec_usbphy_dt_match[] =3D {
>>> >>> +     {
>>> >>> +             .compatible =3D "samsung,s3c64xx-usbphy",
>>> >>> +             .data =3D (void *)TYPE_S3C64XX,
>>> >>> +     }, {
>>> >>> +             .compatible =3D "samsung,exynos4210-usbphy",
>>> >>> +             .data =3D (void *)TYPE_EXYNOS4210,
>>> >>> +     },
>>> >>> +     {},
>>> >>> +};
>>> >>> +MODULE_DEVICE_TABLE(of, sec_usbphy_dt_match);
>>> >>> +#else
>>> >>> +#define sec_usbphy_dt_match NULL
>>> >>> +#endif
>>> >>> +
>>> >>> +static struct platform_device_id sec_usbphy_driver_ids[] =3D {
>>> >>> +     {
>>> >>> +             .name           =3D "s3c64xx-usbphy",
>>> >>> +             .driver_data    =3D TYPE_S3C64XX,
>>> >>> +     }, {
>>> >>> +             .name           =3D "exynos4210-usbphy",
>>> >>> +             .driver_data    =3D TYPE_EXYNOS4210,
>>> >>> +     },
>>> >>> +     {},
>>> >>> +};
>>> >>> +
>>> >>> +MODULE_DEVICE_TABLE(platform, sec_usbphy_driver_ids);
>>> >>> +
>>> >>> +static struct platform_driver sec_usbphy_driver =3D {
>>> >>> +     .probe          =3D sec_usbphy_probe,
>>> >>> +     .remove         =3D __devexit_p(sec_usbphy_remove),
>>> >>> +     .id_table       =3D sec_usbphy_driver_ids,
>>> >>> +     .driver         =3D {
>>> >>> +             .name   =3D "sec-usbphy",
>>> >>> +             .owner  =3D THIS_MODULE,
>>> >>> +             .of_match_table =3D sec_usbphy_dt_match,
>>> >>> +     },
>>> >>> +};
>>> >>> +
>>> >>> +static int __init sec_usbphy_driver_init(void)
>>> >>> +{
>>> >>> +     return platform_driver_register(&sec_usbphy_driver);
>>> >>> +}
>>> >>> +subsys_initcall(sec_usbphy_driver_init);
>>> >>> +
>>> >>> +static void __exit sec_usbphy_driver_exit(void)
>>> >>> +{
>>> >>> +     return platform_driver_unregister(&sec_usbphy_driver);
>>> >>> +}
>>> >>> +module_exit(sec_usbphy_driver_exit);
>>> >>> +
>>> >>> +MODULE_DESCRIPTION("Samsung USB phy controller");
>>> >>> +MODULE_AUTHOR("Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
>>> >>> +MODULE_LICENSE("GPL");
>>> >>> +MODULE_ALIAS("platform:sec-usbphy");
>>> >>> diff --git a/drivers/usb/phy/sec_usbphy.h
>>> >>> b/drivers/usb/phy/sec_usbphy.h new file mode 100644
>>> >>> index 0000000..06e81d4
>>> >>> --- /dev/null
>>> >>> +++ b/drivers/usb/phy/sec_usbphy.h
>>> >>> @@ -0,0 +1,48 @@
>>> >>> +/*
>>> >>> + * Copyright (C) 2012 Samsung Electronics Co.Ltd
>>> >>> + * Author: Yulgon Kim <yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> >>> + * Author: Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> >>> + * Author: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> >>> + *
>>> >>> + * This program is free software; you can redistribute  it and=
/or
>>> >>> modify
>>> >>> it + * under  the terms of  the GNU General  Public License as
>>> >>> published by the + * Free Software Foundation;  either version =
2 of
>>> >>> the  License, or
>>> >>> (at your + * option) any later version.
>>> >>> + */
>>> >>> +
>>> >>> +#ifndef __SEC_USBPHY_H
>>> >>> +#define __SEC_USBPHY_H
>>> >>> +
>>> >>> +#define S3C_PHYPWR                           (0x00)
>>> >>> +
>>> >>> +#define S3C_PHYPWR_NORMAL_MASK                       (0x19 << =
0)
>>> >>> +#define S3C_PHYPWR_OTG_DISABLE                       (1 << 4)
>>> >>> +#define S3C_PHYPWR_ANALOG_POWERDOWN          (1 << 3)
>>> >>> +#define S3C_PHYPWR_FORCE_SUSPEND             (1 << 1)
>>> >>> +/* For Exynos4 */
>>> >>> +#define EXYNOS4_PHYPWR_NORMAL_MASK           (0x39 << 0)
>>> >>> +#define EXYNOS4_PHYPWR_SLEEP                 (1 << 5)
>>> >>> +
>>> >>> +#define S3C_PHYCLK                           (0x04)
>>> >>> +
>>> >>> +#define S3C_PHYCLK_MODE_SERIAL                       (1 << 6)
>>> >>> +#define S3C_PHYCLK_EXT_OSC                   (1 << 5)
>>> >>> +#define S3C_PHYCLK_COMMON_ON_N                       (1 << 4)
>>> >>> +#define S3C_PHYCLK_ID_PULL                   (1 << 2)
>>> >>> +#define S3C_PHYCLK_CLKSEL_MASK                       (0x3 << 0=
)
>>> >>> +#define S3C_PHYCLK_CLKSEL_SHIFT                      (0)
>>> >>> +#define S3C_PHYCLK_CLKSEL_48M                        (0x0 << 0=
)
>>> >>> +#define S3C_PHYCLK_CLKSEL_12M                        (0x2 << 0=
)
>>> >>> +#define S3C_PHYCLK_CLKSEL_24M                        (0x3 << 0=
)
>>> >>> +
>>> >>> +#define S3C_RSTCON                           (0x08)
>>> >>> +
>>> >>> +#define S3C_RSTCON_PHYCLK                    (1 << 2)
>>> >>> +#define S3C_RSTCON_HCLK                              (1 << 1)
>>> >>> +#define S3C_RSTCON_PHY                               (1 << 0)
>>> >>> +
>>> >>> +#ifndef MHZ
>>> >>> +#define MHZ (1000*1000)
>>> >>> +#endif
>>> >>> +
>>> >>> +#endif /* __SEC_USBPHY_H */
>>> >>> diff --git a/include/linux/platform_data/s3c-hsotg.h
>>> >>> b/include/linux/platform_data/s3c-hsotg.h index 8b79e09..25ed31=
e 100644
>>> >>> --- a/include/linux/platform_data/s3c-hsotg.h
>>> >>> +++ b/include/linux/platform_data/s3c-hsotg.h
>>> >>> @@ -35,6 +35,11 @@ struct s3c_hsotg_plat {
>>> >>>
>>> >>>       int (*phy_exit)(struct platform_device *pdev, int type);
>>> >>>
>>> >>>  };
>>> >>>
>>> >>> +struct s3c_usbphy_plat {
>>> >>> +     void (*pmu_isolation)(int on);
>>> >>> +};
>>> >>> +
>>> >>>
>>> >>>  extern void s3c_hsotg_set_platdata(struct s3c_hsotg_plat *pd);
>>> >>>
>>> >>> +extern void s3c_usbphy_set_platdata(struct s3c_usbphy_plat *pd=
);
>>> >>>
>>> >>>  #endif /* __LINUX_USB_S3C_HSOTG_H */
>>> >>
>>> >> --
>>> >> To unsubscribe from this list: send the line "unsubscribe linux-=
usb" in
>>> >> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> >> More majordomo info at  http://vger.kernel.org/majordomo-info.ht=
ml
>>> >
>>> > --
>>> > To unsubscribe from this list: send the line "unsubscribe
>>> > linux-samsung-soc" in
>>> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> > More majordomo info at  http://vger.kernel.org/majordomo-info.htm=
l
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
