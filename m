From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 1/4] drm/rockchip: vop: export line flag function
Date: Fri, 1 Jul 2016 11:32:20 -0400
Message-ID: <CAOw6vbKuy5wCb_J0ENP5OGf7B31ut-FDzBzE5NLiFzEY5sWqsg@mail.gmail.com>
References: <1467364685-21390-1-git-send-email-ykk@rock-chips.com>
 <1467364745-21621-1-git-send-email-ykk@rock-chips.com>
 <CAOw6vb+vS3O+Db1_1RSGup7Y2tNjRkxyz7ah817R6nXceSHeFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAOw6vb+vS3O+Db1_1RSGup7Y2tNjRkxyz7ah817R6nXceSHeFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Yao <yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jul 1, 2016 at 11:30 AM, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> On Fri, Jul 1, 2016 at 5:19 AM, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>> VOP have integrated a hardware counter which indicate the exact display
>> line that vop is scanning. And if we're interested in a specific line,
>> we can set the line number to vop line_flag register, and then vop would
>> generate a line_flag interrupt for it.
>>
>> For example eDP PSR function is interested in the vertical blanking
>> period, then driver could set the line number to zero.
>>
>> This patch have exported a symbol that allow other driver to listen the
>> line flag event with given timeout limit:
>> -  rockchip_drm_wait_line_flag()
>>
>> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>> Changes in v3:
>> - Export the 'rockchip_drm_wait_line_flag' symbol, and document it.
>> - Add 'line_flag_num_0' for RK3288/RK3036
>> - Remove the notify for waiting line_flag event (Daniel)
>>
>> Changes in v2:
>> - Introduce in v2, split VOP line flag changes out
>>
>>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h |   3 +
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 103 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h |   3 +
>>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c |   4 ++
>>  4 files changed, 113 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
>> index ea39329..239b830 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
>> @@ -70,4 +70,7 @@ int rockchip_drm_dma_attach_device(struct drm_device *drm_dev,
>>                                    struct device *dev);
>>  void rockchip_drm_dma_detach_device(struct drm_device *drm_dev,
>>                                     struct device *dev);
>> +int rockchip_drm_wait_line_flag(struct drm_crtc *crtc, unsigned int line_num,
>> +                               unsigned int mstimeout);
>> +
>>  #endif /* _ROCKCHIP_DRM_DRV_H_ */
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> index c8a62a8..cd3cac5 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> @@ -121,6 +121,8 @@ struct vop {
>>         /* protected by dev->event_lock */
>>         struct drm_pending_vblank_event *event;
>>
>> +       struct completion line_flag_completion;
>> +
>>         const struct vop_data *data;
>>
>>         uint32_t *regsbak;
>> @@ -431,6 +433,59 @@ static void vop_dsp_hold_valid_irq_disable(struct vop *vop)
>>         spin_unlock_irqrestore(&vop->irq_lock, flags);
>>  }
>>
>> +/*
>> + * (1) each frame starts at the start of the Vsync pulse which is signaled by
>> + *     the "FRAME_SYNC" interrupt.
>> + * (2) the active data region of each frame ends at dsp_vact_end
>> + * (3) we should program this same number (dsp_vact_end) into dsp_line_frag_num,
>> + *      to get "LINE_FLAG" interrupt at the end of the active on screen data.
>> + *
>> + * VOP_INTR_CTRL0.dsp_line_frag_num = VOP_DSP_VACT_ST_END.dsp_vact_end
>> + * Interrupts
>> + * LINE_FLAG -------------------------------+
>> + * FRAME_SYNC ----+                         |
>> + *                |                         |
>> + *                v                         v
>> + *                | Vsync | Vbp |  Vactive  | Vfp |
>> + *                        ^     ^           ^     ^
>> + *                        |     |           |     |
>> + *                        |     |           |     |
>> + * dsp_vs_end ------------+     |           |     |   VOP_DSP_VTOTAL_VS_END
>> + * dsp_vact_start --------------+           |     |   VOP_DSP_VACT_ST_END
>> + * dsp_vact_end ----------------------------+     |   VOP_DSP_VACT_ST_END
>> + * dsp_total -------------------------------------+   VOP_DSP_VTOTAL_VS_END
>> + */
>> +
>> +static void vop_line_flag_irq_enable(struct vop *vop, int line_num)
>> +{
>> +       unsigned long flags;
>> +
>> +       if (WARN_ON(!vop->is_enabled))
>> +               return;
>> +
>> +       spin_lock_irqsave(&vop->irq_lock, flags);
>> +
>> +       VOP_CTRL_SET(vop, line_flag_num_0, line_num);
>> +       VOP_INTR_SET_TYPE(vop, enable, LINE_FLAG_INTR, 1);
>> +       vop_cfg_done(vop);
>> +
>> +       spin_unlock_irqrestore(&vop->irq_lock, flags);
>> +}
>> +
>> +static void vop_line_flag_irq_disable(struct vop *vop)
>> +{
>> +       unsigned long flags;
>> +
>> +       if (WARN_ON(!vop->is_enabled))
>> +               return;
>> +
>> +       spin_lock_irqsave(&vop->irq_lock, flags);
>> +
>> +       VOP_INTR_SET_TYPE(vop, enable, LINE_FLAG_INTR, 0);
>> +
>> +       spin_unlock_irqrestore(&vop->irq_lock, flags);
>> +}
>> +
>>  static void vop_enable(struct drm_crtc *crtc)
>>  {
>>         struct vop *vop = to_vop(crtc);
>> @@ -1157,6 +1212,13 @@ static irqreturn_t vop_isr(int irq, void *data)
>>                 ret = IRQ_HANDLED;
>>         }
>>
>> +       if (active_irqs & LINE_FLAG_INTR) {
>> +               if (!completion_done(&vop->line_flag_completion))
>> +                       complete(&vop->line_flag_completion);
>
> I think there's potential to miss flags here if the timing is just
> right because the completion_done and complete are not atomic wrt the
> wait_line_flag function. I think you need some locking around the
> completion operations to ensure they're properly sequenced.
>
> FWIW, if you're reinitializing the completion every time in
> drm_wait_line_flag, you should be able to just call complete (or
> complete_all) without checking if there are any waiters.
>

I should add, if you just call complete/complete_all() here, you
shouldn't need to add locking (assuming only one waiter).

>
>> +               active_irqs &= ~LINE_FLAG_INTR;
>> +               ret = IRQ_HANDLED;
>> +       }
>> +
>>         if (active_irqs & FS_INTR) {
>>                 drm_crtc_handle_vblank(crtc);
>>                 vop_handle_vblank(vop);
>> @@ -1255,6 +1317,7 @@ static int vop_create_crtc(struct vop *vop)
>>
>>         init_completion(&vop->dsp_hold_completion);
>>         init_completion(&vop->wait_update_complete);
>> +       init_completion(&vop->line_flag_completion);
>>         crtc->port = port;
>>         rockchip_register_crtc_funcs(crtc, &private_crtc_funcs);
>>
>> @@ -1411,6 +1474,46 @@ static void vop_win_init(struct vop *vop)
>>         }
>>  }
>>
>> +/**
>> + * rockchip_drm_wait_line_flag - acqiure the give line flag event
>> + * @crtc: CRTC to enable line flag
>> + * @line_num: interested line number
>> + * @mstimeout: millisecond for timeout
>> + *
>> + * Driver would hold here until the interested line flag interrupt have
>> + * happened or timeout to wait.
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int rockchip_drm_wait_line_flag(struct drm_crtc *crtc, unsigned int line_num,
>> +                               unsigned int mstimeout)
>> +{
>> +       struct vop *vop = to_vop(crtc);
>> +       unsigned long jiffies_left;
>> +
>> +       if (!crtc || !vop->is_enabled)
>> +               return -ENODEV;
>> +
>> +       if (line_num > crtc->mode.vtotal || mstimeout <= 0)
>> +               return -EINVAL;
>> +
>> +       reinit_completion(&vop->line_flag_completion);
>> +       vop_line_flag_irq_enable(vop, line_num);
>> +
>
> This will only work for one waiter per vop. Is it worth enforcing this
> explicitly to avoid weird behavior when there are more than one?
>
>> +       jiffies_left = wait_for_completion_timeout(&vop->line_flag_completion,
>> +                                                  msecs_to_jiffies(mstimeout));
>> +       vop_line_flag_irq_disable(vop);
>> +
>> +       if (jiffies_left == 0) {
>> +               dev_err(vop->dev, "Timeout waiting for IRQ\n");
>> +               return -ETIMEDOUT;
>> +       }
>> +
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL(rockchip_drm_wait_line_flag);
>> +
>>  static int vop_bind(struct device *dev, struct device *master, void *data)
>>  {
>>         struct platform_device *pdev = to_platform_device(dev);
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
>> index ff4f52e..34fcd03 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
>> @@ -61,6 +61,9 @@ struct vop_ctrl {
>>         struct vop_reg hpost_st_end;
>>         struct vop_reg vpost_st_end;
>>
>> +       struct vop_reg line_flag_num_0;
>> +       struct vop_reg line_flag_num_1;
>> +
>
> nit: you could make this an array:
>
> struct vop_reg line_flag_num[2];
>
>
>>         struct vop_reg cfg_done;
>>  };
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
>> index 6f42e56..e9211c9 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
>> @@ -122,6 +122,7 @@ static const struct vop_ctrl rk3036_ctrl_data = {
>>         .hact_st_end = VOP_REG(RK3036_DSP_HACT_ST_END, 0x1fff1fff, 0),
>>         .vtotal_pw = VOP_REG(RK3036_DSP_VTOTAL_VS_END, 0x1fff1fff, 0),
>>         .vact_st_end = VOP_REG(RK3036_DSP_VACT_ST_END, 0x1fff1fff, 0),
>> +       .line_flag_num_0 = VOP_REG(RK3036_INT_STATUS, 0xfff, 12),
>>         .cfg_done = VOP_REG(RK3036_REG_CFG_DONE, 0x1, 0),
>>  };
>>
>> @@ -221,6 +222,7 @@ static const struct vop_ctrl rk3288_ctrl_data = {
>>         .vact_st_end = VOP_REG(RK3288_DSP_VACT_ST_END, 0x1fff1fff, 0),
>>         .hpost_st_end = VOP_REG(RK3288_POST_DSP_HACT_INFO, 0x1fff1fff, 0),
>>         .vpost_st_end = VOP_REG(RK3288_POST_DSP_VACT_INFO, 0x1fff1fff, 0),
>> +       .line_flag_num_0 = VOP_REG(RK3288_INTR_CTRL0, 0x1fff, 12),
>>         .cfg_done = VOP_REG(RK3288_REG_CFG_DONE, 0x1, 0),
>>  };
>>
>> @@ -299,6 +301,8 @@ static const struct vop_ctrl rk3399_ctrl_data = {
>>         .vact_st_end = VOP_REG(RK3399_DSP_VACT_ST_END, 0x1fff1fff, 0),
>>         .hpost_st_end = VOP_REG(RK3399_POST_DSP_HACT_INFO, 0x1fff1fff, 0),
>>         .vpost_st_end = VOP_REG(RK3399_POST_DSP_VACT_INFO, 0x1fff1fff, 0),
>> +       .line_flag_num_0 = VOP_REG(RK3399_LINE_FLAG, 0xffff, 0),
>> +       .line_flag_num_1 = VOP_REG(RK3399_LINE_FLAG, 0xffff, 16),
>>         .cfg_done = VOP_REG_MASK(RK3399_REG_CFG_DONE, 0x1, 0),
>>  };
>>
>> --
>> 1.9.1
>>
>>
