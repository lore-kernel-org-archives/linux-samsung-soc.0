From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 2/5] drm/exynos: use regmap interface to set hdmiphy
 control bit in pmu
Date: Fri, 4 Apr 2014 00:53:06 +0900
Message-ID: <CAAQKjZN8fCGsOXZ6xf1KMH8oezi8f1C29HcDKO0cWq-2kyg5rQ@mail.gmail.com>
References: <1396458826-3051-1-git-send-email-rahul.sharma@samsung.com>
 <1396458826-3051-3-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1396458826-3051-3-git-send-email-rahul.sharma@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Rahul,

Thanks for contributions.

2014-04-03 2:13 GMT+09:00 Rahul Sharma <rahul.sharma@samsung.com>:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>
> Hdmiphy control bit needs to be set before setting the resolution
> to hdmi hardware. This was handled using dummy hdmiphy clock which
> is removed now.
>
> PMU is already defined as system controller for exynos SoC. Registers
> of PMU are accessed using regmap interfaces.
>
> Devicetree binding document for hdmi is also updated.
>
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> ---
>  .../devicetree/bindings/video/exynos_hdmi.txt      |    2 ++
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |   17 +++++++++++++++++
>  drivers/gpu/drm/exynos/regs-hdmi.h                 |    4 ++++
>  3 files changed, 23 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> index f9187a2..243a499 100644
> --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> @@ -27,6 +27,7 @@ Required properties:
>         "hdmi", "sclk_hdmi", "sclk_pixel", "sclk_hdmiphy" and "mout_hdmi".
>  - ddc: phandle to the hdmi ddc node
>  - phy: phandle to the hdmi phy node
> +- samsung,syscon-phandle: phandle for system controller node for PMU.
>
>  Example:
>
> @@ -37,4 +38,5 @@ Example:
>                 hpd-gpio = <&gpx3 7 1>;
>                 ddc = <&hdmi_ddc_node>;
>                 phy = <&hdmi_phy_node>;
> +               samsung,syscon-phandle = <&pmu_system_controller>;

System regiters could be controlled by phy framework, drivers/phy/*
with 'phys' property so I think we would need to consider the phy
framework. Especially, this patch adds a new property,
samsung,syscon-phandle so I'm careful in merging - I'm not sure that
we really need this property, and we couldn't really use existing phys
property. So let's have more times for reviews.

Thanks,
Inki Dae

>         };
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 23abfa0..47b8c06 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -36,6 +36,8 @@
>  #include <linux/i2c.h>
>  #include <linux/of_gpio.h>
>  #include <linux/hdmi.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
>
>  #include <drm/exynos_drm.h>
>
> @@ -194,6 +196,7 @@ struct hdmi_context {
>         struct hdmi_resources           res;
>
>         int                             hpd_gpio;
> +       struct regmap                   *pmureg;
>
>         enum hdmi_type                  type;
>  };
> @@ -1853,6 +1856,9 @@ static void hdmi_poweron(struct exynos_drm_display *display)
>         if (regulator_bulk_enable(res->regul_count, res->regul_bulk))
>                 DRM_DEBUG_KMS("failed to enable regulator bulk\n");
>
> +       /* set pmu hdmiphy control bit to enable hdmiphy */
> +       regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
> +                       PMU_HDMI_PHY_ENABLE_BIT, 1);
>         clk_prepare_enable(res->hdmi);
>         clk_prepare_enable(res->sclk_hdmi);
>
> @@ -1879,6 +1885,10 @@ static void hdmi_poweroff(struct exynos_drm_display *display)
>
>         clk_disable_unprepare(res->sclk_hdmi);
>         clk_disable_unprepare(res->hdmi);
> +       /* reset pmu hdmiphy control bit to disable hdmiphy */
> +       regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
> +                       PMU_HDMI_PHY_ENABLE_BIT, 0);
> +
>         regulator_bulk_disable(res->regul_count, res->regul_bulk);
>
>         pm_runtime_put_sync(hdata->dev);
> @@ -2128,6 +2138,13 @@ static int hdmi_probe(struct platform_device *pdev)
>                 goto err_hdmiphy;
>         }
>
> +       hdata->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
> +                       "samsung,syscon-phandle");
> +       if (IS_ERR_OR_NULL(hdata->pmureg)) {
> +               DRM_ERROR("syscon regmap lookup failed.\n");
> +               goto err_hdmiphy;
> +       }
> +
>         pm_runtime_enable(dev);
>
>         hdmi_display.ctx = hdata;
> diff --git a/drivers/gpu/drm/exynos/regs-hdmi.h b/drivers/gpu/drm/exynos/regs-hdmi.h
> index ef1b3eb..9811d6f 100644
> --- a/drivers/gpu/drm/exynos/regs-hdmi.h
> +++ b/drivers/gpu/drm/exynos/regs-hdmi.h
> @@ -578,4 +578,8 @@
>  #define HDMI_TG_VACT_ST4_H             HDMI_TG_BASE(0x0074)
>  #define HDMI_TG_3D                     HDMI_TG_BASE(0x00F0)
>
> +/* PMU Registers for PHY */
> +#define PMU_HDMI_PHY_CONTROL           0x700
> +#define PMU_HDMI_PHY_ENABLE_BIT        (1<<0)
> +
>  #endif /* SAMSUNG_REGS_HDMI_H */
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
