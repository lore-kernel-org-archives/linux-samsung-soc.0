From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] GPIO: Samsung: correct pin configuration for
 S5PC100/S5PC110/Exynos4
Date: Mon, 26 Sep 2011 13:26:04 +0900
Message-ID: <00d501cc7c04$67700610$36501230$%kim@samsung.com>
References: <1316777930-13136-1-git-send-email-m.szyprowski@samsung.com>
 <20110923233237.GK24631@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12857 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750731Ab1IZE0F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Sep 2011 00:26:05 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LS400H5J4AOPAM0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Sep 2011 13:26:04 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LS400GGY4BFLG40@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 26 Sep 2011 13:26:04 +0900 (KST)
In-reply-to: <20110923233237.GK24631@ponder.secretlab.ca>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Grant Likely' <grant.likely@secretlab.ca>, 'Marek Szyprowski' <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Angus Ainslie' <angus.ainslie@linaro.org>

Grant Likely wrote:
> 
> On Fri, Sep 23, 2011 at 01:38:50PM +0200, Marek Szyprowski wrote:
> > Commit 1b39d5f2cc introduced new common gpio driver for all Samsung GPIO
> > SoCs. The new driver use wrong configuration setup for all gpio pins on
> > S5PC100 and S5PV210 SoCs and external interrupt lines on Exynos4 SoCs.
> > This patch fixes this issue.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> Acked-by: Grant Likely <grant.likely@secretlab.ca>
> 
> > ---
> >  drivers/gpio/gpio-samsung.c |   30 +++++++++++++++---------------
> >  1 files changed, 15 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
> > index cdffb0c..b6be77a 100644
> > --- a/drivers/gpio/gpio-samsung.c
> > +++ b/drivers/gpio/gpio-samsung.c
> > @@ -1862,7 +1862,7 @@ static struct samsung_gpio_chip
s5pc100_gpios_4bit[]
> = {
> >   * Followings are the gpio banks in S5PV210/S5PC110
> >   *
> >   * The 'config' member when left to NULL, is initialized to the default
> > - * structure samsung_gpio_cfgs[4] in the init function below.
> > + * structure samsung_gpio_cfgs[3] in the init function below.
> >   *
> >   * The 'base' member is also initialized in the init function below.
> >   * Note: The initialization of 'base' member of samsung_gpio_chip
structure
> > @@ -2083,7 +2083,7 @@ static struct samsung_gpio_chip
s5pv210_gpios_4bit[]
> = {
> >   * Followings are the gpio banks in EXYNOS4210
> >   *
> >   * The 'config' member when left to NULL, is initialized to the default
> > - * structure samsung_gpio_cfgs[4] in the init function below.
> > + * structure samsung_gpio_cfgs[3] in the init function below.
> >   *
> >   * The 'base' member is also initialized in the init function below.
> >   * Note: The initialization of 'base' member of samsung_gpio_chip
structure
> > @@ -2249,49 +2249,49 @@ static struct samsung_gpio_chip
exynos4_gpios_2[]
> = {
> >  			.label	= "GPL2",
> >  		},
> >  	}, {
> > -		.config	= &samsung_gpio_cfgs[4],
> > +		.config	= &samsung_gpio_cfgs[0],
> >  		.chip	= {
> >  			.base	= EXYNOS4_GPY0(0),
> >  			.ngpio	= EXYNOS4_GPIO_Y0_NR,
> >  			.label	= "GPY0",
> >  		},
> >  	}, {
> > -		.config	= &samsung_gpio_cfgs[4],
> > +		.config	= &samsung_gpio_cfgs[0],
> >  		.chip	= {
> >  			.base	= EXYNOS4_GPY1(0),
> >  			.ngpio	= EXYNOS4_GPIO_Y1_NR,
> >  			.label	= "GPY1",
> >  		},
> >  	}, {
> > -		.config	= &samsung_gpio_cfgs[4],
> > +		.config	= &samsung_gpio_cfgs[0],
> >  		.chip	= {
> >  			.base	= EXYNOS4_GPY2(0),
> >  			.ngpio	= EXYNOS4_GPIO_Y2_NR,
> >  			.label	= "GPY2",
> >  		},
> >  	}, {
> > -		.config	= &samsung_gpio_cfgs[4],
> > +		.config	= &samsung_gpio_cfgs[0],
> >  		.chip	= {
> >  			.base	= EXYNOS4_GPY3(0),
> >  			.ngpio	= EXYNOS4_GPIO_Y3_NR,
> >  			.label	= "GPY3",
> >  		},
> >  	}, {
> > -		.config	= &samsung_gpio_cfgs[4],
> > +		.config	= &samsung_gpio_cfgs[0],
> >  		.chip	= {
> >  			.base	= EXYNOS4_GPY4(0),
> >  			.ngpio	= EXYNOS4_GPIO_Y4_NR,
> >  			.label	= "GPY4",
> >  		},
> >  	}, {
> > -		.config	= &samsung_gpio_cfgs[4],
> > +		.config	= &samsung_gpio_cfgs[0],
> >  		.chip	= {
> >  			.base	= EXYNOS4_GPY5(0),
> >  			.ngpio	= EXYNOS4_GPIO_Y5_NR,
> >  			.label	= "GPY5",
> >  		},
> >  	}, {
> > -		.config	= &samsung_gpio_cfgs[4],
> > +		.config	= &samsung_gpio_cfgs[0],
> >  		.chip	= {
> >  			.base	= EXYNOS4_GPY6(0),
> >  			.ngpio	= EXYNOS4_GPIO_Y6_NR,
> > @@ -2299,7 +2299,7 @@ static struct samsung_gpio_chip exynos4_gpios_2[]
=
> {
> >  		},
> >  	}, {
> >  		.base	= (S5P_VA_GPIO2 + 0xC00),
> > -		.config	= &samsung_gpio_cfgs[4],
> > +		.config	= &samsung_gpio_cfgs[3],
> >  		.irq_base = IRQ_EINT(0),
> >  		.chip	= {
> >  			.base	= EXYNOS4_GPX0(0),
> > @@ -2309,7 +2309,7 @@ static struct samsung_gpio_chip exynos4_gpios_2[]
=
> {
> >  		},
> >  	}, {
> >  		.base	= (S5P_VA_GPIO2 + 0xC20),
> > -		.config	= &samsung_gpio_cfgs[4],
> > +		.config	= &samsung_gpio_cfgs[3],
> >  		.irq_base = IRQ_EINT(8),
> >  		.chip	= {
> >  			.base	= EXYNOS4_GPX1(0),
> > @@ -2319,7 +2319,7 @@ static struct samsung_gpio_chip exynos4_gpios_2[]
=
> {
> >  		},
> >  	}, {
> >  		.base	= (S5P_VA_GPIO2 + 0xC40),
> > -		.config	= &samsung_gpio_cfgs[4],
> > +		.config	= &samsung_gpio_cfgs[3],
> >  		.irq_base = IRQ_EINT(16),
> >  		.chip	= {
> >  			.base	= EXYNOS4_GPX2(0),
> > @@ -2329,7 +2329,7 @@ static struct samsung_gpio_chip exynos4_gpios_2[]
=
> {
> >  		},
> >  	}, {
> >  		.base	= (S5P_VA_GPIO2 + 0xC60),
> > -		.config	= &samsung_gpio_cfgs[4],
> > +		.config	= &samsung_gpio_cfgs[3],
> >  		.irq_base = IRQ_EINT(24),
> >  		.chip	= {
> >  			.base	= EXYNOS4_GPX3(0),
> > @@ -2399,7 +2399,7 @@ static __init int samsung_gpiolib_init(void)
> >
> >  		for (i = 0; i < nr_chips; i++, chip++) {
> >  			if (!chip->config) {
> > -				chip->config = &samsung_gpio_cfgs[4];
> > +				chip->config = &samsung_gpio_cfgs[3];
> >  				chip->group = group++;
> >  			}
> >  		}
> > @@ -2414,7 +2414,7 @@ static __init int samsung_gpiolib_init(void)
> >
> >  		for (i = 0; i < nr_chips; i++, chip++) {
> >  			if (!chip->config) {
> > -				chip->config = &samsung_gpio_cfgs[4];
> > +				chip->config = &samsung_gpio_cfgs[3];
> >  				chip->group = group++;
> >  			}
> >  		}
> > --
> > 1.7.1.569.g6f426
> >

Applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
