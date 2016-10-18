From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v3 1/6] drm/bridge: analogix_dp: set psr
 activate/deactivate when enable/disable bridge
Date: Tue, 18 Oct 2016 11:52:16 -0400
Message-ID: <CAOw6vb+peajznT3BkAZSG7f_7NRB08rTA8Vh_AufPSmwYjT0EQ@mail.gmail.com>
References: <1476771283-11398-1-git-send-email-wzz@rock-chips.com> <1476771283-11398-2-git-send-email-wzz@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476771283-11398-2-git-send-email-wzz@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zain Wang <wzz@rock-chips.com>, Archit <architt@codeaurora.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Doug Anderson <dianders@chromium.org>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Oct 18, 2016 at 2:14 AM, Zain Wang <wzz@rock-chips.com> wrote:
> From: zain wang <wzz@rock-chips.com>
>
> There's a race between when bridge_disable and when vop_crtc_disable are called.
> If the flush timer triggers a new psr work between these, we will operate eDP
> without power shutdowned by bridge_disable.
> In this case, moving activate/deactivate to enable/disable bridge to avoid it.
>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> Signed-off-by: zain wang <wzz@rock-chips.com>
> ---
>
> Changes in v3:
> - remove changes before.
> - move psr activat/deactivate to enable/disable bridge.
>
> Changes in v2:
> - add spin_lock to protect dpms_mode
>
>
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c |  4 ++--
>  drivers/gpu/drm/rockchip/rockchip_drm_psr.c     | 30 ++++++++++++++++++++-----
>  drivers/gpu/drm/rockchip/rockchip_drm_psr.h     |  4 ++--
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c     |  4 ----
>  4 files changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index 8548e82..e5471e7 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -159,7 +159,7 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
>                 return ret;
>         }
>
> -       return 0;
> +       return rockchip_drm_psr_activate(&dp->encoder);
>  }
>
>  static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
> @@ -168,7 +168,7 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
>
>         clk_disable_unprepare(dp->pclk);
>
> -       return 0;
> +       return rockchip_drm_psr_deactivate(&dp->encoder);
>  }
>
>  static int rockchip_dp_get_modes(struct analogix_dp_plat_data *plat_data,
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_psr.c b/drivers/gpu/drm/rockchip/rockchip_drm_psr.c
> index a553e18..4c379e9 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_psr.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_psr.c
> @@ -57,6 +57,24 @@ out:
>         return psr;
>  }
>
> +static struct psr_drv *find_psr_by_encoder(struct drm_encoder *encoder)
> +{
> +       struct rockchip_drm_private *drm_drv = encoder->dev->dev_private;
> +       struct psr_drv *psr;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&drm_drv->psr_list_lock, flags);
> +       list_for_each_entry(psr, &drm_drv->psr_list, list) {
> +               if (psr->encoder == encoder)
> +                       goto out;
> +       }
> +       psr = ERR_PTR(-ENODEV);
> +
> +out:
> +       spin_unlock_irqrestore(&drm_drv->psr_list_lock, flags);
> +       return psr;
> +}
> +
>  static void psr_set_state_locked(struct psr_drv *psr, enum psr_state state)
>  {
>         /*
> @@ -115,14 +133,14 @@ static void psr_flush_handler(unsigned long data)
>
>  /**
>   * rockchip_drm_psr_activate - activate PSR on the given pipe
> - * @crtc: CRTC to obtain the PSR encoder
> + * @encoder: encoder to obtain the PSR encoder
>   *
>   * Returns:
>   * Zero on success, negative errno on failure.
>   */
> -int rockchip_drm_psr_activate(struct drm_crtc *crtc)
> +int rockchip_drm_psr_activate(struct drm_encoder *encoder)
>  {
> -       struct psr_drv *psr = find_psr_by_crtc(crtc);
> +       struct psr_drv *psr = find_psr_by_encoder(encoder);
>         unsigned long flags;
>
>         if (IS_ERR(psr))
> @@ -138,14 +156,14 @@ EXPORT_SYMBOL(rockchip_drm_psr_activate);
>
>  /**
>   * rockchip_drm_psr_deactivate - deactivate PSR on the given pipe
> - * @crtc: CRTC to obtain the PSR encoder
> + * @encoder: encoder to obtain the PSR encoder
>   *
>   * Returns:
>   * Zero on success, negative errno on failure.
>   */
> -int rockchip_drm_psr_deactivate(struct drm_crtc *crtc)
> +int rockchip_drm_psr_deactivate(struct drm_encoder *encoder)
>  {
> -       struct psr_drv *psr = find_psr_by_crtc(crtc);
> +       struct psr_drv *psr = find_psr_by_encoder(encoder);
>         unsigned long flags;
>
>         if (IS_ERR(psr))
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_psr.h b/drivers/gpu/drm/rockchip/rockchip_drm_psr.h
> index b420cf1..b1ea015 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_psr.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_psr.h
> @@ -18,8 +18,8 @@
>  void rockchip_drm_psr_flush_all(struct drm_device *dev);
>  int rockchip_drm_psr_flush(struct drm_crtc *crtc);
>
> -int rockchip_drm_psr_activate(struct drm_crtc *crtc);
> -int rockchip_drm_psr_deactivate(struct drm_crtc *crtc);
> +int rockchip_drm_psr_activate(struct drm_encoder *encoder);
> +int rockchip_drm_psr_deactivate(struct drm_encoder *encoder);
>
>  int rockchip_drm_psr_register(struct drm_encoder *encoder,
>                         void (*psr_set)(struct drm_encoder *, bool enable));
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index c7eba30..1740a0b 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -566,8 +566,6 @@ static void vop_crtc_disable(struct drm_crtc *crtc)
>
>         WARN_ON(vop->event);
>
> -       rockchip_drm_psr_deactivate(&vop->crtc);
> -
>         /*
>          * We need to make sure that all windows are disabled before we
>          * disable that crtc. Otherwise we might try to scan from a destroyed
> @@ -975,8 +973,6 @@ static void vop_crtc_enable(struct drm_crtc *crtc)
>         clk_set_rate(vop->dclk, adjusted_mode->clock * 1000);
>
>         VOP_CTRL_SET(vop, standby, 0);
> -
> -       rockchip_drm_psr_activate(&vop->crtc);
>  }
>
>  static bool vop_fs_irq_is_pending(struct vop *vop)
> --
> 1.9.1
>
>
