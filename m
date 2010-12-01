From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4] ARM: s3c244x: Fix mess with gpio {set,get}_pull
 callbacks
Date: Wed, 01 Dec 2010 14:28:17 +0900
Message-ID: <000d01cb9118$9136c740$b3a455c0$%kim@samsung.com>
References: <201011301701.03443.anarsoul@gmail.com>
 <1291146383-16215-1-git-send-email-anarsoul@gmail.com>
 <4CF55785.5090403@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:21543 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750950Ab0LAF2c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 00:28:32 -0500
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LCQ007G5HVJAD60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Dec 2010 14:28:31 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LCQ00E3RHVIZI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Dec 2010 14:28:31 +0900 (KST)
In-reply-to: <4CF55785.5090403@metafoo.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Lars-Peter Clausen' <lars@metafoo.de>, 'Vasily Khoruzhick' <anarsoul@gmail.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Abdoulaye Walsimou GAYE' <awg@embtoolkit.org>

Lars-Peter Clausen wrote:
> 
> > +static int s3c_gpio_setpull_1(struct s3c_gpio_chip *chip,
> > +			 unsigned int off, s3c_gpio_pull_t pull,
> > +			 s3c_gpio_pull_t updown)
> >  {
> >  	void __iomem *reg = chip->base + 0x08;
> >  	u32 pup = __raw_readl(reg);
> >
> > -	pup = __raw_readl(reg);
> > -
> > -	if (pup == S3C_GPIO_PULL_UP)
> > +	if (pup == updown)
> This should be pull == updown, otherwise looks fine to me
> 
Yeah, I meant this.

> >  		pup &= ~(1 << off);
> >  	else if (pup == S3C_GPIO_PULL_NONE)

pull == S3C_GPIO_PULL_NONE?

> >  		pup |= (1 << off);

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
