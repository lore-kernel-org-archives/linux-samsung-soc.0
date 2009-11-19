From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 14/19] ARM: S5PC1XX: add support for s5pc110 gpio
Date: Thu, 19 Nov 2009 15:40:05 +0100
Message-ID: <001d01ca6926$31de81e0$959b85a0$%szyprowski@samsung.com>
References: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
 <1258551194-16018-15-git-send-email-m.szyprowski@samsung.com>
 <20091118220535.GA4808@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40985 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753537AbZKSOkH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2009 09:40:07 -0500
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KTD00ACB22ZOX@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Nov 2009 23:40:11 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KTD008A822WGF@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Nov 2009 23:40:11 +0900 (KST)
In-reply-to: <20091118220535.GA4808@trinity.fluff.org>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>

Hello,

On Wednesday, November 18, 2009 11:06 PM Ben Dooks wrote:

> On Wed, Nov 18, 2009 at 02:33:09PM +0100, Marek Szyprowski wrote:
> > From: Kyungmin Park <kyungmin.park@samsung.com>
> >
> > Samsung S5PC110 SoC are newer Samsung SoCs. Like S5PC100 they are based
> > on CortexA8 ARM CPU, but have much more powerfull integrated periperals.
> > This patch adds gpiolib support for S5PC110 sub-platform.
> 
> Hmm, another file with Byungho Min <bhmin@samsung.com> in and no signoff
> from this person.

Ok, we will handle this better next time.

> [...]

> > diff --git a/arch/arm/plat-s5pc1xx/gpiolib.c b/arch/arm/plat-s5pc1xx/gpiolib.c
> > index 60bf31d..2cd095c 100644
> > --- a/arch/arm/plat-s5pc1xx/gpiolib.c
> > +++ b/arch/arm/plat-s5pc1xx/gpiolib.c
> > @@ -453,6 +453,272 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] = {
> >  #define s5pc1xx_gpio_chips s5pc100_gpio_chips
> >
> >  #endif
> > +
> > +#ifdef CONFIG_CPU_S5PC110
> 
> this amount of #ifdef screams seperate file.
> 

> [...]

> > +	}, {
> > +		.base	= S5PC110_MP0_5_BASE,
> > +		.config	= &gpio_cfg,
> > +		.chip	= {
> > +			.base	= S5PC110_MP0_5(0),
> > +			.ngpio	= S5PC110_GPIO_MP0_5_NR,
> > +			.label	= "MP0_5",
> > +		},
> > +	},
> > +};
> > +
> > +#define s5pc1xx_gpio_chips s5pc110_gpio_chips
> > +
> > +#endif
> > +
> >  /* FIXME move from irq-gpio.c */
> >  extern struct irq_chip s5pc1xx_gpioint;
> >  extern void s5pc1xx_irq_gpioint_handler(unsigned int irq, struct irq_desc *desc);
> > diff --git a/arch/arm/plat-s5pc1xx/irq-gpio.c b/arch/arm/plat-s5pc1xx/irq-gpio.c
> > index f5d8dab..b13308f 100644
> > --- a/arch/arm/plat-s5pc1xx/irq-gpio.c
> > +++ b/arch/arm/plat-s5pc1xx/irq-gpio.c
> > @@ -142,6 +142,116 @@ static int s5pc100_group_end = 21;
> >
> >  #endif
> >
> > +#ifdef CONFIG_CPU_S5PC110
> 
> these follwing functions could have had their info added to an extended
> gpio structure, say struct s5p_gpio_chip and had a s3c_gpio_chip embededded in
> it, which would make the code simpler,
> 
> ie:
> 
> struct s5p_gpio_chip {
>        struct s3c_gpio_chip chip;
>        unsigned int 	    gpio_start;
>        unsigned int 	    gpio_groupl
> };
> 
> and then you could have gone chip->info easily.
 
Thanks for suggestion! I will rewrite this and split gpio lib support into
separate files for each sub-platform and send new patches soon.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
