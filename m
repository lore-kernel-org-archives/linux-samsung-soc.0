From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 06/15] ARM: S5PC100: Move gpio support from plat-s5pc1xx to
 mach-s5pc100
Date: Tue, 18 May 2010 11:38:59 +0200
Message-ID: <00f801caf66d$f3fb20b0$dbf16210$%szyprowski@samsung.com>
References: <1273817946-29404-1-git-send-email-m.szyprowski@samsung.com>
 <1273817946-29404-7-git-send-email-m.szyprowski@samsung.com>
 <003501caf5b3$94807c80$bd817580$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62928 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753372Ab0ERJjm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 May 2010 05:39:42 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2M00BGF064F7@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 18:39:41 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2M00JTS05VH0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 18:39:40 +0900 (KST)
In-reply-to: <003501caf5b3$94807c80$bd817580$%kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.orgkyungmin.park@samsung.com

Hello,

On Monday, May 17, 2010 1:25 PM Kukjin Kim wrote:

> Marek Szyprowski wrote:
> >
> > Move gpio-lib support from plat-s5pc1xx to mach-s5pc100. Only basic gpio
> > functionality is now supported. Gpio interrupts are disabled temporarly
> > and will be added later.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  arch/arm/mach-s5pc100/Makefile                     |    2 +-
> >  .../gpiolib.c => mach-s5pc100/gpio.c}              |   11 +++++++----
> >  .../plat => mach-s5pc100/include/mach}/regs-gpio.h |    0
> >  arch/arm/mach-s5pc100/mach-smdkc100.c              |    1 -
> >  arch/arm/plat-s5pc1xx/Makefile                     |    3 +--
> >  5 files changed, 9 insertions(+), 8 deletions(-)
> >  rename arch/arm/{plat-s5pc1xx/gpiolib.c => mach-s5pc100/gpio.c} (99%)
> >  rename arch/arm/{plat-s5pc1xx/include/plat =>
> mach-s5pc100/include/mach}/regs-
> > gpio.h (100%)
> >
> > diff --git a/arch/arm/mach-s5pc100/Makefile
> b/arch/arm/mach-s5pc100/Makefile
> > index 809ff10..e1afdbf 100644
> > --- a/arch/arm/mach-s5pc100/Makefile
> > +++ b/arch/arm/mach-s5pc100/Makefile
> > @@ -11,7 +11,7 @@ obj-				:=
> >
> >  # Core support for S5PC100 system
> >
> > -obj-$(CONFIG_CPU_S5PC100)	+= cpu.o
> > +obj-$(CONFIG_CPU_S5PC100)	+= cpu.o gpio.o
> 
> How about changing gpiolib like gpiolib.c of mach-s3c64xx/ and mach-
> s5pv210/.
> I will change the file name of mach-s5p6440/ also.

I you don't mind I wanted first move the existing and working code and
then, later update it to match common s5p style.

> >
> >  # Helper and device support
> >
> > diff --git a/arch/arm/plat-s5pc1xx/gpiolib.c b/arch/arm/mach-
> s5pc100/gpio.c
> > similarity index 99%
> > rename from arch/arm/plat-s5pc1xx/gpiolib.c
> > rename to arch/arm/mach-s5pc100/gpio.c
> > index 5a97a8f..c8e8336 100644
> > --- a/arch/arm/plat-s5pc1xx/gpiolib.c
> > +++ b/arch/arm/mach-s5pc100/gpio.c
> > @@ -17,11 +17,11 @@
> >  #include <linux/gpio.h>
> >
> >  #include <mach/map.h>
> > +#include <mach/regs-gpio.h>
> >
> >  #include <plat/gpio-core.h>
> >  #include <plat/gpio-cfg.h>
> >  #include <plat/gpio-cfg-helpers.h>
> > -#include <plat/regs-gpio.h>
> >
> >  /* S5PC100 GPIO bank summary:
> >   *
> > @@ -61,6 +61,7 @@
> >   * L3	8	4Bit	None
> >   */
> >
> > +#if 0
> >  static int s5pc1xx_gpiolib_to_irq(struct gpio_chip *chip, unsigned int
> offset)
> >  {
> >  	return S3C_IRQ_GPIO(chip->base + offset);
> > @@ -84,7 +85,7 @@ static int s5pc1xx_gpiolib_to_eint(struct gpio_chip
> *chip,
> > unsigned int offset)
> >  		return IRQ_EINT(24 + offset);
> >  	return -EINVAL;
> >  }
> > -
> > +#endif
> >  static struct s3c_gpio_cfg gpio_cfg = {
> >  	.set_config	= s3c_gpio_setcfg_s3c64xx_4bit,
> >  	.set_pull	= s3c_gpio_setpull_updown,
> > @@ -386,7 +387,7 @@ extern void s5pc1xx_irq_gpioint_handler(unsigned int
> irq,
> > struct irq_desc *desc)
> >
> >  static __init void s5pc100_gpiolib_link(struct s3c_gpio_chip *chip)
> >  {
> > -
> > +#if 0
> >  	/* Interrupt */
> >  	if (chip->config == &gpio_cfg) {
> >  		int i, irq;
> > @@ -402,6 +403,7 @@ static __init void s5pc100_gpiolib_link(struct
> s3c_gpio_chip
> > *chip)
> >  		}
> >  	} else if (chip->config == &gpio_cfg_eint)
> >  		chip->chip.to_irq = s5pc1xx_gpiolib_to_eint;
> > +#endif
> >  }
> >
> >  static __init int s5pc1xx_gpiolib_init(void)
> > @@ -417,9 +419,10 @@ static __init int s5pc1xx_gpiolib_init(void)
> >
> >  	samsung_gpiolib_add_4bit_chips(s5pc100_gpio_chips,
> >  				       ARRAY_SIZE(s5pc100_gpio_chips));
> > +#if 0
> >  	/* Interrupt */
> >  	set_irq_chained_handler(IRQ_GPIOINT, s5pc1xx_irq_gpioint_handler);
> > -
> > +#endif
> >  	return 0;
> >  }
> >  core_initcall(s5pc1xx_gpiolib_init);
> 
> Is there any way to avoid compile compatibility without #if 0?

The other way would be to completely remove that code and add it in the
next patches. I don't think that this is really required.

> ...

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
