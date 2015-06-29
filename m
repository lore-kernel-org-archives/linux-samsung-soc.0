From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RESEND PATCH v3] clocksource: exynos_mct: fix for sleeping in
 atomic ctx handling cpu hotplug notif.
Date: Mon, 29 Jun 2015 11:24:36 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1506291123320.4037@nanos>
References: <1426151496-5509-1-git-send-email-d.eppel@samsung.com> <1435324984-7328-1-git-send-email-d.eppel@samsung.com> <55910DA6.4070404@linaro.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:57123 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752154AbbF2JYr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jun 2015 05:24:47 -0400
In-Reply-To: <55910DA6.4070404@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Damian Eppel <d.eppel@samsung.com>, kgene@kernel.org, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, m.jabrzyk@samsung.com, stable@vger.kernel.org

On Mon, 29 Jun 2015, Daniel Lezcano wrote:

> On 06/26/2015 03:23 PM, Damian Eppel wrote:
> > This is to fix an issue of sleeping in atomic context when processing
> > hotplug notifications in Exynos MCT(Multi-Core Timer).
> > The issue was reproducible on Exynos 3250 (Rinato board) and Exynos 5420
> > (Arndale Octa board).
> > 
> > Whilst testing cpu hotplug events on kernel configured with DEBUG_PREEMPT
> > and DEBUG_ATOMIC_SLEEP we get following BUG message, caused by calling
> > request_irq() and free_irq() in the context of hotplug notification
> > (which is in this case atomic context).
> 
> Applied as a 4.2 fix.
> 
> Should it be tagged stable@ ?

I have that one queued in tip/timers/urgent already. Please check my
branches before picking up stuff.

Thanks,

	tglx
