From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Initialize L2x0 cache controller for Exynos4 only
Date: Thu, 14 Nov 2013 02:07:07 +0100
Message-ID: <1991908.0kMUaR4gV4@flatron>
References: <1382011392-18199-1-git-send-email-sachin.kamat@linaro.org> <2638150.ifpQGYh5Gk@flatron> <52841E44.8040703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47]:61861 "EHLO
	mail-ee0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751544Ab3KNBHJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Nov 2013 20:07:09 -0500
Received: by mail-ee0-f47.google.com with SMTP id c50so20237eek.20
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Nov 2013 17:07:08 -0800 (PST)
In-Reply-To: <52841E44.8040703@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Will Deacon <will.deacon@arm.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>

Hi Rob,

On Wednesday 13 of November 2013 18:50:12 Rob Herring wrote:
> On 11/13/2013 06:41 PM, Tomasz Figa wrote:
> > Hi Will,
> > 
> > On Friday 25 of October 2013 14:48:52 Will Deacon wrote:
> >> On Sat, Oct 19, 2013 at 03:04:22PM +0100, Tomasz Figa wrote:
> >>> On Saturday 19 of October 2013 18:09:15 Sachin Kamat wrote:
> >>>> Hi Tomasz,
> >>>>
> >>>> On 17 October 2013 18:35, Tomasz Figa <t.figa@samsung.com> wrote:
> >>>>> Hi Sachin,
> >>>>>
> >>>>> On Thursday 17 of October 2013 17:33:12 Sachin Kamat wrote:
> >>>>>> L2x0 cache controller is present only in Cortex-A9 based Exynos4 SoCs.
> >>>>>> Thus move this function to Exynos4 early init call to avoid non-Exynos4
> >>>>>> SoCs from calling this function in multi-platform support.
> >>>>>
> >>>>> I believe that at the time .init_early() is called there is no ioremap()
> >>>>> infrastructure working yet and so L2 cache initialization which needs
> >>>>> it will cause a kernel panic. This patch worked only because currently
> >>>>> there is no L2X0 controller defined in device tree sources of Exynos 4.
> >>>>
> >>>> It is not clear to me as to why device tree entry is required for this
> >>>> to work in current form
> >>>> as we call the  L2X0 init function explicitly.
> >>>
> >>> L2x0 controller is just another IP block on the SoC. In addition its
> >>> registers are memory mapped and the driver needs some way to get their
> >>> location. The function being called explicitly simply scans device tree
> >>> for applicable node and performs rest of the setup only if it finds one.
> >>>
> >>> Ideally there should be no need to call this function explicitly, as it
> >>> should be called by some code based on presence of applicable device tree
> >>> node.
> >>
> >> It's a nice idea, but you need to be careful if you start deferring this
> >> stuff. Aside from the potential performance loss during early boot, I'm not
> >> even sure that the l2x0_init function is safe to run with IRQs enabled.
> >>
> >> Will
> > 
> > I just realised that I have not replied to your message, sorry for that.
> > 
> > So, my intention was not deferring this, but rather making this more
> > generic. In case of Exynos, we call l2x0_of_init() from an early_initcall
> > which is long time already after enabling interrupts, but still before
> > SMP is initialized.
> 
> I believe SMP is enabled before any initcalls.

You're almost right. Before any initcalls, except early_initcalls. This is
a misleading label in init/main.c in an array of initcall names, calling
initcall level 0 "early", but that should be "pure". early_initcalls are
called from a different place in code - see do_pre_smp_initcalls().

> > My idea was to create a generic early_initcall in arch/arm/mm/cache-l2x0.c
> > that would scan DT for applicable node, parse aux_val and aux_mask from
> > such node (if found) and then initialize L2X0 without any need for
> > having platform-specific code.
> > 
> > However my concern here is whether on some platforms such platform code
> > wouldn't be needed anyway. Unfortunately I don't really know enough
> > about L2X0 to be able to answer this myself, at least at the moment.
> 
> Unfortunately, non-secure mode platforms like highbank and omap have to
> make platform specific smc calls.

This is what I was afraid of. Still, I don't think there is no way we
could mitigate this. Maybe firmware_ops infrastructure could be used for
this?

I need to know more about requirements of such platforms w.r.t. L2 cache
initialization to be able to say anything more, though.

Best regards,
Tomasz
