From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV310: Implement kernel timers using MCT
Date: Thu, 23 Dec 2010 19:29:48 +0900
Message-ID: <003e01cba28c$5517dee0$ff479ca0$%kim@samsung.com>
References: <1293017221-31037-1-git-send-email-kgene.kim@samsung.com>
 <20101222225555.GH14693@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:16083 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752203Ab0LWK3x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Dec 2010 05:29:53 -0500
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LDV004HKMHR9PC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Dec 2010 19:29:51 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LDV00CXLMHRF1@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Dec 2010 19:29:52 +0900 (KST)
In-reply-to: <20101222225555.GH14693@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Changhwan Youn' <chaos.youn@samsung.com>

Russell King - ARM Linux wrote:
> 
> On Wed, Dec 22, 2010 at 08:27:01PM +0900, Kukjin Kim wrote:
> > From: Changhwan Youn <chaos.youn@samsung.com>

(snip)

> > +static void s5pv310_mct_clockevent_init(struct clock_event_device *dev)
> > +{
> > +	dev->mult = div_sc(clk_rate / 2, NSEC_PER_SEC, dev->shift);
> 
> Best use the helper function to calculate both the multipler and shift,
> rather than hard-coding the shift.  As the shift is defined to be '20'
> I guess this was copied rather than calculated for the optimal value.
> 
You're right...will fix it.

(snip)

> > +static void __init s5pv310_clockevent1_init(void *info)
> > +{
> > +	s5pv310_mct_write(0x1, S5PV310_MCT_L1_TCNTB);
> > +	s5pv310_mct_clockevent_init(&mct_tick1_device);
> > +	mct_tick1_device.cpumask = cpumask_of(1);
> > +	clockevents_register_device(&mct_tick1_device);
> > +
> > +	irq_set_affinity(IRQ_MCT1, cpumask_of(1));
> > +	setup_irq(IRQ_MCT_L1, &mct_tick1_event_irq);
> 
> This looks like it's supporting SMP - is there some reason not to use
> the localtimer support built into SMP, which also supports hotplug CPU
> (the above doesn't because the local clockevents will be automatically
> unregistered.)
> 
As I know, to use the localtimer support, it needs to support PPI.
Unfortunately the MCT of S5PV310 supports SPI. For hotplug CPU, I'm looking
for the methods to register clockevents again at CPU hotplug-in.

> If you don't have a global timer, then register your boot CPU's clock
> event timer as the global timer for the time being - the SMP code needs
> tweaking so that a local timer can be registered early for those without
> global timers.  Until then, if you have a global timer, I strongly
> suggest you register that as a clock event too (it'll automatically
> get shutdown when not needed.)
> 
Ok...will add another timer for the global timer.

(snip)

> > +static cycle_t s5pv310_frc_read(struct clocksource *cs)
> > +{
> > +	unsigned int lo, hi0, hi1;
> > +
> > +	hi0 = __raw_readl(S5PV310_MCT_G_CNT_U);
> > +	lo = __raw_readl(S5PV310_MCT_G_CNT_L);
> > +	dsb();
> > +	hi1 = __raw_readl(S5PV310_MCT_G_CNT_U);
> > +
> > +	if (hi0 != hi1) {
> > +		lo = __raw_readl(S5PV310_MCT_G_CNT_L);
> > +		hi1 = __raw_readl(S5PV310_MCT_G_CNT_U);
> > +	}
> 
> Are you sure this is safe?  Would it not be better to do this as:
> 
> 	hi1 = __raw_readl(S5PV310_MCT_G_CNT_U);
> 	do {
> 		hi0 = hi1;
> 		lo = __raw_readl(S5PV310_MCT_G_CNT_L);
> 		hi1 = __raw_readl(S5PV310_MCT_G_CNT_U);
> 	} while (hi0 != hi1);
> 
> Note that I don't believe you need a dsb() in there either, as device
> accesses are ordered with respect to themselves.  I know it's highly
> unlikely that we'll see two updates, but I think having it obviously
> robust is a good idea.

Yes, would be better..will change as your suggestion.

Merry Xmas :-)
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
