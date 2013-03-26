From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RFC: PATCH v5] i2c: exynos5: add High Speed I2C controller
 driver
Date: Tue, 26 Mar 2013 10:23:07 +0100
Message-ID: <20130326092306.GA8553@the-dreams.de>
References: <1363062732-27869-1-git-send-email-ch.naveen@samsung.com>
 <1363796690-30242-1-git-send-email-ch.naveen@samsung.com>
 <CA+NduCBFUTW9Pu1k4NyTK+tFUyWUHBbMONO_oAr6PK+y30sYDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:57788 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934019Ab3CZJXO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Mar 2013 05:23:14 -0400
Content-Disposition: inline
In-Reply-To: <CA+NduCBFUTW9Pu1k4NyTK+tFUyWUHBbMONO_oAr6PK+y30sYDw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yuvaraj CD <yuvaraj.lkml@gmail.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, w.sang@pengutronix.de, khali@linux-fr.org, ben-linux@fluff.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, sjg@chromium.org, grundler@chromium.org, naveenkrishna.ch@gmail.com, broonie@opensource.wolfsonmicro.com


> > +       /* CLK_DIV max is 256 */
> > +       for (i = 0; i < 256; i++) {
> > +               utemp1 = utemp0 / (i + 1);
> > +               /* SCLK_L/H max is 256 / 2 */
> > +               if (utemp1 < 128) {
> I think TSCLK_L and TSCLK_H both can be configured upto 255.Why
> limiting it to < 128 ?
> By limiting it to < 128 dont we achieve lesser SCL clock?

Thanks for reviewing but please quote only the relevant part of the
message (like I did). This improves readability a lot.
