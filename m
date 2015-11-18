From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 14/25] drm/exynos: introduce exynos_drm_plane_config
 structure
Date: Wed, 18 Nov 2015 11:25:50 +0100
Message-ID: <564C522E.1030503@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
 <1447161821-1877-15-git-send-email-m.szyprowski@samsung.com>
 <564B6B4E.7000200@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43229 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750808AbbKRKZy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Nov 2015 05:25:54 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NY000GDBAB3CXA0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Nov 2015 10:25:51 +0000 (GMT)
In-reply-to: <564B6B4E.7000200@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

Hello,

On 2015-11-17 19:00, Tobias Jakobi wrote:
> Marek Szyprowski wrote:
>> This patch adds common structure for keeping plane configuration and
>> capabilities data. This patch is inspired by similar code developed by
>> Tobias Jakobi.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 18 +++++++---
>>   drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 23 +++++++-----
>>   drivers/gpu/drm/exynos/exynos_drm_drv.h       | 22 ++++++++++++
>>   drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 25 ++++++++-----
>>   drivers/gpu/drm/exynos/exynos_drm_plane.c     | 34 ++++++++----------
>>   drivers/gpu/drm/exynos/exynos_drm_plane.h     |  7 ++--
>>   drivers/gpu/drm/exynos/exynos_drm_vidi.c      | 25 ++++++++-----
>>   drivers/gpu/drm/exynos/exynos_mixer.c         | 51 ++++++++++++++++-----------
>>   8 files changed, 131 insertions(+), 74 deletions(-)
>>
> <SNIP>
>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
>> index 015e85cabcc9..cdec3c1827c6 100644
>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>> @@ -43,7 +43,6 @@
>>   
>>   #define MIXER_WIN_NR		3
>>   #define VP_DEFAULT_WIN		2
>> -#define CURSOR_WIN		1
>>   
>>   /* The pixelformats that are natively supported by the mixer. */
>>   #define MXR_FORMAT_RGB565	4
>> @@ -112,6 +111,31 @@ struct mixer_drv_data {
>>   	bool					has_sclk;
>>   };
>>   
>> +static const struct exynos_drm_plane_config plane_configs[MIXER_WIN_NR] = {
>> +	{
>> +		.zpos = 0,
>> +		.type = DRM_PLANE_TYPE_PRIMARY,
>> +		.pixel_formats = mixer_formats,
>> +		.num_pixel_formats = ARRAY_SIZE(mixer_formats),
>> +		.capabilities = EXYNOS_DRM_PLANE_CAP_DOUBLE_X |
>> +				EXYNOS_DRM_PLANE_CAP_DOUBLE_Y,
>> +	}, {
>> +		.zpos = 1,
>> +		.type = DRM_PLANE_TYPE_CURSOR,
>> +		.pixel_formats = mixer_formats,
>> +		.num_pixel_formats = ARRAY_SIZE(mixer_formats),
>> +		.capabilities = EXYNOS_DRM_PLANE_CAP_DOUBLE_X |
>> +				EXYNOS_DRM_PLANE_CAP_DOUBLE_Y,
>> +	}, {
>> +		.zpos = 2,
>> +		.type = DRM_PLANE_TYPE_OVERLAY,
>> +		.pixel_formats = vp_formats,
>> +		.num_pixel_formats = ARRAY_SIZE(vp_formats),
>> +		.capabilities = EXYNOS_DRM_PLANE_CAP_DOUBLE_X |
>> +				EXYNOS_DRM_PLANE_CAP_DOUBLE_Y,
> As far as I know the video plane supports arbitrary scaling and provides
> no dedicated 'pixel doubling' mode.

Right, I've forgotten that, I will update the code then. BTW, do you plan to
submit your patches for Mixer, which fixes alpha blending setup?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
