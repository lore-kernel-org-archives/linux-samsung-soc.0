From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] irqchip: gic: Allow setting affinity to offline CPUs
Date: Tue, 20 Aug 2013 18:41:54 +0200
Message-ID: <3879851.vmCHJ3AcgQ@amdc1227>
References: <1377015070-26320-1-git-send-email-t.figa@samsung.com>
 <52139A5B.5040708@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42999 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751625Ab3HTQl6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 12:41:58 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MRU00B7G91N21D0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Aug 2013 17:41:56 +0100 (BST)
In-reply-to: <52139A5B.5040708@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Kyungmin Park <kyungmin.park@samsung.com>

On Tuesday 20 of August 2013 09:33:31 Stephen Boyd wrote:
> On 08/20/13 09:11, Tomasz Figa wrote:
> > Sometimes it is necessary to fix interrupt affinity to an offline CPU,
> > for example in initialization of local timers. This patch modifies
> > .set_affinity() operation of irq-gic driver to fall back to any
> > possible
> > CPU if no online CPU can be found in requested CPU mask.
> > 
> > This fixes broken Exynos4210 support since commit
> > 
> > 	ee98d27df6 ARM: EXYNOS4: Divorce mct from local timer API
> > 
> > caused by timer initialization code unable to set affinity for local
> > timer interrupts.
> 
> Care to elaborate further? I don't see how the interrupt affinity is set
> for a CPU that isn't online because the mct code runs on the CPU that
> the affinity is being set to.

Well, please look at secondary_start_kernel() in arch/arm/kernel/smp.c [1]. 
You can see that notify_cpu_starting() (line 348) that fires the notifier 
registered in MCT driver is called before set_cpu_online() (line 359) that 
marks the CPU as online. Also notice that, originally, local timer 
initialization was happening after set_cpu_online() - see line 365.

[1] - http://lxr.free-electrons.com/source/arch/arm/kernel/smp.c?a=arm#L312

Best regards,
Tomasz
