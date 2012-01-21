From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Add stub runtime power management
Date: Sat, 21 Jan 2012 21:38:13 +0100
Message-ID: <4F1B2235.4000009@gmail.com>
References: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com> <1327152527-11364-2-git-send-email-broonie@opensource.wolfsonmicro.com> <4F1ADF5A.6000806@gmail.com> <20120121183155.GE10751@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:37439 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751015Ab2AUUiS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Jan 2012 15:38:18 -0500
In-Reply-To: <20120121183155.GE10751@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <khali@linux-fr.org>, Wolfram Sang <w.sang@pengutronix.de>, Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 01/21/2012 07:31 PM, Mark Brown wrote:
> On Sat, Jan 21, 2012 at 04:52:58PM +0100, Sylwester Nawrocki wrote:
>> On 01/21/2012 02:28 PM, Mark Brown wrote:
> 
>>> +	pm_runtime_get_sync(&adap->dev);
>>>    	clk_enable(i2c->clk);
> 
>> It looks a bit strange to have pm_runtime* and manual clock control side
>> by side. How about implementing proper runtime_suspend/resume calls and
>> moving clk_enable/disable to these handlers ?
> 
> I'd rather not do that in a single patch, and really we ought to be
> doing more than just stopping and starting the clocks anyway.  Given

Agreed.
> that the rather serious problems with getting I2C patches applied I'd
> rather do as little as possible in individual patches.
> 
> It would also introduce a regression for systems that don't use runtime
> PM (probably most s3c24xx ones).

Indeed, I'd forgotten about this fact for a while. I suspect the Run-time PM
core functionality could be enabled on those platform, allowing to make the
common driver dependant on PM_RUNTIME. Not sure if that's acceptable for
the smaller SoCs though. It rather sounds more like lots of trouble for 
little benefits. Maybe it's desirable to do that at some point anyway.
 
>> It might also make sense to check return value of pm_runtime_get_sync().
> 
> This is fairly idiomatic for the API, the error handling gets a bit
> complicated if you do it properly.

OK.

>>>    	for (retry = 0; retry<   adap->retries; retry++) {
>>> @@ -572,6 +574,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
>>>
>>>    		if (ret != -EAGAIN) {
>>>    			clk_disable(i2c->clk);
>>> +			pm_runtime_put_sync(&adap->dev);
> 
>> I would go for just pm_runtime_put() here...
> 
> Yeah, me too but it seemed idiomatic.  Frankly I don't really understand
> why there's a synchronous version of put.

The synchronous put callbacks might be needed for instance in a bus core code
to make sure the child device drivers aren't accessing resources while
bus adapter (USB/PCI) is being unplugged for example. In cases like platform 
I2C bus controller it might be more optimal to use asynchronous put versions.
As there are usually performed fast multiple adjacent transfers and multiple
put runtime get/put might be merged to one get/put due to scheduling latency.
However I've never really measured that. Implementing autosuspend might give
some insights about that.
