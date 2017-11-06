From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v4 5/9] drm/exynos: Add generic support for devices
 shared with V4L2 subsystem
Date: Mon, 06 Nov 2017 10:20:14 +0900
Message-ID: <59FFB8CE.5000905@samsung.com>
References: <20171023075428.7003-1-m.szyprowski@samsung.com>
        <CGME20171023075450eucas1p24923c2a0793ac24364b97770dadd56e0@eucas1p2.samsung.com>
        <20171023075428.7003-6-m.szyprowski@samsung.com>
        <59F96913.4040000@samsung.com>
        <1e56ff9c-f90d-278e-69fd-c0bfe3dadaa7@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23134 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750750AbdKFBUS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Nov 2017 20:20:18 -0500
In-reply-to: <1e56ff9c-f90d-278e-69fd-c0bfe3dadaa7@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Hi Marek,

2017년 11월 03일 21:28에 Marek Szyprowski 이(가) 쓴 글:
> Hi Inki,
> 
> On 2017-11-01 07:26, Inki Dae wrote:
>> 2017년 10월 23일 16:54에 Marek Szyprowski 이(가) 쓴 글:
>>> Some hardware modules, like FIMC in Exynos4 series are shared between
>>> V4L2 (camera support) and DRM (memory-to-memory processing) subsystems.
>>> This patch provides a simple check to let such drivers to be used in the
>>> driver components framework.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   drivers/gpu/drm/exynos/exynos_drm_drv.c | 17 ++++++++++++++++-
>>>   drivers/gpu/drm/exynos/exynos_drm_drv.h |  2 ++
>>>   2 files changed, 18 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>> index cac0d84385d3..60ae6ae06eb2 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>> @@ -216,6 +216,7 @@ struct exynos_drm_driver_info {
>>>   #define DRM_COMPONENT_DRIVER    BIT(0)    /* supports component framework */
>>>   #define DRM_VIRTUAL_DEVICE    BIT(1)    /* create virtual platform device */
>>>   #define DRM_DMA_DEVICE        BIT(2)    /* can be used for dma allocations */
>>> +#define DRM_SHARED_DEVICE    BIT(3)    /* devices shared with V4L2 subsystem */
>>>     #define DRV_PTR(drv, cond) (IS_ENABLED(cond) ? &drv : NULL)
>>>   @@ -267,6 +268,17 @@ static struct exynos_drm_driver_info exynos_drm_drivers[] = {
>>>       }
>>>   };
>>>   +int exynos_drm_check_shared_device(struct device *dev)
>>> +{
>>> +    /*
>>> +     * Exynos DRM drivers handle only devices that support
>>> +     * the LCD Writeback data path, rest is handled by V4L2 driver
>>> +     */
>>> +    if (!of_property_read_bool(dev->of_node, "samsung,lcd-wb"))
>>> +        return -ENODEV;
>>> +    return 0;
>>> +}
>>> +
>>>   static int compare_dev(struct device *dev, void *data)
>>>   {
>>>       return dev == (struct device *)data;
>>> @@ -288,7 +300,10 @@ static struct component_match *exynos_drm_match_add(struct device *dev)
>>>                           &info->driver->driver,
>>>                           (void *)platform_bus_type.match))) {
>>>               put_device(p);
>>> -            component_match_add(dev, &match, compare_dev, d);
>>> +
>>> +            if (!(info->flags & DRM_SHARED_DEVICE) ||
>>> +                exynos_drm_check_shared_device(d) == 0)
>>> +                component_match_add(dev, &match, compare_dev, d);
>> Seems above line make fimc device driver to be bound only when fimc device node has "samsung,lcd-wb" property. However, Exynos DRM FIMC driver is able to various transfomations such as color space conversion, scaling up/down and rotation.
>> And this driver is used as mem to mem device driver. However, 'writeback' feature means 'dma to memory', which delivers one blended image in display controller into system memory.
> 
> This patch is only to bind fimc.2 and fimc.3 devices to DRM and fimc.0
> and fimc.1 to V4L2. Exactly the same checks are in V4l2 and old DRM FIMC
> drivers.

Indeed. No change for behaivor.

When Sylwester posted old version[1] of DRM fimc device tree support, seems he and even me missed the behaiver of DRM FIMC driver.
According to below patch description, it says,
"The DRM driver uses this interface for setting up the FIFO data link between FIMD and FIMC IP blocks"

We thought we could use 'samsung,lcd-wb' property to distinguish FIMC devices for V4L2 and ones for DRM - only fimc 2 and fimc 3 - have 'samsung'lcd-wb' property'.

but it's not true. DRM FIMC driver is used as a general post processing hardware such as color space conversion, scaling up/down and rotation operations.
In FIMC device's perspective, 'samsung,lcd-wb' means 'dma to memory' - as I mentioned before, which delivers one blended image in display controller into system memory and it's just one of several features FIMC has - so it doesn't make sense.

For example,
User - some device tree - can remove 'samsung,lcd-wb' property from fimc device node because this property is optional. In this case, binding of DRM FIMC driver will fail even though FIMC driver can provide other functions.
We shouldn't make FIMC device to be limited with just LCD write back feature and we need to find a good way to distinguish FIMC devices for V4L2 and DRM. 

Anyway, we are trying to merge new version of IPP driver which is really a big change so how about making sure the behaiver of this driver, not depending on 'old version'?
I think we need to take care of this carefully because ABI interface could be changed according to our decision.

To Sylwester,
Could you give us your option? 

According to Exynos4412 datasheet,
'isp-wb' can go to input of FIMC 0, 1 and 2, and 'lcd-wb' can go to input of FIMC 2 and 3 if Figure 43-1 in the datasheet is right.

So it says,
1. FIMC 0 and 1 could be used for isp-wb.
2. FIMC 2 could be used for isp-wb and lcd-wb.
3. FIMC 3 could be used for lcd-wb.

But you updated binding document as like below, 
"Optional properties:
...
- samsung,isp-wb: this property must be present if the IP block has the ISP
  writeback input.
- samsung,lcd-wb: this property must be present if the IP block has the LCD
  writeback input."

This would mean that all FIMC devices - 0 to 3 - could be used for isp-wb or lcd-wb, and it wouldn't make sense.

My opinion is,
1. we could dedicate FIMC 0 and 1 for isp-wb, and FIMC 3 for lcd-wb, and binding document may be changed like below,
   - For FIMC 0 and 1, isp-wb property should be a required property, not optional.
   - For FIMC 3, lcd-wb propery should be a required property, not optionl.
2. we could share FIMC 2 for isp-wb and lcd-wb.
   - For FIMC 2, isp-wb and lcd-wb should be required properties but only one driver - V4L2 or DRM driver - can be bound.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5186fc5e8eda184935467aa84295b2897166fecd


Thanks,
Inki Dae

> 
>>
>> Thanks,
>> Inki Dae
>>
>>>               p = d;
>>>           }
>>>           put_device(p);
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> index b47f810d64d2..8b3b31d35168 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> @@ -275,6 +275,8 @@ static inline int exynos_dpi_bind(struct drm_device *dev,
>>>   }
>>>   #endif
>>>   +int exynos_drm_check_shared_device(struct device *dev);
>>> +
>>>   int exynos_atomic_commit(struct drm_device *dev, struct drm_atomic_state *state,
>>>                bool nonblock);
>>>   int exynos_atomic_check(struct drm_device *dev, struct drm_atomic_state *state);
>>>
>>
> 
> Best regards
