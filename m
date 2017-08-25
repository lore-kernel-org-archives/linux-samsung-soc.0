From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v2 0/9] drm/exynos: misc fixes and more
Date: Fri, 25 Aug 2017 15:16:15 +0200
Message-ID: <4a1cdce0-78fa-0489-c1ca-24a46d3ccdc1@math.uni-bielefeld.de>
References: <CGME20170822142004epcas4p4778b4a0fcf04c7ba4a0d70e995cbad73@epcas4p4.samsung.com>
 <20170822141944.8138-1-tjakobi@math.uni-bielefeld.de>
 <599FC1E1.10406@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:60775 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1756751AbdHYNQQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Aug 2017 09:16:16 -0400
In-Reply-To: <599FC1E1.10406@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com

Inki Dae wrote:
> Hi Tobias,
> 
> Regarding below two patches, I'd like to have more review so I will consider to merge them in next turn. Sorry for this.
Thanks, calling out to potential reviewers then :-)

- Tobias


>   drm/exynos: introduce BYTE_PITCH capability
>   drm/exynos: add BYTE_PITCH cap for all supported planes
> 
> Thanks,
> Inki Dae
> 
> 2017년 08월 22일 23:19에 Tobias Jakobi 이(가) 쓴 글:
>> Hello,
>>
>> this is the second iteration of [1], with the following changes:
>> - split patch 3/8 (suggested by Inki)
>> - zero init registers in patch 4/8 (suggested by Inki)
>> - rephrased commit description of patch 5/8 to make it more
>>   clear that this behaviour depends on the hw
>> - replace zero with linear modifier in patch 2/8
>>
>>
>> Summary:
>> (a) Enables support for NV12MT in the mixer.
>> (b) Sanitizes buffer pitch for HW with restrictions.
>> (c) Misc fixes
>>
>> With best wishes,
>> Tobias
>>
>> [1] https://www.spinics.net/lists/linux-samsung-soc/msg60235.html
>>
>>
>> Tobias Jakobi (9):
>>   drm/exynos: mixer: fix chroma comment in vp_video_buffer()
>>   drm/exynos: mixer: enable NV12MT support for the video plane
>>   drm/exynos: mixer: simplify vp_video_buffer()
>>   drm/exynos: mixer: simplify mixer_graph_buffer()
>>   drm/exynos: mixer: remove src offset from mixer_graph_buffer()
>>   drm/exynos: introduce BYTE_PITCH capability
>>   drm/exynos: add BYTE_PITCH cap for all supported planes
>>   drm/exynos: consistent use of cpp
>>   drm/exynos: simplify set_pixfmt() in DECON and FIMD drivers
>>
>>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 17 +++++-----
>>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 13 +++-----
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h       |  2 ++
>>  drivers/gpu/drm/exynos/exynos_drm_fb.c        |  2 ++
>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 17 ++++------
>>  drivers/gpu/drm/exynos/exynos_drm_plane.c     | 37 +++++++++++++++++++++
>>  drivers/gpu/drm/exynos/exynos_mixer.c         | 48 +++++++++------------------
>>  7 files changed, 75 insertions(+), 61 deletions(-)
>>
