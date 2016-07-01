From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v3 4/4] drm/rockchip: analogix_dp: implement PSR function
Date: Fri, 1 Jul 2016 16:05:52 -0400
Message-ID: <CAOw6vbL=GsAL+XDive6g4ettZrdrW6BZ-OkVbPp54E5gxn_HsQ@mail.gmail.com>
References: <1467364685-21390-1-git-send-email-ykk@rock-chips.com> <1467364776-21794-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467364776-21794-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Doug Anderson <dianders@chromium.org>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jul 1, 2016 at 5:19 AM, Yakir Yang <ykk@rock-chips.com> wrote:
> Alway enable the PSR function for Rockchip analogix_dp driver. If panel
> don't support PSR, then the core analogix_dp would ignore this setting.
>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> ---
> Changes in v3:
> - split the common psr logic into a seperate driver, make this to a
>   simple sub-psr device driver.
>
> Changes in v2:
> - remove vblank notify out (Daniel)
> - create a psr_active() callback in vop data struct.
>
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 52 +++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index e81e19a..80a60a6 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -32,6 +32,7 @@
>  #include <drm/bridge/analogix_dp.h>
>
>  #include "rockchip_drm_drv.h"
> +#include "rockchip_drm_psr.h"
>  #include "rockchip_drm_vop.h"
>
>  #define RK3288_GRF_SOC_CON6            0x25c
> @@ -68,11 +69,53 @@ struct rockchip_dp_device {
>         struct regmap            *grf;
>         struct reset_control     *rst;
>
> +       struct delayed_work      psr_work;
> +       unsigned int             psr_state;
> +
>         const struct rockchip_dp_chip_data *data;
>
>         struct analogix_dp_plat_data plat_data;
>  };
>
> +static int analogix_dp_psr_set(struct drm_encoder *encoder, bool enabled)

Again, this function doesn't fail, but its return type is int.
Fortunately you don't check the return in rockchip_drm_psr.c, so this
also seems like a good void candidate.

> +{
> +       struct rockchip_dp_device *dp = to_dp(encoder);
> +
> +       dev_dbg(dp->dev, "%s PSR...\n", enabled ? "Entry" : "Exit");
> +
> +       if (enabled)
> +               dp->psr_state = EDP_VSC_PSR_STATE_ACTIVE;
> +       else
> +               dp->psr_state = ~EDP_VSC_PSR_STATE_ACTIVE;
> +
> +       schedule_delayed_work(&dp->psr_work, msecs_to_jiffies(10));

Pull 10 out into a #define

> +
> +       return 0;
> +}
> +
> +static void analogix_dp_psr_work(struct work_struct *work)
> +{
> +       struct rockchip_dp_device *dp =
> +                               container_of(work, typeof(*dp), psr_work.work);
> +       struct drm_crtc *crtc = dp->encoder.crtc;
> +       int psr_state = dp->psr_state;
> +       int vact_end;
> +       int ret;
> +
> +       if (!crtc)
> +               return;
> +
> +       vact_end = crtc->mode.vtotal - crtc->mode.vsync_start + crtc->mode.vdisplay;
> +
> +       ret = rockchip_drm_wait_line_flag(dp->encoder.crtc, vact_end, 100);


Pull 100 out into a #define

> +       if (ret == 0) {

if (ret) {
    dev_err(... "line flag interrupt did not arrive");
    return;
}

> +               if (psr_state == EDP_VSC_PSR_STATE_ACTIVE)
> +                       analogix_dp_active_psr(dp->dev);
> +               else
> +                       analogix_dp_inactive_psr(dp->dev);
> +       }
> +}
> +
>  static int rockchip_dp_pre_init(struct rockchip_dp_device *dp)
>  {
>         reset_control_assert(dp->rst);
> @@ -340,12 +383,21 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>         dp->plat_data.power_off = rockchip_dp_powerdown;
>         dp->plat_data.get_modes = rockchip_dp_get_modes;
>
> +       dp->psr_state = ~EDP_VSC_PSR_STATE_ACTIVE;
> +       INIT_DELAYED_WORK(&dp->psr_work, analogix_dp_psr_work);
> +
> +       rockchip_drm_psr_register(&dp->encoder, analogix_dp_psr_set);
> +
>         return analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
>  }
>
>  static void rockchip_dp_unbind(struct device *dev, struct device *master,
>                                void *data)
>  {
> +       struct rockchip_dp_device *dp = dev_get_drvdata(dev);
> +
> +       rockchip_drm_psr_unregister(&dp->encoder);
> +
>         return analogix_dp_unbind(dev, master, data);
>  }
>
> --
> 1.9.1
>
>
