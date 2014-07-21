From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RESEND PATCH V5 03/12] drm/exynos: dp: modify driver to support
 drm_panel
Date: Mon, 21 Jul 2014 17:48:18 +0530
Message-ID: <CAEC9eQOMVK3Gw39U6eTX-muByAbcdNZQutJ8dGddV+6foomYcQ@mail.gmail.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
 <1405629839-12086-4-git-send-email-ajaykumar.rs@samsung.com>
 <20140721081450.GE8843@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140721081450.GE8843@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Javier Martinez Canillas <javier@dowhile0.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Thierry,

On Mon, Jul 21, 2014 at 1:44 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Fri, Jul 18, 2014 at 02:13:49AM +0530, Ajay Kumar wrote:
>> Add drm_panel controls to support powerup/down of the
>> eDP panel, if one is present at the sink side.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  .../devicetree/bindings/video/exynos_dp.txt        |    2 +
>>  drivers/gpu/drm/exynos/Kconfig                     |    1 +
>>  drivers/gpu/drm/exynos/exynos_dp_core.c            |   45 ++++++++++++++++----
>>  drivers/gpu/drm/exynos/exynos_dp_core.h            |    2 +
>>  4 files changed, 41 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/video/exynos_dp.txt b/Documentation/devicetree/bindings/video/exynos_dp.txt
>> index 53dbccf..c029a09 100644
>> --- a/Documentation/devicetree/bindings/video/exynos_dp.txt
>> +++ b/Documentation/devicetree/bindings/video/exynos_dp.txt
>> @@ -51,6 +51,8 @@ Required properties for dp-controller:
>>                       LANE_COUNT1 = 1, LANE_COUNT2 = 2, LANE_COUNT4 = 4
>>       - display-timings: timings for the connected panel as described by
>>               Documentation/devicetree/bindings/video/display-timing.txt
>> +     -edp-panel:
>> +             phandle for the edp/lvds drm_panel node.
>
> There's really no need for the edp- prefix here. Also please don't use
> drm_panel in the binding description since it makes no sense outside of
> DRM (and bindings need to be OS agnostic).
>
> Also: "eDP" and "LVDS"
Ok. Will fix this.

>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
>> index a94b114..b3d0d9b 100644
>> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
>> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
>> @@ -28,6 +28,7 @@
>>  #include <drm/drmP.h>
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_panel.h>
>>  #include <drm/bridge/ptn3460.h>
>>
>>  #include "exynos_drm_drv.h"
>> @@ -1029,6 +1030,9 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
>>       drm_connector_register(connector);
>>       drm_mode_connector_attach_encoder(connector, encoder);
>>
>> +     if (dp->edp_panel)
>> +             drm_panel_attach(dp->edp_panel, &dp->connector);
>
> This function can fail, so you really need to do some error-checking
> here.
Ok.

>> @@ -1063,11 +1067,13 @@ static void exynos_dp_poweron(struct exynos_dp_device *dp)
>>       if (dp->dpms_mode == DRM_MODE_DPMS_ON)
>>               return;
>>
>> +     drm_panel_prepare(dp->edp_panel);
>>       clk_prepare_enable(dp->clock);
>>       exynos_dp_phy_init(dp);
>>       exynos_dp_init_dp(dp);
>>       enable_irq(dp->irq);
>>       exynos_dp_setup(dp);
>> +     drm_panel_enable(dp->edp_panel);
>
> These two as well. clk_prepare_enable() can also fail by the way.
>
> exynos_dp_init_dp() can also fail theoretically (it returns int) but
> never returns anything other than 0, so it could just as well return
> void.
Ok. Will fix this.

>> @@ -1075,10 +1081,12 @@ static void exynos_dp_poweroff(struct exynos_dp_device *dp)
>>       if (dp->dpms_mode != DRM_MODE_DPMS_ON)
>>               return;
>>
>> +     drm_panel_disable(dp->edp_panel);
>>       disable_irq(dp->irq);
>>       flush_work(&dp->hotplug_work);
>>       exynos_dp_phy_exit(dp);
>>       clk_disable_unprepare(dp->clock);
>> +     drm_panel_unprepare(dp->edp_panel);
>>  }
>
> And these two also.
Ok.

>>  static void exynos_dp_dpms(struct exynos_drm_display *display, int mode)
>> @@ -1209,8 +1217,17 @@ err:
>>  static int exynos_dp_dt_parse_panel(struct exynos_dp_device *dp)
>>  {
>>       int ret;
>> +     struct device_node *videomode_parent;
>> +
>> +     /* Receive video timing info from panel node
>> +      * if there is a panel node
>> +      */
>> +     if (dp->panel_node)
>> +             videomode_parent = dp->panel_node;
>> +     else
>> +             videomode_parent = dp->dev->of_node;
>>
>> -     ret = of_get_videomode(dp->dev->of_node, &dp->panel.vm,
>> +     ret = of_get_videomode(videomode_parent, &dp->panel.vm,
>
> You shouldn't be grabbing the video timings from some random node like
> this. Instead you should use the DRM panel's .get_modes() function to
> query the supported modes. The panel may not (in fact, should not, at
> least under most circumstances) define video timings in the device tree.
Right, I am planning to use panel-simple driver by adding drm_display_mode
structure for the lvds panels. So, I would not need this change.

>> @@ -1341,6 +1353,21 @@ static int exynos_dp_probe(struct platform_device *pdev)
>>       if (ret)
>>               return ret;
>>
>> +     dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
>> +                             GFP_KERNEL);
>> +     if (!dp)
>> +             return -ENOMEM;
>> +
>> +     dp->panel_node = of_parse_phandle(dev->of_node, "edp-panel", 0);
>
> There should be no need to store the struct device_node * obtained here
> in the context like this.
>
>> +     if (dp->panel_node) {
>> +             dp->edp_panel = of_drm_find_panel(dp->panel_node);
>> +             of_node_put(dp->panel_node);
>
> Especially since after this that pointer may become invalid.
Same explanation as above. Need not store panel_node inside private context.

Ajay
