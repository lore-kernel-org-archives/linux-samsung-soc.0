From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RESEND PATCH V5 12/12] drm/exynos: Add ps8622 lvds bridge
 discovery to DP driver
Date: Mon, 21 Jul 2014 20:06:01 +0530
Message-ID: <CAEC9eQODqv=vkWhxnSVC4fFcfn1pHAmXzMZowayBbgKPjdppzw@mail.gmail.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
 <1405629839-12086-13-git-send-email-ajaykumar.rs@samsung.com>
 <20140721071028.GB8843@ulmo>
 <CAEC9eQPkzrpQn41+zu8mwJUctSd0CF_U4UCdff0F7VYq2oWthw@mail.gmail.com>
 <20140721125424.GD15238@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140721125424.GD15238@ulmo>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Javier Martinez Canillas <javier@dowhile0.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Thierry,

On Mon, Jul 21, 2014 at 6:24 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Mon, Jul 21, 2014 at 04:58:25PM +0530, Ajay kumar wrote:
>> On Mon, Jul 21, 2014 at 12:40 PM, Thierry Reding
>> <thierry.reding@gmail.com> wrote:
>> > On Fri, Jul 18, 2014 at 02:13:58AM +0530, Ajay Kumar wrote:
>> >> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>> >>
>> >> This patch adds ps8622 lvds bridge discovery code to the dp driver.
>> >>
>> >> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
>> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> >> ---
>> >>  drivers/gpu/drm/exynos/exynos_dp_core.c |    5 +++++
>> >>  1 file changed, 5 insertions(+)
>> >>
>> >> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
>> >> index 0ca6256..82e2942 100644
>> >> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
>> >> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
>> >> @@ -31,6 +31,7 @@
>> >>  #include <drm/drm_panel.h>
>> >>  #include <drm/bridge/ptn3460.h>
>> >>  #include <drm/bridge/panel_binder.h>
>> >> +#include <drm/bridge/ps8622.h>
>> >>
>> >>  #include "exynos_drm_drv.h"
>> >>  #include "exynos_dp_core.h"
>> >> @@ -999,6 +1000,10 @@ static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
>> >>       if (find_bridge("nxp,ptn3460", &bridge)) {
>> >>               bridge_chain = ptn3460_init(dp->drm_dev, encoder, bridge.client,
>> >>                                                               bridge.node);
>> >> +     } else if (find_bridge("parade,ps8622", &bridge) ||
>> >> +                             find_bridge("parade,ps8625", &bridge)) {
>> >> +             bridge_chain = ps8622_init(dp->drm_dev, encoder, bridge.client,
>> >> +                                                             bridge.node);
>> >>       }
>> >
>> > We really ought to be adding some sort of registry at some point.
>> > Otherwise every driver that wants to use bridges needs to come up with a
>> > similar set of helpers to instantiate them.
>> >
>> > Also you're making this driver depend on (now) two bridges, whereas it
>> > really shouldn't matter which exact types it supports. Bridges should be
>> > exposed via a generic interface.
>>
>> How about moving out the find_bridge() function into a common header file,
>> and also supporting the list of bridge_init declarations in the same file?
>>
>> We get bridge chip node from phandle, and then pass the same node
>> to find_bridge() which searches the list using of_device_is_compatible()
>> to call the appropriate bridge_init function?
>
> That could work, but it's still somewhat unusual and shouldn't be
> required. I think we'd be better of with some sort of registry like we
> have for panels. That would mean that a driver that wants to use a
> bridge would do something like this:
>
>         struct drm_bridge *bridge;
>         struct device_node *np;
>
>         np = of_parse_phandle(dev->of_node, "bridge", 0);
>         if (np) {
>                 bridge = of_drm_find_bridge(np);
>                 of_node_put(np);
>
>                 if (!bridge)
>                         return -EPROBE_DEFER;
>         }
>
> An alternative way would be to add a non-OF wrapper around this, like
> this for example:
Let me try the DT version first :)

>         bridge = drm_bridge_get(dev, NULL);
>
> Which would be conceptually the same as clk_get() or regulator_get() and
> could be easily extended to support non-DT setups as well.
>
> As for bridge drivers I think we may have to rework things a little, so
> that a driver can call some sequence like this:
>
>         struct foo_bridge {
>                 struct drm_bridge base;
>                 ...
>         };
>
>         static const struct drm_bridge_funcs foo_bridge_funcs = {
>                 ...
>         };
>
>         static int foo_probe(...)
>         {
>                 struct foo_bridge *bridge;
>                 int err;
>
>                 bridge = devm_kzalloc(dev, sizeof(*bridge), GFP_KERNEL);
>                 if (!bridge)
>                         return -ENOMEM;
>
>                 /* setup bridge (return -EPROBE_DEFER if necessary, ...) */
>
>                 /* register bridge with DRM */
>                 drm_bridge_init(&bridge->base);
>                 bridge->base.dev = dev;
>                 bridge->base.funcs = &foo_bridge_funcs;
>
>                 err = drm_bridge_add(&bridge->base);
>                 if (err < 0)
>                         return err;
>
>                 dev_set_drvdata(dev, bridge);
>                 ...
>         }
>
> drm_bridge_add() would add the bridge to a global list of bridge devices
> which drm_bridge_get()/of_drm_find_bridge() can use to find the one that
> it needs. The above has the big advantage that it'sdev->mode_config.bridge_list completely
> independent of the underlying bus that the bridge is on. It could be I2C
> or SPI, platform device or PCI device.
>
> Thierry
Ok. This is all about making the bridge driver confine to the driver model.
But, I would need a drm_device pointer to register the bridge to DRM core.
How do I get it?

Ajay
