From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH 6/6] drm: bridge/analogix: enable vop standby when entry PSR
Date: Tue, 18 Oct 2016 11:54:56 -0400
Message-ID: <CAOw6vbLL-_GisEmLnE9S7uQvLGnqvfi5+KAcW9PSVHVo7TdMMQ@mail.gmail.com>
References: <1476771756-12045-1-git-send-email-wzz@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f182.google.com ([209.85.161.182]:36649 "EHLO
        mail-yw0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964819AbcJRQDI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 12:03:08 -0400
Received: by mail-yw0-f182.google.com with SMTP id u124so142506084ywg.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Oct 2016 09:03:07 -0700 (PDT)
Received: from mail-yb0-f172.google.com (mail-yb0-f172.google.com. [209.85.213.172])
        by smtp.gmail.com with ESMTPSA id n184sm613742ywn.24.2016.10.18.09.03.06
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Oct 2016 09:03:06 -0700 (PDT)
Received: by mail-yb0-f172.google.com with SMTP id x128so23990352ybg.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Oct 2016 09:03:06 -0700 (PDT)
In-Reply-To: <1476771756-12045-1-git-send-email-wzz@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Zain Wang <wzz@rock-chips.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Doug Anderson <dianders@chromium.org>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org, Archit <architt@codeaurora.org>

On Tue, Oct 18, 2016 at 2:22 AM, Zain Wang <wzz@rock-chips.com> wrote:
> From: zain wang <wzz@rock-chips.com>
>
> make VOP standby when entry PSR to save some power.

This is super racey and will cause bugs. Hopefully once you base it on
the updated locking it won't be.

I'll wait until then to review.

Sean


>
> Signed-off-by: zain wang <wzz@rock-chips.com>
> ---
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 29 ++++++++++++++++++-------
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h     |  1 +
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c     | 19 ++++++++++++++++
>  3 files changed, 41 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index 1c2d756..e0f3ed3 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -113,6 +113,13 @@ static void analogix_dp_psr_work(struct work_struct *work)
>         if (!crtc)
>                 return;
>
> +       spin_lock_irqsave(&dp->psr_lock, flags);
> +       psr_state = dp->psr_state;
> +       spin_unlock_irqrestore(&dp->psr_lock, flags);
> +
> +       if (psr_state != EDP_VSC_PSR_STATE_ACTIVE)
> +               rockchip_drm_vop_set_standby(crtc, false);
> +
>         vact_end = crtc->mode.vtotal - crtc->mode.vsync_start + crtc->mode.vdisplay;
>
>         ret = rockchip_drm_wait_line_flag(dp->encoder.crtc, vact_end,
> @@ -122,14 +129,20 @@ static void analogix_dp_psr_work(struct work_struct *work)
>                 return;
>         }
>
> -       spin_lock_irqsave(&dp->psr_lock, flags);
> -       psr_state = dp->psr_state;
> -       spin_unlock_irqrestore(&dp->psr_lock, flags);
> -
> -       if (psr_state == EDP_VSC_PSR_STATE_ACTIVE)
> -               analogix_dp_enable_psr(dp->dev);
> -       else
> -               analogix_dp_disable_psr(dp->dev);
> +       if (psr_state == EDP_VSC_PSR_STATE_ACTIVE) {
> +               ret = analogix_dp_enable_psr(dp->dev);
> +               if (ret) {
> +                       dev_err(dp->dev, "failed to enable psr\n");
> +                       return;
> +               }
> +               rockchip_drm_vop_set_standby(crtc, true);
> +       } else {
> +               ret = analogix_dp_disable_psr(dp->dev);
> +               if (ret) {
> +                       dev_err(dp->dev, "failed to disable psr\n");
> +                       return;
> +               }
> +       }
>  }
>
>  static int rockchip_dp_pre_init(struct rockchip_dp_device *dp)
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> index fb6226c..7149c69 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> @@ -74,5 +74,6 @@ void rockchip_drm_dma_detach_device(struct drm_device *drm_dev,
>                                     struct device *dev);
>  int rockchip_drm_wait_line_flag(struct drm_crtc *crtc, unsigned int line_num,
>                                 unsigned int mstimeout);
> +void rockchip_drm_vop_set_standby(struct drm_crtc *crtc, bool enabled);
>
>  #endif /* _ROCKCHIP_DRM_DRV_H_ */
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index 1740a0b..13eabda 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1478,6 +1478,25 @@ int rockchip_drm_wait_line_flag(struct drm_crtc *crtc, unsigned int line_num,
>  }
>  EXPORT_SYMBOL(rockchip_drm_wait_line_flag);
>
> +void rockchip_drm_vop_set_standby(struct drm_crtc *crtc, bool enabled)
> +{
> +       struct vop *vop = to_vop(crtc);
> +
> +       if (!crtc || !vop->is_enabled)
> +               return;
> +
> +       spin_lock(&vop->reg_lock);
> +
> +       if (enabled)
> +               VOP_CTRL_SET(vop, standby, 1);
> +       else
> +               VOP_CTRL_SET(vop, standby, 0);
> +
> +       spin_unlock(&vop->reg_lock);
> +
> +}
> +EXPORT_SYMBOL(rockchip_drm_vop_set_standby);
> +
>  static int vop_bind(struct device *dev, struct device *master, void *data)
>  {
>         struct platform_device *pdev = to_platform_device(dev);
> --
> 1.9.1
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
