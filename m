From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: exynos4412: misc issues on Hardkernel Odroid boards
Date: Mon, 09 Feb 2015 09:00:19 +0100
Message-ID: <54D86913.2050109@samsung.com>
References: <54D779FB.9070306@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:32205 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932355AbbBIIAX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Feb 2015 03:00:23 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NJH0029WVRB3V30@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Feb 2015 08:04:23 +0000 (GMT)
In-reply-to: <54D779FB.9070306@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>

Hello,

On 2015-02-08 16:00, Tobias Jakobi wrote:
> Hello,
>
> I've collected some of the more serious remaining problems on the
> Hardkernel Odroid boards (here on an X2).
>
> 1) When using cpufreq-exynos and having selected the 'ondemand'
> governor, the system shutdown/reboot process doesn't complete and hangs
> before the end. I'm currently hotfixing this by switching to
> 'performance' governor in a custom initscript.

I didn't observe any issues with 'ondemand' governor. I've just tested it
on next-20150204 with "[PATCH v2 0/3] Add support for hardware reset of eMMC
card on reboot" patches added
(http://www.spinics.net/lists/linux-mmc/msg30621.html) and reboot works 
fine.

> 2) When reading the 'clk_summary' debugfs entry the system locks up
> immediately. Currently hotfixing this by having the ISP powerdomain
> always-on. The problem seems to be known, at least it was mentioned here:
> http://www.spinics.net/lists/linux-samsung-soc/msg39488.html

This is known issue. To properly solve it, we need to rewrite exynos4 clock
driver and integrate power domain support for handling of ISP clocks.
Sylwester can provide more details.

> 3) Maybe related to (1). I'm experiencing high SoC temperatures after
> shutting the system down and leaving the AC connector plugged into the
> board. The shutdown procedure is like mentioned in (1): Switch to
> 'performance' and then do a normal 'shutdown -h now'. I was wondering if
> the Odroid boards need a special shutdown procedure (like designed in
> the odroid-restart handler patch) after all.

Right. That's because CPU is busy looping instead of proper shutdown. 
I've just
posted a patch for solving this issue on all Exynos SoCs, see "[PATCH] 
exynos:
pmu: use PS_HOLD based poweroff for all supported SoCs" thread.

> 4) Spinlock BUGs triggered by the sdhci subsystem (so for the people
> using the system with a SD card). This is also a known problem, I think
> first mentioned here: http://www.spinics.net/lists/linux-mmc/msg27277.html
> Currently fixing this with this patch:
> https://github.com/tobiasjakobi/linux-odroid/commit/abc749843dd7022d01322dca3db0181211a30cd8

The fix for this issue has been queued to mmc-next:
https://git.linaro.org/people/ulf.hansson/mmc.git/commit/017210d1c0dc2e2d3b142985cb31d90b98dc0f0f

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
