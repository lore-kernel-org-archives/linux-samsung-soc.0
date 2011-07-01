From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] Samsung SoC: ready to use NTC value inside kernel
Date: Fri, 1 Jul 2011 08:59:42 -0700
Message-ID: <20110701155941.GA23784@opensource.wolfsonmicro.com>
References: <1309422387-11546-1-git-send-email-myungjoo.ham@samsung.com>
 <1309422387-11546-3-git-send-email-myungjoo.ham@samsung.com>
 <20110630090013.GP21898@n2100.arm.linux.org.uk>
 <BANLkTikC2zUPamzactXLdLb8Szgs2o9V7w@mail.gmail.com>
 <BANLkTin3bu4Xf0cS0EkASvYXG0AdW+eprQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:37526 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752852Ab1GAP7q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Jul 2011 11:59:46 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTin3bu4Xf0cS0EkASvYXG0AdW+eprQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: myungjoo.ham@gmail.com, Russell King - ARM Linux <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, dg77.kim@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Changhwan Youn <chaos.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

On Fri, Jul 01, 2011 at 05:15:05PM +0200, Linus Walleij wrote:

> There is no clean nice ADC subsystem though, and *that* feels
> like a big problem to drivers like this (and no I don't like the AB8500
> GPADC living in MFD either) so if you'd like to create a ADC
> subsystem just go ahead, there is something in drivers/staging/iio/adc
> but that had another problem last time I looked: it was only intended
> for userspace control, not in-kernel use.

The other issue is that it's designed for high volume data and these
AUXADCs tend to be relatively slow.  That said I've had some discussions
with Jonathan about supporting these devices via IIO and he seems to be
coming round to the idea that we could integrate support.  Not sure how
fast IIO is progressing to mainline, though.
