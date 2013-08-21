From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] irqchip: gic: Allow setting affinity to offline CPUs
Date: Wed, 21 Aug 2013 14:23:02 +0200
Message-ID: <2014445.LqiPMUoEWf@amdc1227>
References: <1377015070-26320-1-git-send-email-t.figa@samsung.com>
 <2189739.GnKWSuLhMq@flatron> <20130820223916.GB23960@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:15613 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751462Ab3HUMXH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Aug 2013 08:23:07 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MRV0043LRQGTZA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Aug 2013 13:23:04 +0100 (BST)
In-reply-to: <20130820223916.GB23960@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>

[Copying Daniel]

On Tuesday 20 of August 2013 15:39:17 Stephen Boyd wrote:
> On 08/21, Tomasz Figa wrote:
> > On Tuesday 20 of August 2013 22:14:42 Russell King - ARM Linux wrote:
> > > On Tue, Aug 20, 2013 at 06:11:10PM +0200, Tomasz Figa wrote:
> > > > Sometimes it is necessary to fix interrupt affinity to an offline
> > > > CPU,
> > > > for example in initialization of local timers. This patch modifies
> > > > .set_affinity() operation of irq-gic driver to fall back to any
> > > > possible CPU if no online CPU can be found in requested CPU mask.
> > > 
> > > Err, this is a bad idea.  If a CPU is offline, then it must not
> > > respond
> > > to interrupts.  If you bind an interrupt to an offline CPU, and that
> > > device asserts its interrupt, what happens?  It doesn't get serviced
> > > until that CPU comes back online, which may be a very long time.
> > > 
> > > If, for example, that is your network device, it would mean your
> > > network stops operating.  Worse, the network layer will time out and
> > > reset the ethernet device, trying to get things working (which it
> > > won't.)
> > > 
> > > I think how I used to handle this case prior to genirq is that I fell
> > > back to any online CPU if the interrupt ended up only routed to
> > > offline
> > > CPUs, but when an offline CPU comes back, it could then be re-routed
> > > back to that CPU.  In other words, the mask change was
> > > non-destructive.
> > > 
> > > I think with genirq, such mask changes are destructive.
> > 
> > Yes, that's correct. Although if you _explicitly_ request the interrupt
> > to be routed to an offline CPU (i.e. only offline CPUs have bits set
> > in passed cpumask), is it an error?
> > 
> > There is at least one irqchip that does not check received cpumask for
> > this (metag) and I don't see any documentation saying what should
> > happen
> > in this case in .set_affinity operation.
> > 
> > Still, if you have any better solution for the original problem (broken
> > Exynos4210 local timers, due to failing irq_set_affinity()), then I'd
> > appreciate it, as I don't like the one from this patch too much either.
> 
> One "solution" might be to change the irq affinity after the CPU
> is marked online via the hotplug notifier chain. For a short
> period of time the timer interrupt will go to a different CPU but
> I don't see how that is a problem.

After initial testing, this seems to work, but but it still seems a little 
hackish.

I'd like to make sure that nothing bad happens if the irq somehow fires 
before setting the affinity. An opinion of someone that is more into kernel 
timekeeping than me would be nice.

Best regards,
Tomasz
