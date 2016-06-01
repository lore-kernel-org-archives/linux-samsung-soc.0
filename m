From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [RFC PATCH v1 1/2] drm/rockchip: add a notify event about vblank
 enable/disable
Date: Wed, 1 Jun 2016 10:52:25 +0800
Message-ID: <574E4DE9.3030408@rock-chips.com>
References: <1464701856-8695-1-git-send-email-ykk@rock-chips.com>
 <1464701959-9428-1-git-send-email-ykk@rock-chips.com>
 <20160531143615.GJ7231@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160531143615.GJ7231@phenom.ffwll.local>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.vetter@intel.com
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Heiko Stuebner <heiko@sntech.de>, tfiga@chromium.org, Jingoo Han <jingoohan1@gmail.com>, David Airlie <airlied@linux.ie>, Thierry Reding <treding@nvidia.com>, dianders@chromium.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Daniel,

On 05/31/2016 10:36 PM, Daniel Vetter wrote:
> On Tue, May 31, 2016 at 09:39:19PM +0800, Yakir Yang wrote:
>> EDP PSR function is interesting in vblank enable or disable event,
>> so it would be great introduce a way to notify encoder about this
>> event.
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> notifiers considered evil, especially if you add a global notifier for
> something that's very specific to a given crtc.
Oops, I haven't realized that. Yes, you're right, this is very specific to
a given crtc, that's bad :(
> I think the better fix would be add a suitable hook to drm_bridge to allow
> encoders to go into self refresh, and to wake them up from self-refresh
> again.
Sounds good, need to found a better way.

Thanks,
- Yakir
> -Daniel
>
>> ---
>>   drivers/gpu/drm/rockchip/Makefile              |  2 +-
>>   drivers/gpu/drm/rockchip/rockchip_drm_notify.c | 66 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/rockchip/rockchip_drm_notify.h | 29 +++++++++++
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c    |  5 ++
>>   4 files changed, 101 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_notify.c
>>   create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_notify.h
>>
>> diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip/Makefile
>> index 05d0713..49fee8c 100644
>> --- a/drivers/gpu/drm/rockchip/Makefile
>> +++ b/drivers/gpu/drm/rockchip/Makefile
>> @@ -3,7 +3,7 @@
>>   # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>>   
>>   rockchipdrm-y := rockchip_drm_drv.o rockchip_drm_fb.o \
>> -		rockchip_drm_gem.o rockchip_drm_vop.o
>> +		rockchip_drm_gem.o rockchip_drm_vop.o rockchip_drm_notify.o
>>   rockchipdrm-$(CONFIG_DRM_FBDEV_EMULATION) += rockchip_drm_fbdev.o
>>   
>>   obj-$(CONFIG_ROCKCHIP_ANALOGIX_DP) += analogix_dp-rockchip.o
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_notify.c b/drivers/gpu/drm/rockchip/rockchip_drm_notify.c
>> new file mode 100644
>> index 0000000..84111d9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_notify.c
>> @@ -0,0 +1,66 @@
>> +#include "rockchip_drm_notify.h"
>> +
>> +static RAW_NOTIFIER_HEAD(vblank_chain);
>> +static DEFINE_MUTEX(vblank_lock);
>> +
>> +/**
>> + * rockchip_drm_vblank_enable - Send Vblank enable event. Will only enable send
>> + * Vblank if there are 1 or fewer notifiers.
>> + */
>> +void rockchip_drm_vblank_enable(void)
>> +{
>> +	mutex_lock(&vblank_lock);
>> +	raw_notifier_call_chain(&vblank_chain, VBLANK_ENABLE, NULL);
>> +	mutex_unlock(&vblank_lock);
>> +}
>> +EXPORT_SYMBOL_GPL(rockchip_drm_vblank_enable);
>> +
>> +/**
>> + * rockchip_drm_vblank_disable - Send VBlank disable event.
>> + */
>> +void rockchip_drm_vblank_disable(void)
>> +{
>> +	mutex_lock(&vblank_lock);
>> +	raw_notifier_call_chain(&vblank_chain, VBLANK_DISABLE, NULL);
>> +	mutex_unlock(&vblank_lock);
>> +}
>> +EXPORT_SYMBOL_GPL(rockchip_drm_vblank_disable);
>> +
>> +/**
>> + * rockchip_drm_vblank_register_notifier - Add notifier to Vblank notifiers.
>> + *
>> + * Enable notifiers are called when we enable/disable vblank. This can be done
>> + * through rockchip_drm_vblank_enable/disable or when there is more than one
>> + * sync notifier. Must call rockchip_drm_vblank_lock before calling this.
>> + * @nb The notifier to add
>> + */
>> +int rockchip_drm_vblank_register_notifier(struct notifier_block *nb)
>> +{
>> +	int ret = 0;
>> +
>> +	if (!nb)
>> +		return -EINVAL;
>> +
>> +	ret = raw_notifier_chain_register(&vblank_chain, nb);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(rockchip_drm_vblank_register_notifier);
>> +
>> +/**
>> + * rockchip_drm_vblank_unregister_notifier - Remove notifier from Vblank
>> + * notifiers.
>> + *
>> + * Must call rockchip_drm_vblank_lock before calling this.
>> + * @nb The notifier to remove.
>> + */
>> +int rockchip_drm_vblank_unregister_notifier(struct notifier_block *nb)
>> +{
>> +	int ret = 0;
>> +
>> +	if (!nb)
>> +		return -EINVAL;
>> +
>> +	ret = raw_notifier_chain_unregister(&vblank_chain, nb);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(rockchip_drm_vblank_unregister_notifier);
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_notify.h b/drivers/gpu/drm/rockchip/rockchip_drm_notify.h
>> new file mode 100644
>> index 0000000..2f28afa
>> --- /dev/null
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_notify.h
>> @@ -0,0 +1,29 @@
>> +/*
>> + * Copyright (C) 2014 Google, Inc.
>> + *
>> + * This software is licensed under the terms of the GNU General Public
>> + * License version 2, as published by the Free Software Foundation, and
>> + * may be copied, distributed, and modified under those terms.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#ifndef __ROCKCHIP_DRM_NOTIFY_H
>> +#define __ROCKCHIP_DRM_NOTIFY_H
>> +
>> +#include <linux/notifier.h>
>> +
>> +enum vblank_enable_op {
>> +	VBLANK_ENABLE = 0,
>> +	VBLANK_DISABLE,
>> +};
>> +
>> +void rockchip_drm_vblank_enable(void);
>> +void rockchip_drm_vblank_disable(void);
>> +int rockchip_drm_vblank_register_notifier(struct notifier_block *nb);
>> +int rockchip_drm_vblank_unregister_notifier(struct notifier_block *nb);
>> +
>> +#endif /* __ROCKCHIP_DRM_NOTIFY_H */
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> index 257501f..fb6ce4b 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> @@ -35,6 +35,7 @@
>>   #include "rockchip_drm_gem.h"
>>   #include "rockchip_drm_fb.h"
>>   #include "rockchip_drm_vop.h"
>> +#include "rockchip_drm_notify.h"
>>   
>>   #define __REG_SET_RELAXED(x, off, mask, shift, v, write_mask) \
>>   		vop_mask_write(x, off, mask, shift, v, write_mask, true)
>> @@ -851,6 +852,8 @@ static int vop_crtc_enable_vblank(struct drm_crtc *crtc)
>>   
>>   	spin_unlock_irqrestore(&vop->irq_lock, flags);
>>   
>> +	rockchip_drm_vblank_enable();
>> +
>>   	return 0;
>>   }
>>   
>> @@ -867,6 +870,8 @@ static void vop_crtc_disable_vblank(struct drm_crtc *crtc)
>>   	VOP_INTR_SET_TYPE(vop, enable, FS_INTR, 0);
>>   
>>   	spin_unlock_irqrestore(&vop->irq_lock, flags);
>> +
>> +	rockchip_drm_vblank_disable();
>>   }
>>   
>>   static void vop_crtc_wait_for_update(struct drm_crtc *crtc)
>> -- 
>> 1.9.1
>>
>>
