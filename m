From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] Samsung SoC: ready to use NTC value inside kernel
Date: Fri, 1 Jul 2011 17:15:05 +0200
Message-ID: <BANLkTin3bu4Xf0cS0EkASvYXG0AdW+eprQ@mail.gmail.com>
References: <1309422387-11546-1-git-send-email-myungjoo.ham@samsung.com>
	<1309422387-11546-3-git-send-email-myungjoo.ham@samsung.com>
	<20110630090013.GP21898@n2100.arm.linux.org.uk>
	<BANLkTikC2zUPamzactXLdLb8Szgs2o9V7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:53686 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751643Ab1GAPPG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Jul 2011 11:15:06 -0400
Received: by qwk3 with SMTP id 3so1642090qwk.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Jul 2011 08:15:06 -0700 (PDT)
In-Reply-To: <BANLkTikC2zUPamzactXLdLb8Szgs2o9V7w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: myungjoo.ham@gmail.com
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, dg77.kim@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Changhwan Youn <chaos.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

On Fri, Jul 1, 2011 at 2:28 AM, MyungJoo Ham <myungjoo.ham@samsung.com> wrote:

> Or if the values are only exported through sysfs (HWMON), is the only
> clean way to read such values (w/o extending HWMON itself) to seperate
> the HWMON device driver into two pieces: a platform driver that
> provide values to somewhere sharable in kernel and a HWMON driver that
> reads the values and exports them to sysfs?

Sounds like you could very well separate out the ADC part and have
functions for reading values off them? Compare
drivers/mfd/ab8500-gpadc.c for example, this will be used by a
yet to be submitted HWMON driver for doing ADC.

There is no clean nice ADC subsystem though, and *that* feels
like a big problem to drivers like this (and no I don't like the AB8500
GPADC living in MFD either) so if you'd like to create a ADC
subsystem just go ahead, there is something in drivers/staging/iio/adc
but that had another problem last time I looked: it was only intended
for userspace control, not in-kernel use.

Linus Walleij
