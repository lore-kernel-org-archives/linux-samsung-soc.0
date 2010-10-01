From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 5/6] ARM: Samsung: Add common samsung_gpiolib_to_irq
 function
Date: Fri, 01 Oct 2010 07:19:16 +0200
Message-ID: <00ec01cb6128$34300720$9c901560$%szyprowski@samsung.com>
References: <1283764347-460-1-git-send-email-m.szyprowski@samsung.com>
 <1283764347-460-6-git-send-email-m.szyprowski@samsung.com>
 <00fb01cb6124$068a8790$139f96b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:14249 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751629Ab0JAFT3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Oct 2010 01:19:29 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9L00AQJISF3R00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Oct 2010 14:19:27 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9L001R8IS556@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Oct 2010 14:19:27 +0900 (KST)
In-reply-to: <00fb01cb6124$068a8790$139f96b0$%kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org, jy0922.shim@samsung.com

Hello,

On Friday, October 01, 2010 6:49 AM Kukjin Kim wrote:

...

> > diff --git a/arch/arm/plat-samsung/gpiolib.c
> b/arch/arm/plat-samsung/gpiolib.c
> > index c354089..f2dc389 100644
> > --- a/arch/arm/plat-samsung/gpiolib.c
> > +++ b/arch/arm/plat-samsung/gpiolib.c
> > @@ -197,3 +197,11 @@ void __init samsung_gpiolib_add_4bit2_chips(struct
> > s3c_gpio_chip *chip,
> >  		s3c_gpiolib_add(chip);
> >  	}
> >  }
> > +
> > +int samsung_gpiolib_to_irq(struct gpio_chip *chip, unsigned int offset)
> > +{
> > +	struct s3c_gpio_chip *s3c_chip = container_of(chip,
> > +			struct s3c_gpio_chip, chip);
> > +
> > +	return s3c_chip->irq_base + offset;
> > +}
> 
> Hi,
> 
> Following is for your information...
> 
> Moved samsung_gpiolib_to_irq() into plat-samsung/gpio.c because happened
> build error like following after applying this.
> 
> arch/arm/plat-s3c24xx/built-in.o:(.data+0x11c4): undefined reference to
> `samsung_gpiolib_to_irq'
> 
> The reason is that plat-samsung/gpiolib.c is not required for
> s3c24xx...applied anyway with modifying.

I must have missed that plat-samsung/gpiolib.c is not used for s3c-24xx. Thank
You for the fix!

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
