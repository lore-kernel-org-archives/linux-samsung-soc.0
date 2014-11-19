From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration
 to module init
Date: Wed, 19 Nov 2014 17:52:08 +0100
Message-ID: <546CCAB8.9050402@collabora.co.uk>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk> <7hh9xwxsev.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:59986 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755565AbaKSQwO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 11:52:14 -0500
In-Reply-To: <7hh9xwxsev.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>

[adding Paolo and Vivek as cc]

Hello,

On 11/18/2014 07:41 PM, Kevin Hilman wrote:
> 
> It fixes the DRM deadlock, issue for me on exynos5800-peach-pi, but then
> it proceeds to panic in the workqueue code called by the asoc max98090
> codec[1].
> 
> If I then disable CONFIG_SND_SOC_SNOW, I can get it to boot to a shell,
> but I still don't have display output.
> 

Paolo Pisati pointed out in another thread that he needed the patch
"[PATCH v2 2/2] arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy"
is also needed to get display working for exynos on linux-next.

I've pinged Kukjin to apply this as a -rc fix since is needed after
a5ec598 ("phy: exynos-dp-video: Use syscon support to control pmu register")
landed in 3.18 which broke the Exynos Display Port PHY:

exynos-dp-video-phy 10040728.video-phy: Failed to lookup PMU regmap

I've an Exynos5800 Peach Pi now so I wanted to test display on it. Just $subject
and [0] should be enough to have display working on Peach Pi with linux-next but
it fails to me with:

exynos-mipi-video-phy 10040714.video-phy: can't request region for resource [mem 0x10040714-0x1004071f]

The same issue was reported by Paolo a couple of days ago [1].

Vivek,

Any idea what could cause this regression on linux-next? As reported by Paolo this
works well for me in 3.18-rc5.

Best regards,
Javier

[0]: https://lkml.org/lkml/2014/10/30/394
[1]: http://www.spinics.net/lists/linux-samsung-soc/msg39032.html
