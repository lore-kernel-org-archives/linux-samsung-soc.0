From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 00/10] drm/exynos: TV path improvements
Date: Mon, 11 Sep 2017 15:54:40 +0200
Message-ID: <29e9a521-ba8e-4753-38df-665e50bbc4cb@math.uni-bielefeld.de>
References: <CGME20170906103727eucas1p23614a8da470a625d760b50095a4a4ad1@eucas1p2.samsung.com>
 <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:41845 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751216AbdIKNym (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Sep 2017 09:54:42 -0400
In-Reply-To: <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>

Hello Andrzej,

just did a quick test and looks good so far. One thing I noticed is that
compared to Daniel's approach you just manipulate HDMI_TG_HACT_{ST,SZ}_L,
instead of HDMI_TG_VACT_SZ_L + HDMI_TG_HACT_{ST,SZ}_L. I just wanted to make
sure that on the HDMI level, this does the same thing?

I'll try to do a proper review tomorrow.

I also noticed that I have another patch by Daniel in my tree, which, together
with the quirk, enables 1366x768@60Hz. Going to send it shortly, since it could
probably go along with this series.

With best wishes,
Tobias



Andrzej Hajda wrote:
> Hi all,
> 
> This patchset does two main things:
> - removes mode limitation for Exynos542x chips, multiple modes were filtered
>   out due to lack of HW version checking code,
> - enables two modes on older chips, thanks to quirk found by Daniel Drake,
>   and published by Tobias Jakobi [1][2].
> Beside this it consolidates the code and performs multiple cleanups.
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
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c |  15 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |   3 +
>  drivers/gpu/drm/exynos/exynos_hdmi.c     |  49 ++--
>  drivers/gpu/drm/exynos/exynos_mixer.c    | 452 +++++++++++++++----------------
>  4 files changed, 265 insertions(+), 254 deletions(-)
> 
