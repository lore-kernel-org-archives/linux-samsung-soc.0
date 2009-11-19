From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 09/19] drivers: serial: add support for Samsung S5PC110
 SoC uart
Date: Thu, 19 Nov 2009 12:13:41 +0000
Message-ID: <20091119121341.GI9763@rakim.wolfsonmicro.main>
References: <1258551194-16018-10-git-send-email-m.szyprowski@samsung.com>
 <1b68c6790911180614y355f656fs828177ecc845ec8e@mail.gmail.com>
 <20091118221345.GB4808@trinity.fluff.org>
 <1b68c6790911181844p3fb32525h11f79f942afb2d64@mail.gmail.com>
 <20091119103336.GB15460@sirena.org.uk>
 <1b68c6790911190305w33e777e3n1ed6b172d67f1639@mail.gmail.com>
 <20091119110827.GE9763@rakim.wolfsonmicro.main>
 <20091119113841.GJ13376@n2100.arm.linux.org.uk>
 <20091119114833.GH9763@rakim.wolfsonmicro.main>
 <000e01ca6911$24ea5d20$6ebf1760$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:48254 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750716AbZKSMNh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2009 07:13:37 -0500
Content-Disposition: inline
In-Reply-To: <000e01ca6911$24ea5d20$6ebf1760$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'jassi brar' <jassisinghbrar@gmail.com>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>

On Thu, Nov 19, 2009 at 01:09:23PM +0100, Marek Szyprowski wrote:
> On Thursday, November 19, 2009 12:49 PM Mark Brown wrote:

> > My suggestion was to push this logic down into the clock API so the
> > serial driver just requests a rate and then clock API picks the best
> > option from the mux.  As well as being nicer from the clock API point of

> What if a device does not operate properly when clocked from one of the
> available clock sources (lets say machine specific problem)? There must
> be a way of setting which clock(s) should not be considered when calculating
> best choice for particular device.

Have the machine driver tell the clock API about this - that's what I
was suggesting originally before I realised there was the mux managment
logic in there.
