From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/7] drm/exynos: panel mode info propagation
Date: Tue, 01 Aug 2017 09:01:46 +0900
Message-ID: <597FC4EA.5080401@samsung.com>
References: <CGME20170418124012eucas1p268347111adc9cf1550f7bf228aaeddbf@eucas1p2.samsung.com>
        <1492519203-23537-1-git-send-email-a.hajda@samsung.com>
        <fc043fca-564c-64dc-0c6f-c3e1d89882b5@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14440 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751114AbdHAABt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 20:01:49 -0400
In-reply-to: <fc043fca-564c-64dc-0c6f-c3e1d89882b5@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org



2017년 07월 26일 16:09에 Andrzej Hajda 이(가) 쓴 글:
> On 18.04.2017 14:39, Andrzej Hajda wrote:
>> Hi Inki,
>>
>> This patchset beside cleanup/refactoring patches (01-03) adds code to propagate
>> info provided by MIPI-DSI panels about its mode of work (video/command mode).
>> The propagation is performed for whole pipeline as every its elements uses it.
> 
> Gently ping.

Sorry for late. Will review them soon.

Thanks,
Inki Dae

> 
> Regards
> Andrzej
> 
>>
>> Regards
>> Andrzej
>>
>>
>> Andrzej Hajda (7):
>>   drm/exynos/decon5433: use readl_poll_timeout helpers
>>   drm/exynos: use helper to set possible crtcs
>>   drm/exynos/dsi: refactor panel detection logic
>>   drm/exynos: propagate info about command mode from panel
>>   drm/exynos/mic: use mode info stored in CRTC to detect i80 mode
>>   drm/exynos/decon5433: use mode info stored in CRTC to detect i80 mode
>>   dt-bindings: exynos5433-decon: remove i80-if-timings property
>>
>>  .../bindings/display/exynos/exynos5433-decon.txt   |   6 -
>>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c      | 118 ++++++-----
>>  drivers/gpu/drm/exynos/exynos_dp.c                 |  15 +-
>>  drivers/gpu/drm/exynos/exynos_drm_core.c           |   1 +
>>  drivers/gpu/drm/exynos/exynos_drm_crtc.c           |  21 +-
>>  drivers/gpu/drm/exynos/exynos_drm_crtc.h           |  10 +-
>>  drivers/gpu/drm/exynos/exynos_drm_dpi.c            |  12 +-
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h            |   1 +
>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 219 ++++++++++-----------
>>  drivers/gpu/drm/exynos/exynos_drm_mic.c            |  44 +----
>>  drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  15 +-
>>  drivers/gpu/drm/exynos/exynos_hdmi.c               |  25 +--
>>  12 files changed, 228 insertions(+), 259 deletions(-)
>>
> 
> 
> 
