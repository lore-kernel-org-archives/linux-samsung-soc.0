From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 2/6] drm/exynos: ipp: Add IPP v2 framework
Date: Wed, 20 Sep 2017 12:13:37 +0200
Message-ID: <a10731d2-91db-55c5-06ae-66f7ca05a8e0@samsung.com>
References: <1505203739-29747-1-git-send-email-m.szyprowski@samsung.com>
        <CGME20170912080911eucas1p1a9ca05ec684dc4b71f8fb984b5baa161@eucas1p1.samsung.com>
        <1505203739-29747-3-git-send-email-m.szyprowski@samsung.com>
        <3f102506-da99-aba9-90cf-f3b026995f49@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32976 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751480AbdITKNn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Sep 2017 06:13:43 -0400
In-reply-to: <3f102506-da99-aba9-90cf-f3b026995f49@math.uni-bielefeld.de>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hi Tobias,

Thanks for testing!

On 2017-09-15 19:18, Tobias Jakobi wrote:
> Hello Marek,
>
> Marek Szyprowski wrote:
>> This patch adds Exynos IPP v2 subsystem and userspace API.
>>
>> New userspace API is focused ONLY on memory-to-memory image processing.
>> The two remainging IPP operation modes (framebuffer writeback and
>> local-path output with image processing) can be implemented using
>> standard DRM features: writeback connectors and additional DRM planes with
>> scaling features.
>>
>> V2 IPP userspace API is not compatible with old IPP ioctls. This is a
>> significant change, but the old IPP subsystem in mainline Linux kernel was
>> partially disfunctional anyway and not used in any open-source project.
>>
>> V2 IPP userspace API is based on stateless approach, which much better fits
>> to memory-to-memory image processing model. It also provides support for
>> all image formats, which are both already defined in DRM API and supported
>> by the existing IPP hardware modules.
>>
>> The API consists of the following ioctls:
>> - DRM_IOCTL_EXYNOS_IPP_GET_RESOURCES: to enumerate all available image
>>    processing modules,
>> - DRM_IOCTL_EXYNOS_IPP_GET_CAPS: to query capabilities and supported image
>>    formats of given IPP module,
>> - DRM_IOCTL_EXYNOS_IPP_GET_LIMITS: to query hardware limitiations for
>>    selected image format of given IPP module,
>> - DRM_IOCTL_EXYNOS_IPP_COMMIT: to perform operation described by the
>>    provided structures (source and destination buffers, operation rectangle,
>>    transformation, etc).
>>
>> The proposed userspace API is extensible. In the future more advanced image
>> processing operations can be defined to support for example blending.
>>
>> Userspace API is fully functional also on DRM render nodes, so it is not
>> limited to the root/privileged client.
>>
>> Internal driver API also has been completely rewritten. New IPP core
>> performs all possible input validation, checks and object life-time
>> control. The drivers can focus only on writing configuration to hardware
>> registers. Stateless nature of DRM_IOCTL_EXYNOS_IPP_COMMIT ioctl simplifies
>> the driver API. Minimal driver needs to provide a single callback for
>> starting processing and an array with supported image formats.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/Kconfig          |   3 +
>>   drivers/gpu/drm/exynos/Makefile         |   1 +
>>   drivers/gpu/drm/exynos/exynos_drm_drv.c |   9 +
>>   drivers/gpu/drm/exynos/exynos_drm_ipp.c | 893 ++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/exynos/exynos_drm_ipp.h | 188 +++++++
>>   include/uapi/drm/exynos_drm.h           | 227 ++++++++
>>   6 files changed, 1321 insertions(+)
>>   create mode 100644 drivers/gpu/drm/exynos/exynos_drm_ipp.c
>>   create mode 100644 drivers/gpu/drm/exynos/exynos_drm_ipp.h
>>
>> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
>> index 88cff0e039b6..2e097a81df12 100644
>> --- a/drivers/gpu/drm/exynos/Kconfig
>> +++ b/drivers/gpu/drm/exynos/Kconfig
>> @@ -94,6 +94,9 @@ config DRM_EXYNOS_G2D
>>   	help
>>   	  Choose this option if you want to use Exynos G2D for DRM.
>>   
>> +config DRM_EXYNOS_IPP
>> +	bool
>> +
>>   config DRM_EXYNOS_FIMC
>>   	bool "FIMC"
>>   	depends on BROKEN && MFD_SYSCON
>> diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
>> index 09bb002c9555..f663490e949d 100644
>> --- a/drivers/gpu/drm/exynos/Makefile
>> +++ b/drivers/gpu/drm/exynos/Makefile
>> @@ -17,6 +17,7 @@ exynosdrm-$(CONFIG_DRM_EXYNOS_MIXER)	+= exynos_mixer.o
>>   exynosdrm-$(CONFIG_DRM_EXYNOS_HDMI)	+= exynos_hdmi.o
>>   exynosdrm-$(CONFIG_DRM_EXYNOS_VIDI)	+= exynos_drm_vidi.o
>>   exynosdrm-$(CONFIG_DRM_EXYNOS_G2D)	+= exynos_drm_g2d.o
>> +exynosdrm-$(CONFIG_DRM_EXYNOS_IPP)	+= exynos_drm_ipp.o
>>   exynosdrm-$(CONFIG_DRM_EXYNOS_FIMC)	+= exynos_drm_fimc.o
>>   exynosdrm-$(CONFIG_DRM_EXYNOS_ROTATOR)	+= exynos_drm_rotator.o
>>   exynosdrm-$(CONFIG_DRM_EXYNOS_GSC)	+= exynos_drm_gsc.o
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> index 7f19054ebce3..645046c5943a 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> @@ -26,6 +26,7 @@
>>   #include "exynos_drm_fb.h"
>>   #include "exynos_drm_gem.h"
>>   #include "exynos_drm_plane.h"
>> +#include "exynos_drm_ipp.h"
>>   #include "exynos_drm_vidi.h"
>>   #include "exynos_drm_g2d.h"
>>   #include "exynos_drm_iommu.h"
>> @@ -114,6 +115,14 @@ static void exynos_drm_lastclose(struct drm_device *dev)
>>   			DRM_AUTH | DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(EXYNOS_G2D_EXEC, exynos_g2d_exec_ioctl,
>>   			DRM_AUTH | DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(EXYNOS_IPP_GET_RESOURCES, exynos_drm_ipp_get_res_ioctl,
>> +			DRM_AUTH | DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(EXYNOS_IPP_GET_CAPS, exynos_drm_ipp_get_caps_ioctl,
>> +			DRM_AUTH | DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(EXYNOS_IPP_GET_LIMITS, exynos_drm_ipp_get_limits_ioctl,
>> +			DRM_AUTH | DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(EXYNOS_IPP_COMMIT, exynos_drm_ipp_commit_ioctl,
>> +			DRM_AUTH | DRM_RENDER_ALLOW),
>>   };
>>   
>>   static const struct file_operations exynos_drm_driver_fops = {
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
>> new file mode 100644
>> index 000000000000..11be6a1bf839
>> --- /dev/null
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
>> @@ -0,0 +1,892 @@
>> +/*
>> + * Copyright (C) 2017 Samsung Electronics Co.Ltd
>> + * Authors:
>> + *	Marek Szyprowski <m.szyprowski@samsung.com>
>> + *
>> + * Exynos DRM Image Post Processing (IPP) related functions
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + */
>> +
>> +
>> +#include <drm/drmP.h>
>> +#include <drm/drm_mode.h>
>> +#include <uapi/drm/exynos_drm.h>
>> +
>> +#include "exynos_drm_drv.h"
>> +#include "exynos_drm_gem.h"
>> +#include "exynos_drm_ipp.h"
>> +
>> +static int num_ipp;
>> +static LIST_HEAD(ipp_list);
>> +
>> +struct drm_pending_exynos_ipp_event {
>> +	struct drm_pending_event base;
>> +	struct drm_exynos_ipp_event event;
>> +};
>> +
>> +/**
>> + * exynos_drm_ipp_register - Register a new picture processor hardware module
>> + * @dev: DRM device
>> + * @ipp: ipp module to init
>> + * @funcs: callbacks for the new ipp object
>> + * @caps: bitmask of ipp capabilities (%DRM_EXYNOS_IPP_CAP_*)
>> + * @formats: array of supported formats (%DRM_FORMAT_*)
>> + * @name: name (for debugging purposes)
>> + *
>> + * Initializes a ipp module.
>> + *
>> + * Returns:
>> + * Zero on success, error code on failure.
>> + */
>> +int exynos_drm_ipp_register(struct drm_device *dev, struct exynos_drm_ipp *ipp,
>> +		const struct exynos_drm_ipp_funcs *funcs, unsigned int caps,
>> +		const struct exynos_drm_ipp_formats *formats, const char *name)
>> +{
>> +	WARN_ON(!ipp);
>> +	WARN_ON(!funcs);
>> +	WARN_ON(!formats);
>> +
>> +	spin_lock_init(&ipp->lock);
>> +	INIT_LIST_HEAD(&ipp->todo_list);
>> +	init_waitqueue_head(&ipp->done_wq);
>> +	ipp->dev = dev;
>> +	ipp->funcs = funcs;
>> +	ipp->capabilities = caps;
>> +	ipp->name = name;
>> +	ipp->formats = formats;
>> +	while (formats++->fourcc)
>> +		ipp->num_formats++;
>> +
>> +	list_add_tail(&ipp->head, &ipp_list);
>> +	ipp->id = num_ipp++;
>> +
>> +	DRM_DEBUG_DRIVER("Registered ipp %d\n", ipp->id);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * exynos_drm_ipp_unregister - Unregister the picture processor module
>> + * @dev: DRM device
>> + * @ipp: ipp module
>> + */
>> +void exynos_drm_ipp_unregister(struct drm_device *dev,
>> +			       struct exynos_drm_ipp *ipp)
>> +{
>> +	BUG_ON(ipp->task);
>> +	BUG_ON(!list_empty(&ipp->todo_list));
>> +	list_del(&ipp->head);
>> +}
>> +
>> +/**
>> + * exynos_drm_ipp_ioctl_get_res_ioctl - enumerate all ipp modules
>> + * @dev: DRM device
>> + * @data: ioctl data
>> + * @file_priv: DRM file info
>> + *
>> + * Construct a list of ipp ids.
>> + *
>> + * Called by the user via ioctl.
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int exynos_drm_ipp_get_res_ioctl(struct drm_device *dev, void *data,
>> +				 struct drm_file *file_priv)
>> +{
>> +	struct drm_exynos_ioctl_ipp_get_res *resp = data;
>> +	struct exynos_drm_ipp *ipp;
>> +	uint32_t __user *ipp_ptr = (uint32_t __user *)
>> +						(unsigned long)resp->ipp_id_ptr;
>> +	unsigned int count = num_ipp, copied = 0;
>> +
>> +	/*
>> +	 * This ioctl is called twice, once to determine how much space is
>> +	 * needed, and the 2nd time to fill it.
>> +	 */
>> +	if (count && resp->count_ipps >= count) {
>> +		list_for_each_entry(ipp, &ipp_list, head) {
>> +			if (put_user(ipp->id, ipp_ptr + copied))
>> +				return -EFAULT;
>> +			copied++;
>> +		}
>> +	}
>> +	resp->count_ipps = count;
>> +
>> +	return 0;
>> +}
>> +
>> +static inline struct exynos_drm_ipp *__ipp_get(uint32_t id)
>> +{
>> +	struct exynos_drm_ipp *ipp;
>> +
>> +	list_for_each_entry(ipp, &ipp_list, head)
>> +		if (ipp->id == id)
>> +			return ipp;
>> +	return NULL;
>> +}
>> +
>> +/**
>> + * exynos_drm_ipp_ioctl_get_caps - get ipp module capabilities and formats
>> + * @dev: DRM device
>> + * @data: ioctl data
>> + * @file_priv: DRM file info
>> + *
>> + * Construct a structure describing ipp module capabilities.
>> + *
>> + * Called by the user via ioctl.
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int exynos_drm_ipp_get_caps_ioctl(struct drm_device *dev, void *data,
>> +				  struct drm_file *file_priv)
>> +{
>> +	struct drm_exynos_ioctl_ipp_get_caps *resp = data;
>> +	void __user *ptr = (void __user *)(unsigned long)resp->formats_ptr;
>> +	struct exynos_drm_ipp *ipp;
>> +	int i;
>> +
>> +	ipp = __ipp_get(resp->ipp_id);
>> +	if (!ipp)
>> +		return -ENOENT;
>> +
>> +	resp->ipp_id = ipp->id;
>> +	resp->capabilities = ipp->capabilities;
>> +
>> +	/*
>> +	 * This ioctl is called twice, once to determine how much space is
>> +	 * needed, and the 2nd time to fill it.
>> +	 */
>> +	if (resp->formats_count >= ipp->num_formats) {
>> +		for (i = 0; i < ipp->num_formats; i++) {
>> +			struct exynos_drm_ipp_format tmp = {
>> +				.fourcc = ipp->formats[i].fourcc,
>> +				.type = ipp->formats[i].type,
>> +				.modifier = ipp->formats[i].modifier,
>> +			};
>> +
>> +			if (copy_to_user(ptr, &tmp, sizeof(tmp)))
>> +				return -EFAULT;
>> +			ptr += sizeof(tmp);
>> +		}
>> +	}
>> +	resp->formats_count = ipp->num_formats;
>> +
>> +	return 0;
>> +}
>> +
>> +static inline const struct exynos_drm_ipp_formats *__ipp_format_get(
>> +			uint32_t fourcc, uint64_t mod, unsigned long type,
>> +			const struct exynos_drm_ipp_formats *f)
>> +{
>> +	for (; f->fourcc; f++)
>> +		if ((f->type & type) && f->fourcc == fourcc &&
>> +		    f->modifier == mod)
>> +			return f;
>> +	return NULL;
>> +}
>> +
>> +/**
>> + * exynos_drm_ipp_get_limits_ioctl - get ipp module limits
>> + * @dev: DRM device
>> + * @data: ioctl data
>> + * @file_priv: DRM file info
>> + *
>> + * Construct a structure describing ipp module limitations for provided
>> + * picture format.
>> + *
>> + * Called by the user via ioctl.
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int exynos_drm_ipp_get_limits_ioctl(struct drm_device *dev, void *data,
>> +				    struct drm_file *file_priv)
> I'm getting a null-pointer Opps in this ioctl(). I haven't fully debugged this,
> but I guess it's because format->limits might be NULL. E.g. the formats for the
> FIMC (exynos_drm_ipp_formats fimc_formats[]) don't carry any limits for the
> color formats.

Right, my fault. There should be a check against NULL. On the other 
hand, drivers
should provide some limits, but those were not added to FIMC and GSC 
drivers yet.

>> +{
>> +	struct drm_exynos_ioctl_ipp_get_limits *resp = data;
>> +	void __user *ptr = (void __user *)(unsigned long)resp->limits_ptr;
>> +	const struct exynos_drm_ipp_formats *format;
>> +	const struct drm_exynos_ipp_limit *limits, *l;
>> +	struct exynos_drm_ipp *ipp;
>> +	int count = 0;
>> +
>> +	if (resp->type != DRM_EXYNOS_IPP_FORMAT_SOURCE &&
>> +	    resp->type != DRM_EXYNOS_IPP_FORMAT_DESTINATION)
>> +		return -EINVAL;
>> +
>> +	ipp = __ipp_get(resp->ipp_id);
>> +	if (!ipp)
>> +		return -ENOENT;
>> +
>> +	format = __ipp_format_get(resp->fourcc, resp->modifier, resp->type,
>> +			      ipp->formats);
>> +	if (!format)
>> +		return -EINVAL;
>> +
>> +	limits = format->limits;
>> +	for (l = limits; l->type; l++)
>> +		count++;
>> +
>> +	/*
>> +	 * This ioctl is called twice, once to determine how much space is
>> +	 * needed, and the 2nd time to fill it.
>> +	 */
>> +	if (count && resp->limits_size >= count * sizeof(*l)) {
>> +		for (l = limits; l->type; l++, ptr += sizeof(*l))
>> +			if (copy_to_user((void __user *)ptr, l, sizeof(*l)))
>> +				return -EFAULT;
>> +	}
>> +	resp->limits_size = count * sizeof(*l);
> I wonder why you return the size if bytes here? How about keeping this
> consistant with the other ioctls (like exynos_drm_ipp_get_caps_ioctl) and just
> return the count (together with renaming limits_size to limits>count).

Frankly, this is a leftover from my previous approach to limit handling, 
where
limits were described by different structures. I will change this to 
limit count
to make it consistent.

 >> ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
