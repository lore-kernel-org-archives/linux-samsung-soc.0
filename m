From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 7/7] drm/bridge: ptn3460: add drm_panel controls
Date: Fri, 18 Apr 2014 18:25:36 +0900
Message-ID: <000501cf5ae8$27f19510$77d4bf30$%han@samsung.com>
References: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
 <1397658786-26138-8-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1397658786-26138-8-git-send-email-ajaykumar.rs@samsung.com>
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
To: 'Ajay Kumar' <ajaykumar.rs@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, seanpaul@google.com, abrestic@chromium.org, joshi@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kyungmin.park@samsung.com, ajaynumb@gmail.com, treding@nvidia.com, prashanth.g@samsung.com, rahul.sharma@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday, April 16, 2014 11:33 PM, Ajay Kumar wrote:
> 
> attach ptn3460 connector to drm_panel and support drm_panel routines,
> if a valid drm_panel object is passed to ptn3460_init.
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig          |  1 +
>  drivers/gpu/drm/bridge/ptn3460.c        | 17 ++++++++++++++++-
>  drivers/gpu/drm/exynos/exynos_dp_core.c | 15 +++++++++++----
>  include/drm/bridge/ptn3460.h            |  6 ++++--
>  4 files changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 884923f..3bc6845 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -2,4 +2,5 @@ config DRM_PTN3460
>  	tristate "PTN3460 DP/LVDS bridge"
>  	depends on DRM
>  	select DRM_KMS_HELPER
> +	select DRM_PANEL
>  	---help---
> diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/ptn3460.c
> index f1d2afc..736c7a8 100644
> --- a/drivers/gpu/drm/bridge/ptn3460.c
> +++ b/drivers/gpu/drm/bridge/ptn3460.c
> @@ -24,6 +24,7 @@
>  #include "drm_edid.h"
>  #include "drm_crtc.h"
>  #include "drm_crtc_helper.h"
> +#include <drm/drm_panel.h>

Move '<drm/drm_panel.h>' as below.

#include <linux/gpio.h>
#include <linux/delay.h>
+#include <drm/drm_panel.h>

#include "drmP.h"


> 
>  #include "bridge/ptn3460.h"
> 
> @@ -38,6 +39,7 @@ struct ptn3460_bridge {
>  	struct i2c_client *client;
>  	struct drm_encoder *encoder;
>  	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
>  	struct edid *edid;
>  	int gpio_pd_n;
>  	int gpio_rst_n;
> @@ -126,6 +128,8 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
>  		gpio_set_value(ptn_bridge->gpio_rst_n, 1);
>  	}
> 
> +	drm_panel_pre_enable(ptn_bridge->panel);
> +
>  	/*
>  	 * There's a bug in the PTN chip where it falsely asserts hotplug before
>  	 * it is fully functional. We're forced to wait for the maximum start up
> @@ -142,6 +146,9 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
> 
>  static void ptn3460_enable(struct drm_bridge *bridge)
>  {
> +	struct ptn3460_bridge *ptn_bridge = bridge->driver_private;
> +
> +	drm_panel_enable(ptn_bridge->panel);
>  }
> 
>  static void ptn3460_disable(struct drm_bridge *bridge)
> @@ -153,6 +160,8 @@ static void ptn3460_disable(struct drm_bridge *bridge)
> 
>  	ptn_bridge->enabled = false;
> 
> +	drm_panel_disable(ptn_bridge->panel);
> +
>  	if (gpio_is_valid(ptn_bridge->gpio_rst_n))
>  		gpio_set_value(ptn_bridge->gpio_rst_n, 1);
> 
> @@ -265,7 +274,8 @@ struct drm_connector_funcs ptn3460_connector_funcs = {
>  };
> 
>  int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
> -		struct i2c_client *client, struct device_node *node)
> +		struct i2c_client *client, struct device_node *node,
> +		struct drm_panel *panel)
>  {
>  	int ret;
>  	struct drm_bridge *bridge;
> @@ -324,6 +334,11 @@ int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
>  		goto err;
>  	}
> 
> +	if (panel) {
> +		ptn_bridge->panel = panel;
> +		drm_panel_attach(ptn_bridge->panel, &ptn_bridge->connector);
> +	}
> +
>  	bridge->driver_private = ptn_bridge;
>  	encoder->bridge = bridge;
>  	ptn_bridge->connector.polled = DRM_CONNECTOR_POLL_HPD;
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
> index 6beeab6..7f550b6 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -989,13 +989,14 @@ static bool find_bridge(const char *compat, struct bridge_init *bridge)
> 
>  /* returns the number of bridges attached */
>  static int exynos_drm_attach_lcd_bridge(struct drm_device *dev,
> -		struct drm_encoder *encoder)
> +		struct drm_encoder *encoder, struct drm_panel *panel)
>  {
>  	struct bridge_init bridge;
>  	int ret;
> 
>  	if (find_bridge("nxp,ptn3460", &bridge)) {
> -		ret = ptn3460_init(dev, encoder, bridge.client, bridge.node);
> +		ret = ptn3460_init(dev, encoder, bridge.client, bridge.node,
> +									panel);

'panel' is too far. Please fix it as below.

	if (find_bridge("nxp,ptn3460", &bridge)) {
		ret = ptn3460_init(dev, encoder, bridge.client, bridge.node,
				   panel);


>  		if (!ret)
>  			return 1;
>  	}
> @@ -1012,9 +1013,15 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
>  	dp->encoder = encoder;
> 
>  	/* Pre-empt DP connector creation if there's a bridge */
> -	ret = exynos_drm_attach_lcd_bridge(dp->drm_dev, encoder);
> -	if (ret)
> +	ret = exynos_drm_attach_lcd_bridge(dp->drm_dev, encoder, dp->drm_panel);
> +	if (ret) {
> +		/* Also set "dp->drm_panel = NULL" so that we don't end up
> +		 * controlling panel power both in exynos_dp and bridge
> +		 * DPMS routines.
> +		 */

Please fix it as below.

 +		/*
 +		 * Also set "dp->drm_panel = NULL" so that we don't end up
 +		 * controlling panel power both in exynos_dp and bridge
 +		 * DPMS routines.
 +		 */

Best regards,
Jingoo Han

> +		dp->drm_panel = NULL;
>  		return 0;
> +	}
> 
>  	connector->polled = DRM_CONNECTOR_POLL_HPD;
> 
> diff --git a/include/drm/bridge/ptn3460.h b/include/drm/bridge/ptn3460.h
> index ff62344..570cebb 100644
> --- a/include/drm/bridge/ptn3460.h
> +++ b/include/drm/bridge/ptn3460.h
> @@ -18,16 +18,18 @@ struct drm_device;
>  struct drm_encoder;
>  struct i2c_client;
>  struct device_node;
> +struct drm_panel;
> 
>  #if defined(CONFIG_DRM_PTN3460) || defined(CONFIG_DRM_PTN3460_MODULE)
> 
>  int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
> -		struct i2c_client *client, struct device_node *node);
> +		struct i2c_client *client, struct device_node *node,
> +		struct drm_panel *panel);
>  #else
> 
>  static inline int ptn3460_init(struct drm_device *dev,
>  		struct drm_encoder *encoder, struct i2c_client *client,
> -		struct device_node *node)
> +		struct device_node *node, struct drm_panel *panel)
>  {
>  	return 0;
>  }
> --
> 1.8.1.2
