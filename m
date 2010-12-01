From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH RESEND v3] ARM: s3c2442: Setup gpio {set,get}_pull callbacks
Date: Wed, 01 Dec 2010 14:19:57 +0900
Message-ID: <000c01cb9117$68034070$3809c150$%kim@samsung.com>
References: <000201cb8fae$4d61fd20$e825f760$%kim@samsung.com>
 <1291026399-14873-1-git-send-email-anarsoul@gmail.com>
 <001801cb9056$65296530$2f7c2f90$%kim@samsung.com> <4CF4E5C7.5020600@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16961 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750735Ab0LAFUO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 00:20:14 -0500
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LCQ007YFHHOAD50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Dec 2010 14:20:12 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LCQ00NV7HHO3M@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Dec 2010 14:20:12 +0900 (KST)
In-reply-to: <4CF4E5C7.5020600@metafoo.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Lars-Peter Clausen' <lars@metafoo.de>
Cc: 'Vasily Khoruzhick' <anarsoul@gmail.com>, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Abdoulaye Walsimou GAYE' <awg@embtoolkit.org>

Lars-Peter Clausen wrote:
> 
> >> -#ifdef CONFIG_S3C_GPIO_PULL_UP
> >> -int s3c_gpio_setpull_1up(struct s3c_gpio_chip *chip,
> >> -			 unsigned int off, s3c_gpio_pull_t pull)
> >> +#if defined(CONFIG_S3C_GPIO_PULL_UP) ||
> > defined(CONFIG_S3C_GPIO_PULL_DOWN)
> >> +static int s3c_gpio_setpull_1(struct s3c_gpio_chip *chip,
> >> +			 unsigned int off, s3c_gpio_pull_t pull,
> >> +			 s3c_gpio_pull_t updown)
> >
> > Hmm...how about s3c_gpio_setpull_1updown(...)?
> > And actually, not used 3rd argument, "pull" now.
> > I prefer follwoing.
> >
> 
> You need the 4th arguemnt, because the s3c2440 only supports pullups and the
> s3c2442
> only supports pulldowns. So you want to return -EINVAL if somebody tries to
> set a
> pullup on a s3c2442 based board.
> Your proposed solution would return 0 and set a pulldown instead.
> 

Hmm...please read following which is from previous my comment.
---
> > But, according to your patch, maybe not called "else if" and "else".
> > Because you only used "S3C_GPIO_PULL_UP" and "S3C_GPIO_PULL_DOWN" as
> > argument from caller function.
> >
> > So should be separate it as Ben's original code.
---
In addition, the reason is that it is not used 3rd argument "pull" in s3c_gpio_setpull_1().
My question is simple. Why do you think that we need useless argument :-(
Do we _really_ need two s3c_gpuo_pull_t in argument here?

(snip)

> >> -s3c_gpio_pull_t s3c_gpio_getpull_1up(struct s3c_gpio_chip *chip,
> >> -				     unsigned int off)
> >> +static s3c_gpio_pull_t s3c_gpio_getpull_1(struct s3c_gpio_chip *chip,
> >> +				     unsigned int off, s3c_gpio_pull_t
> > updown)
> >
> > s3c_gpio_getpull_1updown(...)?
> > And...why need 3rd argument, "updown"
> 
> Same reason as above.
> 
> >
> > +static s3c_gpio_pull_t s3c_gpio_getpull_1(struct s3c_gpio_chip *chip,
> > +					  unsigned int off)
> >
> >>  {
> >>  	void __iomem *reg = chip->base + 0x08;
> >>  	u32 pup = __raw_readl(reg);
> >>
> >>  	pup &= (1 << off);
> >> -	return pup ? S3C_GPIO_PULL_NONE : S3C_GPIO_PULL_UP;
> >> +	return pup ? S3C_GPIO_PULL_NONE : updown;
> >
> > Is this right?
> > Hmm...No...
> Why do you think it is wrong? As far as I can see it is correct.
> 
I miss-read. It's ok.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
