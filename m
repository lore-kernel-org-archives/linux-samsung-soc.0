From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2 2/4] pinctrl: samsung: Register pinctrl before GPIO
Date: Thu, 23 Feb 2017 17:23:13 +0000
Message-ID: <20170223172313.GF2742@localhost.localdomain>
References: <1487251636-2480-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1487251636-2480-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <CACRpkdbq4RMH_2rfaxDbEZaqrQWO9bq8BS8AqnaV6SH=0s6jRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:56456 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751275AbdBWRY7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Feb 2017 12:24:59 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdbq4RMH_2rfaxDbEZaqrQWO9bq8BS8AqnaV6SH=0s6jRQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>

On Wed, Feb 22, 2017 at 03:37:37PM +0100, Linus Walleij wrote:
> On Thu, Feb 16, 2017 at 2:27 PM, Charles Keepax
> <ckeepax@opensource.wolfsonmicro.com> wrote:
> 
> > If we request a GPIO hog, then gpiochip_add_data will attempt to request
> > some of its own GPIOs. The driver also uses gpiochip_generic_request
> > which means that for any GPIO request to succeed the pinctrl needs to be
> > registered. Currently however the driver registers the GPIO and then the
> > pinctrl meaning all GPIO hog requests will fail, which then in turn causes
> > the whole driver to fail probe. Fix this up by ensuring we register the
> > pinctrl first. Although currently there are no users of GPIO hogs in
> > mainline there are plenty of Samsung based boards that are widely used
> > for development purposes of other hardware. Indeed we hit this issue
> > whilst attaching some additional hardware to an Arndale system.
> >
> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >
> > Changes since v1:
> >  - Updated commit message
> 
> Patch applied. Will not be visible in -next until after the merge window
> though.
> 

Apologies but I think you might be best to drop this patch for
now, it seems this causes the ranges passed to
pinctrl_add_gpio_range to have the wrong .base, whilst I can
actually see no ill effects from this on Arndale. I suspect this
patch may be only part of the solution and may potentially cause
issues for others even though it seems fine for me.

It does seem to there is some circular dependancy issues between
setting up the pinctrl and setting up the gpio which crops up in
the case of gpio hogs that may be more fundamental.

Thanks,
Charles
