From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH v4] ARM: s3c244x: Fix mess with gpio {set,get}_pull callbacks
Date: Tue, 30 Nov 2010 22:05:24 +0200
Message-ID: <201011302205.24839.anarsoul@gmail.com>
References: <201011301701.03443.anarsoul@gmail.com> <1291146383-16215-1-git-send-email-anarsoul@gmail.com> <4CF55785.5090403@metafoo.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:41295 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756613Ab0K3UF4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Nov 2010 15:05:56 -0500
Received: by eye27 with SMTP id 27so3035455eye.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Nov 2010 12:05:55 -0800 (PST)
In-Reply-To: <4CF55785.5090403@metafoo.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Abdoulaye Walsimou GAYE <awg@embtoolkit.org>

On Tuesday 30 November 2010 21:59:01 Lars-Peter Clausen wrote:
> On 11/30/2010 08:46 PM, Vasily Khoruzhick wrote:
> > Currently the {set,get}_pull callbacks of the s3c24xx_gpiocfg_default
> > structure are initalized via s3c_gpio_{get,set}pull_1up. This results in
> > a linker error when only CONFIG_CPU_S3C2442 is selected:
> > 
> > arch/arm/plat-s3c24xx/built-in.o:(.data+0x13f4): undefined reference to
> > `s3c_gpio_getpull_1up'
> > arch/arm/plat-s3c24xx/built-in.o:(.data+0x13f8): undefined reference to
> > `s3c_gpio_setpull_1up'
> > 
> > The s3c2442 has pulldowns instead of pullups compared to the s3c2440.
> > The method of controlling them is the same though.
> > So this patch modifies the existing s3c_gpio_{get,set}pull_1up helper
> > functions to take an additional parameter deciding whether the pin has a
> > pullup or pulldown. The s3c_gpio_{get,set}pull_1{down,up} functions then
> > wrap that functions passing either S3C_GPIO_PULL_UP or
> > S3C_GPIO_PULL_DOWN.
> > 
> > Furthermore this patch sets up the s3c24xx_gpiocfg_default.{get,set}_pull
> > fields in the s3c244{0,2}_map_io function to the new pulldown helper
> > functions.
> > 
> > Based on patch from "Lars-Peter Clausen" <lars@metafoo.de>
> > 
> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > ---
> > v2: adapt patch for 2.6.37-rc1
> > v3: restore default pull callbacks, add default pull callbacks for
> > s3c2442 v4: remove default pull callbacks, set them in per-soc map_io
> > function instead.
> > 
> >  arch/arm/mach-s3c2440/Kconfig                      |    1 +
> >  arch/arm/mach-s3c2440/s3c2440.c                    |   11 ++++-
> >  arch/arm/mach-s3c2440/s3c2442.c                    |   14 ++++++
> >  arch/arm/plat-s3c24xx/cpu.c                        |    8 ++--
> >  arch/arm/plat-s3c24xx/gpiolib.c                    |    2 -
> >  arch/arm/plat-s3c24xx/include/plat/s3c244x.h       |    7 +++-
> >  arch/arm/plat-samsung/gpio-config.c                |   45
> >  ++++++++++++++++---- .../plat-samsung/include/plat/gpio-cfg-helpers.h  
> >  |   11 +++++ 8 files changed, 80 insertions(+), 19 deletions(-)
> > 
> > ...
> > 
> > +static int s3c_gpio_setpull_1(struct s3c_gpio_chip *chip,
> > +			 unsigned int off, s3c_gpio_pull_t pull,
> > +			 s3c_gpio_pull_t updown)
> > 
> >  {
> >  
> >  	void __iomem *reg = chip->base + 0x08;
> >  	u32 pup = __raw_readl(reg);
> > 
> > -	pup = __raw_readl(reg);
> > -
> > -	if (pup == S3C_GPIO_PULL_UP)
> > +	if (pup == updown)
> 
> This should be pull == updown, otherwise looks fine to me

You're right. Btw, can you test this patch on your s3c24xx-machine?

> >  		pup &= ~(1 << off);
> >  	
> >  	else if (pup == S3C_GPIO_PULL_NONE)
> >  	
> >  		pup |= (1 << off);
> > 
> > @@ -300,17 +299,45 @@ int s3c_gpio_setpull_1up(struct s3c_gpio_chip
> > *chip,
> > 
> >  	return 0;
> >  
> >  }
> 
> - Lars

Regards
Vasily
