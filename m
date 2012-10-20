From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] usb: phy: samsung: Introducing usb phy driver for hsotg
Date: Sat, 20 Oct 2012 21:19:19 +0200
Message-ID: <20121020191919.GA555@elf.ucw.cz>
References: <1349256393-11741-1-git-send-email-p.paneri@samsung.com>
 <1350036934-6051-1-git-send-email-p.paneri@samsung.com>
 <20121015132836.GT24333@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:57251 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756524Ab2JTTTY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 20 Oct 2012 15:19:24 -0400
Content-Disposition: inline
In-Reply-To: <20121015132836.GT24333@arwen.pp.htv.fi>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Praveen Paneri <p.paneri@samsung.com>, l.majewski@samsung.com, linux-samsung-soc@vger.kernel.org, heiko@sntech.de, gregkh@linuxfoundation.org, devicetree-discuss@lists.ozlabs.org, linux-usb@vger.kernel.org, grant.likely@secretlab.ca, kyungmin.park@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org

Hi!

> > +#define S3C_PHYPWR				(0x00)
...
> > +#define S3C_PHYCLK				(0x04)
> > +
> > +#define S3C_PHYCLK_MODE_SERIAL			(1 << 6)
> > +#define S3C_PHYCLK_EXT_OSC			(1 << 5)
> > +#define S3C_PHYCLK_COMMON_ON_N			(1 << 4)
> > +#define S3C_PHYCLK_ID_PULL			(1 << 2)
> > +#define S3C_PHYCLK_CLKSEL_MASK			(0x3 << 0)
> > +#define S3C_PHYCLK_CLKSEL_SHIFT			(0)
> > +#define S3C_PHYCLK_CLKSEL_48M			(0x0 << 0)
> > +#define S3C_PHYCLK_CLKSEL_12M			(0x2 << 0)
> > +#define S3C_PHYCLK_CLKSEL_24M			(0x3 << 0)

I believe these 0x 's should be removed. Ouch and << 0 is interesting,
too, just remove it.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
