From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 09/19] drivers: serial: add support for Samsung S5PC110 SoC
 uart
Date: Thu, 19 Nov 2009 13:09:23 +0100
Message-ID: <000e01ca6911$24ea5d20$6ebf1760$%szyprowski@samsung.com>
References: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
 <1258551194-16018-10-git-send-email-m.szyprowski@samsung.com>
 <1b68c6790911180614y355f656fs828177ecc845ec8e@mail.gmail.com>
 <20091118221345.GB4808@trinity.fluff.org>
 <1b68c6790911181844p3fb32525h11f79f942afb2d64@mail.gmail.com>
 <20091119103336.GB15460@sirena.org.uk>
 <1b68c6790911190305w33e777e3n1ed6b172d67f1639@mail.gmail.com>
 <20091119110827.GE9763@rakim.wolfsonmicro.main>
 <20091119113841.GJ13376@n2100.arm.linux.org.uk>
 <20091119114833.GH9763@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37992 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716AbZKSMJ0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2009 07:09:26 -0500
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KTC004JRV3UCW@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Nov 2009 21:09:31 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KTC00NPAV3P3H@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Nov 2009 21:09:30 +0900 (KST)
In-reply-to: <20091119114833.GH9763@rakim.wolfsonmicro.main>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'jassi brar' <jassisinghbrar@gmail.com>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hello,

On Thursday, November 19, 2009 12:49 PM Mark Brown wrote:

> On Thu, Nov 19, 2009 at 11:38:41AM +0000, Russell King - ARM Linux wrote:
> 
> > I'm not sure what you're commenting on precisely, but the Samsung code as
> > a whole doesn't use the clk API very well, and I suspect that is starting
> > to cause people to have to pass clock names around.
> 
> That's what I'd thought originally but it's not quite the problem here.
> The issue is that Samsung serial port clock is chosen from a mux and the
> logic to select which of the inputs to that mux should be used is in the
> serial driver.  This means that if the set of parent clocks changes then
> the serial driver needs to be told what they are.
> 
> My suggestion was to push this logic down into the clock API so the
> serial driver just requests a rate and then clock API picks the best
> option from the mux.  As well as being nicer from the clock API point of
> view this would also allow other drivers to use the same logic since
> these muxes are a standard idiom for Samsung SoCs.

What if a device does not operate properly when clocked from one of the
available clock sources (lets say machine specific problem)? There must
be a way of setting which clock(s) should not be considered when calculating
best choice for particular device.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
