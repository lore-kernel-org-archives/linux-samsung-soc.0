From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Initialize L2x0 cache controller for
 Exynos4 only
Date: Fri, 25 Oct 2013 14:48:52 +0100
Message-ID: <20131025134852.GA10286@mudshark.cambridge.arm.com>
References: <1382011392-18199-1-git-send-email-sachin.kamat@linaro.org>
 <3434799.pjC3lbNE3P@amdc1227>
 <CAK9yfHxNPKeRPpxPjoeUs1Xbu9pibn=dLK2U=7atpxEmKY1k1Q@mail.gmail.com>
 <1947285.WNu0Q66K3g@thinkpad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:49636 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753323Ab3JYNtO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Oct 2013 09:49:14 -0400
Content-Disposition: inline
In-Reply-To: <1947285.WNu0Q66K3g@thinkpad>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>

On Sat, Oct 19, 2013 at 03:04:22PM +0100, Tomasz Figa wrote:
> On Saturday 19 of October 2013 18:09:15 Sachin Kamat wrote:
> > Hi Tomasz,
> > 
> > On 17 October 2013 18:35, Tomasz Figa <t.figa@samsung.com> wrote:
> > > Hi Sachin,
> > > 
> > > On Thursday 17 of October 2013 17:33:12 Sachin Kamat wrote:
> > >> L2x0 cache controller is present only in Cortex-A9 based Exynos4 SoCs.
> > >> Thus move this function to Exynos4 early init call to avoid non-Exynos4
> > >> SoCs from calling this function in multi-platform support.
> > > 
> > > I believe that at the time .init_early() is called there is no ioremap()
> > > infrastructure working yet and so L2 cache initialization which needs
> > > it will cause a kernel panic. This patch worked only because currently
> > > there is no L2X0 controller defined in device tree sources of Exynos 4.
> > 
> > It is not clear to me as to why device tree entry is required for this
> > to work in current form
> > as we call the  L2X0 init function explicitly.
> 
> L2x0 controller is just another IP block on the SoC. In addition its
> registers are memory mapped and the driver needs some way to get their
> location. The function being called explicitly simply scans device tree
> for applicable node and performs rest of the setup only if it finds one.
> 
> Ideally there should be no need to call this function explicitly, as it
> should be called by some code based on presence of applicable device tree
> node.

It's a nice idea, but you need to be careful if you start deferring this
stuff. Aside from the potential performance loss during early boot, I'm not
even sure that the l2x0_init function is safe to run with IRQs enabled.

Will
