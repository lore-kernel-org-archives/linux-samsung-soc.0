From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: Samsung SoC clock updates
Date: Tue, 12 Jan 2010 22:03:51 +0000
Message-ID: <20100112220351.GG18532@trinity.fluff.org>
References: <1262917822-26004-1-git-send-email-ben-linux@fluff.org> <20100112091608.GD26435@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:42722 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753161Ab0ALWD6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jan 2010 17:03:58 -0500
Content-Disposition: inline
In-Reply-To: <20100112091608.GD26435@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Tue, Jan 12, 2010 at 09:16:08AM +0000, Russell King - ARM Linux wrote:
> On Fri, Jan 08, 2010 at 02:30:08AM +0000, Ben Dooks wrote:
> > This is a new set of lcokc updates currently in my next-samsung-clock
> > branch, this has a few updates from the previous releases, including
> > updating of the clock registration code.
> 
> When is the Samsung code going to move over to clkdev?

I'm not sure that clkdev will do what we need, we have a situatio where
our platform-device names change depending on the system and thus we
would have to either change the clk array at init time or do our own
thing.

My aim is to try and look at this once the move to try and ensure that the
Samsung SoC range is using common code for things like clksrc_clk and
various things like gpiolib and then try and sort out updating the handling
of clocks.

I will certainly eliminate the driver's use of clk_get(dev, "name") to get
their default bus clock.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
