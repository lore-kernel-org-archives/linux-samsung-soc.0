From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V3 6/8] drm/exynos: dp: Modify driver to support bridge chaining
Date: Fri, 6 Jun 2014 00:52:14 +0530
Message-ID: <CAEC9eQPKkqq9VnzHdEBD3v8x41AGUh6hbGmgLnMaFa6FHwfb6A@mail.gmail.com>
References: <1401995452-15798-1-git-send-email-ajaykumar.rs@samsung.com>
	<1401995452-15798-7-git-send-email-ajaykumar.rs@samsung.com>
	<CAEC9eQMqQe3Z5iLuURO6U34pONjrPd3cZ-Ehjaw8mQDKGPD8vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f170.google.com ([209.85.128.170]:64207 "EHLO
	mail-ve0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752717AbaFETWQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jun 2014 15:22:16 -0400
In-Reply-To: <CAEC9eQMqQe3Z5iLuURO6U34pONjrPd3cZ-Ehjaw8mQDKGPD8vg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

On Fri, Jun 6, 2014 at 12:48 AM, Ajay kumar <ajaynumb@gmail.com> wrote:
> +Device tree list
>
> On Fri, Jun 6, 2014 at 12:40 AM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
>> exynos_dp supports a simple bridge chain with ptn3460 bridge
>> and an LVDS panel attached to it.
>> This patch creates the bridge chain with ptn3460 as the head
>> of the list and panel_binder being the tail.
>>
>> Also, DERER_PROBE for exynos_dp is tested with this patch.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  .../devicetree/bindings/video/exynos_dp.txt        |    2 +
>>  drivers/gpu/drm/exynos/Kconfig                     |    1 +
>>  drivers/gpu/drm/exynos/exynos_dp_core.c            |   39 +++++++++++++++-----
>>  drivers/gpu/drm/exynos/exynos_dp_core.h            |    1 +
>>  4 files changed, 34 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/video/exynos_dp.txt b/Documentation/devicetree/bindings/video/exynos_dp.txt
>> index 53dbccf..0c118ff 100644
>> --- a/Documentation/devicetree/bindings/video/exynos_dp.txt
>> +++ b/Documentation/devicetree/bindings/video/exynos_dp.txt
>> @@ -51,6 +51,8 @@ Required properties for dp-controller:
>>                         LANE_COUNT1 = 1, LANE_COUNT2 = 2, LANE_COUNT4 = 4
>>         - display-timings: timings for the connected panel as described by
>>                 Documentation/devicetree/bindings/video/display-timing.txt
>> +       -edp-panel:
>> +               phandle for the drm_panel node required by panel_binder.
>>
>>  Optional properties for dp-controller:
>>         -interlaced:
>> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
>> index 178d2a9..fd1c070 100644
>> --- a/drivers/gpu/drm/exynos/Kconfig
>> +++ b/drivers/gpu/drm/exynos/Kconfig
>> @@ -52,6 +52,7 @@ config DRM_EXYNOS_DP
>>         bool "EXYNOS DRM DP driver support"
>>         depends on DRM_EXYNOS_FIMD && ARCH_EXYNOS && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
>>         default DRM_EXYNOS
>> +       select DRM_PANEL
>>         help
>>           This enables support for DP device.
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
>> index 414f5e5..a608f5c 100644
>> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
>> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
>> @@ -28,7 +28,9 @@
>>  #include <drm/drmP.h>
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_panel.h>
>>  #include <drm/bridge/ptn3460.h>
>> +#include <drm/bridge/panel_binder.h>
>>
>>  #include "exynos_drm_drv.h"
>>  #include "exynos_dp_core.h"
>> @@ -983,7 +985,7 @@ static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
>>                 struct drm_encoder *encoder)
>>  {
>>         struct bridge_init bridge;
>> -       struct drm_bridge *bridge_chain = NULL;
>> +       struct drm_bridge *bridge_chain = NULL, *next = NULL;
>>         bool connector_created = false;
>>
>>         if (find_bridge("nxp,ptn3460", &bridge)) {
>> @@ -991,6 +993,14 @@ static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
>>                                                                 bridge.node);
>>         }
>>
>> +       if (dp->edp_panel) {
>> +               next = panel_binder_init(dp->drm_dev, encoder, bridge.client,
>> +                       bridge.node, dp->edp_panel, DRM_CONNECTOR_POLL_HPD);
>> +               if (next)
>> +                       connector_created = true;
>> +               drm_bridge_add_to_chain(bridge_chain, next);
>> +       }
>> +
>>         return connector_created;
>>  }
>>
>> @@ -1215,16 +1225,10 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
>>         struct platform_device *pdev = to_platform_device(dev);
>>         struct drm_device *drm_dev = data;
>>         struct resource *res;
>> -       struct exynos_dp_device *dp;
>> +       struct exynos_dp_device *dp = exynos_dp_display.ctx;
>>         unsigned int irq_flags;
>> -
>>         int ret = 0;
>>
>> -       dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
>> -                               GFP_KERNEL);
>> -       if (!dp)
>> -               return -ENOMEM;
>> -
>>         dp->dev = &pdev->dev;
>>         dp->dpms_mode = DRM_MODE_DPMS_OFF;
>>
>> @@ -1298,7 +1302,6 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
>>         disable_irq(dp->irq);
>>
>>         dp->drm_dev = drm_dev;
>> -       exynos_dp_display.ctx = dp;
>>
>>         platform_set_drvdata(pdev, &exynos_dp_display);
>>
>> @@ -1325,6 +1328,9 @@ static const struct component_ops exynos_dp_ops = {
>>
>>  static int exynos_dp_probe(struct platform_device *pdev)
>>  {
>> +       struct device *dev = &pdev->dev;
>> +       struct device_node *panel_node;
>> +       struct exynos_dp_device *dp;
>>         int ret;
>>
>>         ret = exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR,
>> @@ -1332,6 +1338,21 @@ static int exynos_dp_probe(struct platform_device *pdev)
>>         if (ret)
>>                 return ret;
>>
>> +       dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
>> +                               GFP_KERNEL);
>> +       if (!dp)
>> +               return -ENOMEM;
>> +
>> +       panel_node = of_parse_phandle(dev->of_node, "edp-panel", 0);
>> +       if (panel_node) {
>> +               dp->edp_panel = of_drm_find_panel(panel_node);
>> +               of_node_put(panel_node);
>> +               if (!dp->edp_panel)
>> +                       return -EPROBE_DEFER;
>> +       }
>> +
>> +       exynos_dp_display.ctx = dp;
>> +
>>         ret = component_add(&pdev->dev, &exynos_dp_ops);
>>         if (ret)
>>                 exynos_drm_component_del(&pdev->dev,
>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h b/drivers/gpu/drm/exynos/exynos_dp_core.h
>> index 02cc4f9..26a64d3 100644
>> --- a/drivers/gpu/drm/exynos/exynos_dp_core.h
>> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.h
>> @@ -149,6 +149,7 @@ struct exynos_dp_device {
>>         struct drm_device       *drm_dev;
>>         struct drm_connector    connector;
>>         struct drm_encoder      *encoder;
>> +       struct drm_panel        *edp_panel;
>>         struct clk              *clock;
>>         unsigned int            irq;
>>         void __iomem            *reg_base;
>> --
>> 1.7.9.5
>>
