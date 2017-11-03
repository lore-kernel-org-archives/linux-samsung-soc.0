From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v4 5/9] drm/exynos: Add generic support for devices
 shared with V4L2 subsystem
Date: Fri, 03 Nov 2017 13:28:14 +0100
Message-ID: <1e56ff9c-f90d-278e-69fd-c0bfe3dadaa7@samsung.com>
References: <20171023075428.7003-1-m.szyprowski@samsung.com>
        <CGME20171023075450eucas1p24923c2a0793ac24364b97770dadd56e0@eucas1p2.samsung.com>
        <20171023075428.7003-6-m.szyprowski@samsung.com>
        <59F96913.4040000@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39754 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750826AbdKCM2T (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Nov 2017 08:28:19 -0400
In-reply-to: <59F96913.4040000@samsung.com>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Hi Inki,

On 2017-11-01 07:26, Inki Dae wrote:
> 2017년 10월 23일 16:54에 Marek Szyprowski 이(가) 쓴 글:
>> Some hardware modules, like FIMC in Exynos4 series are shared between
>> V4L2 (camera support) and DRM (memory-to-memory processing) subsystems.
>> This patch provides a simple check to let such drivers to be used in the
>> driver components framework.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_drv.c | 17 ++++++++++++++++-
>>   drivers/gpu/drm/exynos/exynos_drm_drv.h |  2 ++
>>   2 files changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> index cac0d84385d3..60ae6ae06eb2 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> @@ -216,6 +216,7 @@ struct exynos_drm_driver_info {
>>   #define DRM_COMPONENT_DRIVER	BIT(0)	/* supports component framework */
>>   #define DRM_VIRTUAL_DEVICE	BIT(1)	/* create virtual platform device */
>>   #define DRM_DMA_DEVICE		BIT(2)	/* can be used for dma allocations */
>> +#define DRM_SHARED_DEVICE	BIT(3)	/* devices shared with V4L2 subsystem */
>>   
>>   #define DRV_PTR(drv, cond) (IS_ENABLED(cond) ? &drv : NULL)
>>   
>> @@ -267,6 +268,17 @@ static struct exynos_drm_driver_info exynos_drm_drivers[] = {
>>   	}
>>   };
>>   
>> +int exynos_drm_check_shared_device(struct device *dev)
>> +{
>> +	/*
>> +	 * Exynos DRM drivers handle only devices that support
>> +	 * the LCD Writeback data path, rest is handled by V4L2 driver
>> +	 */
>> +	if (!of_property_read_bool(dev->of_node, "samsung,lcd-wb"))
>> +		return -ENODEV;
>> +	return 0;
>> +}
>> +
>>   static int compare_dev(struct device *dev, void *data)
>>   {
>>   	return dev == (struct device *)data;
>> @@ -288,7 +300,10 @@ static struct component_match *exynos_drm_match_add(struct device *dev)
>>   					    &info->driver->driver,
>>   					    (void *)platform_bus_type.match))) {
>>   			put_device(p);
>> -			component_match_add(dev, &match, compare_dev, d);
>> +
>> +			if (!(info->flags & DRM_SHARED_DEVICE) ||
>> +			    exynos_drm_check_shared_device(d) == 0)
>> +				component_match_add(dev, &match, compare_dev, d);
> Seems above line make fimc device driver to be bound only when fimc device node has "samsung,lcd-wb" property. However, Exynos DRM FIMC driver is able to various transfomations such as color space conversion, scaling up/down and rotation.
> And this driver is used as mem to mem device driver. However, 'writeback' feature means 'dma to memory', which delivers one blended image in display controller into system memory.

This patch is only to bind fimc.2 and fimc.3 devices to DRM and fimc.0
and fimc.1 to V4L2. Exactly the same checks are in V4l2 and old DRM FIMC
drivers.

>
> Thanks,
> Inki Dae
>
>>   			p = d;
>>   		}
>>   		put_device(p);
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> index b47f810d64d2..8b3b31d35168 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> @@ -275,6 +275,8 @@ static inline int exynos_dpi_bind(struct drm_device *dev,
>>   }
>>   #endif
>>   
>> +int exynos_drm_check_shared_device(struct device *dev);
>> +
>>   int exynos_atomic_commit(struct drm_device *dev, struct drm_atomic_state *state,
>>   			 bool nonblock);
>>   int exynos_atomic_check(struct drm_device *dev, struct drm_atomic_state *state);
>>
>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
