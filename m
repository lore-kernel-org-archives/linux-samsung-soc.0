From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH v2] drm/exynos: use regmap interface to set hdmiphy
 control bit in pmu
Date: Wed, 21 May 2014 15:21:34 +0530
Message-ID: <CAPdUM4Nmyo4kYyy_0GSGpjStMTrt37LcMxWHpdYr4bgQ=5Pt9g@mail.gmail.com>
References: <1400562365-7566-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1400562365-7566-1-git-send-email-rahul.sharma@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Inki, Tomasz,

Any comment on this patch?

Regards,
Rahul Sharma

On 20 May 2014 10:36, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Exynos drm hdmi driver used to get dummy hdmiphy clock to
> control the PMU bit for hdmiphy. This bit needs to be set
> before setting any resolution to hdmi hardware. This was
> handled using dummy hdmiphy clock which is removed here.
>
> PMU is already defined as system controller for exynos
> SoCs. Hdmi driver is modified to control the phy enable bit
> inside PMU using regmap interfaces.
>
> Devicetree binding document for hdmi is also updated.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
> V2:
>   1) Squashed hdmiphy clock cleanup patch.
>   2) Addressed comments related to indentation, using
>      BIT macro while definnig bits and using IS_ERR check
>      while verifying regmap handle.
>
> This patch is based on exynos-drm-next branch.
>
>  .../devicetree/bindings/video/exynos_hdmi.txt      |    2 ++
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |   27 ++++++++++++++------
>  drivers/gpu/drm/exynos/regs-hdmi.h                 |    4 +++
>  3 files changed, 25 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> index 75ada04..1fd8cf9 100644
> --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> @@ -28,6 +28,7 @@ Required properties:
>         "hdmi", "sclk_hdmi", "sclk_pixel", "sclk_hdmiphy" and "mout_hdmi".
>  - ddc: phandle to the hdmi ddc node
>  - phy: phandle to the hdmi phy node
> +- samsung,syscon-phandle: phandle for system controller node for PMU.
>
>  Example:
>
> @@ -38,4 +39,5 @@ Example:
>                 hpd-gpio = <&gpx3 7 1>;
>                 ddc = <&hdmi_ddc_node>;
>                 phy = <&hdmi_phy_node>;
> +               samsung,syscon-phandle = <&pmu_system_controller>;
>         };
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index b03e721..f5e188f 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -38,6 +38,8 @@
>  #include <linux/of_gpio.h>
>  #include <linux/hdmi.h>
>  #include <linux/component.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
>
>  #include <drm/exynos_drm.h>
>
> @@ -81,7 +83,6 @@ struct hdmi_resources {
>         struct clk                      *sclk_hdmi;
>         struct clk                      *sclk_pixel;
>         struct clk                      *sclk_hdmiphy;
> -       struct clk                      *hdmiphy;
>         struct clk                      *mout_hdmi;
>         struct regulator_bulk_data      *regul_bulk;
>         int                             regul_count;
> @@ -208,6 +209,7 @@ struct hdmi_context {
>         const struct hdmiphy_config             *phy_confs;
>         unsigned int                    phy_conf_count;
>
> +       struct regmap                   *pmureg;
>         enum hdmi_type                  type;
>  };
>
> @@ -2013,7 +2015,10 @@ static void hdmi_poweron(struct exynos_drm_display *display)
>         if (regulator_bulk_enable(res->regul_count, res->regul_bulk))
>                 DRM_DEBUG_KMS("failed to enable regulator bulk\n");
>
> -       clk_prepare_enable(res->hdmiphy);
> +       /* set pmu hdmiphy control bit to enable hdmiphy */
> +       regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
> +                       PMU_HDMI_PHY_ENABLE_BIT, 1);
> +
>         clk_prepare_enable(res->hdmi);
>         clk_prepare_enable(res->sclk_hdmi);
>
> @@ -2040,7 +2045,11 @@ static void hdmi_poweroff(struct exynos_drm_display *display)
>
>         clk_disable_unprepare(res->sclk_hdmi);
>         clk_disable_unprepare(res->hdmi);
> -       clk_disable_unprepare(res->hdmiphy);
> +
> +       /* reset pmu hdmiphy control bit to disable hdmiphy */
> +       regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
> +                       PMU_HDMI_PHY_ENABLE_BIT, 0);
> +
>         regulator_bulk_disable(res->regul_count, res->regul_bulk);
>
>         pm_runtime_put_sync(hdata->dev);
> @@ -2143,11 +2152,6 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
>                 DRM_ERROR("failed to get clock 'sclk_hdmiphy'\n");
>                 goto fail;
>         }
> -       res->hdmiphy = devm_clk_get(dev, "hdmiphy");
> -       if (IS_ERR(res->hdmiphy)) {
> -               DRM_ERROR("failed to get clock 'hdmiphy'\n");
> -               goto fail;
> -       }
>         res->mout_hdmi = devm_clk_get(dev, "mout_hdmi");
>         if (IS_ERR(res->mout_hdmi)) {
>                 DRM_ERROR("failed to get clock 'mout_hdmi'\n");
> @@ -2353,6 +2357,13 @@ static int hdmi_probe(struct platform_device *pdev)
>                 goto err_hdmiphy;
>         }
>
> +       hdata->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
> +                       "samsung,syscon-phandle");
> +       if (IS_ERR(hdata->pmureg)) {
> +               DRM_ERROR("syscon regmap lookup failed.\n");
> +               goto err_hdmiphy;
> +       }
> +
>         pm_runtime_enable(dev);
>         hdmi_display.ctx = hdata;
>
> diff --git a/drivers/gpu/drm/exynos/regs-hdmi.h b/drivers/gpu/drm/exynos/regs-hdmi.h
> index 84a69cd..6d846b9 100644
> --- a/drivers/gpu/drm/exynos/regs-hdmi.h
> +++ b/drivers/gpu/drm/exynos/regs-hdmi.h
> @@ -585,4 +585,8 @@
>  #define HDMI_PHY_DISABLE_MODE_SET      0x80
>  #define HDMI_PHY_ENABLE_MODE_SET       0x00
>
> +/* PMU Registers for PHY */
> +#define PMU_HDMI_PHY_CONTROL           0x700
> +#define PMU_HDMI_PHY_ENABLE_BIT                BIT(0)
> +
>  #endif /* SAMSUNG_REGS_HDMI_H */
> --
> 1.7.9.5
>
