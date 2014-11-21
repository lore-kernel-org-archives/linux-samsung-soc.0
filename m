From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: Peach Pi/Pit boot failures in linux-next  (was Re: [RFC PATCH
 1/1] drm/exynos: Move platform drivers registration to module init)
Date: Fri, 21 Nov 2014 21:49:01 +0100
Message-ID: <546FA53D.2060807@collabora.co.uk>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>	<7hh9xwxsev.fsf@deeprootsystems.com>	<546CCAB8.9050402@collabora.co.uk>	<CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com>	<7hppchsu29.fsf@deeprootsystems.com>	<546E293D.9000300@collabora.co.uk>	<7hbno1spdt.fsf@deeprootsystems.com>	<546F3837.5020706@collabora.co.uk> <7hzjbko6eb.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:34862 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752018AbaKUUtI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 15:49:08 -0500
In-Reply-To: <7hzjbko6eb.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Vivek Gautam <gautamvivek1987@gmail.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>

Hello Kevin,

On 11/21/2014 05:38 PM, Kevin Hilman wrote:
>> So, I see two different boot failures on the Peach Pi[t] Chromebooks:
>>
>> 1) next20141121 boot fails due snd-soc-snow
>>
>> Disabling CONFIG_SND_SOC_SNOW makes the boot to got a little further
>> but still fails with the second issue:
>>
>> 2) next20141121 boot hangs if unused clocks are disabled.
>>
>> I tried to root cause these two issues but didn't see anything evident
>> so I'll find a last known good commit and bisect. If anyone has an
>> idea of the possible causes for these issues that would be appreciated.
> 
> FWIW, in addition to the failures on 5800/peach-pi, I'm also seeing boot
> failures in next-20141121 on the exynos5420-arndale-octa[1].  Adding
> clk_ignore_unused gets things booting there as well.
> 
> What's interesting is that my exynos5422-odroid-xu3 is booting fine as
> well as the exynos5420-arndale and the exynos5410-odroid-xu (shown as
> exynos5410-smdk5410)
> 
> Whatever the issue, it definietly seems like a problem that was came
> through a driver/subsystem tree because that these boards are all
> booting fine with Kukjin's for-next, arm-soc/for-next and
> mainline/v3.18-rc5 (all with just plain exynos_defconfig, and without
> clk_ignore_unused.)  For example, just looking at peach-pi across all
> these trees[2], you can see that it's only failing in linux-next.
>

By bisecting I found that the commit introducing both regressions is:

ae43b32 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power Management support v12")

By reverting ae43b32, next-20141121 boots with both CONFIG_SND_SOC_SNOW=y
and *without* clk_ignore_unused.

Krzysztof,

I see you are the author of the patch, maybe you can take a look why this
is causing regressions in some Exynos boards?

Thanks a lot and best regards,
Javier
