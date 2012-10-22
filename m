From: Praveen Paneri <p.paneri@samsung.com>
Subject: Re: [PATCH] usb: phy: samsung: Introducing usb phy driver for hsotg
Date: Mon, 22 Oct 2012 11:13:42 +0530
Message-ID: <CAD6zSYOfasOuQX=N-YuMxvB-3zW=dERqfmX7yRtGLfg5HiiZvg@mail.gmail.com>
References: <1349256393-11741-1-git-send-email-p.paneri@samsung.com>
	<1350036934-6051-1-git-send-email-p.paneri@samsung.com>
	<20121015132836.GT24333@arwen.pp.htv.fi>
	<20121020191919.GA555@elf.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f174.google.com ([209.85.210.174]:36798 "EHLO
	mail-ia0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753999Ab2JVFno (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Oct 2012 01:43:44 -0400
In-Reply-To: <20121020191919.GA555@elf.ucw.cz>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Felipe Balbi <balbi@ti.com>, l.majewski@samsung.com, linux-samsung-soc@vger.kernel.org, heiko@sntech.de, gregkh@linuxfoundation.org, devicetree-discuss@lists.ozlabs.org, linux-usb@vger.kernel.org, grant.likely@secretlab.ca, kyungmin.park@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org

Hi,

On Sun, Oct 21, 2012 at 12:49 AM, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
>> > +#define S3C_PHYPWR                         (0x00)
> ...
>> > +#define S3C_PHYCLK                         (0x04)
>> > +
>> > +#define S3C_PHYCLK_MODE_SERIAL                     (1 << 6)
>> > +#define S3C_PHYCLK_EXT_OSC                 (1 << 5)
>> > +#define S3C_PHYCLK_COMMON_ON_N                     (1 << 4)
>> > +#define S3C_PHYCLK_ID_PULL                 (1 << 2)
>> > +#define S3C_PHYCLK_CLKSEL_MASK                     (0x3 << 0)
>> > +#define S3C_PHYCLK_CLKSEL_SHIFT                    (0)
>> > +#define S3C_PHYCLK_CLKSEL_48M                      (0x0 << 0)
>> > +#define S3C_PHYCLK_CLKSEL_12M                      (0x2 << 0)
>> > +#define S3C_PHYCLK_CLKSEL_24M                      (0x3 << 0)
>
> I believe these 0x 's should be removed. Ouch and << 0 is interesting,
> too, just remove it.
Yes it makes sense to maintain a uniform pattern across all the
definition. How about maintaining hex values everywhere instead of
dropping 0x's? It will make it easier to add big values to the
definitions tomorrow, if needed.
About "<< 0", IMHO people must have started using it to maintain a
parallelism with other definitions. I do not mind changing it if you
still feel that it's very much needed
thanks :)

Praveen
>
>                                                                         Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
