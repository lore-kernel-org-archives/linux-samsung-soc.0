From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] irqchip: gic: Allow setting affinity to offline CPUs
Date: Tue, 20 Aug 2013 09:48:25 -0700
Message-ID: <52139DD9.3020004@codeaurora.org>
References: <1377015070-26320-1-git-send-email-t.figa@samsung.com> <52139A5B.5040708@codeaurora.org> <3879851.vmCHJ3AcgQ@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:49045 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751255Ab3HTQs0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 12:48:26 -0400
In-Reply-To: <3879851.vmCHJ3AcgQ@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Kyungmin Park <kyungmin.park@samsung.com>

On 08/20/13 09:41, Tomasz Figa wrote:
> On Tuesday 20 of August 2013 09:33:31 Stephen Boyd wrote:
>> On 08/20/13 09:11, Tomasz Figa wrote:
>>> Sometimes it is necessary to fix interrupt affinity to an offline CPU,
>>> for example in initialization of local timers. This patch modifies
>>> .set_affinity() operation of irq-gic driver to fall back to any
>>> possible
>>> CPU if no online CPU can be found in requested CPU mask.
>>>
>>> This fixes broken Exynos4210 support since commit
>>>
>>> 	ee98d27df6 ARM: EXYNOS4: Divorce mct from local timer API
>>>
>>> caused by timer initialization code unable to set affinity for local
>>> timer interrupts.
>> Care to elaborate further? I don't see how the interrupt affinity is set
>> for a CPU that isn't online because the mct code runs on the CPU that
>> the affinity is being set to.
> Well, please look at secondary_start_kernel() in arch/arm/kernel/smp.c [1]. 
> You can see that notify_cpu_starting() (line 348) that fires the notifier 
> registered in MCT driver is called before set_cpu_online() (line 359) that 
> marks the CPU as online. Also notice that, originally, local timer 
> initialization was happening after set_cpu_online() - see line 365.
>
>

Great, thank you. Please put this information in the commit text next time.

I wonder if we shouldn't make the cpumask_any_and() work on the present
mask instead? If we ever support physical hotplug on ARM I think we
wouldn't want to allow interrupts to go to CPUs that aren't even present
(but still possible).

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
