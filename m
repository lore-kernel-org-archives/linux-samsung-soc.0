From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 7/7] drm/bridge: ptn3460: add drm_panel controls
Date: Sat, 19 Apr 2014 01:25:27 +0530
Message-ID: <CAEC9eQOxePZtQwCF=17rKDFFFgXSQxVUM_y2P1pFwYGC1tiyjA@mail.gmail.com>
References: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
 <1397658786-26138-8-git-send-email-ajaykumar.rs@samsung.com>
 <000501cf5ae8$27f19510$77d4bf30$%han@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0337596846=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <000501cf5ae8$27f19510$77d4bf30$%han@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jingoo Han <jg1.han@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, abrestic@chromium.org, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, a.hajda@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, treding@nvidia.com, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0337596846==
Content-Type: multipart/alternative; boundary=bcaec547c9d5f7a36604f756871a

--bcaec547c9d5f7a36604f756871a
Content-Type: text/plain; charset=UTF-8

Hi Jingoo,

On Fri, Apr 18, 2014 at 2:55 PM, Jingoo Han <jg1.han@samsung.com> wrote:

> On Wednesday, April 16, 2014 11:33 PM, Ajay Kumar wrote:
> >
> > attach ptn3460 connector to drm_panel and support drm_panel routines,
> > if a valid drm_panel object is passed to ptn3460_init.
> >
> > Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> > ---
> >  drivers/gpu/drm/bridge/Kconfig          |  1 +
> >  drivers/gpu/drm/bridge/ptn3460.c        | 17 ++++++++++++++++-
> >  drivers/gpu/drm/exynos/exynos_dp_core.c | 15 +++++++++++----
> >  include/drm/bridge/ptn3460.h            |  6 ++++--
> >  4 files changed, 32 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig
> b/drivers/gpu/drm/bridge/Kconfig
> > index 884923f..3bc6845 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -2,4 +2,5 @@ config DRM_PTN3460
> >       tristate "PTN3460 DP/LVDS bridge"
> >       depends on DRM
> >       select DRM_KMS_HELPER
> > +     select DRM_PANEL
> >       ---help---
> > diff --git a/drivers/gpu/drm/bridge/ptn3460.c
> b/drivers/gpu/drm/bridge/ptn3460.c
> > index f1d2afc..736c7a8 100644
> > --- a/drivers/gpu/drm/bridge/ptn3460.c
> > +++ b/drivers/gpu/drm/bridge/ptn3460.c
> > @@ -24,6 +24,7 @@
> >  #include "drm_edid.h"
> >  #include "drm_crtc.h"
> >  #include "drm_crtc_helper.h"
> > +#include <drm/drm_panel.h>
>
> Move '<drm/drm_panel.h>' as below.
>
> #include <linux/gpio.h>
> #include <linux/delay.h>
> +#include <drm/drm_panel.h>
>
> #include "drmP.h"
>
>
> >
> >  #include "bridge/ptn3460.h"
> >
> > @@ -38,6 +39,7 @@ struct ptn3460_bridge {
> >       struct i2c_client *client;
> >       struct drm_encoder *encoder;
> >       struct drm_bridge *bridge;
> > +     struct drm_panel *panel;
> >       struct edid *edid;
> >       int gpio_pd_n;
> >       int gpio_rst_n;
> > @@ -126,6 +128,8 @@ static void ptn3460_pre_enable(struct drm_bridge
> *bridge)
> >               gpio_set_value(ptn_bridge->gpio_rst_n, 1);
> >       }
> >
> > +     drm_panel_pre_enable(ptn_bridge->panel);
> > +
> >       /*
> >        * There's a bug in the PTN chip where it falsely asserts hotplug
> before
> >        * it is fully functional. We're forced to wait for the maximum
> start up
> > @@ -142,6 +146,9 @@ static void ptn3460_pre_enable(struct drm_bridge
> *bridge)
> >
> >  static void ptn3460_enable(struct drm_bridge *bridge)
> >  {
> > +     struct ptn3460_bridge *ptn_bridge = bridge->driver_private;
> > +
> > +     drm_panel_enable(ptn_bridge->panel);
> >  }
> >
> >  static void ptn3460_disable(struct drm_bridge *bridge)
> > @@ -153,6 +160,8 @@ static void ptn3460_disable(struct drm_bridge
> *bridge)
> >
> >       ptn_bridge->enabled = false;
> >
> > +     drm_panel_disable(ptn_bridge->panel);
> > +
> >       if (gpio_is_valid(ptn_bridge->gpio_rst_n))
> >               gpio_set_value(ptn_bridge->gpio_rst_n, 1);
> >
> > @@ -265,7 +274,8 @@ struct drm_connector_funcs ptn3460_connector_funcs =
> {
> >  };
> >
> >  int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
> > -             struct i2c_client *client, struct device_node *node)
> > +             struct i2c_client *client, struct device_node *node,
> > +             struct drm_panel *panel)
> >  {
> >       int ret;
> >       struct drm_bridge *bridge;
> > @@ -324,6 +334,11 @@ int ptn3460_init(struct drm_device *dev, struct
> drm_encoder *encoder,
> >               goto err;
> >       }
> >
> > +     if (panel) {
> > +             ptn_bridge->panel = panel;
> > +             drm_panel_attach(ptn_bridge->panel,
> &ptn_bridge->connector);
> > +     }
> > +
> >       bridge->driver_private = ptn_bridge;
> >       encoder->bridge = bridge;
> >       ptn_bridge->connector.polled = DRM_CONNECTOR_POLL_HPD;
> > diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c
> b/drivers/gpu/drm/exynos/exynos_dp_core.c
> > index 6beeab6..7f550b6 100644
> > --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> > +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> > @@ -989,13 +989,14 @@ static bool find_bridge(const char *compat, struct
> bridge_init *bridge)
> >
> >  /* returns the number of bridges attached */
> >  static int exynos_drm_attach_lcd_bridge(struct drm_device *dev,
> > -             struct drm_encoder *encoder)
> > +             struct drm_encoder *encoder, struct drm_panel *panel)
> >  {
> >       struct bridge_init bridge;
> >       int ret;
> >
> >       if (find_bridge("nxp,ptn3460", &bridge)) {
> > -             ret = ptn3460_init(dev, encoder, bridge.client,
> bridge.node);
> > +             ret = ptn3460_init(dev, encoder, bridge.client,
> bridge.node,
> > +
> panel);
>
> 'panel' is too far. Please fix it as below.
>
>         if (find_bridge("nxp,ptn3460", &bridge)) {
>                 ret = ptn3460_init(dev, encoder, bridge.client,
> bridge.node,
>                                    panel);
>
> Ok.

>
> >               if (!ret)
> >                       return 1;
> >       }
> > @@ -1012,9 +1013,15 @@ static int exynos_dp_create_connector(struct
> exynos_drm_display *display,
> >       dp->encoder = encoder;
> >
> >       /* Pre-empt DP connector creation if there's a bridge */
> > -     ret = exynos_drm_attach_lcd_bridge(dp->drm_dev, encoder);
> > -     if (ret)
> > +     ret = exynos_drm_attach_lcd_bridge(dp->drm_dev, encoder,
> dp->drm_panel);
> > +     if (ret) {
> > +             /* Also set "dp->drm_panel = NULL" so that we don't end up
> > +              * controlling panel power both in exynos_dp and bridge
> > +              * DPMS routines.
> > +              */
>
> Please fix it as below.
>
>  +              /*
>  +               * Also set "dp->drm_panel = NULL" so that we don't end up
>  +               * controlling panel power both in exynos_dp and bridge
>  +               * DPMS routines.
>  +               */
>
> Right. I used wrong style for commenting!


> Best regards,
> Jingoo Han
>
> > +             dp->drm_panel = NULL;
> >               return 0;
> > +     }
> >
> >       connector->polled = DRM_CONNECTOR_POLL_HPD;
> >
> > diff --git a/include/drm/bridge/ptn3460.h b/include/drm/bridge/ptn3460.h
> > index ff62344..570cebb 100644
> > --- a/include/drm/bridge/ptn3460.h
> > +++ b/include/drm/bridge/ptn3460.h
> > @@ -18,16 +18,18 @@ struct drm_device;
> >  struct drm_encoder;
> >  struct i2c_client;
> >  struct device_node;
> > +struct drm_panel;
> >
> >  #if defined(CONFIG_DRM_PTN3460) || defined(CONFIG_DRM_PTN3460_MODULE)
> >
> >  int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
> > -             struct i2c_client *client, struct device_node *node);
> > +             struct i2c_client *client, struct device_node *node,
> > +             struct drm_panel *panel);
> >  #else
> >
> >  static inline int ptn3460_init(struct drm_device *dev,
> >               struct drm_encoder *encoder, struct i2c_client *client,
> > -             struct device_node *node)
> > +             struct device_node *node, struct drm_panel *panel)
> >  {
> >       return 0;
> >  }
> > --
> > 1.8.1.2
>
>
Thanks and regards,
Ajay Kumar

--bcaec547c9d5f7a36604f756871a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jingoo,<br><br><div class=3D"gmail_extra"><div class=3D=
"gmail_quote">On Fri, Apr 18, 2014 at 2:55 PM, Jingoo Han <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:jg1.han@samsung.com" target=3D"_blank">jg1.han@samsu=
ng.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On W=
ednesday, April 16, 2014 11:33 PM, Ajay Kumar wrote:<br>
&gt;<br>
&gt; attach ptn3460 connector to drm_panel and support drm_panel routines,<=
br>
&gt; if a valid drm_panel object is passed to ptn3460_init.<br>
&gt;<br>
&gt; Signed-off-by: Ajay Kumar &lt;<a href=3D"mailto:ajaykumar.rs@samsung.c=
om">ajaykumar.rs@samsung.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0drivers/gpu/drm/bridge/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A01 +<br>
&gt; =C2=A0drivers/gpu/drm/bridge/ptn3460.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17=
 ++++++++++++++++-<br>
&gt; =C2=A0drivers/gpu/drm/exynos/exynos_dp_core.c | 15 +++++++++++----<br>
&gt; =C2=A0include/drm/bridge/ptn3460.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A06 ++++--<br>
&gt; =C2=A04 files changed, 32 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/K=
config<br>
&gt; index 884923f..3bc6845 100644<br>
&gt; --- a/drivers/gpu/drm/bridge/Kconfig<br>
&gt; +++ b/drivers/gpu/drm/bridge/Kconfig<br>
&gt; @@ -2,4 +2,5 @@ config DRM_PTN3460<br>
&gt; =C2=A0 =C2=A0 =C2=A0 tristate &quot;PTN3460 DP/LVDS bridge&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 depends on DRM<br>
&gt; =C2=A0 =C2=A0 =C2=A0 select DRM_KMS_HELPER<br>
&gt; + =C2=A0 =C2=A0 select DRM_PANEL<br>
&gt; =C2=A0 =C2=A0 =C2=A0 ---help---<br>
&gt; diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge=
/ptn3460.c<br>
&gt; index f1d2afc..736c7a8 100644<br>
&gt; --- a/drivers/gpu/drm/bridge/ptn3460.c<br>
&gt; +++ b/drivers/gpu/drm/bridge/ptn3460.c<br>
&gt; @@ -24,6 +24,7 @@<br>
&gt; =C2=A0#include &quot;drm_edid.h&quot;<br>
&gt; =C2=A0#include &quot;drm_crtc.h&quot;<br>
&gt; =C2=A0#include &quot;drm_crtc_helper.h&quot;<br>
&gt; +#include &lt;drm/drm_panel.h&gt;<br>
<br>
</div></div>Move &#39;&lt;drm/drm_panel.h&gt;&#39; as below.<br>
<br>
#include &lt;linux/gpio.h&gt;<br>
#include &lt;linux/delay.h&gt;<br>
+#include &lt;drm/drm_panel.h&gt;<br>
<br>
#include &quot;drmP.h&quot;<br>
<div><div class=3D"h5"><br>
<br>
&gt;<br>
&gt; =C2=A0#include &quot;bridge/ptn3460.h&quot;<br>
&gt;<br>
&gt; @@ -38,6 +39,7 @@ struct ptn3460_bridge {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct i2c_client *client;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct drm_encoder *encoder;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct drm_bridge *bridge;<br>
&gt; + =C2=A0 =C2=A0 struct drm_panel *panel;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct edid *edid;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 int gpio_pd_n;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 int gpio_rst_n;<br>
&gt; @@ -126,6 +128,8 @@ static void ptn3460_pre_enable(struct drm_bridge *=
bridge)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio_set_value(ptn_br=
idge-&gt;gpio_rst_n, 1);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; + =C2=A0 =C2=A0 drm_panel_pre_enable(ptn_bridge-&gt;panel);<br>
&gt; +<br>
&gt; =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0* There&#39;s a bug in the PTN chip where i=
t falsely asserts hotplug before<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0* it is fully functional. We&#39;re forced =
to wait for the maximum start up<br>
&gt; @@ -142,6 +146,9 @@ static void ptn3460_pre_enable(struct drm_bridge *=
bridge)<br>
&gt;<br>
&gt; =C2=A0static void ptn3460_enable(struct drm_bridge *bridge)<br>
&gt; =C2=A0{<br>
&gt; + =C2=A0 =C2=A0 struct ptn3460_bridge *ptn_bridge =3D bridge-&gt;drive=
r_private;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 drm_panel_enable(ptn_bridge-&gt;panel);<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0static void ptn3460_disable(struct drm_bridge *bridge)<br>
&gt; @@ -153,6 +160,8 @@ static void ptn3460_disable(struct drm_bridge *bri=
dge)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 ptn_bridge-&gt;enabled =3D false;<br>
&gt;<br>
&gt; + =C2=A0 =C2=A0 drm_panel_disable(ptn_bridge-&gt;panel);<br>
&gt; +<br>
&gt; =C2=A0 =C2=A0 =C2=A0 if (gpio_is_valid(ptn_bridge-&gt;gpio_rst_n))<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio_set_value(ptn_br=
idge-&gt;gpio_rst_n, 1);<br>
&gt;<br>
&gt; @@ -265,7 +274,8 @@ struct drm_connector_funcs ptn3460_connector_funcs=
 =3D {<br>
&gt; =C2=A0};<br>
&gt;<br>
&gt; =C2=A0int ptn3460_init(struct drm_device *dev, struct drm_encoder *enc=
oder,<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct i2c_client *client,=
 struct device_node *node)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct i2c_client *client,=
 struct device_node *node,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_panel *panel)<b=
r>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct drm_bridge *bridge;<br>
&gt; @@ -324,6 +334,11 @@ int ptn3460_init(struct drm_device *dev, struct d=
rm_encoder *encoder,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; + =C2=A0 =C2=A0 if (panel) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptn_bridge-&gt;panel =3D p=
anel;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_panel_attach(ptn_bridg=
e-&gt;panel, &amp;ptn_bridge-&gt;connector);<br>
&gt; + =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; =C2=A0 =C2=A0 =C2=A0 bridge-&gt;driver_private =3D ptn_bridge;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 encoder-&gt;bridge =3D bridge;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 ptn_bridge-&gt;connector.polled =3D DRM_CONNECTOR=
_POLL_HPD;<br>
&gt; diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm=
/exynos/exynos_dp_core.c<br>
&gt; index 6beeab6..7f550b6 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/exynos_dp_core.c<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c<br>
&gt; @@ -989,13 +989,14 @@ static bool find_bridge(const char *compat, stru=
ct bridge_init *bridge)<br>
&gt;<br>
&gt; =C2=A0/* returns the number of bridges attached */<br>
&gt; =C2=A0static int exynos_drm_attach_lcd_bridge(struct drm_device *dev,<=
br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_encoder *encode=
r)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_encoder *encode=
r, struct drm_panel *panel)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct bridge_init bridge;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 if (find_bridge(&quot;nxp,ptn3460&quot;, &amp;bri=
dge)) {<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ptn3460_init(dev, =
encoder, bridge.client, bridge.node);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ptn3460_init(dev, =
encoder, bridge.client, bridge.node,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 panel);<br>
<br>
</div></div>&#39;panel&#39; is too far. Please fix it as below.<br>
<div class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (find_bridge(&quot;nxp,ptn3460&quot;, &amp;b=
ridge)) {<br>
</div><div class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D ptn3460_init(dev, encoder, bridge.client, bridge.node,<br>
</div><div class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pa=
nel);<br>
<br></div></blockquote><div>Ok. <br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv class=3D"">
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ret)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return 1;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -1012,9 +1013,15 @@ static int exynos_dp_create_connector(struct ex=
ynos_drm_display *display,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 dp-&gt;encoder =3D encoder;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 /* Pre-empt DP connector creation if there&#39;s =
a bridge */<br>
&gt; - =C2=A0 =C2=A0 ret =3D exynos_drm_attach_lcd_bridge(dp-&gt;drm_dev, e=
ncoder);<br>
&gt; - =C2=A0 =C2=A0 if (ret)<br>
&gt; + =C2=A0 =C2=A0 ret =3D exynos_drm_attach_lcd_bridge(dp-&gt;drm_dev, e=
ncoder, dp-&gt;drm_panel);<br>
&gt; + =C2=A0 =C2=A0 if (ret) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Also set &quot;dp-&gt;d=
rm_panel =3D NULL&quot; so that we don&#39;t end up<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* controlling panel =
power both in exynos_dp and bridge<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* DPMS routines.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
<br>
</div>Please fix it as below.<br>
<br>
=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Also set &quot;d=
p-&gt;drm_panel =3D NULL&quot; so that we don&#39;t end up<br>
<div class=3D"">=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * =
controlling panel power both in exynos_dp and bridge<br>
=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * DPMS routines.<b=
r>
=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
<br></div></blockquote><div>Right. I used wrong style for commenting!<br>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"">
</div>Best regards,<br>
Jingoo Han<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dp-&gt;drm_panel =3D NULL;=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; + =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 connector-&gt;polled =3D DRM_CONNECTOR_POLL_HPD;<=
br>
&gt;<br>
&gt; diff --git a/include/drm/bridge/ptn3460.h b/include/drm/bridge/ptn3460=
.h<br>
&gt; index ff62344..570cebb 100644<br>
&gt; --- a/include/drm/bridge/ptn3460.h<br>
&gt; +++ b/include/drm/bridge/ptn3460.h<br>
&gt; @@ -18,16 +18,18 @@ struct drm_device;<br>
&gt; =C2=A0struct drm_encoder;<br>
&gt; =C2=A0struct i2c_client;<br>
&gt; =C2=A0struct device_node;<br>
&gt; +struct drm_panel;<br>
&gt;<br>
&gt; =C2=A0#if defined(CONFIG_DRM_PTN3460) || defined(CONFIG_DRM_PTN3460_MO=
DULE)<br>
&gt;<br>
&gt; =C2=A0int ptn3460_init(struct drm_device *dev, struct drm_encoder *enc=
oder,<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct i2c_client *client,=
 struct device_node *node);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct i2c_client *client,=
 struct device_node *node,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_panel *panel);<=
br>
&gt; =C2=A0#else<br>
&gt;<br>
&gt; =C2=A0static inline int ptn3460_init(struct drm_device *dev,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_encoder *e=
ncoder, struct i2c_client *client,<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_node *node)<=
br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_node *node, =
struct drm_panel *panel)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; =C2=A0}<br>
&gt; --<br>
&gt; 1.8.1.2<br>
<br>
</div></div></blockquote></div><br></div><div class=3D"gmail_extra">Thanks =
and regards,<br>Ajay Kumar<br></div></div>

--bcaec547c9d5f7a36604f756871a--

--===============0337596846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0337596846==--
