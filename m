From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 5/7] drm/exynos: dp: modify driver to support drm_panel
Date: Sat, 19 Apr 2014 01:22:48 +0530
Message-ID: <CAEC9eQN_0nmqNCSi8XOi7bd1ZjC=hvuRtEv8xh-D-_ECpMv53Q@mail.gmail.com>
References: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
 <1397658786-26138-6-git-send-email-ajaykumar.rs@samsung.com>
 <000401cf5ae5$bbea0340$33be09c0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0128825156=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <000401cf5ae5$bbea0340$33be09c0$%han@samsung.com>
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

--===============0128825156==
Content-Type: multipart/alternative; boundary=485b397dd2997d8b1e04f7567e02

--485b397dd2997d8b1e04f7567e02
Content-Type: text/plain; charset=UTF-8

Hi Jingoo,


On Fri, Apr 18, 2014 at 2:38 PM, Jingoo Han <jg1.han@samsung.com> wrote:

> On Wednesday, April 16, 2014 11:33 PM, Ajay Kumar wrote:
> >
> > This patch attaches the dp connector to exynos_dp_panel, and adds
> > calls to drm_panel functions to control panel power sequence.
> >
> > Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> > ---
> >  drivers/gpu/drm/exynos/Kconfig          |  1 +
> >  drivers/gpu/drm/exynos/exynos_dp_core.c | 19 +++++++++++++++++++
> >  drivers/gpu/drm/exynos/exynos_dp_core.h |  1 +
> >  3 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/exynos/Kconfig
> b/drivers/gpu/drm/exynos/Kconfig
> > index 5bf5bca..56af433 100644
> > --- a/drivers/gpu/drm/exynos/Kconfig
> > +++ b/drivers/gpu/drm/exynos/Kconfig
> > @@ -52,6 +52,7 @@ config DRM_EXYNOS_DP
> >       bool "EXYNOS DRM DP driver support"
> >       depends on DRM_EXYNOS && ARCH_EXYNOS
> >       default DRM_EXYNOS
> > +     select DRM_PANEL
> >       help
> >         This enables support for DP device.
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c
> b/drivers/gpu/drm/exynos/exynos_dp_core.c
> > index 18fd9c5..6beeab6 100644
> > --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> > +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> > @@ -28,6 +28,7 @@
> >  #include <drm/drmP.h>
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_panel.h>
> >  #include <drm/bridge/ptn3460.h>
> >
> >  #include "exynos_drm_drv.h"
> > @@ -1028,6 +1029,9 @@ static int exynos_dp_create_connector(struct
> exynos_drm_display *display,
> >       drm_sysfs_connector_add(connector);
> >       drm_mode_connector_attach_encoder(connector, encoder);
> >
> > +     if (dp->drm_panel)
> > +             drm_panel_attach(dp->drm_panel, &dp->connector);
> > +
> >       return 0;
> >  }
> >
> > @@ -1062,10 +1066,12 @@ static void exynos_dp_poweron(struct
> exynos_dp_device *dp)
> >       if (dp->dpms_mode == DRM_MODE_DPMS_ON)
> >               return;
> >
> > +     drm_panel_pre_enable(dp->drm_panel);
> >       clk_prepare_enable(dp->clock);
> >       exynos_dp_phy_init(dp);
> >       exynos_dp_init_dp(dp);
> >       enable_irq(dp->irq);
> > +     drm_panel_enable(dp->drm_panel);
> >  }
> >
> >  static void exynos_dp_poweroff(struct exynos_dp_device *dp)
> > @@ -1073,6 +1079,7 @@ static void exynos_dp_poweroff(struct
> exynos_dp_device *dp)
> >       if (dp->dpms_mode != DRM_MODE_DPMS_ON)
> >               return;
> >
> > +     drm_panel_disable(dp->drm_panel);
> >       disable_irq(dp->irq);
> >       flush_work(&dp->hotplug_work);
> >       exynos_dp_phy_exit(dp);
> > @@ -1225,6 +1232,7 @@ static int exynos_dp_dt_parse_panel(struct
> exynos_dp_device *dp)
> >  static int exynos_dp_bind(struct device *dev, struct device *master,
> void *data)
> >  {
> >       struct platform_device *pdev = to_platform_device(dev);
> > +     struct device_node *panel_node;
> >       struct drm_device *drm_dev = data;
> >       struct resource *res;
> >       struct exynos_dp_device *dp;
> > @@ -1299,6 +1307,17 @@ static int exynos_dp_bind(struct device *dev,
> struct device *master, void *data)
> >
> >       INIT_WORK(&dp->hotplug_work, exynos_dp_hotplug);
> >
> > +     panel_node = of_find_compatible_node(NULL, NULL,
> > +                                             "samsung,exynos-dp-panel");
> > +     if (panel_node) {
> > +             dp->drm_panel = of_drm_find_panel(panel_node);
> > +             if (!dp->drm_panel) {
> > +                     of_node_put(panel_node);
> > +                     return -ENODEV;
> > +             }
> > +             of_node_put(panel_node);
> > +     }
>
> The following is simpler.
>
> +       if (panel_node) {
> +               dp->drm_panel = of_drm_find_panel(panel_node);
> +               of_node_put(panel_node);
> +               if (!dp->drm_panel)
> +                       return -ENODEV;
> +       }
>
Right, will change it.


> Best regards,
> Jingoo Han
>
> > +
> >       exynos_dp_phy_init(dp);
> >
> >       exynos_dp_init_dp(dp);
> > diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h
> b/drivers/gpu/drm/exynos/exynos_dp_core.h
> > index 56fa43e..9dc7991 100644
> > --- a/drivers/gpu/drm/exynos/exynos_dp_core.h
> > +++ b/drivers/gpu/drm/exynos/exynos_dp_core.h
> > @@ -148,6 +148,7 @@ struct exynos_dp_device {
> >       struct drm_device       *drm_dev;
> >       struct drm_connector    connector;
> >       struct drm_encoder      *encoder;
> > +     struct drm_panel        *drm_panel;
> >       struct clk              *clock;
> >       unsigned int            irq;
> >       void __iomem            *reg_base;
> > --
> > 1.8.1.2
>
>
Thanks and regards,
Ajay Kumar

--485b397dd2997d8b1e04f7567e02
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jingoo,<br><div class=3D"gmail_extra"><br><br><div clas=
s=3D"gmail_quote">On Fri, Apr 18, 2014 at 2:38 PM, Jingoo Han <span dir=3D"=
ltr">&lt;<a href=3D"mailto:jg1.han@samsung.com" target=3D"_blank">jg1.han@s=
amsung.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On W=
ednesday, April 16, 2014 11:33 PM, Ajay Kumar wrote:<br>
&gt;<br>
&gt; This patch attaches the dp connector to exynos_dp_panel, and adds<br>
&gt; calls to drm_panel functions to control panel power sequence.<br>
&gt;<br>
&gt; Signed-off-by: Ajay Kumar &lt;<a href=3D"mailto:ajaykumar.rs@samsung.c=
om">ajaykumar.rs@samsung.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0drivers/gpu/drm/exynos/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A01 +<br>
&gt; =C2=A0drivers/gpu/drm/exynos/exynos_dp_core.c | 19 +++++++++++++++++++=
<br>
&gt; =C2=A0drivers/gpu/drm/exynos/exynos_dp_core.h | =C2=A01 +<br>
&gt; =C2=A03 files changed, 21 insertions(+)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/K=
config<br>
&gt; index 5bf5bca..56af433 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/Kconfig<br>
&gt; +++ b/drivers/gpu/drm/exynos/Kconfig<br>
&gt; @@ -52,6 +52,7 @@ config DRM_EXYNOS_DP<br>
&gt; =C2=A0 =C2=A0 =C2=A0 bool &quot;EXYNOS DRM DP driver support&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 depends on DRM_EXYNOS &amp;&amp; ARCH_EXYNOS<br>
&gt; =C2=A0 =C2=A0 =C2=A0 default DRM_EXYNOS<br>
&gt; + =C2=A0 =C2=A0 select DRM_PANEL<br>
&gt; =C2=A0 =C2=A0 =C2=A0 help<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 This enables support for DP device.<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm=
/exynos/exynos_dp_core.c<br>
&gt; index 18fd9c5..6beeab6 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/exynos_dp_core.c<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c<br>
&gt; @@ -28,6 +28,7 @@<br>
&gt; =C2=A0#include &lt;drm/drmP.h&gt;<br>
&gt; =C2=A0#include &lt;drm/drm_crtc.h&gt;<br>
&gt; =C2=A0#include &lt;drm/drm_crtc_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_panel.h&gt;<br>
&gt; =C2=A0#include &lt;drm/bridge/ptn3460.h&gt;<br>
&gt;<br>
&gt; =C2=A0#include &quot;exynos_drm_drv.h&quot;<br>
&gt; @@ -1028,6 +1029,9 @@ static int exynos_dp_create_connector(struct exy=
nos_drm_display *display,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 drm_sysfs_connector_add(connector);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 drm_mode_connector_attach_encoder(connector, enco=
der);<br>
&gt;<br>
&gt; + =C2=A0 =C2=A0 if (dp-&gt;drm_panel)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_panel_attach(dp-&gt;dr=
m_panel, &amp;dp-&gt;connector);<br>
&gt; +<br>
&gt; =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; @@ -1062,10 +1066,12 @@ static void exynos_dp_poweron(struct exynos_dp=
_device *dp)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 if (dp-&gt;dpms_mode =3D=3D DRM_MODE_DPMS_ON)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;<br>
&gt; + =C2=A0 =C2=A0 drm_panel_pre_enable(dp-&gt;drm_panel);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 clk_prepare_enable(dp-&gt;clock);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 exynos_dp_phy_init(dp);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 exynos_dp_init_dp(dp);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 enable_irq(dp-&gt;irq);<br>
&gt; + =C2=A0 =C2=A0 drm_panel_enable(dp-&gt;drm_panel);<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0static void exynos_dp_poweroff(struct exynos_dp_device *dp)<br>
&gt; @@ -1073,6 +1079,7 @@ static void exynos_dp_poweroff(struct exynos_dp_=
device *dp)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 if (dp-&gt;dpms_mode !=3D DRM_MODE_DPMS_ON)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;<br>
&gt; + =C2=A0 =C2=A0 drm_panel_disable(dp-&gt;drm_panel);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 disable_irq(dp-&gt;irq);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 flush_work(&amp;dp-&gt;hotplug_work);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 exynos_dp_phy_exit(dp);<br>
&gt; @@ -1225,6 +1232,7 @@ static int exynos_dp_dt_parse_panel(struct exyno=
s_dp_device *dp)<br>
&gt; =C2=A0static int exynos_dp_bind(struct device *dev, struct device *mas=
ter, void *data)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct platform_device *pdev =3D to_platform_devi=
ce(dev);<br>
&gt; + =C2=A0 =C2=A0 struct device_node *panel_node;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct drm_device *drm_dev =3D data;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct resource *res;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct exynos_dp_device *dp;<br>
&gt; @@ -1299,6 +1307,17 @@ static int exynos_dp_bind(struct device *dev, s=
truct device *master, void *data)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 INIT_WORK(&amp;dp-&gt;hotplug_work, exynos_dp_hot=
plug);<br>
&gt;<br>
&gt; + =C2=A0 =C2=A0 panel_node =3D of_find_compatible_node(NULL, NULL,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;samsung,exynos-dp-panel&quot;);<br>
&gt; + =C2=A0 =C2=A0 if (panel_node) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dp-&gt;drm_panel =3D of_dr=
m_find_panel(panel_node);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dp-&gt;drm_panel) {<b=
r>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 of_node_put(panel_node);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -ENODEV;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_node_put(panel_node);<b=
r>
&gt; + =C2=A0 =C2=A0 }<br>
<br>
</div></div>The following is simpler.<br>
<div class=3D""><br>
+ =C2=A0 =C2=A0 =C2=A0 if (panel_node) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dp-&gt;drm_panel =3D of_=
drm_find_panel(panel_node);<br>
</div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_node_put(panel_=
node);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dp-&gt;drm_panel)<b=
r>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -ENODEV;<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div>Right, will change it.<br>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
Best regards,<br>
Jingoo Han<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; +<br>
&gt; =C2=A0 =C2=A0 =C2=A0 exynos_dp_phy_init(dp);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 exynos_dp_init_dp(dp);<br>
&gt; diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h b/drivers/gpu/drm=
/exynos/exynos_dp_core.h<br>
&gt; index 56fa43e..9dc7991 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/exynos_dp_core.h<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos_dp_core.h<br>
&gt; @@ -148,6 +148,7 @@ struct exynos_dp_device {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct drm_device =C2=A0 =C2=A0 =C2=A0 *drm_dev;<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct drm_connector =C2=A0 =C2=A0connector;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct drm_encoder =C2=A0 =C2=A0 =C2=A0*encoder;<=
br>
&gt; + =C2=A0 =C2=A0 struct drm_panel =C2=A0 =C2=A0 =C2=A0 =C2=A0*drm_panel=
;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct clk =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*clock;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0irq;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 void __iomem =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*reg_base;<br>
&gt; --<br>
&gt; 1.8.1.2<br>
<br>
</div></div></blockquote></div><br></div><div class=3D"gmail_extra">Thanks =
and regards,<br></div><div class=3D"gmail_extra">Ajay Kumar<br></div></div>

--485b397dd2997d8b1e04f7567e02--

--===============0128825156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0128825156==--
