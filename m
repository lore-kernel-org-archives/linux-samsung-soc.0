From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 0/7] drm/exynos: panel mode info propagation
Date: Wed, 26 Jul 2017 09:09:21 +0200
Message-ID: <fc043fca-564c-64dc-0c6f-c3e1d89882b5@samsung.com>
References: <CGME20170418124012eucas1p268347111adc9cf1550f7bf228aaeddbf@eucas1p2.samsung.com>
 <1492519203-23537-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:22523 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750883AbdGZHJ0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Jul 2017 03:09:26 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OTO00G5BRVOZR60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Jul 2017 08:09:24 +0100 (BST)
In-reply-to: <1492519203-23537-1-git-send-email-a.hajda@samsung.com>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

On 18.04.2017 14:39, Andrzej Hajda wrote:
> Hi Inki,
>
> This patchset beside cleanup/refactoring patches (01-03) adds code to propagate
> info provided by MIPI-DSI panels about its mode of work (video/command mode).
> The propagation is performed for whole pipeline as every its elements uses it.

Gently ping.

Regards
Andrzej

>
> Regards
> Andrzej
>
>
> Andrzej Hajda (7):
>   drm/exynos/decon5433: use readl_poll_timeout helpers
>   drm/exynos: use helper to set possible crtcs
>   drm/exynos/dsi: refactor panel detection logic
>   drm/exynos: propagate info about command mode from panel
>   drm/exynos/mic: use mode info stored in CRTC to detect i80 mode
>   drm/exynos/decon5433: use mode info stored in CRTC to detect i80 mode
>   dt-bindings: exynos5433-decon: remove i80-if-timings property
>
>  .../bindings/display/exynos/exynos5433-decon.txt   |   6 -
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c      | 118 ++++++-----
>  drivers/gpu/drm/exynos/exynos_dp.c                 |  15 +-
>  drivers/gpu/drm/exynos/exynos_drm_core.c           |   1 +
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c           |  21 +-
>  drivers/gpu/drm/exynos/exynos_drm_crtc.h           |  10 +-
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c            |  12 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.h            |   1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 219 ++++++++++-----------
>  drivers/gpu/drm/exynos/exynos_drm_mic.c            |  44 +----
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  15 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |  25 +--
>  12 files changed, 228 insertions(+), 259 deletions(-)
>
