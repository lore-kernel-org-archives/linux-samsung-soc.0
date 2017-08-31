From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v2 6/9] drm/exynos: introduce BYTE_PITCH capability
Date: Thu, 31 Aug 2017 13:31:12 +0200
Message-ID: <40731f02-2854-1048-cd64-c259330c2d98@math.uni-bielefeld.de>
References: <20170822141944.8138-1-tjakobi@math.uni-bielefeld.de>
 <CGME20170822142304epcas2p160257b12e8a9f3aed71bd55f5dcd524b@epcas2p1.samsung.com>
 <20170822141944.8138-7-tjakobi@math.uni-bielefeld.de>
 <3ee9b3a1-b8ee-2f0b-5ef5-186bfd736806@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:52562 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750790AbdHaLbP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 31 Aug 2017 07:31:15 -0400
In-Reply-To: <3ee9b3a1-b8ee-2f0b-5ef5-186bfd736806@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: inki.dae@samsung.com, Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>

Hello Marek,

first of all thanks for checking this!


Marek Szyprowski wrote:
> Hi Tobias,
> 
> On 2017-08-22 16:19, Tobias Jakobi wrote:
>> In some of subdrivers we compute something like 'pitch / cpp' at some
>> point, silently assuming that the pitch (which is in bytes) is
>> divisible by the buffer's cpp. This must not be true, in particular
>> it depends on the underlying hardware.
>>
>> If userspace should request such a setup, we should communicate this.
>>
>> Introduce a new cap which indicates that the hardware supports a
>> pitch with 'byte-granularity'. If the cap is not set, assume that
>> we need a pitch aligned to cpp.
>>
>> We set this cap in a later patch for the drivers/planes which
>> support it.
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> 
> I briefly checked the patch and it looks fine, but I really wonder whether
> drivers should support such strange formats, when pitches are not multiple
> of pixel size in bytes. I cannot find any sane use case for such formats.
Apparantly the hw can do it, so why not support it? A potential use case I see
would be an application that uses a single buffer with multiple pixelformats.

Let buffer-size = width * height * sizeof(uint16_t), with width odd. Then the
buffer pitch is not divisible by 4. In case the hw supports it, we can still use
e.g. XRGB8888 with this setup.


> Maybe it would make sense to add a check for it in DRM core? I also didn't
> notice a check for that in any other drivers, but some of them also
> compute 'pitch / cpp' values.
I thought about some check in DRM core, but I didn't see a clean way to add it,
since the behaviour very much depends on the hw.  Well, except if you just want
to enforce 'pitch % cpp == 0' everywhere. Not sure how the rest of the DRM folks
thinks about it.

With best wishes,
Tobias



>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_drv.h   |  1 +
>>   drivers/gpu/drm/exynos/exynos_drm_plane.c | 10 ++++++++++
>>   2 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> index 43afab4bebc3..ec32632485d2 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> @@ -92,6 +92,7 @@ struct exynos_drm_plane {
>>   #define EXYNOS_DRM_PLANE_CAP_SCALE    (1 << 1)
>>   #define EXYNOS_DRM_PLANE_CAP_ZPOS    (1 << 2)
>>   #define EXYNOS_DRM_PLANE_CAP_TILE    (1 << 3)
>> +#define EXYNOS_DRM_PLANE_CAP_BYTE_PITCH    (1 << 4)
>>     /*
>>    * Exynos DRM plane configuration structure.
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c
>> b/drivers/gpu/drm/exynos/exynos_drm_plane.c
>> index 133af72f5c90..17e47b8f0d6a 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
>> @@ -185,6 +185,16 @@ exynos_drm_plane_check_format(const struct
>> exynos_drm_plane_config *config,
>>   {
>>       struct drm_framebuffer *fb = state->base.fb;
>>   +    /*
>> +     * Some blocks only allow to specify a buffer pitch in terms
>> +     * of pixels. In these cases, we need to ensure that the pitch
>> +     * provided by userspace is divisible by the cpp.
>> +     */
>> +    if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_BYTE_PITCH)) {
>> +        if (fb->pitches[0] % fb->format->cpp[0])
>> +            return -ENOTSUPP;
>> +    }
>> +
>>       switch (fb->modifier) {
>>       case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
>>           if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_TILE))
> 
> Best regards
