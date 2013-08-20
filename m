From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] irqchip: gic: Allow setting affinity to offline CPUs
Date: Wed, 21 Aug 2013 00:11:09 +0200
Message-ID: <2189739.GnKWSuLhMq@flatron>
References: <1377015070-26320-1-git-send-email-t.figa@samsung.com> <20130820211442.GF17845@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f44.google.com ([209.85.214.44]:55106 "EHLO
	mail-bk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751175Ab3HTWLP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 18:11:15 -0400
Received: by mail-bk0-f44.google.com with SMTP id mz10so374694bkb.31
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2013 15:11:14 -0700 (PDT)
In-Reply-To: <20130820211442.GF17845@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>

On Tuesday 20 of August 2013 22:14:42 Russell King - ARM Linux wrote:
> On Tue, Aug 20, 2013 at 06:11:10PM +0200, Tomasz Figa wrote:
> > Sometimes it is necessary to fix interrupt affinity to an offline CPU,
> > for example in initialization of local timers. This patch modifies
> > .set_affinity() operation of irq-gic driver to fall back to any
> > possible CPU if no online CPU can be found in requested CPU mask.
> 
> Err, this is a bad idea.  If a CPU is offline, then it must not respond
> to interrupts.  If you bind an interrupt to an offline CPU, and that
> device asserts its interrupt, what happens?  It doesn't get serviced
> until that CPU comes back online, which may be a very long time.
> 
> If, for example, that is your network device, it would mean your
> network stops operating.  Worse, the network layer will time out and
> reset the ethernet device, trying to get things working (which it
> won't.)
> 
> I think how I used to handle this case prior to genirq is that I fell
> back to any online CPU if the interrupt ended up only routed to offline
> CPUs, but when an offline CPU comes back, it could then be re-routed
> back to that CPU.  In other words, the mask change was non-destructive.
> 
> I think with genirq, such mask changes are destructive.

Yes, that's correct. Although if you _explicitly_ request the interrupt to 
be routed to an offline CPU (i.e. only offline CPUs have bits set in 
passed cpumask), is it an error?

There is at least one irqchip that does not check received cpumask for 
this (metag) and I don't see any documentation saying what should happen 
in this case in .set_affinity operation.

Still, if you have any better solution for the original problem (broken 
Exynos4210 local timers, due to failing irq_set_affinity()), then I'd 
appreciate it, as I don't like the one from this patch too much either.

Best regards,
Tomasz
