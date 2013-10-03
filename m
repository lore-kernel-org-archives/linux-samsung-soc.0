From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 4/5] drm/exynos: Initialize ptn3460 if present
Date: Thu, 3 Oct 2013 23:43:30 +0900
Message-ID: <CAAQKjZPgtKf5UWZhHV-+Vv2c4uwuEUhZHV=r14es8eFC07PONg@mail.gmail.com>
References: <1380670860-17621-1-git-send-email-seanpaul@chromium.org>
	<1380670860-17621-5-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380670860-17621-5-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

2013/10/2 Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>:
> This patch adds code to look for the ptn3460 in the device tree file on
> exynos initialization. If ptn node is found, the driver will initialize
> the ptn3460 driver and skip creating a DP connector (since the bridge
> driver will register its own connector).
>
> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_core.c | 44 +++++++++++++++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_core.c b/drivers/gpu/drm/exynos/exynos_drm_core.c
> index 1bef6dc..9cf4476 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_core.c
> @@ -12,7 +12,9 @@
>   * option) any later version.
>   */
>
> +#include <linux/of_i2c.h>
>  #include <drm/drmP.h>
> +#include <drm/bridge/ptn3460.h>
>  #include "exynos_drm_drv.h"
>  #include "exynos_drm_encoder.h"
>  #include "exynos_drm_connector.h"
> @@ -20,6 +22,40 @@
>
>  static LIST_HEAD(exynos_drm_subdrv_list);
>
> +struct bridge_init {
> +       struct i2c_client *client;
> +       struct device_node *node;
> +};
> +
> +static bool find_bridge(const char *name, struct bridge_init *bridge)
> +{
> +       bridge->client = NULL;
> +       bridge->node = of_find_node_by_name(NULL, name);

Not clear to me. Why do you try to handle device tree here, not real
device driver?. How about adding a output property to board specific
fimd dt node: i.e. output = <&ptn3460_bridge>? Actually, the output
device of fimd hw could be one of MIPI-DSI, eDP, mDNIe, LVDS bridge,
or LCD. And then, let's find ptn3460-bridge node in the fimd driver,
and initialize the ptn3460 bridge driver, and get power on or off
through  exynos_drm_display_ops of the fimd driver. And all these
codes could be hided from fimd driver by moving them into
exynos_drm_display_ops. Of course, for this, you would need additional
works. So let's do it if needed.

The below is the outline of device tree I recommend,

In board dts,
       i2c@I2CD000 {
             ptn3460_bridge: prn3460-bridge@20 {
                    ...
             }
        }

        fimd@11c00000 {
             ...
             output_dev = <&ptn3460_bridge>;
        }

With this, I believe that you can do all things you want for
controlling the LVDS bridge in fimd driver.

Thanks,
Inki Dae

> +       if (!bridge->node)
> +               return false;
> +
> +       bridge->client = of_find_i2c_device_by_node(bridge->node);
> +       if (!bridge->client)
> +               return false;
> +
> +       return true;
> +}
> +
> +/* returns the number of bridges attached */
> +static int exynos_drm_attach_lcd_bridge(struct drm_device *dev,
> +               struct drm_encoder *encoder)
> +{
> +       struct bridge_init bridge;
> +       int ret;
> +
> +       if (find_bridge("ptn3460-bridge", &bridge)) {
> +               ret = ptn3460_init(dev, encoder, bridge.client, bridge.node);
> +               if (!ret)
> +                       return 1;
> +       }
> +       return 0;
> +}
> +
>  static int exynos_drm_create_enc_conn(struct drm_device *dev,
>                                         struct exynos_drm_subdrv *subdrv)
>  {
> @@ -36,6 +72,13 @@ static int exynos_drm_create_enc_conn(struct drm_device *dev,
>                 DRM_ERROR("failed to create encoder\n");
>                 return -EFAULT;
>         }
> +       subdrv->encoder = encoder;
> +
> +       if (subdrv->manager->display_ops->type == EXYNOS_DISPLAY_TYPE_LCD) {
> +               ret = exynos_drm_attach_lcd_bridge(dev, encoder);
> +               if (ret)
> +                       return 0;
> +       }
>
>         /*
>          * create and initialize a connector for this sub driver and
> @@ -48,7 +91,6 @@ static int exynos_drm_create_enc_conn(struct drm_device *dev,
>                 goto err_destroy_encoder;
>         }
>
> -       subdrv->encoder = encoder;
>         subdrv->connector = connector;
>
>         return 0;
> --
> 1.8.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
