From: Kevin Hilman <khilman@kernel.org>
Subject: Re: Peach Pi/Pit boot failures in linux-next  (was Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration to module init)
Date: Fri, 21 Nov 2014 08:38:52 -0800
Message-ID: <7hzjbko6eb.fsf@deeprootsystems.com>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>
	<7hh9xwxsev.fsf@deeprootsystems.com>
	<546CCAB8.9050402@collabora.co.uk>
	<CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com>
	<7hppchsu29.fsf@deeprootsystems.com>
	<546E293D.9000300@collabora.co.uk>
	<7hbno1spdt.fsf@deeprootsystems.com>
	<546F3837.5020706@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:58756 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758835AbaKUQi4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 11:38:56 -0500
Received: by mail-pd0-f174.google.com with SMTP id w10so5608381pde.33
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2014 08:38:55 -0800 (PST)
In-Reply-To: <546F3837.5020706@collabora.co.uk> (Javier Martinez Canillas's
	message of "Fri, 21 Nov 2014 14:03:51 +0100")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, Vivek Gautam <gautamvivek1987@gmail.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>

Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:

> [adding Kukjin as cc and dropping dri-devel]
>
> Hello Kevin,
>
> On 11/20/2014 07:22 PM, Kevin Hilman wrote:
>>> My kernel command line is almost the same with the difference that
>>> I'm using clk_ignore_unused and I just checked that not passing
>>> that parameter, makes linux-next to hang showing the same output
>>> log that Kevin reported.
>> 
>> Ah!  Good find.  I confirm that adding clk_ignore_unused is getting
>> me booting again, but of course that is just masking a problem, so I
>> hope someone can shed light on which clock isn't being correctly
>> managed.
>> 
>
> True, I'm renaming the thread subject to track these issues separately
> of the original Exynos DRM bug since these are unrelated.
>
> So, I see two different boot failures on the Peach Pi[t] Chromebooks:
>
> 1) next20141121 boot fails due snd-soc-snow
>
> Disabling CONFIG_SND_SOC_SNOW makes the boot to got a little further
> but still fails with the second issue:
>
> 2) next20141121 boot hangs if unused clocks are disabled.
>
> I tried to root cause these two issues but didn't see anything evident
> so I'll find a last known good commit and bisect. If anyone has an
> idea of the possible causes for these issues that would be appreciated.

FWIW, in addition to the failures on 5800/peach-pi, I'm also seeing boot
failures in next-20141121 on the exynos5420-arndale-octa[1].  Adding
clk_ignore_unused gets things booting there as well.

What's interesting is that my exynos5422-odroid-xu3 is booting fine as
well as the exynos5420-arndale and the exynos5410-odroid-xu (shown as
exynos5410-smdk5410)

Whatever the issue, it definietly seems like a problem that was came
through a driver/subsystem tree because that these boards are all
booting fine with Kukjin's for-next, arm-soc/for-next and
mainline/v3.18-rc5 (all with just plain exynos_defconfig, and without
clk_ignore_unused.)  For example, just looking at peach-pi across all
these trees[2], you can see that it's only failing in linux-next.

Kevin

[1] http://status.armcloud.us/boot/?next-2014112?&exynos
[2] http://status.armcloud.us/boot/?exynos5800-peach-pi

NOTE: the exynos5422-odroid-xu3 is shown as exynos5420-smdk5420 since
      that's the DTS being used, and exynos5410-odroid-xu is shown as
      exynos5410-smdk5410, again due to the DTS being used.
