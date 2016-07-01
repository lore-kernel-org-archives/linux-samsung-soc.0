From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v3 2/4] drm/rockchip: add an common abstracted PSR driver
Date: Fri, 1 Jul 2016 14:00:00 -0400
Message-ID: <CAOw6vbKMWEEDEqw0_ba_FGO-2mOBg3uanQzk5nbnCtowWdLu9w@mail.gmail.com>
References: <1467364685-21390-1-git-send-email-ykk@rock-chips.com> <1467364754-21674-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467364754-21674-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Doug Anderson <dianders@chromium.org>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jul 1, 2016 at 5:19 AM, Yakir Yang <ykk@rock-chips.com> wrote:
> The PSR driver have exported four symbols for specific device driver:
> - rockchip_drm_psr_register()
> - rockchip_drm_psr_unregister()
> - rockchip_drm_psr_enable()
> - rockchip_drm_psr_disable()
> - rockchip_drm_psr_flush()
>
> Encoder driver should call the register/unregister interfaces to hook
> itself into common PSR driver, encoder have implement the 'psr_set'
> callback which use the set PSR state in hardware side.
>
> Crtc driver would call the enable/disable interfaces when vblank is
> enable/disable, after that the common PSR driver would call the encoder
> registered callback to set the PSR state.
>

This feels overly complicated. It seems like you could cut out a bunch
of code by just coding the psr functions into vop and
analogix_dp-rockchip. I suppose the only reason to keep it abstracted
would be if you plan on supporting psr in a different encoder or crtc
in rockchip, or if you're planning on moving this into drm core.

Perhaps others will disagree with this sentiment and this is the right
thing to do.

> Fb driver would call the flush interface in 'fb->dirty' callback, this
> helper function would force all PSR enabled encoders to exit from PSR
> for 3 seconds.
>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> ---
> Changes in v3:
> - split the psr flow into an common abstracted PSR driver
> - implement the 'fb->dirty' callback function (Daniel)
> - avoid to use notify to acqiure for vact event (Daniel)
> - remove psr_active() callback which introduce in v2
>
> Changes in v2: None
>
>  drivers/gpu/drm/rockchip/Makefile           |   2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c  |  12 ++
>  drivers/gpu/drm/rockchip/rockchip_drm_psr.c | 200 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_psr.h |  12 ++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  24 ++++
>  5 files changed, 249 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_psr.c
>  create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_psr.h
>
> diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip/Makefile
> index 05d0713..9746365 100644
> --- a/drivers/gpu/drm/rockchip/Makefile
> +++ b/drivers/gpu/drm/rockchip/Makefile
> @@ -3,7 +3,7 @@
>  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>
>  rockchipdrm-y := rockchip_drm_drv.o rockchip_drm_fb.o \
> -               rockchip_drm_gem.o rockchip_drm_vop.o
> +               rockchip_drm_gem.o rockchip_drm_psr.o rockchip_drm_vop.o
>  rockchipdrm-$(CONFIG_DRM_FBDEV_EMULATION) += rockchip_drm_fbdev.o
>
>  obj-$(CONFIG_ROCKCHIP_ANALOGIX_DP) += analogix_dp-rockchip.o
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> index 20f12bc..0fec18f 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> @@ -21,6 +21,7 @@
>
>  #include "rockchip_drm_drv.h"
>  #include "rockchip_drm_gem.h"
> +#include "rockchip_drm_psr.h"
>
>  #define to_rockchip_fb(x) container_of(x, struct rockchip_drm_fb, fb)
>
> @@ -66,9 +67,20 @@ static int rockchip_drm_fb_create_handle(struct drm_framebuffer *fb,
>                                      rockchip_fb->obj[0], handle);
>  }
>
> +static int rockchip_drm_fb_dirty(struct drm_framebuffer *fb,
> +                                struct drm_file *file,
> +                                unsigned int flags, unsigned int color,
> +                                struct drm_clip_rect *clips,
> +                                unsigned int num_clips)
> +{
> +       rockchip_drm_psr_flush();
> +       return 0;
> +}
> +
>  static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs = {
>         .destroy        = rockchip_drm_fb_destroy,
>         .create_handle  = rockchip_drm_fb_create_handle,
> +       .dirty          = rockchip_drm_fb_dirty,
>  };
>
>  static struct rockchip_drm_fb *
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_psr.c b/drivers/gpu/drm/rockchip/rockchip_drm_psr.c
> new file mode 100644
> index 0000000..c044443
> --- /dev/null
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_psr.c
> @@ -0,0 +1,200 @@
> +#include <drm/drm_crtc_helper.h>
> +
> +#include "rockchip_drm_psr.h"
> +
> +#define PSR_FLUSH_TIMEOUT      msecs_to_jiffies(3000) /* 3 seconds */
> +
> +static LIST_HEAD(psr_list);
> +static DEFINE_MUTEX(psr_list_mutex);

I'm not crazy about these globals. Perhaps you can initialize them
with the rockchip driver and tuck them in a driver-level struct
(rockchip_drm_private or something).


> +
> +enum psr_state {
> +       PSR_FLUSH,
> +       PSR_ENABLE,
> +       PSR_DISABLE,
> +};
> +
> +struct psr_drv {
> +       struct list_head list;
> +       enum psr_state state;
> +       struct mutex state_mutex;
> +
> +       struct timer_list flush_timer;
> +
> +       struct drm_encoder *encoder;
> +       int (*set)(struct drm_encoder *encoder, bool enable);
> +};
> +
> +static struct psr_drv *find_psr_by_crtc(struct drm_crtc *crtc)
> +{
> +       struct psr_drv *psr;
> +
> +       mutex_lock(&psr_list_mutex);
> +       list_for_each_entry(psr, &psr_list, list) {
> +               if (psr->encoder->crtc == crtc) {
> +                       mutex_unlock(&psr_list_mutex);
> +                       return psr;
> +               }
> +       }
> +       mutex_unlock(&psr_list_mutex);
> +
> +       return ERR_PTR(-ENODEV);
> +}
> +
> +static void psr_enable(struct psr_drv *psr)
> +{
> +       if (psr->state == PSR_ENABLE)
> +               return;

Should you be worried about races by accessing this outside of the state mutex?

> +
> +       mutex_lock(&psr->state_mutex);
> +       psr->state = PSR_ENABLE;
> +       psr->set(psr->encoder, true);
> +       mutex_unlock(&psr->state_mutex);
> +}
> +
> +static void psr_disable(struct psr_drv *psr)
> +{
> +       if (psr->state == PSR_DISABLE)
> +               return;
> +
> +       mutex_lock(&psr->state_mutex);
> +       psr->state = PSR_DISABLE;
> +       psr->set(psr->encoder, false);
> +       mutex_unlock(&psr->state_mutex);
> +}
> +
> +static void psr_flush_handler(unsigned long data)
> +{
> +       struct psr_drv *psr = (struct psr_drv *)data;
> +
> +       if (!psr || psr->state != PSR_FLUSH)
> +               return;
> +
> +       psr_enable(psr);
> +}
> +
> +/**
> + * rockchip_drm_psr_enable - enable the encoder PSR which bind to given CRTC
> + * @crtc: CRTC to obtain the PSR encoder
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int rockchip_drm_psr_enable(struct drm_crtc *crtc)
> +{
> +       struct psr_drv *psr = find_psr_by_crtc(crtc);
> +
> +       if (IS_ERR(psr))
> +               return PTR_ERR(psr);
> +
> +       psr_enable(psr);
> +       return 0;
> +}
> +EXPORT_SYMBOL(rockchip_drm_psr_enable);
> +
> +/**
> + * rockchip_drm_psr_disable - disable the encoder PSR which bind to given CRTC
> + * @crtc: CRTC to obtain the PSR encoder
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int rockchip_drm_psr_disable(struct drm_crtc *crtc)
> +{
> +       struct psr_drv *psr = find_psr_by_crtc(crtc);
> +
> +       if (IS_ERR(psr))
> +               return PTR_ERR(psr);
> +
> +       psr_disable(psr);
> +       return 0;
> +}
> +EXPORT_SYMBOL(rockchip_drm_psr_disable);
> +
> +/**
> + * rockchip_drm_psr_flush - force to flush all registered PSR encoders
> + *
> + * Disable the PSR function for all registered encoders, and then enable the
> + * PSR function back after 5 second. If encoder PSR state have been changed

s/5 second/PSR_FLUSH_TIMEOUT/

> + * during flush time, then keep the state no change after flush timeout.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +void rockchip_drm_psr_flush(void)
> +{
> +       struct psr_drv *psr;
> +
> +       mutex_lock(&psr_list_mutex);
> +       list_for_each_entry(psr, &psr_list, list) {
> +               if (psr->state == PSR_DISABLE)
> +                       continue;
> +
> +               mod_timer(&psr->flush_timer,
> +                         round_jiffies_up(jiffies + PSR_FLUSH_TIMEOUT));
> +
> +               psr_disable(psr);
> +               psr->state = PSR_FLUSH;

This is set outside of state_mutex, is that intentional?

> +       }
> +       mutex_unlock(&psr_list_mutex);
> +}
> +EXPORT_SYMBOL(rockchip_drm_psr_flush);
> +
> +/**
> + * rockchip_drm_psr_register - register encoder to psr driver
> + * @encoder: encoder that obtain the PSR function
> + * @psr_set: call back to set PSR state
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int rockchip_drm_psr_register(struct drm_encoder *encoder,
> +                             int (*psr_set)(struct drm_encoder *, bool enable))
> +{
> +       struct psr_drv *psr;
> +
> +       if (!encoder || !psr_set)
> +               return -EINVAL;
> +
> +       psr = kzalloc(sizeof(struct psr_drv), GFP_KERNEL);
> +       if (!psr)
> +               return -ENOMEM;
> +
> +       setup_timer(&psr->flush_timer, psr_flush_handler, (unsigned long)psr);
> +
> +       mutex_init(&psr->state_mutex);
> +
> +       psr->state = PSR_DISABLE;
> +       psr->encoder = encoder;
> +       psr->set = psr_set;
> +
> +       mutex_lock(&psr_list_mutex);
> +       list_add_tail(&psr->list, &psr_list);
> +       mutex_unlock(&psr_list_mutex);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(rockchip_drm_psr_register);
> +
> +/**
> + * rockchip_drm_psr_unregister - unregister encoder to psr driver
> + * @encoder: encoder that obtain the PSR function
> + * @psr_set: call back to set PSR state
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +void rockchip_drm_psr_unregister(struct drm_encoder *encoder)
> +{
> +       struct psr_drv *psr;
> +
> +       mutex_lock(&psr_list_mutex);
> +       list_for_each_entry(psr, &psr_list, list) {
> +               if (psr->encoder == encoder) {
> +                       del_timer(&psr->flush_timer);
> +                       list_del(&psr->list);
> +                       kfree(psr);
> +               }
> +       }
> +       mutex_unlock(&psr_list_mutex);
> +}
> +EXPORT_SYMBOL(rockchip_drm_psr_unregister);
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_psr.h b/drivers/gpu/drm/rockchip/rockchip_drm_psr.h
> new file mode 100644
> index 0000000..622f605
> --- /dev/null
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_psr.h
> @@ -0,0 +1,12 @@
> +#ifndef __ROCKCHIP_DRM_PSR___
> +#define __ROCKCHIP_DRM_PSR___
> +
> +void rockchip_drm_psr_flush(void);
> +int rockchip_drm_psr_enable(struct drm_crtc *crtc);
> +int rockchip_drm_psr_disable(struct drm_crtc *crtc);
> +
> +int rockchip_drm_psr_register(struct drm_encoder *encoder,
> +                           int (*psr_set)(struct drm_encoder *, bool enable));
> +void rockchip_drm_psr_unregister(struct drm_encoder *encoder);
> +
> +#endif /* __ROCKCHIP_DRM_PSR__ */
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index cd3cac5..3c6dfc5 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -34,6 +34,7 @@
>  #include "rockchip_drm_drv.h"
>  #include "rockchip_drm_gem.h"
>  #include "rockchip_drm_fb.h"
> +#include "rockchip_drm_psr.h"
>  #include "rockchip_drm_vop.h"
>
>  #define __REG_SET_RELAXED(x, off, mask, shift, v, write_mask) \
> @@ -121,6 +122,9 @@ struct vop {
>         /* protected by dev->event_lock */
>         struct drm_pending_vblank_event *event;
>
> +       bool psr_enabled;
> +       struct delayed_work psr_work;
> +
>         struct completion line_flag_completion;
>
>         const struct vop_data *data;
> @@ -911,6 +915,16 @@ static const struct drm_plane_funcs vop_plane_funcs = {
>         .atomic_destroy_state = vop_atomic_plane_destroy_state,
>  };
>
> +static void vop_psr_work(struct work_struct *work)
> +{
> +       struct vop *vop = container_of(work, typeof(*vop), psr_work.work);
> +
> +       if (vop->psr_enabled)
> +               rockchip_drm_psr_enable(&vop->crtc);
> +       else
> +               rockchip_drm_psr_disable(&vop->crtc);
> +}
> +
>  static int vop_crtc_enable_vblank(struct drm_crtc *crtc)
>  {
>         struct vop *vop = to_vop(crtc);
> @@ -925,6 +939,9 @@ static int vop_crtc_enable_vblank(struct drm_crtc *crtc)
>
>         spin_unlock_irqrestore(&vop->irq_lock, flags);
>
> +       vop->psr_enabled = false;
> +       schedule_delayed_work(&vop->psr_work, msecs_to_jiffies(10));
> +
>         return 0;
>  }
>
> @@ -941,6 +958,9 @@ static void vop_crtc_disable_vblank(struct drm_crtc *crtc)
>         VOP_INTR_SET_TYPE(vop, enable, FS_INTR, 0);
>
>         spin_unlock_irqrestore(&vop->irq_lock, flags);
> +
> +       vop->psr_enabled = true;
> +       schedule_delayed_work(&vop->psr_work, msecs_to_jiffies(10));
>  }
>
>  static void vop_crtc_wait_for_update(struct drm_crtc *crtc)
> @@ -1582,6 +1602,10 @@ static int vop_bind(struct device *dev, struct device *master, void *data)
>                 return ret;
>
>         pm_runtime_enable(&pdev->dev);
> +
> +       vop->psr_enabled = false;
> +       INIT_DELAYED_WORK(&vop->psr_work, vop_psr_work);
> +
>         return 0;
>  }
>
> --
> 1.9.1
>
>
