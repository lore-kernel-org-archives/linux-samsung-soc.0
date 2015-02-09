From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: exynos4412: misc issues on Hardkernel Odroid boards
Date: Mon, 09 Feb 2015 21:28:10 +0100
Message-ID: <54D9185A.10607@math.uni-bielefeld.de>
References: <54D779FB.9070306@math.uni-bielefeld.de> <54D86913.2050109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:39202 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932799AbbBIU2L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Feb 2015 15:28:11 -0500
In-Reply-To: <54D86913.2050109@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>

Hello!

Marek Szyprowski wrote:
> I didn't observe any issues with 'ondemand' governor. I've just tested it
> on next-20150204 with "[PATCH v2 0/3] Add support for hardware reset of
> eMMC
> card on reboot" patches added
> (http://www.spinics.net/lists/linux-mmc/msg30621.html) and reboot works
> fine.
Since I'm not using an eMMC card, I don't think the pwrseq stuff is
going to make a difference here.
Have you checked this with the PS_HOLD patch applied, or without?
Anyway, guess I'm going to recheck this, maybe with some other governors
too.


> This is known issue. To properly solve it, we need to rewrite exynos4 clock
> driver and integrate power domain support for handling of ISP clocks.
> Sylwester can provide more details.
Oh, that sounds like quite some work. Looking forward to hear from
Sylwester about this.


> Right. That's because CPU is busy looping instead of proper shutdown.
> I've just
> posted a patch for solving this issue on all Exynos SoCs, see "[PATCH]
> exynos:
> pmu: use PS_HOLD based poweroff for all supported SoCs" thread.
Like stated in my other mail, this got fixed by your patch. Thanks!


> The fix for this issue has been queued to mmc-next:
> https://git.linaro.org/people/ulf.hansson/mmc.git/commit/017210d1c0dc2e2d3b142985cb31d90b98dc0f0f
Have removed my hotfix and applied this one. Haven't encountered and
spinlock BUGs yet, but I'll keep on testing.


With best wishes,
Tobias
