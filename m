From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] backlight: add regulator support for platform_lcd driver
Date: Mon, 5 Dec 2011 10:33:16 +0000
Message-ID: <20111205103315.GB11150@opensource.wolfsonmicro.com>
References: <1323074921-29291-1-git-send-email-thomas.abraham@linaro.org>
 <CAH9JG2XJ4TCEaN1rMRjMZNRn5Wx6jcTRC_DmyN4Qyf2zztWSsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:50226 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753783Ab1LEKdS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Dec 2011 05:33:18 -0500
Content-Disposition: inline
In-Reply-To: <CAH9JG2XJ4TCEaN1rMRjMZNRn5Wx6jcTRC_DmyN4Qyf2zztWSsg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, rpurdie@rpsys.net, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, Linus Walleij <linus.walleij@linaro.org>

On Mon, Dec 05, 2011 at 07:10:03PM +0900, Kyungmin Park wrote:

> > +		if (plcd->pdata->min_uV || plcd->pdata->max_uV)
> > +			if (regulator_set_voltage(lcd_regulator,
> > +				plcd->pdata->min_uV, plcd->pdata->max_uV))
> > +				dev_info(plcd->us,
> > +					"regulator voltage set failed\n");

> Are there case to change the voltage? Doesn't it easy to set the
> voltage at board file? I mean don't need to setup at drivers?

Yes, unless the driver changes the voltage it should just assume the
voltage is already set up sensibly and leave it up to the board to
do any configuration which is required on boot.

There is one existing driver which implements things this way in the
video subsystem but that should be fixed.
