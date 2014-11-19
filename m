From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration to module init
Date: Wed, 19 Nov 2014 14:29:08 -0800
Message-ID: <7h1toyvn7v.fsf@deeprootsystems.com>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>
	<7hh9xwxsev.fsf@deeprootsystems.com>
	<546CCAB8.9050402@collabora.co.uk>
	<7hbno3ufvx.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:33737 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932428AbaKSW3L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 17:29:11 -0500
Received: by mail-pa0-f46.google.com with SMTP id lj1so1145392pab.33
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2014 14:29:10 -0800 (PST)
In-Reply-To: <7hbno3ufvx.fsf@deeprootsystems.com> (Kevin Hilman's message of
	"Wed, 19 Nov 2014 11:52:50 -0800")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>

Kevin Hilman <khilman@kernel.org> writes:

> Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:
>
>> [adding Paolo and Vivek as cc]
>>
>> Hello,
>>
>> On 11/18/2014 07:41 PM, Kevin Hilman wrote:
>>> 
>>> It fixes the DRM deadlock, issue for me on exynos5800-peach-pi, but then
>>> it proceeds to panic in the workqueue code called by the asoc max98090
>>> codec[1].
>>> 
>>> If I then disable CONFIG_SND_SOC_SNOW, I can get it to boot to a shell,
>>> but I still don't have display output.
>>> 
>>
>> Paolo Pisati pointed out in another thread that he needed the patch
>> "[PATCH v2 2/2] arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy"
>> is also needed to get display working for exynos on linux-next.
>>
>> I've pinged Kukjin to apply this as a -rc fix since is needed after
>> a5ec598 ("phy: exynos-dp-video: Use syscon support to control pmu register")
>> landed in 3.18 which broke the Exynos Display Port PHY:
>>
>> exynos-dp-video-phy 10040728.video-phy: Failed to lookup PMU regmap
>>
>> I've an Exynos5800 Peach Pi now so I wanted to test display on it. Just $subject
>> and [0] should be enough to have display working on Peach Pi 
>
> Yes, with those two patches, peach-pi display working on v3.18-rc5 for me.
>
>> with linux-next but
>> it fails to me with:
>>
>> exynos-mipi-video-phy 10040714.video-phy: can't request region for resource [mem 0x10040714-0x1004071f]
>>
>> The same issue was reported by Paolo a couple of days ago [1].
>
> For me, with linux-next, I'm still getting the DRM deadlock.  Trying
> your patch that moves things to module_init gets past the deadlock, but
> still doesn't boot unless I disable CONFIG_SND_SOC_SNOW.  Doing that I
> see the same video-phy error though.

Another interesting data point is that the 2 patches which get things
working on v3.18-rc5, when applied on Kukjin's for-next branch, result
in a kernel that boots (which is better than linux-next), but without
a working display. :(

Kevin
