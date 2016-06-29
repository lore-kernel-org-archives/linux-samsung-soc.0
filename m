From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v4 01/11] drm/rockchip: analogix_dp: split the lcdc select
 setting into device data
Date: Wed, 29 Jun 2016 09:44:54 -0400
Message-ID: <CAOw6vb+gkT8v0DrOw77gz7vw9vF_2Tjf+-dx09+OoOiy70ghEw@mail.gmail.com>
References: <1467191657-16941-1-git-send-email-ykk@rock-chips.com> <1467191701-17134-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467191701-17134-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <treding@nvidia.com>, Douglas Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Emil Velikov <emil.l.velikov@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jun 29, 2016 at 5:15 AM, Yakir Yang <ykk@rock-chips.com> wrote:
> eDP controller need to declare which vop provide the video source,
> and it's defined in GRF registers.
>
> But different chips have different GRF register address, so we need to
> create a device data to declare the GRF messages for each chips.
>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> Acked-by: Mark Yao <mark.yao@rock-chips.com>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> ---
> Changes in v4:
> - Assigned the GRF setting magic numbers to a #define that corresponds to
>   a TRM name. (Sean & Heiko)
> - Pass the chip type to device type directly. (Sean)
> - Add reviewed flag from Tomasz.
>
> Changes in v3:
> - Write a kerneldoc-style comment explaining the chips data fields (Tomasz, reviewed at Google Gerrit)
>     [https://chromium-review.googlesource.com/#/c/346313/10/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c@39]
> - Drop the '.lcdcsel_mask' number in chips data field (Tomasz, reviewed at Google Gerrit)
>     [https://chromium-review.googlesource.com/#/c/346313/10/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c@382]
> - Add acked flag from Mark.
>
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 49 ++++++++++++++++++++-----
>  1 file changed, 39 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index c120172..0a30931 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -14,6 +14,7 @@
>
>  #include <linux/component.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> @@ -33,13 +34,26 @@
>  #include "rockchip_drm_drv.h"
>  #include "rockchip_drm_vop.h"
>
> +#define RK3288_GRF_SOC_CON6            0x25c
> +#define RK3288_EDP_LCDC_SEL            BIT(5)
> +
> +#define HIWORD_UPDATE(val, mask)       (val | (mask) << 16)
> +
>  #define to_dp(nm)      container_of(nm, struct rockchip_dp_device, nm)
>
> -/* dp grf register offset */
> -#define GRF_SOC_CON6                            0x025c
> -#define GRF_EDP_LCD_SEL_MASK                    BIT(5)
> -#define GRF_EDP_SEL_VOP_LIT                     BIT(5)
> -#define GRF_EDP_SEL_VOP_BIG                     0
> +/**
> + * struct rockchip_dp_chip_data - splite the grf setting of kind of chips
> + * @lcdsel_grf_reg: grf register offset of lcdc select
> + * @lcdsel_big: reg value of selecting vop big for eDP
> + * @lcdsel_lit: reg value of selecting vop little for eDP
> + * @chip_type: specific chip type
> + */
> +struct rockchip_dp_chip_data {
> +       u32     lcdsel_grf_reg;
> +       u32     lcdsel_big;
> +       u32     lcdsel_lit;
> +       u32     chip_type;
> +};
>
>  struct rockchip_dp_device {
>         struct drm_device        *drm_dev;
> @@ -51,6 +65,8 @@ struct rockchip_dp_device {
>         struct regmap            *grf;
>         struct reset_control     *rst;
>
> +       const struct rockchip_dp_chip_data *data;
> +
>         struct analogix_dp_plat_data plat_data;
>  };
>
> @@ -119,13 +135,13 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder)
>                 return;
>
>         if (ret)
> -               val = GRF_EDP_SEL_VOP_LIT | (GRF_EDP_LCD_SEL_MASK << 16);
> +               val = dp->data->lcdsel_lit;
>         else
> -               val = GRF_EDP_SEL_VOP_BIG | (GRF_EDP_LCD_SEL_MASK << 16);
> +               val = dp->data->lcdsel_big;
>
>         dev_dbg(dp->dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
>
> -       ret = regmap_write(dp->grf, GRF_SOC_CON6, val);
> +       ret = regmap_write(dp->grf, dp->data->lcdsel_grf_reg, val);
>         if (ret != 0) {
>                 dev_err(dp->dev, "Could not write to GRF: %d\n", ret);
>                 return;
> @@ -246,6 +262,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>                             void *data)
>  {
>         struct rockchip_dp_device *dp = dev_get_drvdata(dev);
> +       const struct rockchip_dp_chip_data *dp_data;
>         struct drm_device *drm_dev = data;
>         int ret;
>
> @@ -256,10 +273,15 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>          */
>         dev_set_drvdata(dev, NULL);
>
> +       dp_data = of_device_get_match_data(dev);
> +       if (!dp_data)
> +               return -ENODEV;
> +
>         ret = rockchip_dp_init(dp);
>         if (ret < 0)
>                 return ret;
>
> +       dp->data = dp_data;
>         dp->drm_dev = drm_dev;
>
>         ret = rockchip_dp_drm_create_encoder(dp);
> @@ -270,7 +292,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>
>         dp->plat_data.encoder = &dp->encoder;
>
> -       dp->plat_data.dev_type = RK3288_DP;
> +       dp->plat_data.dev_type = dp->data->chip_type;
>         dp->plat_data.power_on = rockchip_dp_poweron;
>         dp->plat_data.power_off = rockchip_dp_powerdown;
>
> @@ -356,8 +378,15 @@ static const struct dev_pm_ops rockchip_dp_pm_ops = {
>  #endif
>  };
>
> +static const struct rockchip_dp_chip_data rk3288_dp = {
> +       .lcdsel_grf_reg = RK3288_GRF_SOC_CON6,
> +       .lcdsel_big = HIWORD_UPDATE(0, RK3288_EDP_LCDC_SEL),
> +       .lcdsel_lit = HIWORD_UPDATE(RK3288_EDP_LCDC_SEL, RK3288_EDP_LCDC_SEL),
> +       .chip_type = RK3288_DP,
> +};
> +
>  static const struct of_device_id rockchip_dp_dt_ids[] = {
> -       {.compatible = "rockchip,rk3288-dp",},
> +       {.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
> --
> 1.9.1
>
>
