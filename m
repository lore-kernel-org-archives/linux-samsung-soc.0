From: Darius Augulis <augulis.darius@gmail.com>
Subject: Re: [PATCH 4/4] ARM: S3C2416: Add platform helpers for setup SDHCI
Date: Tue, 22 Jun 2010 16:45:18 +0300
Message-ID: <AANLkTimUijwXx5UozqVZiJ8BBDysnxd5nQz8P5d1slRC@mail.gmail.com>
References: <1277212585-25605-1-git-send-email-jekhor@gmail.com>
	<1277212585-25605-2-git-send-email-jekhor@gmail.com>
	<1277212585-25605-3-git-send-email-jekhor@gmail.com>
	<1277212585-25605-4-git-send-email-jekhor@gmail.com>
	<1277212585-25605-5-git-send-email-jekhor@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2075533402=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1277212585-25605-5-git-send-email-jekhor@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============2075533402==
Content-Type: multipart/alternative; boundary=0016e6d975aac3233f04899ea1a4

--0016e6d975aac3233f04899ea1a4
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jun 22, 2010 at 4:16 PM, Yauhen Kharuzhy <jekhor@gmail.com> wrote:

> Samsung S3C2416 has two SDHCI controllers compatible with other
> Samsung's SoCs (S3C64XX, S5PC100 etc...).
>
> Add required platform setup code that the devices can be used with
> sdhci-s3c driver.
>
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> ---
>  arch/arm/mach-s3c2416/Kconfig              |   23 ++++++++++
>  arch/arm/mach-s3c2416/Makefile             |    5 ++
>  arch/arm/mach-s3c2416/s3c2416.c            |    5 ++
>  arch/arm/mach-s3c2416/setup-sdhci-gpio.c   |   60
> +++++++++++++++++++++++++++
>  arch/arm/mach-s3c2416/setup-sdhci.c        |   62
> ++++++++++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/sdhci.h |   34 +++++++++++++++
>  6 files changed, 189 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-s3c2416/setup-sdhci-gpio.c
>  create mode 100644 arch/arm/mach-s3c2416/setup-sdhci.c
>
> diff --git a/arch/arm/mach-s3c2416/Kconfig b/arch/arm/mach-s3c2416/Kconfig
> index eafb0ed..e055c7f 100644
> --- a/arch/arm/mach-s3c2416/Kconfig
> +++ b/arch/arm/mach-s3c2416/Kconfig
> @@ -25,6 +25,17 @@ config S3C2416_DMA
>        help
>          Internal config node for S3C2416 DMA support
>
> +config S3C2416_SETUP_SDHCI
> +       bool
> +       select S3C2416_SETUP_SDHCI_GPIO
> +       help
> +         Internal helper functions for S3C2416 based SDHCI systems
> +
> +config S3C2416_SETUP_SDHCI_GPIO
> +       bool
> +       help
> +         Common setup code for SDHCI gpio.
> +
>  menu "S3C2416 Machines"
>
>  config MACH_SMDK2416
> @@ -36,7 +47,19 @@ config MACH_SMDK2416
>        select S3C_DEV_HSMMC1
>        select S3C_DEV_NAND
>        select S3C_DEV_USB_HOST
> +       select S3C2416_SETUP_SDHCI
>        help
>          Say Y here if you are using an SMDK2416
>
> +config MACH_HANLIN_V3C
> +       bool "Hanlin eReader V3C"
> +       select CPU_S3C2416
> +       select S3C_DEV_HSMMC
> +       select S3C_DEV_HSMMC1
> +       select S3C_DEV_NAND
> +       select S3C_DEV_USB_HOST
> +       select S3C2416_SETUP_SDHCI
> +       help
> +         Say Y here if you are using an Jinke's Hanlin V3C eReader
> +
>  endmenu
> diff --git a/arch/arm/mach-s3c2416/Makefile
> b/arch/arm/mach-s3c2416/Makefile
> index 6c12c7b..678e148 100644
> --- a/arch/arm/mach-s3c2416/Makefile
> +++ b/arch/arm/mach-s3c2416/Makefile
> @@ -14,6 +14,11 @@ obj-$(CONFIG_CPU_S3C2416)    += irq.o
>
>  #obj-$(CONFIG_S3C2416_DMA)     += dma.o
>
> +# Device setup
> +obj-$(CONFIG_S3C2416_SETUP_SDHCI) += setup-sdhci.o
> +obj-$(CONFIG_S3C2416_SETUP_SDHCI_GPIO) += setup-sdhci-gpio.o
> +
>  # Machine support
>
>  obj-$(CONFIG_MACH_SMDK2416)    += mach-smdk2416.o
> +obj-$(CONFIG_MACH_HANLIN_V3C)  += mach-v3c.o
> diff --git a/arch/arm/mach-s3c2416/s3c2416.c
> b/arch/arm/mach-s3c2416/s3c2416.c
> index 355ab62..06eacf8 100644
> --- a/arch/arm/mach-s3c2416/s3c2416.c
> +++ b/arch/arm/mach-s3c2416/s3c2416.c
> @@ -53,6 +53,7 @@
>  #include <plat/s3c2416.h>
>  #include <plat/devs.h>
>  #include <plat/cpu.h>
> +#include <plat/sdhci.h>
>
>  #include <plat/iic-core.h>
>
> @@ -115,6 +116,10 @@ void __init s3c2416_map_io(void)
>        s3c24xx_gpiocfg_default.set_pull = s3c_gpio_setpull_updown;
>        s3c24xx_gpiocfg_default.get_pull = s3c_gpio_getpull_updown;
>
> +       /* initialize device information early */
> +       s3c2416_default_sdhci0();
> +       s3c2416_default_sdhci1();
> +
>        iotable_init(s3c2416_iodesc, ARRAY_SIZE(s3c2416_iodesc));
>  }
>
> diff --git a/arch/arm/mach-s3c2416/setup-sdhci-gpio.c
> b/arch/arm/mach-s3c2416/setup-sdhci-gpio.c
> new file mode 100644
> index 0000000..ebdab15
> --- /dev/null
> +++ b/arch/arm/mach-s3c2416/setup-sdhci-gpio.c
> @@ -0,0 +1,60 @@
> +/* linux/arch/arm/plat-s3c2416/setup-sdhci-gpio.c
> + *
> + * Copyright 2010 Promwad Innovation Company
> + *     Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
> + *
> + * S3C2416 - Helper functions for setting up SDHCI device(s) GPIO (HSMMC)
> + *
> + * Based on mach-s3c64xx/setup-sdhci-gpio.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +
> +#include <mach/gpio.h>
> +#include <mach/regs-gpio.h>
> +#include <plat/gpio-cfg.h>
> +
> +/* Note: hsmmc1 and hsmmc0 are swapped versus datasheet */
>

would be nice to provide more accurate link to information source (document
version, page).
And there is a bit tricky place: clock ids are swapped and names of helper
functions are not.
So, it's not clear which helper function corresponds to real physical SDHC
interface.

+
> +void s3c2416_setup_sdhci1_cfg_gpio(struct platform_device *dev, int width)
> +{
> +       unsigned int gpio;
> +       unsigned int end;
> +
> +       end = S3C2410_GPE(7 + width);
> +
> +       /* Set all the necessary GPE pins to special-function 0 */
> +       for (gpio = S3C2410_GPE(5); gpio < end; gpio++) {
> +               s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(2));
> +               s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);
> +       }
> +}
> +
> +void s3c2416_setup_sdhci0_cfg_gpio(struct platform_device *dev, int width)
> +{
> +       unsigned int gpio;
> +       unsigned int end;
> +
> +       end = S3C2410_GPL(0 + width);
> +
> +       /* Set all the necessary GPG pins to special-function 0 */
> +       for (gpio = S3C2410_GPL(0); gpio < end; gpio++) {
> +               s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(2));
> +               s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);
> +       }
> +
> +       s3c_gpio_cfgpin(S3C2410_GPL(8), S3C_GPIO_SFN(2));
> +       s3c_gpio_setpull(S3C2410_GPL(8), S3C_GPIO_PULL_NONE);
> +       s3c_gpio_cfgpin(S3C2410_GPL(9), S3C_GPIO_SFN(2));
> +       s3c_gpio_setpull(S3C2410_GPL(9), S3C_GPIO_PULL_NONE);
> +}
> +
> +
> diff --git a/arch/arm/mach-s3c2416/setup-sdhci.c
> b/arch/arm/mach-s3c2416/setup-sdhci.c
> new file mode 100644
> index 0000000..345ddd1
> --- /dev/null
> +++ b/arch/arm/mach-s3c2416/setup-sdhci.c
> @@ -0,0 +1,62 @@
> +/* linux/arch/arm/mach-s3c2416/setup-sdhci.c
> + *
> + * Copyright 2010 Promwad Innovation Company
> + *     Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
> + *
> + * S3C2416 - Helper functions for settign up SDHCI device(s) (HSMMC)
> + *
> + * Based on mach-s3c64xx/setup-sdhci.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +
> +#include <linux/mmc/card.h>
> +#include <linux/mmc/host.h>
> +
> +#include <plat/regs-sdhci.h>
> +#include <plat/sdhci.h>
> +
> +/* clock sources for the mmc bus clock, order as for the ctrl2[5..4] */
> +
> +char *s3c2416_hsmmc_clksrcs[4] = {
> +       [0] = "hsmmc",
> +       [1] = "hsmmc",
> +       [2] = "hsmmc-if",
> +       /* [3] = "48m", - note not successfully used yet */
> +};
> +
> +void s3c2416_setup_sdhci_cfg_card(struct platform_device *dev,
> +                                 void __iomem *r,
> +                                 struct mmc_ios *ios,
> +                                 struct mmc_card *card)
> +{
> +       u32 ctrl2, ctrl3;
> +
> +       ctrl2 = readl(r + S3C_SDHCI_CONTROL2);
> +       ctrl2 &= S3C_SDHCI_CTRL2_SELBASECLK_MASK;
> +       ctrl2 |= (S3C64XX_SDHCI_CTRL2_ENSTAASYNCCLR |
> +                 S3C64XX_SDHCI_CTRL2_ENCMDCNFMSK |
> +                 S3C_SDHCI_CTRL2_ENFBCLKRX |
> +                 S3C_SDHCI_CTRL2_DFCNT_NONE |
> +                 S3C_SDHCI_CTRL2_ENCLKOUTHOLD);
> +
> +       if (ios->clock < 25 * 1000000)
> +               ctrl3 = (S3C_SDHCI_CTRL3_FCSEL3 |
> +                        S3C_SDHCI_CTRL3_FCSEL2 |
> +                        S3C_SDHCI_CTRL3_FCSEL1 |
> +                        S3C_SDHCI_CTRL3_FCSEL0);
> +       else
> +               ctrl3 = (S3C_SDHCI_CTRL3_FCSEL1 | S3C_SDHCI_CTRL3_FCSEL0);
> +
> +       writel(ctrl2, r + S3C_SDHCI_CONTROL2);
> +       writel(ctrl3, r + S3C_SDHCI_CONTROL3);
> +}
> +
> diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h
> b/arch/arm/plat-samsung/include/plat/sdhci.h
> index 13f9fb2..d408140 100644
> --- a/arch/arm/plat-samsung/include/plat/sdhci.h
> +++ b/arch/arm/plat-samsung/include/plat/sdhci.h
> @@ -78,6 +78,8 @@ extern void s3c64xx_setup_sdhci2_cfg_gpio(struct
> platform_device *, int w);
>  extern void s5pv210_setup_sdhci0_cfg_gpio(struct platform_device *, int
> w);
>  extern void s5pv210_setup_sdhci1_cfg_gpio(struct platform_device *, int
> w);
>  extern void s5pv210_setup_sdhci2_cfg_gpio(struct platform_device *, int
> w);
> +extern void s3c2416_setup_sdhci0_cfg_gpio(struct platform_device *, int
> w);
> +extern void s3c2416_setup_sdhci1_cfg_gpio(struct platform_device *, int
> w);
>
>  /* S3C6400 SDHCI setup */
>
> @@ -270,6 +272,38 @@ static inline void s5pv210_default_sdhci1(void) { }
>  static inline void s5pv210_default_sdhci2(void) { }
>  #endif /* CONFIG_S5PC100_SETUP_SDHCI */
>
> +/* S3C2416 SDHCI setup */
> +#ifdef CONFIG_S3C2416_SETUP_SDHCI
> +extern char *s3c2416_hsmmc_clksrcs[4];
> +
> +extern void s3c2416_setup_sdhci_cfg_card(struct platform_device *dev,
> +                                          void __iomem *r,
> +                                          struct mmc_ios *ios,
> +                                          struct mmc_card *card);
> +
> +#ifdef CONFIG_S3C_DEV_HSMMC
> +static inline void s3c2416_default_sdhci0(void)
> +{
> +       s3c_hsmmc0_def_platdata.clocks = s3c2416_hsmmc_clksrcs;
> +       s3c_hsmmc0_def_platdata.cfg_gpio = s3c2416_setup_sdhci0_cfg_gpio;
> +       s3c_hsmmc0_def_platdata.cfg_card = s3c2416_setup_sdhci_cfg_card;
>

helper id 0 gets to interface 0 - not swapped.


> +}
> +#else
> +static inline void s3c2416_default_sdhci0(void) { }
> +#endif /* CONFIG_S3C_DEV_HSMMC */
> +
> +#ifdef CONFIG_S3C_DEV_HSMMC1
> +static inline void s3c2416_default_sdhci1(void)
> +{
> +       s3c_hsmmc1_def_platdata.clocks = s3c2416_hsmmc_clksrcs;
> +       s3c_hsmmc1_def_platdata.cfg_gpio = s3c2416_setup_sdhci1_cfg_gpio;
> +       s3c_hsmmc1_def_platdata.cfg_card = s3c2416_setup_sdhci_cfg_card;
>

helper id 1 gets to interface 1 - not swapped.


> +}
> +#else
> +static inline void s3c2416_default_sdhci1(void) { }
> +#endif /* CONFIG_S3C_DEV_HSMMC1 */
> +
> +#endif /* CONFIG_S3C2416_SETUP_SDHCI */
>
>
>
> --
> 1.6.6.1
>
>

--0016e6d975aac3233f04899ea1a4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Tue, Jun 22, 2010 at 4:16 PM, Yauhen =
Kharuzhy <span dir=3D"ltr">&lt;<a href=3D"mailto:jekhor@gmail.com">jekhor@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;">
Samsung S3C2416 has two SDHCI controllers compatible with other<br>
Samsung&#39;s SoCs (S3C64XX, S5PC100 etc...).<br>
<br>
Add required platform setup code that the devices can be used with<br>
sdhci-s3c driver.<br>
<br>
Signed-off-by: Yauhen Kharuzhy &lt;<a href=3D"mailto:jekhor@gmail.com">jekh=
or@gmail.com</a>&gt;<br>
---<br>
=A0arch/arm/mach-s3c2416/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 23 ++++++=
++++<br>
=A0arch/arm/mach-s3c2416/Makefile =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A05 ++<br>
=A0arch/arm/mach-s3c2416/s3c2416.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A05 ++<br>
=A0arch/arm/mach-s3c2416/setup-sdhci-gpio.c =A0 | =A0 60 ++++++++++++++++++=
+++++++++<br>
=A0arch/arm/mach-s3c2416/setup-sdhci.c =A0 =A0 =A0 =A0| =A0 62 ++++++++++++=
++++++++++++++++<br>
=A0arch/arm/plat-samsung/include/plat/sdhci.h | =A0 34 +++++++++++++++<br>
=A06 files changed, 189 insertions(+), 0 deletions(-)<br>
=A0create mode 100644 arch/arm/mach-s3c2416/setup-sdhci-gpio.c<br>
=A0create mode 100644 arch/arm/mach-s3c2416/setup-sdhci.c<br>
<br>
diff --git a/arch/arm/mach-s3c2416/Kconfig b/arch/arm/mach-s3c2416/Kconfig<=
br>
index eafb0ed..e055c7f 100644<br>
--- a/arch/arm/mach-s3c2416/Kconfig<br>
+++ b/arch/arm/mach-s3c2416/Kconfig<br>
@@ -25,6 +25,17 @@ config S3C2416_DMA<br>
 =A0 =A0 =A0 =A0help<br>
 =A0 =A0 =A0 =A0 =A0Internal config node for S3C2416 DMA support<br>
<br>
+config S3C2416_SETUP_SDHCI<br>
+ =A0 =A0 =A0 bool<br>
+ =A0 =A0 =A0 select S3C2416_SETUP_SDHCI_GPIO<br>
+ =A0 =A0 =A0 help<br>
+ =A0 =A0 =A0 =A0 Internal helper functions for S3C2416 based SDHCI systems=
<br>
+<br>
+config S3C2416_SETUP_SDHCI_GPIO<br>
+ =A0 =A0 =A0 bool<br>
+ =A0 =A0 =A0 help<br>
+ =A0 =A0 =A0 =A0 Common setup code for SDHCI gpio.<br>
+<br>
=A0menu &quot;S3C2416 Machines&quot;<br>
<br>
=A0config MACH_SMDK2416<br>
@@ -36,7 +47,19 @@ config MACH_SMDK2416<br>
 =A0 =A0 =A0 =A0select S3C_DEV_HSMMC1<br>
 =A0 =A0 =A0 =A0select S3C_DEV_NAND<br>
 =A0 =A0 =A0 =A0select S3C_DEV_USB_HOST<br>
+ =A0 =A0 =A0 select S3C2416_SETUP_SDHCI<br>
 =A0 =A0 =A0 =A0help<br>
 =A0 =A0 =A0 =A0 =A0Say Y here if you are using an SMDK2416<br>
<br>
+config MACH_HANLIN_V3C<br>
+ =A0 =A0 =A0 bool &quot;Hanlin eReader V3C&quot;<br>
+ =A0 =A0 =A0 select CPU_S3C2416<br>
+ =A0 =A0 =A0 select S3C_DEV_HSMMC<br>
+ =A0 =A0 =A0 select S3C_DEV_HSMMC1<br>
+ =A0 =A0 =A0 select S3C_DEV_NAND<br>
+ =A0 =A0 =A0 select S3C_DEV_USB_HOST<br>
+ =A0 =A0 =A0 select S3C2416_SETUP_SDHCI<br>
+ =A0 =A0 =A0 help<br>
+ =A0 =A0 =A0 =A0 Say Y here if you are using an Jinke&#39;s Hanlin V3C eRe=
ader<br>
+<br>
=A0endmenu<br>
diff --git a/arch/arm/mach-s3c2416/Makefile b/arch/arm/mach-s3c2416/Makefil=
e<br>
index 6c12c7b..678e148 100644<br>
--- a/arch/arm/mach-s3c2416/Makefile<br>
+++ b/arch/arm/mach-s3c2416/Makefile<br>
@@ -14,6 +14,11 @@ obj-$(CONFIG_CPU_S3C2416) =A0 =A0+=3D irq.o<br>
<br>
=A0#obj-$(CONFIG_S3C2416_DMA) =A0 =A0 +=3D dma.o<br>
<br>
+# Device setup<br>
+obj-$(CONFIG_S3C2416_SETUP_SDHCI) +=3D setup-sdhci.o<br>
+obj-$(CONFIG_S3C2416_SETUP_SDHCI_GPIO) +=3D setup-sdhci-gpio.o<br>
+<br>
=A0# Machine support<br>
<br>
=A0obj-$(CONFIG_MACH_SMDK2416) =A0 =A0+=3D mach-smdk2416.o<br>
+obj-$(CONFIG_MACH_HANLIN_V3C) =A0+=3D mach-v3c.o<br>
diff --git a/arch/arm/mach-s3c2416/s3c2416.c b/arch/arm/mach-s3c2416/s3c241=
6.c<br>
index 355ab62..06eacf8 100644<br>
--- a/arch/arm/mach-s3c2416/s3c2416.c<br>
+++ b/arch/arm/mach-s3c2416/s3c2416.c<br>
@@ -53,6 +53,7 @@<br>
=A0#include &lt;plat/s3c2416.h&gt;<br>
=A0#include &lt;plat/devs.h&gt;<br>
=A0#include &lt;plat/cpu.h&gt;<br>
+#include &lt;plat/sdhci.h&gt;<br>
<br>
=A0#include &lt;plat/iic-core.h&gt;<br>
<br>
@@ -115,6 +116,10 @@ void __init s3c2416_map_io(void)<br>
 =A0 =A0 =A0 =A0s3c24xx_gpiocfg_default.set_pull =3D s3c_gpio_setpull_updow=
n;<br>
 =A0 =A0 =A0 =A0s3c24xx_gpiocfg_default.get_pull =3D s3c_gpio_getpull_updow=
n;<br>
<br>
+ =A0 =A0 =A0 /* initialize device information early */<br>
+ =A0 =A0 =A0 s3c2416_default_sdhci0();<br>
+ =A0 =A0 =A0 s3c2416_default_sdhci1();<br>
+<br>
 =A0 =A0 =A0 =A0iotable_init(s3c2416_iodesc, ARRAY_SIZE(s3c2416_iodesc));<b=
r>
=A0}<br>
<br>
diff --git a/arch/arm/mach-s3c2416/setup-sdhci-gpio.c b/arch/arm/mach-s3c24=
16/setup-sdhci-gpio.c<br>
new file mode 100644<br>
index 0000000..ebdab15<br>
--- /dev/null<br>
+++ b/arch/arm/mach-s3c2416/setup-sdhci-gpio.c<br>
@@ -0,0 +1,60 @@<br>
+/* linux/arch/arm/plat-s3c2416/setup-sdhci-gpio.c<br>
+ *<br>
+ * Copyright 2010 Promwad Innovation Company<br>
+ * =A0 =A0 Yauhen Kharuzhy &lt;<a href=3D"mailto:yauhen.kharuzhy@promwad.c=
om">yauhen.kharuzhy@promwad.com</a>&gt;<br>
+ *<br>
+ * S3C2416 - Helper functions for setting up SDHCI device(s) GPIO (HSMMC)<=
br>
+ *<br>
+ * Based on mach-s3c64xx/setup-sdhci-gpio.c<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License version 2 as<br>
+ * published by the Free Software Foundation.<br>
+*/<br>
+<br>
+#include &lt;linux/kernel.h&gt;<br>
+#include &lt;linux/types.h&gt;<br>
+#include &lt;linux/interrupt.h&gt;<br>
+#include &lt;linux/platform_device.h&gt;<br>
+#include &lt;linux/io.h&gt;<br>
+<br>
+#include &lt;mach/gpio.h&gt;<br>
+#include &lt;mach/regs-gpio.h&gt;<br>
+#include &lt;plat/gpio-cfg.h&gt;<br>
+<br>
+/* Note: hsmmc1 and hsmmc0 are swapped versus datasheet */<br></blockquote=
><div><br>would be nice to provide more accurate link to information source=
 (document version, page).<br>And there is a bit tricky place: clock ids ar=
e swapped and names of helper functions are not.<br>
So, it&#39;s not clear which helper function corresponds to real physical S=
DHC interface.<br><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-l=
eft: 1ex;">

+<br>
+void s3c2416_setup_sdhci1_cfg_gpio(struct platform_device *dev, int width)=
<br>
+{<br>
+ =A0 =A0 =A0 unsigned int gpio;<br>
+ =A0 =A0 =A0 unsigned int end;<br>
+<br>
+ =A0 =A0 =A0 end =3D S3C2410_GPE(7 + width);<br>
+<br>
+ =A0 =A0 =A0 /* Set all the necessary GPE pins to special-function 0 */<br=
>
+ =A0 =A0 =A0 for (gpio =3D S3C2410_GPE(5); gpio &lt; end; gpio++) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(2));<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);<b=
r>
+ =A0 =A0 =A0 }<br>
+}<br>
+<br>
+void s3c2416_setup_sdhci0_cfg_gpio(struct platform_device *dev, int width)=
<br>
+{<br>
+ =A0 =A0 =A0 unsigned int gpio;<br>
+ =A0 =A0 =A0 unsigned int end;<br>
+<br>
+ =A0 =A0 =A0 end =3D S3C2410_GPL(0 + width);<br>
+<br>
+ =A0 =A0 =A0 /* Set all the necessary GPG pins to special-function 0 */<br=
>
+ =A0 =A0 =A0 for (gpio =3D S3C2410_GPL(0); gpio &lt; end; gpio++) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(2));<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);<b=
r>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 s3c_gpio_cfgpin(S3C2410_GPL(8), S3C_GPIO_SFN(2));<br>
+ =A0 =A0 =A0 s3c_gpio_setpull(S3C2410_GPL(8), S3C_GPIO_PULL_NONE);<br>
+ =A0 =A0 =A0 s3c_gpio_cfgpin(S3C2410_GPL(9), S3C_GPIO_SFN(2));<br>
+ =A0 =A0 =A0 s3c_gpio_setpull(S3C2410_GPL(9), S3C_GPIO_PULL_NONE);<br>
+}<br>
+<br>
+<br>
diff --git a/arch/arm/mach-s3c2416/setup-sdhci.c b/arch/arm/mach-s3c2416/se=
tup-sdhci.c<br>
new file mode 100644<br>
index 0000000..345ddd1<br>
--- /dev/null<br>
+++ b/arch/arm/mach-s3c2416/setup-sdhci.c<br>
@@ -0,0 +1,62 @@<br>
+/* linux/arch/arm/mach-s3c2416/setup-sdhci.c<br>
+ *<br>
+ * Copyright 2010 Promwad Innovation Company<br>
+ * =A0 =A0 Yauhen Kharuzhy &lt;<a href=3D"mailto:yauhen.kharuzhy@promwad.c=
om">yauhen.kharuzhy@promwad.com</a>&gt;<br>
+ *<br>
+ * S3C2416 - Helper functions for settign up SDHCI device(s) (HSMMC)<br>
+ *<br>
+ * Based on mach-s3c64xx/setup-sdhci.c<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License version 2 as<br>
+ * published by the Free Software Foundation.<br>
+*/<br>
+<br>
+#include &lt;linux/kernel.h&gt;<br>
+#include &lt;linux/types.h&gt;<br>
+#include &lt;linux/interrupt.h&gt;<br>
+#include &lt;linux/platform_device.h&gt;<br>
+#include &lt;linux/io.h&gt;<br>
+<br>
+#include &lt;linux/mmc/card.h&gt;<br>
+#include &lt;linux/mmc/host.h&gt;<br>
+<br>
+#include &lt;plat/regs-sdhci.h&gt;<br>
+#include &lt;plat/sdhci.h&gt;<br>
+<br>
+/* clock sources for the mmc bus clock, order as for the ctrl2[5..4] */<br=
>
+<br>
+char *s3c2416_hsmmc_clksrcs[4] =3D {<br>
+ =A0 =A0 =A0 [0] =3D &quot;hsmmc&quot;,<br>
+ =A0 =A0 =A0 [1] =3D &quot;hsmmc&quot;,<br>
+ =A0 =A0 =A0 [2] =3D &quot;hsmmc-if&quot;,<br>
+ =A0 =A0 =A0 /* [3] =3D &quot;48m&quot;, - note not successfully used yet =
*/<br>
+};<br>
+<br>
+void s3c2416_setup_sdhci_cfg_card(struct platform_device *dev,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 void __io=
mem *r,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct mm=
c_ios *ios,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct mm=
c_card *card)<br>
+{<br>
+ =A0 =A0 =A0 u32 ctrl2, ctrl3;<br>
+<br>
+ =A0 =A0 =A0 ctrl2 =3D readl(r + S3C_SDHCI_CONTROL2);<br>
+ =A0 =A0 =A0 ctrl2 &amp;=3D S3C_SDHCI_CTRL2_SELBASECLK_MASK;<br>
+ =A0 =A0 =A0 ctrl2 |=3D (S3C64XX_SDHCI_CTRL2_ENSTAASYNCCLR |<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C64XX_SDHCI_CTRL2_ENCMDCNFMSK |<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C_SDHCI_CTRL2_ENFBCLKRX |<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C_SDHCI_CTRL2_DFCNT_NONE |<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C_SDHCI_CTRL2_ENCLKOUTHOLD);<br>
+<br>
+ =A0 =A0 =A0 if (ios-&gt;clock &lt; 25 * 1000000)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl3 =3D (S3C_SDHCI_CTRL3_FCSEL3 |<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C_SDHCI_CTRL3_FCSEL2 |<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C_SDHCI_CTRL3_FCSEL1 |<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C_SDHCI_CTRL3_FCSEL0);<b=
r>
+ =A0 =A0 =A0 else<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl3 =3D (S3C_SDHCI_CTRL3_FCSEL1 | S3C_SDHCI=
_CTRL3_FCSEL0);<br>
+<br>
+ =A0 =A0 =A0 writel(ctrl2, r + S3C_SDHCI_CONTROL2);<br>
+ =A0 =A0 =A0 writel(ctrl3, r + S3C_SDHCI_CONTROL3);<br>
+}<br>
+<br>
diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/plat-sam=
sung/include/plat/sdhci.h<br>
index 13f9fb2..d408140 100644<br>
--- a/arch/arm/plat-samsung/include/plat/sdhci.h<br>
+++ b/arch/arm/plat-samsung/include/plat/sdhci.h<br>
@@ -78,6 +78,8 @@ extern void s3c64xx_setup_sdhci2_cfg_gpio(struct platform=
_device *, int w);<br>
=A0extern void s5pv210_setup_sdhci0_cfg_gpio(struct platform_device *, int =
w);<br>
=A0extern void s5pv210_setup_sdhci1_cfg_gpio(struct platform_device *, int =
w);<br>
=A0extern void s5pv210_setup_sdhci2_cfg_gpio(struct platform_device *, int =
w);<br>
+extern void s3c2416_setup_sdhci0_cfg_gpio(struct platform_device *, int w)=
;<br>
+extern void s3c2416_setup_sdhci1_cfg_gpio(struct platform_device *, int w)=
;<br>
<br>
=A0/* S3C6400 SDHCI setup */<br>
<br>
@@ -270,6 +272,38 @@ static inline void s5pv210_default_sdhci1(void) { }<br=
>
=A0static inline void s5pv210_default_sdhci2(void) { }<br>
=A0#endif /* CONFIG_S5PC100_SETUP_SDHCI */<br>
<br>
+/* S3C2416 SDHCI setup */<br>
+#ifdef CONFIG_S3C2416_SETUP_SDHCI<br>
+extern char *s3c2416_hsmmc_clksrcs[4];<br>
+<br>
+extern void s3c2416_setup_sdhci_cfg_card(struct platform_device *dev,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0void __iomem *r,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0struct mmc_ios *ios,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0struct mmc_card *card);<br>
+<br>
+#ifdef CONFIG_S3C_DEV_HSMMC<br>
+static inline void s3c2416_default_sdhci0(void)<br>
+{<br>
+ =A0 =A0 =A0 s3c_hsmmc0_def_platdata.clocks =3D s3c2416_hsmmc_clksrcs;<br>
+ =A0 =A0 =A0 s3c_hsmmc0_def_platdata.cfg_gpio =3D s3c2416_setup_sdhci0_cfg=
_gpio;<br>
+ =A0 =A0 =A0 s3c_hsmmc0_def_platdata.cfg_card =3D s3c2416_setup_sdhci_cfg_=
card;<br></blockquote><div><br>helper id 0 gets to interface 0 - not swappe=
d.<br>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0=
pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">

+}<br>
+#else<br>
+static inline void s3c2416_default_sdhci0(void) { }<br>
+#endif /* CONFIG_S3C_DEV_HSMMC */<br>
+<br>
+#ifdef CONFIG_S3C_DEV_HSMMC1<br>
+static inline void s3c2416_default_sdhci1(void)<br>
+{<br>
+ =A0 =A0 =A0 s3c_hsmmc1_def_platdata.clocks =3D s3c2416_hsmmc_clksrcs;<br>
+ =A0 =A0 =A0 s3c_hsmmc1_def_platdata.cfg_gpio =3D s3c2416_setup_sdhci1_cfg=
_gpio;<br>
+ =A0 =A0 =A0 s3c_hsmmc1_def_platdata.cfg_card =3D s3c2416_setup_sdhci_cfg_=
card;<br></blockquote><div><br>helper id 1 gets to interface 1 - not swappe=
d.<br>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0=
pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">

+}<br>
+#else<br>
+static inline void s3c2416_default_sdhci1(void) { }<br>
+#endif /* CONFIG_S3C_DEV_HSMMC1 */<br>
+<br>
+#endif /* CONFIG_S3C2416_SETUP_SDHCI */<br>
<font color=3D"#888888"><br>
<br>
<br>
--<br>
1.6.6.1<br>
<br>
</font></blockquote></div><br>

--0016e6d975aac3233f04899ea1a4--


--===============2075533402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2075533402==--
