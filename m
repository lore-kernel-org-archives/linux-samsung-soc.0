From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 3/3] clocksource: exynos_mct: Optimize register reads
 with ldmia
Date: Wed, 4 Jun 2014 20:05:47 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1406042004140.3319@nanos>
References: <1401903034-20074-1-git-send-email-dianders@chromium.org> <1401903034-20074-3-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:40502 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750750AbaFDSFy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jun 2014 14:05:54 -0400
In-Reply-To: <1401903034-20074-3-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, Chirantan Ekbote <chirantan@chromium.org>, David Riley <davidriley@chromium.org>, olof@lixom.net, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Wed, 4 Jun 2014, Doug Anderson wrote:

> As we saw in (clocksource: exynos_mct: cache mct upper count), the
> time spent reading the MCT shows up fairly high in real-world
> profiles.  That means that it's worth some optimization.
> 
> We get a roughly 10% speedup in userspace gettimeofday() by using an
> ldmia to read the two halfs of the MCT.  That seems like a worthwhile
> thing to do.
> 
> Before: 1173084 us for 1000000 gettimeofday in userspace
> After:  1045674 us for 1000000 gettimeofday in userspace
> 
> NOTE: we could actually do better than this if we really wanted to.
> Technically we could register the clocksource as a 32-bit timer and
> only use the "lower" half.  Doing so brings us down to 1014429 us for
> 1000000 gettimeofday in userspace (and doesn't even require assembly
> code).  That would be an alternative to this change.

I was about to ask exactly that question: What's the advantage of the
64 bit dance there? AFAICT nothing.
 
Thanks,

	tglx
