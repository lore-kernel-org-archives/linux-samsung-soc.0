From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Add the missed s3c_gpio_getpull() API
Date: Fri, 22 Oct 2010 14:22:13 +0900
Message-ID: <002c01cb71a9$1789a720$469cf560$%kim@samsung.com>
References: <1287648286-7202-1-git-send-email-kgene.kim@samsung.com>
 <4CC0BC09.5090803@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39742 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752646Ab0JVFVy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Oct 2010 01:21:54 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LAO00HJOEWH4AE0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Oct 2010 14:21:53 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LAO00347EWHFW@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Oct 2010 14:21:53 +0900 (KST)
In-reply-to: <4CC0BC09.5090803@fluff.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Daein Moon' <moon9124@samsung.com>

Ben Dooks wrote:
> 
> On 21/10/10 09:04, Kukjin Kim wrote:
> > From: Daein Moon <moon9124@samsung.com>
> >
> > This patch adds the s3c_gpio_getpull() API that has been missed in the
> > plat-samsung/gpio-config.c and actullay there is its extern declaration
> > in plat/gpio-cfg.h.
> >
> > Signed-off-by: Daein Moon <moon9124@samsung.com>
> > Cc: Ben Dooks <ben-linux@fluff.org>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > NOTE:
> > - already issued about this
> >
> >  arch/arm/plat-samsung/gpio-config.c                |   19
> +++++++++++++++++++
> >  .../plat-samsung/include/plat/gpio-cfg-helpers.h   |    6 ++++++
> >  2 files changed, 25 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/plat-samsung/gpio-config.c b/arch/arm/plat-
> samsung/gpio-config.c
> > index 8a37211..b732b77 100644
> > --- a/arch/arm/plat-samsung/gpio-config.c
> > +++ b/arch/arm/plat-samsung/gpio-config.c
> > @@ -111,6 +111,25 @@ int s3c_gpio_setpull(unsigned int pin,
s3c_gpio_pull_t
> pull)
> >  }
> >  EXPORT_SYMBOL(s3c_gpio_setpull);
> >
> > +s3c_gpio_pull_t s3c_gpio_getpull(unsigned int pin)
> > +{
> > +	struct s3c_gpio_chip *chip = s3c_gpiolib_getchip(pin);
> > +	unsigned long flags;
> > +	int offset;
> > +	u32 pup = 0;
> 
> would the result of s3c_gpio_do_getpull() should be a s3c_gpio_pull_t?
> 
Yes, righit.

Mr. Moon,
Could you please update your patch as per Ben's comment?

> > +	if (chip) {
> > +		offset = pin - chip->chip.base;
> > +
> > +		s3c_gpio_lock(chip, flags);
> > +		pup = s3c_gpio_do_getpull(chip, offset);
> > +		s3c_gpio_unlock(chip, flags);
> > +	}
> > +
> > +	return (__force s3c_gpio_pull_t)pup;
> > +}
> > +EXPORT_SYMBOL(s3c_gpio_getpull);

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
