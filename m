From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration to module init
Date: Tue, 18 Nov 2014 14:46:38 -0800
Message-ID: <7h4mtwxh2p.fsf@deeprootsystems.com>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>
	<7hh9xwxsev.fsf@deeprootsystems.com> <20141118202836.GB23031@joana>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:55091 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932305AbaKRWqk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 17:46:40 -0500
Received: by mail-pa0-f46.google.com with SMTP id lj1so1283254pab.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2014 14:46:40 -0800 (PST)
In-Reply-To: <20141118202836.GB23031@joana> (Gustavo Padovan's message of
	"Tue, 18 Nov 2014 18:28:36 -0200")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Gustavo Padovan <gustavo@padovan.org> writes:

> 2014-11-18 Kevin Hilman <khilman@kernel.org>:
>
>> Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:
>> 
>> > The Exynos DRM driver register its sub-devices platform drivers in
>> > the probe function but after commit 43c0767 ("of/platform: Move
>> > platform devices under /sys/devices/platform"), this is causing
>> > a deadlock in __driver_attach(). Fix this by moving the platform
>> > drivers registration to exynos_drm_init().
>> >
>> > Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
>> > Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> > ---
>> >
>> > This issue was reported by both Krzysztof Kozlowski [0] and Kevin Hilman [1].
>> >
>> > Inki Dae said that he will fix it property by separating the Exynos DRM
>> > driver in different sub-modules but I post this patch as RFC anyways so
>> > others can test if this fixes their boot issue.
>> 
>> It fixes the DRM deadlock, issue for me on exynos5800-peach-pi, but then
>> it proceeds to panic in the workqueue code called by the asoc max98090
>> codec[1].
>> 
>> If I then disable CONFIG_SND_SOC_SNOW, I can get it to boot to a shell,
>> but I still don't have display output.
>> 
>> Is anyone at Samsung testing linux-next?  If so, on what platforms?  It
>> would really be nice if your linux-next work was tested on these
>> publically-available 542x/5800 platforms (peach-pi, peach-pit,
>> odroid-xu3) which would also allow lots of others to help you test and
>> validate.
>
> It would also be good to add drm-exynos-next to the daily linux-next build.
> Currently drm-exynos-next is ahead of linux-next. This patch from Javier for
> example only applies on linux-next.

Which tree is the drm-exynos-next branch in?

Kevin
