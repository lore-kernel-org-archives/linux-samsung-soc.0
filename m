From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH 5/7] drm/exynos: dp: modify driver to support drm_panel
Date: Fri, 18 Apr 2014 18:08:16 +0900
Message-ID: <000401cf5ae5$bbea0340$33be09c0$%han@samsung.com>
References: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
 <1397658786-26138-6-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1397658786-26138-6-git-send-email-ajaykumar.rs@samsung.com>
Content-language: ko
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: 'Ajay Kumar' <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: seanpaul@google.com, abrestic@chromium.org, joshi@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, ajaynumb@gmail.com, treding@nvidia.com, prashanth.g@samsung.com, rahul.sharma@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday, April 16, 2014 11:33 PM, Ajay Kumar wrote:
> 
> This patch attaches the dp connector to exynos_dp_panel, and adds
> calls to drm_panel functions to control panel power sequence.
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  drivers/gpu/drm/exynos/Kconfig          |  1 +
>  drivers/gpu/drm/exynos/exynos_dp_core.c | 19 +++++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_dp_core.h |  1 +
>  3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
> index 5bf5bca..56af433 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -52,6 +52,7 @@ config DRM_EXYNOS_DP
>  	bool "EXYNOS DRM DP driver support"
>  	depends on DRM_EXYNOS && ARCH_EXYNOS
>  	default DRM_EXYNOS
> +	select DRM_PANEL
>  	help
>  	  This enables support for DP device.
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
> index 18fd9c5..6beeab6 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -28,6 +28,7 @@
>  #include <drm/drmP.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_panel.h>
>  #include <drm/bridge/ptn3460.h>
> 
>  #include "exynos_drm_drv.h"
> @@ -1028,6 +1029,9 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
>  	drm_sysfs_connector_add(connector);
>  	drm_mode_connector_attach_encoder(connector, encoder);
> 
> +	if (dp->drm_panel)
> +		drm_panel_attach(dp->drm_panel, &dp->connector);
> +
>  	return 0;
>  }
> 
> @@ -1062,10 +1066,12 @@ static void exynos_dp_poweron(struct exynos_dp_device *dp)
>  	if (dp->dpms_mode == DRM_MODE_DPMS_ON)
>  		return;
> 
> +	drm_panel_pre_enable(dp->drm_panel);
>  	clk_prepare_enable(dp->clock);
>  	exynos_dp_phy_init(dp);
>  	exynos_dp_init_dp(dp);
>  	enable_irq(dp->irq);
> +	drm_panel_enable(dp->drm_panel);
>  }
> 
>  static void exynos_dp_poweroff(struct exynos_dp_device *dp)
> @@ -1073,6 +1079,7 @@ static void exynos_dp_poweroff(struct exynos_dp_device *dp)
>  	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
>  		return;
> 
> +	drm_panel_disable(dp->drm_panel);
>  	disable_irq(dp->irq);
>  	flush_work(&dp->hotplug_work);
>  	exynos_dp_phy_exit(dp);
> @@ -1225,6 +1232,7 @@ static int exynos_dp_dt_parse_panel(struct exynos_dp_device *dp)
>  static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
> +	struct device_node *panel_node;
>  	struct drm_device *drm_dev = data;
>  	struct resource *res;
>  	struct exynos_dp_device *dp;
> @@ -1299,6 +1307,17 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
> 
>  	INIT_WORK(&dp->hotplug_work, exynos_dp_hotplug);
> 
> +	panel_node = of_find_compatible_node(NULL, NULL,
> +						"samsung,exynos-dp-panel");
> +	if (panel_node) {
> +		dp->drm_panel = of_drm_find_panel(panel_node);
> +		if (!dp->drm_panel) {
> +			of_node_put(panel_node);
> +			return -ENODEV;
> +		}
> +		of_node_put(panel_node);
> +	}

The following is simpler.

+	if (panel_node) {
+		dp->drm_panel = of_drm_find_panel(panel_node);
+		of_node_put(panel_node);
+		if (!dp->drm_panel)
+			return -ENODEV;
+	}

Best regards,
Jingoo Han

> +
>  	exynos_dp_phy_init(dp);
> 
>  	exynos_dp_init_dp(dp);
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h b/drivers/gpu/drm/exynos/exynos_dp_core.h
> index 56fa43e..9dc7991 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.h
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.h
> @@ -148,6 +148,7 @@ struct exynos_dp_device {
>  	struct drm_device	*drm_dev;
>  	struct drm_connector	connector;
>  	struct drm_encoder	*encoder;
> +	struct drm_panel	*drm_panel;
>  	struct clk		*clock;
>  	unsigned int		irq;
>  	void __iomem		*reg_base;
> --
> 1.8.1.2
