From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH 00/25] Exynos DRM: new life of IPP (Image Post Processing) subsystem
Date: Thu, 12 Nov 2015 11:14:01 +0000
Message-ID: <CAPj87rNz6vYrcjgV1fdSgE-ZCHnFFNfJKqskTsu2C1+KkmW_gQ@mail.gmail.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:34178 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752679AbbKLLOD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Nov 2015 06:14:03 -0500
Received: by wmvv187 with SMTP id v187so27378147wmv.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Nov 2015 03:14:01 -0800 (PST)
In-Reply-To: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Vetter <daniel@ffwll.ch>, eric@anholt.net

Hi Marek,

On 10 November 2015 at 13:23, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> This patch series introduces a new life into Exynos IPP (Image Post
> Processing) subsystem by integrating it (transparently for userspace
> applications) with Exynos DRM core plane management. This means that all
> CRTC drivers transparently get support for standard features of IPP
> subsystem like rotation and scaling.
>
> Support for features not supported natively by CRTC drivers is
> implemented with a help of temporary framebuffers, where image data is
> processed by IPP subsystem before performing the scanout by a CRTC driver.
>
> This patchset is a first version of this 'new feature' and I would like
> get some comments on the proposed approach. I plan to continue working
> on enhancing Exynos DRM drivers and especially do the cleanup the IPP
> subsystem.
>
> Most of the new features are added by the last 2 patches. All other
> patches are bugfixes in various Exynos DRM subdrivers and significant
> core rewrite - introducing a subclass of drm_plane_state was needed and
> all drivers have been converted to use it. Some initial cleanups in IPP
> subsystem were also needed to let Exynos core to call it internally from
> the driver core. This part will be cleaned even more in the future.

Hm, interesting. The RPi has a similar setup - VC4 can work either
online (realtime scanout) or offline (mem2mem). Once the scene crosses
a certain complexity boundary, it can no longer be composed in
realtime and must fall back to mem2mem before it can be displayed.

There was talk of having the fallback handled transparently in KMS for
VC4 - similar to this - but the conclusion seemed to be that it was an
inappropriate level of hidden complexity for KMS, and instead would
best be handled by something like HWComposer directing it. Using HWC
would then let you more intelligently split the scene from userspace
(e.g. flatten some components but retain others as active planes).

Dan V, Eric - thoughts?

Cheers,
Daniel
