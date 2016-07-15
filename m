From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 2/4] drm/rockchip: add an common abstracted PSR driver
Date: Fri, 15 Jul 2016 09:43:37 +0800
Message-ID: <57883FC9.4050305@rock-chips.com>
References: <1468469704-12440-1-git-send-email-ykk@rock-chips.com>
 <1468469749-12636-1-git-send-email-ykk@rock-chips.com>
 <20160714151433.GB13857@seanpaul0.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.135]:48396 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752183AbcGOBns (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jul 2016 21:43:48 -0400
In-Reply-To: <20160714151433.GB13857@seanpaul0.roam.corp.google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, daniel.vetter@ffwll.ch, emil.l.velikov@gmail.com, dianders@chromium.org, dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>

Sean,

On 07/14/2016 11:14 PM, Sean Paul wrote:
> On Thu, Jul 14, 2016 at 12:15:49PM +0800, Yakir Yang wrote:
>> The PSR driver have exported four symbols for specific device driver=
:
>> - rockchip_drm_psr_register()
>> - rockchip_drm_psr_unregister()
>> - rockchip_drm_psr_enable()
>> - rockchip_drm_psr_disable()
>> - rockchip_drm_psr_flush()
>>
>> Encoder driver should call the register/unregister interfaces to hoo=
k
>> itself into common PSR driver, encoder have implement the 'psr_set'
>> callback which use the set PSR state in hardware side.
>>
>> Crtc driver would call the enable/disable interfaces when vblank is
>> enable/disable, after that the common PSR driver would call the enco=
der
>> registered callback to set the PSR state.
>>
>> Fb driver would call the flush interface in 'fb->dirty' callback, th=
is
>> helper function would force all PSR enabled encoders to exit from PS=
R
>> for 3 seconds.
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>
> I still don't think it's a good idea to pull this out into a separate=
 PSR
> driver, but I suppose we can integrate it at a later time if it becom=
es
> cumbersome.
>
> Reviewed-by: Sean Paul <seanpaul@chromium.org>

Thanks :-D

- Yakir

>
>> ---
>> Changes in v4:
>> - Tuck the global "psr_list" & "psr_list_mutex" in struct rockchip_d=
rm_private. (Sean)
>> - Move the access of "psr->state" under "psr->state_mutex"'s protect=
=2E (Sean)
>> - Let "psr->state =3D PSR_FLUSH" under "psr->state_mutex"'s protect.=
 (Sean)
>> - Collect psr_enable() and psr_disable() into psr_set_state()
>> - s/5\ second/PSR_FLUSH_TIMEOUT/ (Sean)
>> - Flush the psr callback in vop_crtc_disable(). (St=E9phane, reviewe=
d in Google gerrit)
>>      [https://chromium-review.googlesource.com/#/c/349084/6/drivers/=
gpu/drm/rockchip/rockchip_drm_vop.c@475]
>> - Add the missing file head with license. (St=E9phane, reviewed in G=
oogle gerrit)
>>      [https://chromium-review.googlesource.com/#/c/357563/1/drivers/=
gpu/drm/rockchip/rockchip_drm_psr.h@3]
>>
>> Changes in v3:
>> - split the psr flow into an common abstracted PSR driver
>> - implement the 'fb->dirty' callback function (Daniel)
>> - avoid to use notify to acqiure for vact event (Daniel)
>> - remove psr_active() callback which introduce in v2
>>
>> Changes in v2: None
>>
>>   drivers/gpu/drm/rockchip/Makefile           |   2 +-
>>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c |   4 +
>>   drivers/gpu/drm/rockchip/rockchip_drm_drv.h |   3 +
>>   drivers/gpu/drm/rockchip/rockchip_drm_fb.c  |  12 ++
>>   drivers/gpu/drm/rockchip/rockchip_drm_psr.c | 223 ++++++++++++++++=
++++++++++++
>>   drivers/gpu/drm/rockchip/rockchip_drm_psr.h |  26 ++++
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  29 ++++
>>   7 files changed, 298 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_psr.c
>>   create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_psr.h
>>
>> diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/roc=
kchip/Makefile
>> index 05d0713..9746365 100644
>> --- a/drivers/gpu/drm/rockchip/Makefile
>> +++ b/drivers/gpu/drm/rockchip/Makefile
>> @@ -3,7 +3,7 @@
>>   # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and highe=
r.
>>  =20
>>   rockchipdrm-y :=3D rockchip_drm_drv.o rockchip_drm_fb.o \
>> -		rockchip_drm_gem.o rockchip_drm_vop.o
>> +		rockchip_drm_gem.o rockchip_drm_psr.o rockchip_drm_vop.o
>>   rockchipdrm-$(CONFIG_DRM_FBDEV_EMULATION) +=3D rockchip_drm_fbdev.=
o
>>  =20
>>   obj-$(CONFIG_ROCKCHIP_ANALOGIX_DP) +=3D analogix_dp-rockchip.o
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/g=
pu/drm/rockchip/rockchip_drm_drv.c
>> index d665fb0..26c12b3 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
>> @@ -156,6 +156,9 @@ static int rockchip_drm_bind(struct device *dev)
>>  =20
>>   	drm_dev->dev_private =3D private;
>>  =20
>> +	INIT_LIST_HEAD(&private->psr_list);
>> +	mutex_init(&private->psr_list_mutex);
>> +
>>   	drm_mode_config_init(drm_dev);
>>  =20
>>   	rockchip_drm_mode_config_init(drm_dev);
>> @@ -218,6 +221,7 @@ static int rockchip_drm_bind(struct device *dev)
>>  =20
>>   	if (is_support_iommu)
>>   		arm_iommu_release_mapping(mapping);
>> +
>>   	return 0;
>>   err_fbdev_fini:
>>   	rockchip_drm_fbdev_fini(drm_dev);
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/g=
pu/drm/rockchip/rockchip_drm_drv.h
>> index 239b830..9c34c9e 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
>> @@ -61,6 +61,9 @@ struct rockchip_drm_private {
>>   	struct drm_gem_object *fbdev_bo;
>>   	const struct rockchip_crtc_funcs *crtc_funcs[ROCKCHIP_MAX_CRTC];
>>   	struct drm_atomic_state *state;
>> +
>> +	struct list_head psr_list;
>> +	struct mutex psr_list_mutex;
>>   };
>>  =20
>>   int rockchip_register_crtc_funcs(struct drm_crtc *crtc,
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gp=
u/drm/rockchip/rockchip_drm_fb.c
>> index 20f12bc..36afd9c 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
>> @@ -21,6 +21,7 @@
>>  =20
>>   #include "rockchip_drm_drv.h"
>>   #include "rockchip_drm_gem.h"
>> +#include "rockchip_drm_psr.h"
>>  =20
>>   #define to_rockchip_fb(x) container_of(x, struct rockchip_drm_fb, =
fb)
>>  =20
>> @@ -66,9 +67,20 @@ static int rockchip_drm_fb_create_handle(struct d=
rm_framebuffer *fb,
>>   				     rockchip_fb->obj[0], handle);
>>   }
>>  =20
>> +static int rockchip_drm_fb_dirty(struct drm_framebuffer *fb,
>> +				 struct drm_file *file,
>> +				 unsigned int flags, unsigned int color,
>> +				 struct drm_clip_rect *clips,
>> +				 unsigned int num_clips)
>> +{
>> +	rockchip_drm_psr_flush(fb->dev);
>> +	return 0;
>> +}
>> +
>>   static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs =3D=
 {
>>   	.destroy	=3D rockchip_drm_fb_destroy,
>>   	.create_handle	=3D rockchip_drm_fb_create_handle,
>> +	.dirty		=3D rockchip_drm_fb_dirty,
>>   };
>>  =20
>>   static struct rockchip_drm_fb *
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_psr.c b/drivers/g=
pu/drm/rockchip/rockchip_drm_psr.c
>> new file mode 100644
>> index 0000000..e79ea18
>> --- /dev/null
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_psr.c
>> @@ -0,0 +1,223 @@
>> +/*
>> + * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
>> + * Author: Yakir Yang <ykk@rock-chips.com>
>> + *
>> + * This software is licensed under the terms of the GNU General Pub=
lic
>> + * License version 2, as published by the Free Software Foundation,=
 and
>> + * may be copied, distributed, and modified under those terms.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <drm/drmP.h>
>> +#include <drm/drm_crtc_helper.h>
>> +
>> +#include "rockchip_drm_drv.h"
>> +#include "rockchip_drm_psr.h"
>> +
>> +#define PSR_FLUSH_TIMEOUT	msecs_to_jiffies(3000) /* 3 seconds */
>> +
>> +static LIST_HEAD(psr_list);
>> +static DEFINE_MUTEX(psr_list_mutex);
>> +
>> +enum psr_state {
>> +	PSR_FLUSH,
>> +	PSR_ENABLE,
>> +	PSR_DISABLE,
>> +};
>> +
>> +struct psr_drv {
>> +	struct list_head list;
>> +	enum psr_state state;
>> +	struct mutex state_mutex;
>> +
>> +	struct timer_list flush_timer;
>> +
>> +	struct drm_encoder *encoder;
>> +	void (*set)(struct drm_encoder *encoder, bool enable);
>> +};
>> +
>> +static struct psr_drv *find_psr_by_crtc(struct drm_crtc *crtc)
>> +{
>> +	struct rockchip_drm_private *drm_drv =3D crtc->dev->dev_private;
>> +	struct psr_drv *psr;
>> +
>> +	mutex_lock(&drm_drv->psr_list_mutex);
>> +	list_for_each_entry(psr, &drm_drv->psr_list, list) {
>> +		if (psr->encoder->crtc =3D=3D crtc) {
>> +			mutex_unlock(&drm_drv->psr_list_mutex);
>> +			return psr;
>> +		}
>> +	}
>> +	mutex_unlock(&drm_drv->psr_list_mutex);
>> +
>> +	return ERR_PTR(-ENODEV);
>> +}
>> +
>> +static void psr_set_state(struct psr_drv *psr, enum psr_state state=
)
>> +{
>> +	mutex_lock(&psr->state_mutex);
>> +
>> +	if (psr->state =3D=3D state) {
>> +		mutex_unlock(&psr->state_mutex);
>> +		return;
>> +	}
>> +
>> +	psr->state =3D state;
>> +	switch (state) {
>> +	case PSR_ENABLE:
>> +		psr->set(psr->encoder, true);
>> +		break;
>> +
>> +	case PSR_DISABLE:
>> +	case PSR_FLUSH:
>> +		psr->set(psr->encoder, false);
>> +		break;
>> +	};
>> +
>> +	mutex_unlock(&psr->state_mutex);
>> +}
>> +
>> +static void psr_flush_handler(unsigned long data)
>> +{
>> +	struct psr_drv *psr =3D (struct psr_drv *)data;
>> +
>> +	if (!psr || psr->state !=3D PSR_FLUSH)
>> +		return;
>> +
>> +	psr_set_state(psr, PSR_ENABLE);
>> +}
>> +
>> +/**
>> + * rockchip_drm_psr_enable - enable the encoder PSR which bind to g=
iven CRTC
>> + * @crtc: CRTC to obtain the PSR encoder
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int rockchip_drm_psr_enable(struct drm_crtc *crtc)
>> +{
>> +	struct psr_drv *psr =3D find_psr_by_crtc(crtc);
>> +
>> +	if (IS_ERR(psr))
>> +		return PTR_ERR(psr);
>> +
>> +	psr_set_state(psr, PSR_ENABLE);
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(rockchip_drm_psr_enable);
>> +
>> +/**
>> + * rockchip_drm_psr_disable - disable the encoder PSR which bind to=
 given CRTC
>> + * @crtc: CRTC to obtain the PSR encoder
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int rockchip_drm_psr_disable(struct drm_crtc *crtc)
>> +{
>> +	struct psr_drv *psr =3D find_psr_by_crtc(crtc);
>> +
>> +	if (IS_ERR(psr))
>> +		return PTR_ERR(psr);
>> +
>> +	psr_set_state(psr, PSR_DISABLE);
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(rockchip_drm_psr_disable);
>> +
>> +/**
>> + * rockchip_drm_psr_flush - force to flush all registered PSR encod=
ers
>> + * @dev: drm device
>> + *
>> + * Disable the PSR function for all registered encoders, and then e=
nable the
>> + * PSR function back after PSR_FLUSH_TIMEOUT. If encoder PSR state =
have been
>> + * changed during flush time, then keep the state no change after f=
lush
>> + * timeout.
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +void rockchip_drm_psr_flush(struct drm_device *dev)
>> +{
>> +	struct rockchip_drm_private *drm_drv =3D dev->dev_private;
>> +	struct psr_drv *psr;
>> +
>> +	mutex_lock(&drm_drv->psr_list_mutex);
>> +	list_for_each_entry(psr, &drm_drv->psr_list, list) {
>> +		if (psr->state =3D=3D PSR_DISABLE)
>> +			continue;
>> +
>> +		mod_timer(&psr->flush_timer,
>> +			  round_jiffies_up(jiffies + PSR_FLUSH_TIMEOUT));
>> +
>> +		psr_set_state(psr, PSR_FLUSH);
>> +	}
>> +	mutex_unlock(&drm_drv->psr_list_mutex);
>> +}
>> +EXPORT_SYMBOL(rockchip_drm_psr_flush);
>> +
>> +/**
>> + * rockchip_drm_psr_register - register encoder to psr driver
>> + * @encoder: encoder that obtain the PSR function
>> + * @psr_set: call back to set PSR state
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int rockchip_drm_psr_register(struct drm_encoder *encoder,
>> +			void (*psr_set)(struct drm_encoder *, bool enable))
>> +{
>> +	struct rockchip_drm_private *drm_drv =3D encoder->dev->dev_private=
;
>> +	struct psr_drv *psr;
>> +
>> +	if (!encoder || !psr_set)
>> +		return -EINVAL;
>> +
>> +	psr =3D kzalloc(sizeof(struct psr_drv), GFP_KERNEL);
>> +	if (!psr)
>> +		return -ENOMEM;
>> +
>> +	setup_timer(&psr->flush_timer, psr_flush_handler, (unsigned long)p=
sr);
>> +
>> +	mutex_init(&psr->state_mutex);
>> +
>> +	psr->state =3D PSR_DISABLE;
>> +	psr->encoder =3D encoder;
>> +	psr->set =3D psr_set;
>> +
>> +	mutex_lock(&drm_drv->psr_list_mutex);
>> +	list_add_tail(&psr->list, &drm_drv->psr_list);
>> +	mutex_unlock(&drm_drv->psr_list_mutex);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(rockchip_drm_psr_register);
>> +
>> +/**
>> + * rockchip_drm_psr_unregister - unregister encoder to psr driver
>> + * @encoder: encoder that obtain the PSR function
>> + * @psr_set: call back to set PSR state
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +void rockchip_drm_psr_unregister(struct drm_encoder *encoder)
>> +{
>> +	struct rockchip_drm_private *drm_drv =3D encoder->dev->dev_private=
;
>> +	struct psr_drv *psr;
>> +
>> +	mutex_lock(&drm_drv->psr_list_mutex);
>> +	list_for_each_entry(psr, &drm_drv->psr_list, list) {
>> +		if (psr->encoder =3D=3D encoder) {
>> +			del_timer(&psr->flush_timer);
>> +			list_del(&psr->list);
>> +			kfree(psr);
>> +		}
>> +	}
>> +	mutex_unlock(&drm_drv->psr_list_mutex);
>> +}
>> +EXPORT_SYMBOL(rockchip_drm_psr_unregister);
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_psr.h b/drivers/g=
pu/drm/rockchip/rockchip_drm_psr.h
>> new file mode 100644
>> index 0000000..c35b688
>> --- /dev/null
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_psr.h
>> @@ -0,0 +1,26 @@
>> +/*
>> + * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
>> + * Author: Yakir Yang <ykk@rock-chips.com>
>> + *
>> + * This software is licensed under the terms of the GNU General Pub=
lic
>> + * License version 2, as published by the Free Software Foundation,=
 and
>> + * may be copied, distributed, and modified under those terms.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#ifndef __ROCKCHIP_DRM_PSR___
>> +#define __ROCKCHIP_DRM_PSR___
>> +
>> +void rockchip_drm_psr_flush(struct drm_device *dev);
>> +int rockchip_drm_psr_enable(struct drm_crtc *crtc);
>> +int rockchip_drm_psr_disable(struct drm_crtc *crtc);
>> +
>> +int rockchip_drm_psr_register(struct drm_encoder *encoder,
>> +			void (*psr_set)(struct drm_encoder *, bool enable));
>> +void rockchip_drm_psr_unregister(struct drm_encoder *encoder);
>> +
>> +#endif /* __ROCKCHIP_DRM_PSR__ */
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/g=
pu/drm/rockchip/rockchip_drm_vop.c
>> index 69d32f1..e702fb3 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> @@ -34,6 +34,7 @@
>>   #include "rockchip_drm_drv.h"
>>   #include "rockchip_drm_gem.h"
>>   #include "rockchip_drm_fb.h"
>> +#include "rockchip_drm_psr.h"
>>   #include "rockchip_drm_vop.h"
>>  =20
>>   #define __REG_SET_RELAXED(x, off, mask, shift, v, write_mask) \
>> @@ -87,6 +88,8 @@
>>   #define to_vop_win(x) container_of(x, struct vop_win, base)
>>   #define to_vop_plane_state(x) container_of(x, struct vop_plane_sta=
te, base)
>>  =20
>> +#define VOP_PSR_SET_DELAY_TIME		msecs_to_jiffies(10)
>> +
>>   struct vop_plane_state {
>>   	struct drm_plane_state base;
>>   	int format;
>> @@ -121,6 +124,9 @@ struct vop {
>>   	/* protected by dev->event_lock */
>>   	struct drm_pending_vblank_event *event;
>>  =20
>> +	bool psr_enabled;
>> +	struct delayed_work psr_work;
>> +
>>   	struct completion line_flag_completion;
>>  =20
>>   	const struct vop_data *data;
>> @@ -629,6 +635,9 @@ static void vop_crtc_disable(struct drm_crtc *cr=
tc)
>>  =20
>>   		crtc->state->event =3D NULL;
>>   	}
>> +
>> +	vop->psr_enabled =3D false;
>> +	INIT_DELAYED_WORK(&vop->psr_work, vop_psr_work);
>>   }
>>  =20
>>   static void vop_plane_destroy(struct drm_plane *plane)
>> @@ -923,6 +932,16 @@ static const struct drm_plane_funcs vop_plane_f=
uncs =3D {
>>   	.atomic_destroy_state =3D vop_atomic_plane_destroy_state,
>>   };
>>  =20
>> +static void vop_psr_work(struct work_struct *work)
>> +{
>> +	struct vop *vop =3D container_of(work, typeof(*vop), psr_work.work=
);
>> +
>> +	if (vop->psr_enabled)
>> +		rockchip_drm_psr_enable(&vop->crtc);
>> +	else
>> +		rockchip_drm_psr_disable(&vop->crtc);
>> +}
>> +
>>   static int vop_crtc_enable_vblank(struct drm_crtc *crtc)
>>   {
>>   	struct vop *vop =3D to_vop(crtc);
>> @@ -937,6 +956,9 @@ static int vop_crtc_enable_vblank(struct drm_crt=
c *crtc)
>>  =20
>>   	spin_unlock_irqrestore(&vop->irq_lock, flags);
>>  =20
>> +	vop->psr_enabled =3D false;
>> +	schedule_delayed_work(&vop->psr_work, VOP_PSR_SET_DELAY_TIME);
>> +
>>   	return 0;
>>   }
>>  =20
>> @@ -953,6 +975,9 @@ static void vop_crtc_disable_vblank(struct drm_c=
rtc *crtc)
>>   	VOP_INTR_SET_TYPE(vop, enable, FS_INTR, 0);
>>  =20
>>   	spin_unlock_irqrestore(&vop->irq_lock, flags);
>> +
>> +	vop->psr_enabled =3D true;
>> +	schedule_delayed_work(&vop->psr_work, VOP_PSR_SET_DELAY_TIME);
>>   }
>>  =20
>>   static void vop_crtc_wait_for_update(struct drm_crtc *crtc)
>> @@ -1597,6 +1622,10 @@ static int vop_bind(struct device *dev, struc=
t device *master, void *data)
>>   		return ret;
>>  =20
>>   	pm_runtime_enable(&pdev->dev);
>> +
>> +	vop->psr_enabled =3D false;
>> +	INIT_DELAYED_WORK(&vop->psr_work, vop_psr_work);
>> +
>>   	return 0;
>>   }
>>  =20
>> --=20
>> 1.9.1
>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
