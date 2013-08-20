From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] irqchip: gic: Allow setting affinity to offline CPUs
Date: Tue, 20 Aug 2013 18:57:17 +0200
Message-ID: <3020706.rrCKqOb5n3@amdc1227>
References: <1377015070-26320-1-git-send-email-t.figa@samsung.com>
 <3879851.vmCHJ3AcgQ@amdc1227> <52139DD9.3020004@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:42716 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751144Ab3HTQ5V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 12:57:21 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MRU002HV9RET3D0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Aug 2013 17:57:19 +0100 (BST)
In-reply-to: <52139DD9.3020004@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Kyungmin Park <kyungmin.park@samsung.com>

On Tuesday 20 of August 2013 09:48:25 Stephen Boyd wrote:
> On 08/20/13 09:41, Tomasz Figa wrote:
> > On Tuesday 20 of August 2013 09:33:31 Stephen Boyd wrote:
> >> On 08/20/13 09:11, Tomasz Figa wrote:
> >>> Sometimes it is necessary to fix interrupt affinity to an offline
> >>> CPU,
> >>> for example in initialization of local timers. This patch modifies
> >>> .set_affinity() operation of irq-gic driver to fall back to any
> >>> possible
> >>> CPU if no online CPU can be found in requested CPU mask.
> >>> 
> >>> This fixes broken Exynos4210 support since commit
> >>> 
> >>> 	ee98d27df6 ARM: EXYNOS4: Divorce mct from local timer API
> >>> 
> >>> caused by timer initialization code unable to set affinity for local
> >>> timer interrupts.
> >> 
> >> Care to elaborate further? I don't see how the interrupt affinity is
> >> set
> >> for a CPU that isn't online because the mct code runs on the CPU that
> >> the affinity is being set to.
> > 
> > Well, please look at secondary_start_kernel() in arch/arm/kernel/smp.c
> > [1]. You can see that notify_cpu_starting() (line 348) that fires the
> > notifier registered in MCT driver is called before set_cpu_online()
> > (line 359) that marks the CPU as online. Also notice that, originally,
> > local timer initialization was happening after set_cpu_online() - see
> > line 365.
> Great, thank you. Please put this information in the commit text next
> time.

Right, I could have added a sentence or two about this.

> I wonder if we shouldn't make the cpumask_any_and() work on the present
> mask instead? If we ever support physical hotplug on ARM I think we
> wouldn't want to allow interrupts to go to CPUs that aren't even present
> (but still possible).

Yes, cpu_present_mask might be better indeed.

Best regards,
Tomasz
