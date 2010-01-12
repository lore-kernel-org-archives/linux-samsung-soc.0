From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: Samsung SoC clock updates
Date: Tue, 12 Jan 2010 23:50:19 +0000
Message-ID: <20100112235019.GH18532@trinity.fluff.org>
References: <1262917822-26004-1-git-send-email-ben-linux@fluff.org> <20100112091608.GD26435@n2100.arm.linux.org.uk> <20100112220351.GG18532@trinity.fluff.org> <20100112224833.GA19957@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:41659 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752887Ab0ALXuV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jan 2010 18:50:21 -0500
Content-Disposition: inline
In-Reply-To: <20100112224833.GA19957@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org

On Tue, Jan 12, 2010 at 10:48:34PM +0000, Mark Brown wrote:
> On Tue, Jan 12, 2010 at 10:03:51PM +0000, Ben Dooks wrote:
> 
> > I'm not sure that clkdev will do what we need, we have a situatio where
> > our platform-device names change depending on the system and thus we
> > would have to either change the clk array at init time or do our own
> > thing.
> 
> Surely this is exactly the sort of use case that clkdev is designed to
> handle?  Essentially all it does is provide a remapping layer so that
> the data associated with the struct clk doesn't have to bear any direct
> relationship to the device and name used to look it up.  This means that
> the SoC specific code can just define its clock tree in some way that
> looks good for the hardware and then easily layer a mapping to what the
> drivers expect without the two jobs having to interfere with each other.

For the first thing this ends up allocating more memory at run time when
we've already got a list of our clocks created from the compile time
structures that describe them.

I could certainly see that we could use clkdev to deal with this, but I
would like to schedule looking at this until after the current round of
SoC code cleanups and the addition of the s5p6440 SoC.
 
> > I will certainly eliminate the driver's use of clk_get(dev, "name") to get
> > their default bus clock.
> 
> I don't understand what the problem is with that?  That's exactly what
> I'd expect to see a driver doing (possibly with NULL instead of a
> specific name).

>From what I've looked at, the driver _should_ use clk_get(dev, NULL) for
the bus clock, and use named clocks only for extra clocks it may need
such as a codec clock for an audio device. I belive this is what Russell's
initial complaint about the implementation is.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
