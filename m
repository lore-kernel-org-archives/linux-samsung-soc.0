From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Add stub runtime power management
Date: Sat, 21 Jan 2012 18:31:55 +0000
Message-ID: <20120121183155.GE10751@opensource.wolfsonmicro.com>
References: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1327152527-11364-2-git-send-email-broonie@opensource.wolfsonmicro.com>
 <4F1ADF5A.6000806@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:39833 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751043Ab2AUSb7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Jan 2012 13:31:59 -0500
Content-Disposition: inline
In-Reply-To: <4F1ADF5A.6000806@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <khali@linux-fr.org>, Wolfram Sang <w.sang@pengutronix.de>, Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Sat, Jan 21, 2012 at 04:52:58PM +0100, Sylwester Nawrocki wrote:
> On 01/21/2012 02:28 PM, Mark Brown wrote:

> > +	pm_runtime_get_sync(&adap->dev);
> >   	clk_enable(i2c->clk);

> It looks a bit strange to have pm_runtime* and manual clock control side
> by side. How about implementing proper runtime_suspend/resume calls and
> moving clk_enable/disable to these handlers ?

I'd rather not do that in a single patch, and really we ought to be
doing more than just stopping and starting the clocks anyway.  Given
that the rather serious problems with getting I2C patches applied I'd
rather do as little as possible in individual patches.

It would also introduce a regression for systems that don't use runtime
PM (probably most s3c24xx ones).

> It might also make sense to check return value of pm_runtime_get_sync().

This is fairly idiomatic for the API, the error handling gets a bit
complicated if you do it properly.

> >   	for (retry = 0; retry<  adap->retries; retry++) {
> > @@ -572,6 +574,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
> > 
> >   		if (ret != -EAGAIN) {
> >   			clk_disable(i2c->clk);
> > +			pm_runtime_put_sync(&adap->dev);

> I would go for just pm_runtime_put() here...

Yeah, me too but it seemed idiomatic.  Frankly I don't really understand
why there's a synchronous version of put.

> > +	pm_runtime_enable(&pdev->dev);
> > +	pm_runtime_enable(&i2c->adap.dev);

> Why do we need pm_runtime_enable() on i2c->adap.dev ?
> AFAIK enabling runtime PM on the platform device only should do.

We probably don't need to, no.
