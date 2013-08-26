From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] clocksource: exynos_mct: Set IRQ affinity when the CPU
 goes online
Date: Mon, 26 Aug 2013 16:09:41 -0700
Message-ID: <20130826230940.GI23960@codeaurora.org>
References: <1377534836-21682-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:45780 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751575Ab3HZXJm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 19:09:42 -0400
Content-Disposition: inline
In-Reply-To: <1377534836-21682-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>

On 08/26, Tomasz Figa wrote:
> Some variants of Exynos MCT, namely exynos4210-mct at the moment, use
> normal, shared interrupts for local timers. This means that each
> interrupt must have correct affinity set to fire only on CPU
> corresponding to given local timer.
> 
> However after recent conversion of clocksource drivers to not use the
> local timer API for local timer initialization any more, the point of
> time when local timers get initialized changed and irq_set_affinity()
> fails because the CPU is not marked as online yet.
> 
> This patch fixes this by moving the call to irq_set_affinity() to
> CPU_ONLINE notification, so the affinity is being set when the CPU goes
> online.
> 
> This fixes a problem with Exynos4210 failing to boot, present since commit
> 	ee98d27df6 ARM: EXYNOS4: Divorce mct from local timer API
> due to failing irq_set_affinity().
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---

Looks good to me if you want to go this route.

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
