From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 5/8] drm/exynos: introduce BYTE_PITCH capability
Date: Fri, 11 Aug 2017 13:44:06 +0200
Message-ID: <04da84e3-ce79-0009-36bf-5febaf305ab2@math.uni-bielefeld.de>
References: <20170809114857.4945-1-tjakobi@math.uni-bielefeld.de>
 <CGME20170809115059epcas2p25c4ebecf972fbaf4949db9f760a801e2@epcas2p2.samsung.com>
 <20170809114857.4945-6-tjakobi@math.uni-bielefeld.de>
 <598D696D.80406@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:59192 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753301AbdHKLoJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Aug 2017 07:44:09 -0400
In-Reply-To: <598D696D.80406@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com

Inki Dae wrote:
> 
> 
> 2017년 08월 09일 20:48에 Tobias Jakobi 이(가) 쓴 글:
>> In some of drivers we compute something like 'pitch / cpp' at some
>> point, silently assuming that the pitch (which is in bytes) is
>> divisible by the buffer's cpp. This is not always true, in particular
>> DRM core does not check for pitch alignment in the common case.
>>
>> Introduce a new cap which indicates that the hardware supports a
>> pitch with 'byte-granularity'. If the cap is not set, assume that
>> we need pitch aligned to cpp.
>>
>> We set this cap later for the drivers/planes that support it.
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h   |  1 +
>>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 10 ++++++++++
>>  2 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> index 43afab4bebc3..ec32632485d2 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> @@ -92,6 +92,7 @@ struct exynos_drm_plane {
>>  #define EXYNOS_DRM_PLANE_CAP_SCALE	(1 << 1)
>>  #define EXYNOS_DRM_PLANE_CAP_ZPOS	(1 << 2)
>>  #define EXYNOS_DRM_PLANE_CAP_TILE	(1 << 3)
>> +#define EXYNOS_DRM_PLANE_CAP_BYTE_PITCH	(1 << 4)
> 
> I don't see why this flag is required because cpp value is given always. So I think we can check the pitch alignment regardless of a given flag.
> BTW, it'd better for pitch alignment to be checked by drm core?
How do you want to check the pitch value, if you don't know what the HW can handle?

- Tobias

> 
>>  
>>  /*
>>   * Exynos DRM plane configuration structure.
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
>> index bd3825617b06..734d5ba4eb99 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
>> @@ -185,6 +185,16 @@ exynos_drm_plane_check_format(const struct exynos_drm_plane_config *config,
>>  {
>>  	struct drm_framebuffer *fb = state->base.fb;
>>  
>> +	/*
>> +	 * Some blocks only allow to specify a buffer pitch in terms
>> +	 * of pixels. In these cases, we need to ensure that the pitch
>> +	 * provided by userspace is divisible by the cpp.
>> +	 */
>> +	if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_BYTE_PITCH)) {
>> +		if (fb->pitches[0] % fb->format->cpp[0])
>> +			return -ENOTSUPP;
>> +	}
>> +
>>  	switch (fb->modifier) {
>>  	case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
>>  		if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_TILE))
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
