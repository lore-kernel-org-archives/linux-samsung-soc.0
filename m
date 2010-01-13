From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: Samsung SoC clock updates
Date: Wed, 13 Jan 2010 11:57:46 +0000
Message-ID: <20100113115746.GA27473@rakim.wolfsonmicro.main>
References: <1262917822-26004-1-git-send-email-ben-linux@fluff.org>
 <20100112091608.GD26435@n2100.arm.linux.org.uk>
 <20100112220351.GG18532@trinity.fluff.org>
 <20100112224833.GA19957@sirena.org.uk>
 <20100112235019.GH18532@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:59862 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752192Ab0AML5s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Jan 2010 06:57:48 -0500
Content-Disposition: inline
In-Reply-To: <20100112235019.GH18532@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org

On Tue, Jan 12, 2010 at 11:50:19PM +0000, Ben Dooks wrote:
> On Tue, Jan 12, 2010 at 10:48:34PM +0000, Mark Brown wrote:

> > I don't understand what the problem is with that?  That's exactly what
> > I'd expect to see a driver doing (possibly with NULL instead of a
> > specific name).

> From what I've looked at, the driver _should_ use clk_get(dev, NULL) for
> the bus clock, and use named clocks only for extra clocks it may need
> such as a codec clock for an audio device. I belive this is what Russell's
> initial complaint about the implementation is.

AFAICT that's a relatively cosmetic issue, but I don't know how Russell
feels about that one.  If the block has multiple clocks it can actually
get a bit confusing trying to remember what the default clock should be.

The issues I've noticed have been that at the minute the lookups are
essentially using a global namespace for the clocks (since the only bit
of the struct device that gets looked at when doing lookups is the id
field) and that the muxes for clock sources are handled in individual
drivers (which means the drivers need to know about the clock tree of
the SoC they're running on).  Given the way the Samsung SoCs structure
their clock trees the name issue isn't quite so pressing as it might be,
it'd probably only really bite if Samsung decide to change the names of
the clocks.
