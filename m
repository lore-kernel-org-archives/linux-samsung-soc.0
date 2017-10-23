From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 00/11] drm/exynos: TV path improvements
Date: Mon, 23 Oct 2017 10:37:27 +0900
Message-ID: <59ED47D7.4030908@samsung.com>
References: <CGME20170929100545eucas1p24e82643e9ba934c6a0a1f437f4c0891a@eucas1p2.samsung.com>
        <20170929100542.12849-1-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63636 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932171AbdJWBhb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 22 Oct 2017 21:37:31 -0400
In-reply-to: <20170929100542.12849-1-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>

Hi Andrzej,

Merged. And regarding below patch 9, I will try to contact HW guy to ask for why the difference happens.
[PATCH v2 09/11] drm/exynos/hdmi: quirk for support mode timings conversion

Thanks,
Inki Dae

2017년 09월 29일 19:05에 Andrzej Hajda 이(가) 쓴 글:
> Hi all,
> 
> This patchset does two main things:
> - removes mode limitation for Exynos542x chips, multiple modes were filtered
>   out due to lack of HW version checking code,
> - enables two modes on older chips, thanks to quirk found by Daniel Drake,
>   and published by Tobias Jakobi [1][2].
> Beside this it consolidates the code and performs multiple cleanups.
> 
> v2:
> - addressed comments by Tobias,
> - added Daniel's patch adding 1366x768Hz mode
> 
> [1]: http://www.spinics.net/lists/linux-samsung-soc/msg24617.html
> [2]: https://www.spinics.net/lists/dri-devel/msg150906.html
> 
> Regards
> Andrzej
> 
> 
> Andrzej Hajda (10):
>   drm/exynos/mixer: abstract out output mode setup code
>   drm/exynos/mixer: move mode commit to enable callback
>   drm/exynos/mixer: move resolution configuration to single function
>   drm/exynos/mixer: fix mode validation code
>   drm/exynos/mixer: remove mixer_resources sub-structure
>   drm/exynos/hdmi: remove redundant mode field
>   drm/exynos: add mode_fixup callback to exynos_drm_crtc_ops
>   drm/exynos/mixer: pass actual mode on MIXER to encoder
>   drm/exynos/hdmi: quirk for support mode timings conversion
>   drm/exynos/mixer: enable support for 1024x768 and 1280x1024 modes
> 
> Daniel Drake (1):
>   drm/exynos/hdmi: add 85.5MHz pixel clock for v14 HDMI PHY
> 
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c |  15 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |   3 +
>  drivers/gpu/drm/exynos/exynos_hdmi.c     |  58 ++--
>  drivers/gpu/drm/exynos/exynos_mixer.c    | 458 +++++++++++++++----------------
>  4 files changed, 278 insertions(+), 256 deletions(-)
> 
