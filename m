From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 09/19] drivers: serial: add support for Samsung S5PC110
 SoC uart
Date: Thu, 19 Nov 2009 11:48:33 +0000
Message-ID: <20091119114833.GH9763@rakim.wolfsonmicro.main>
References: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
 <1258551194-16018-10-git-send-email-m.szyprowski@samsung.com>
 <1b68c6790911180614y355f656fs828177ecc845ec8e@mail.gmail.com>
 <20091118221345.GB4808@trinity.fluff.org>
 <1b68c6790911181844p3fb32525h11f79f942afb2d64@mail.gmail.com>
 <20091119103336.GB15460@sirena.org.uk>
 <1b68c6790911190305w33e777e3n1ed6b172d67f1639@mail.gmail.com>
 <20091119110827.GE9763@rakim.wolfsonmicro.main>
 <20091119113841.GJ13376@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:37285 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752057AbZKSLs2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2009 06:48:28 -0500
Content-Disposition: inline
In-Reply-To: <20091119113841.GJ13376@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: jassi brar <jassisinghbrar@gmail.com>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Thu, Nov 19, 2009 at 11:38:41AM +0000, Russell King - ARM Linux wrote:

> I'm not sure what you're commenting on precisely, but the Samsung code as
> a whole doesn't use the clk API very well, and I suspect that is starting
> to cause people to have to pass clock names around.

That's what I'd thought originally but it's not quite the problem here.
The issue is that Samsung serial port clock is chosen from a mux and the
logic to select which of the inputs to that mux should be used is in the
serial driver.  This means that if the set of parent clocks changes then
the serial driver needs to be told what they are.

My suggestion was to push this logic down into the clock API so the
serial driver just requests a rate and then clock API picks the best
option from the mux.  As well as being nicer from the clock API point of
view this would also allow other drivers to use the same logic since
these muxes are a standard idiom for Samsung SoCs.

> I've tried to persuade Ben to tidy this up and convert over to clkdev
> before it becomes too big a problem, but I've had little success.  I
> suspect it's now grown too big to be tackled sanely.

clkdev would be nice but I don't think it'd deal with the issue here.
