From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [RFC 1/3] i2c: Enhancement of i2c API to address circular lock
 dependency problem
Date: Wed, 25 Feb 2015 11:47:15 -0800
Message-ID: <20150225194715.421.87263@quantum>
References: <1421419194-1849-1-git-send-email-p.osmialowsk@samsung.com>
 <CA+Ln22GrsCj0291dVccFPzPW8pmxyc8JHtPo5ijsAdDXw6RC1Q@mail.gmail.com>
 <54BB9100.7000506@samsung.com> <20150118134124.GC2809@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:35653 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752714AbbBYTrb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Feb 2015 14:47:31 -0500
Received: by mail-oi0-f51.google.com with SMTP id g201so5276775oib.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Feb 2015 11:47:31 -0800 (PST)
In-Reply-To: <20150118134124.GC2809@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Paul Osmialowski <p.osmialowsk@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Quoting Mark Brown (2015-01-18 05:41:24)
> On Sun, Jan 18, 2015 at 11:54:56AM +0100, Krzysztof Kozlowski wrote:
> > W dniu 18.01.2015 o 07:30, Tomasz Figa pisze:
> 
> > >So, the question is, do we actually have hardware that _really_
> > >requires _actual_ preparation or all the clk_prepare_enable()s in I2C
> > >drivers (at least in i2c-s3c2410) are just to simplify the code?
> 
> > I completely forgot that you already thought about this deadlock in 2014. I
> > think we can try the no-prepare way for i2c-s3c2410. However this would be
> > only workaround for specific chip. Other buses (like SPI) would require
> > similar changes.
> 
> Right, and it's every single driver which would need an update too which
> is a bit icky and sad.  On the other hand a more detailed fix is going
> to involve trying to make the clock API locking more fine grained which
> isn't fun.

Not fun is right. Please see Stephen's attempt here:

http://lkml.kernel.org/r/<1409792466-5092-1-git-send-email-sboyd@codeaurora.org>

I'm hoping this approach will be revisited soon.

Regards,
Mike

> 
> > I wondered why this was not observed (at least not observed by me with
> > lockdep) on Gear 2 (Rinato) board. This is quite similar case: the S2MPS14
> > PMIC provides regulators and 32kHz clocks. I think it is exactly the same
> > pattern as for max77686... but somehow lockdep never reported that deadlock
> > there.
> 
> Mostly the clocks on PMICs never get changed at runtime which helps a
> lot here.
