From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V4 07/10] drm/bridge: ptn3460: Support bridge chaining
Date: Fri, 20 Jun 2014 13:39:03 +0530
Message-ID: <CAEC9eQMAFXPuG8DfTt6m6_Pwjtpi+vAhiv=Qy=B7QCP1Dce=xQ@mail.gmail.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
	<1402511228-18945-8-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f177.google.com ([209.85.220.177]:44583 "EHLO
	mail-vc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934161AbaFTIJD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jun 2014 04:09:03 -0400
In-Reply-To: <1402511228-18945-8-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>

ping.

On Wed, Jun 11, 2014 at 11:57 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Modify the driver to invoke callbacks for the next bridge
> in the bridge chain.
> Also, remove the drm_connector implementation from ptn3460,
> since the same is implemented using panel_binder.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  drivers/gpu/drm/bridge/ptn3460.c        |  136 +++++--------------------------
>  drivers/gpu/drm/exynos/exynos_dp_core.c |   16 ++--
>  include/drm/bridge/ptn3460.h            |   15 ++--
>  3 files changed, 39 insertions(+), 128 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/ptn3460.c
> index 98fd17a..21e9db8 100644
> --- a/drivers/gpu/drm/bridge/ptn3460.c
> +++ b/drivers/gpu/drm/bridge/ptn3460.c
> @@ -34,37 +34,15 @@
>  #define PTN3460_EDID_SRAM_LOAD_ADDR            0x85
>
>  struct ptn3460_bridge {
> -       struct drm_connector connector;
>         struct i2c_client *client;
>         struct drm_encoder *encoder;
>         struct drm_bridge *bridge;
> -       struct edid *edid;
>         int gpio_pd_n;
>         int gpio_rst_n;
>         u32 edid_emulation;
>         bool enabled;
>  };
>
> -static int ptn3460_read_bytes(struct ptn3460_bridge *ptn_bridge, char addr,
> -               u8 *buf, int len)
> -{
> -       int ret;
> -
> -       ret = i2c_master_send(ptn_bridge->client, &addr, 1);
> -       if (ret <= 0) {
> -               DRM_ERROR("Failed to send i2c command, ret=%d\n", ret);
> -               return ret;
> -       }
> -
> -       ret = i2c_master_recv(ptn_bridge->client, buf, len);
> -       if (ret <= 0) {
> -               DRM_ERROR("Failed to recv i2c data, ret=%d\n", ret);
> -               return ret;
> -       }
> -
> -       return 0;
> -}
> -
>  static int ptn3460_write_byte(struct ptn3460_bridge *ptn_bridge, char addr,
>                 char val)
>  {
> @@ -126,6 +104,8 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
>                 gpio_set_value(ptn_bridge->gpio_rst_n, 1);
>         }
>
> +       drm_next_bridge_pre_enable(bridge);
> +
>         /*
>          * There's a bug in the PTN chip where it falsely asserts hotplug before
>          * it is fully functional. We're forced to wait for the maximum start up
> @@ -142,6 +122,7 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
>
>  static void ptn3460_enable(struct drm_bridge *bridge)
>  {
> +       drm_next_bridge_enable(bridge);
>  }
>
>  static void ptn3460_disable(struct drm_bridge *bridge)
> @@ -153,6 +134,8 @@ static void ptn3460_disable(struct drm_bridge *bridge)
>
>         ptn_bridge->enabled = false;
>
> +       drm_next_bridge_disable(bridge);
> +
>         if (gpio_is_valid(ptn_bridge->gpio_rst_n))
>                 gpio_set_value(ptn_bridge->gpio_rst_n, 1);
>
> @@ -162,6 +145,7 @@ static void ptn3460_disable(struct drm_bridge *bridge)
>
>  static void ptn3460_post_disable(struct drm_bridge *bridge)
>  {
> +       drm_next_bridge_post_disable(bridge);
>  }
>
>  void ptn3460_bridge_destroy(struct drm_bridge *bridge)
> @@ -173,6 +157,9 @@ void ptn3460_bridge_destroy(struct drm_bridge *bridge)
>                 gpio_free(ptn_bridge->gpio_pd_n);
>         if (gpio_is_valid(ptn_bridge->gpio_rst_n))
>                 gpio_free(ptn_bridge->gpio_rst_n);
> +
> +       drm_next_bridge_destroy(bridge);
> +
>         /* Nothing else to free, we've got devm allocated memory */
>  }
>
> @@ -184,81 +171,10 @@ struct drm_bridge_funcs ptn3460_bridge_funcs = {
>         .destroy = ptn3460_bridge_destroy,
>  };
>
> -int ptn3460_get_modes(struct drm_connector *connector)
> -{
> -       struct ptn3460_bridge *ptn_bridge;
> -       u8 *edid;
> -       int ret, num_modes;
> -       bool power_off;
> -
> -       ptn_bridge = container_of(connector, struct ptn3460_bridge, connector);
> -
> -       if (ptn_bridge->edid)
> -               return drm_add_edid_modes(connector, ptn_bridge->edid);
> -
> -       power_off = !ptn_bridge->enabled;
> -       ptn3460_pre_enable(ptn_bridge->bridge);
> -
> -       edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
> -       if (!edid) {
> -               DRM_ERROR("Failed to allocate edid\n");
> -               return 0;
> -       }
> -
> -       ret = ptn3460_read_bytes(ptn_bridge, PTN3460_EDID_ADDR, edid,
> -                       EDID_LENGTH);
> -       if (ret) {
> -               kfree(edid);
> -               num_modes = 0;
> -               goto out;
> -       }
> -
> -       ptn_bridge->edid = (struct edid *)edid;
> -       drm_mode_connector_update_edid_property(connector, ptn_bridge->edid);
> -
> -       num_modes = drm_add_edid_modes(connector, ptn_bridge->edid);
> -
> -out:
> -       if (power_off)
> -               ptn3460_disable(ptn_bridge->bridge);
> -
> -       return num_modes;
> -}
> -
> -struct drm_encoder *ptn3460_best_encoder(struct drm_connector *connector)
> -{
> -       struct ptn3460_bridge *ptn_bridge;
> -
> -       ptn_bridge = container_of(connector, struct ptn3460_bridge, connector);
> -
> -       return ptn_bridge->encoder;
> -}
> -
> -struct drm_connector_helper_funcs ptn3460_connector_helper_funcs = {
> -       .get_modes = ptn3460_get_modes,
> -       .best_encoder = ptn3460_best_encoder,
> -};
> -
> -enum drm_connector_status ptn3460_detect(struct drm_connector *connector,
> -               bool force)
> -{
> -       return connector_status_connected;
> -}
> -
> -void ptn3460_connector_destroy(struct drm_connector *connector)
> -{
> -       drm_connector_cleanup(connector);
> -}
> -
> -struct drm_connector_funcs ptn3460_connector_funcs = {
> -       .dpms = drm_helper_connector_dpms,
> -       .fill_modes = drm_helper_probe_single_connector_modes,
> -       .detect = ptn3460_detect,
> -       .destroy = ptn3460_connector_destroy,
> -};
> -
> -int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
> -               struct i2c_client *client, struct device_node *node)
> +struct drm_bridge *ptn3460_init(struct drm_device *dev,
> +                               struct drm_encoder *encoder,
> +                               struct i2c_client *client,
> +                               struct device_node *node)
>  {
>         int ret;
>         struct drm_bridge *bridge;
> @@ -267,13 +183,13 @@ int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
>         bridge = devm_kzalloc(dev->dev, sizeof(*bridge), GFP_KERNEL);
>         if (!bridge) {
>                 DRM_ERROR("Failed to allocate drm bridge\n");
> -               return -ENOMEM;
> +               return NULL;
>         }
>
>         ptn_bridge = devm_kzalloc(dev->dev, sizeof(*ptn_bridge), GFP_KERNEL);
>         if (!ptn_bridge) {
>                 DRM_ERROR("Failed to allocate ptn bridge\n");
> -               return -ENOMEM;
> +               return NULL;
>         }
>
>         ptn_bridge->client = client;
> @@ -285,7 +201,7 @@ int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
>                                 GPIOF_OUT_INIT_HIGH, "PTN3460_PD_N");
>                 if (ret) {
>                         DRM_ERROR("Request powerdown-gpio failed (%d)\n", ret);
> -                       return ret;
> +                       return NULL;
>                 }
>         }
>
> @@ -300,7 +216,7 @@ int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
>                 if (ret) {
>                         DRM_ERROR("Request reset-gpio failed (%d)\n", ret);
>                         gpio_free(ptn_bridge->gpio_pd_n);
> -                       return ret;
> +                       return NULL;
>                 }
>         }
>
> @@ -318,26 +234,18 @@ int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
>         }
>
>         bridge->driver_private = ptn_bridge;
> -       encoder->bridge = bridge;
>
> -       ret = drm_connector_init(dev, &ptn_bridge->connector,
> -                       &ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
> -       if (ret) {
> -               DRM_ERROR("Failed to initialize connector with drm\n");
> -               goto err;
> -       }
> -       drm_connector_helper_add(&ptn_bridge->connector,
> -                       &ptn3460_connector_helper_funcs);
> -       drm_sysfs_connector_add(&ptn_bridge->connector);
> -       drm_mode_connector_attach_encoder(&ptn_bridge->connector, encoder);
> +       if (!encoder->bridge)
> +               /* First entry in the bridge chain */
> +               encoder->bridge = bridge;
>
> -       return 0;
> +       return bridge;
>
>  err:
>         if (gpio_is_valid(ptn_bridge->gpio_pd_n))
>                 gpio_free(ptn_bridge->gpio_pd_n);
>         if (gpio_is_valid(ptn_bridge->gpio_rst_n))
>                 gpio_free(ptn_bridge->gpio_rst_n);
> -       return ret;
> +       return NULL;
>  }
>  EXPORT_SYMBOL(ptn3460_init);
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
> index aca739d..d8546ea 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -988,19 +988,19 @@ static bool find_bridge(const char *compat, struct bridge_init *bridge)
>         return true;
>  }
>
> -/* returns the number of bridges attached */
> -static int exynos_drm_attach_lcd_bridge(struct drm_device *dev,
> +static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
>                 struct drm_encoder *encoder)
>  {
>         struct bridge_init bridge;
> -       int ret;
> +       struct drm_bridge *bridge_chain = NULL;
> +       bool connector_created = false;
>
>         if (find_bridge("nxp,ptn3460", &bridge)) {
> -               ret = ptn3460_init(dev, encoder, bridge.client, bridge.node);
> -               if (!ret)
> -                       return 1;
> +               bridge_chain = ptn3460_init(dp->drm_dev, encoder, bridge.client,
> +                                                               bridge.node);
>         }
> -       return 0;
> +
> +       return connector_created;
>  }
>
>  static int exynos_dp_create_connector(struct exynos_drm_display *display,
> @@ -1013,7 +1013,7 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
>         dp->encoder = encoder;
>
>         /* Pre-empt DP connector creation if there's a bridge */
> -       ret = exynos_drm_attach_lcd_bridge(dp->drm_dev, encoder);
> +       ret = exynos_drm_attach_lcd_bridge(dp, encoder);
>         if (ret)
>                 return 0;
>
> diff --git a/include/drm/bridge/ptn3460.h b/include/drm/bridge/ptn3460.h
> index ff62344..f612b9b 100644
> --- a/include/drm/bridge/ptn3460.h
> +++ b/include/drm/bridge/ptn3460.h
> @@ -21,15 +21,18 @@ struct device_node;
>
>  #if defined(CONFIG_DRM_PTN3460) || defined(CONFIG_DRM_PTN3460_MODULE)
>
> -int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
> -               struct i2c_client *client, struct device_node *node);
> +struct drm_bridge *ptn3460_init(struct drm_device *dev,
> +                               struct drm_encoder *encoder,
> +                               struct i2c_client *client,
> +                               struct device_node *node);
>  #else
>
> -static inline int ptn3460_init(struct drm_device *dev,
> -               struct drm_encoder *encoder, struct i2c_client *client,
> -               struct device_node *node)
> +static inline struct drm_bridge *ptn3460_init(struct drm_device *dev,
> +                                               struct drm_encoder *encoder,
> +                                               struct i2c_client *client,
> +                                               struct device_node *node)
>  {
> -       return 0;
> +       return NULL;
>  }
>
>  #endif
> --
> 1.7.9.5
>
