From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] clocksource: exynos_mct: Set IRQ affinity when the CPU goes online
Date: Tue, 27 Aug 2013 01:26:33 +0200
Message-ID: <2107433.RPK48Jjyd2@flatron>
References: <1377534836-21682-1-git-send-email-t.figa@samsung.com> <20130826230940.GI23960@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:39129 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751620Ab3HZX0j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 19:26:39 -0400
Received: by mail-ee0-f51.google.com with SMTP id c1so1892939eek.38
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Aug 2013 16:26:38 -0700 (PDT)
In-Reply-To: <20130826230940.GI23960@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>

On Monday 26 of August 2013 16:09:41 Stephen Boyd wrote:
> On 08/26, Tomasz Figa wrote:
> > Some variants of Exynos MCT, namely exynos4210-mct at the moment, use
> > normal, shared interrupts for local timers. This means that each
> > interrupt must have correct affinity set to fire only on CPU
> > corresponding to given local timer.
> > 
> > However after recent conversion of clocksource drivers to not use the
> > local timer API for local timer initialization any more, the point of
> > time when local timers get initialized changed and irq_set_affinity()
> > fails because the CPU is not marked as online yet.
> > 
> > This patch fixes this by moving the call to irq_set_affinity() to
> > CPU_ONLINE notification, so the affinity is being set when the CPU
> > goes
> > online.
> > 
> > This fixes a problem with Exynos4210 failing to boot, present since
> > commit> 
> > 	ee98d27df6 ARM: EXYNOS4: Divorce mct from local timer API
> > 
> > due to failing irq_set_affinity().
> > 
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> 
> Looks good to me if you want to go this route.
> 
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>

Thanks. After some testing this seems to work fine and I don't see any 
reason how the timer could be programmed to fire an interrupt before the 
CPU goes online, so it should be fine.

Anyway, we want this to be fixed for 3.12 for sure and since I don't 
really see any better solution we should take this one.

Best regards,
Tomasz
