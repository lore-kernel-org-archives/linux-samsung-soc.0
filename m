From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] Samsung SoC: ready to use NTC value inside kernel
Date: Fri, 1 Jul 2011 13:10:18 -0700
Message-ID: <20110701201018.GA24949@opensource.wolfsonmicro.com>
References: <1309422387-11546-1-git-send-email-myungjoo.ham@samsung.com>
 <BANLkTin3bu4Xf0cS0EkASvYXG0AdW+eprQ@mail.gmail.com>
 <20110701155941.GA23784@opensource.wolfsonmicro.com>
 <201107011923.13324.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:34734 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751921Ab1GAUK1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Jul 2011 16:10:27 -0400
Content-Disposition: inline
In-Reply-To: <201107011923.13324.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, dg77.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, myungjoo.ham@gmail.com, Changhwan Youn <chaos.youn@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On Fri, Jul 01, 2011 at 07:23:13PM +0200, Arnd Bergmann wrote:
> On Friday 01 July 2011, Mark Brown wrote:

> > The other issue is that it's designed for high volume data and these
> > AUXADCs tend to be relatively slow.  That said I've had some discussions
> > with Jonathan about supporting these devices via IIO and he seems to be
> > coming round to the idea that we could integrate support.  Not sure how
> > fast IIO is progressing to mainline, though.

> I think IIO is progressing well and I would rather base products on that
> while it's in staging than having a random out-of-tree driver. It seems

It's certainly progressing well - looks really nice right now.

> to fit the purpose of this driver, though not the in-kernel uses that
> Linus mentioned above.

The in kernel uses are the main usage of this sort of ADC in most
systems - you get a general purpose ADC used for (usually) voltage and
temperature monitoring with a few auxiliary inputs available for random
system specific things but generally not actually used so often (jack
detection stuff is the main use case).  The power supply and hwmon
subsystems are the main users.

> With regard to IIO, that could live on a higher level and just provide
> a user interface on top of the generic in-kernel abstraction for adc.

Yeah, that's roughly the option that Jonathan and myself had been
discussing last time this came up - have the convertor level deliver
events to a pluggable API layer with the IIO userspace be just one of
those plugins.
