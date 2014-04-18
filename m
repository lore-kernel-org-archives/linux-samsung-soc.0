From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 1/7] drm/exynos: dp: support hotplug detection via GPIO
Date: Sat, 19 Apr 2014 01:03:07 +0530
Message-ID: <CAEC9eQO8+-et=-OdwV-1fqO=RuCx-fEPa6XgRA5K_duJHvjGtw@mail.gmail.com>
References: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
 <1397658786-26138-2-git-send-email-ajaykumar.rs@samsung.com>
 <000001cf5adf$87cf7280$976e5780$%han@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1746825157=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <000001cf5adf$87cf7280$976e5780$%han@samsung.com>
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

--===============1746825157==
Content-Type: multipart/alternative; boundary=001a113376fe1e1fac04f75638c5

--001a113376fe1e1fac04f75638c5
Content-Type: text/plain; charset=UTF-8

Hi Jingoo,


On Fri, Apr 18, 2014 at 1:53 PM, Jingoo Han <jg1.han@samsung.com> wrote:

> On Wednesday, April 16, 2014 11:33 PM, Ajay Kumar wrote:
> >
> > From: Andrew Bresticker <abrestic@chromium.org>
> >
> > Certain bridge chips use a GPIO to indicate the cable status instead
> > of the I_DP_HPD pin.  This adds an optional device-tree property,
> > "samsung,hpd-gpio", to the exynos-dp controller which indicates that
> > the specified GPIO should be used for hotplug detection.
> > The GPIO is then set up as an edge-triggered interrupt where the
> > rising edge indicates hotplug-in and the falling edge indicates
> hotplug-out.
> >
> > Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> > Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> > Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> > ---
> >  .../devicetree/bindings/video/exynos_dp.txt        |  4 +++
> >  drivers/gpu/drm/exynos/exynos_dp_core.c            | 32
> ++++++++++++++++++++--
> >  drivers/gpu/drm/exynos/exynos_dp_core.h            |  1 +
> >  drivers/gpu/drm/exynos/exynos_dp_reg.c             | 26
> ++++++++++++++++--
> >  4 files changed, 57 insertions(+), 6 deletions(-)
> >
>
> [.....]
>
> > --- a/drivers/gpu/drm/exynos/exynos_dp_reg.c
> > +++ b/drivers/gpu/drm/exynos/exynos_dp_reg.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/device.h>
> >  #include <linux/io.h>
> >  #include <linux/delay.h>
> > +#include <linux/gpio.h>
> >
> >  #include "exynos_dp_core.h"
> >  #include "exynos_dp_reg.h"
> > @@ -326,6 +327,9 @@ void exynos_dp_clear_hotplug_interrupts(struct
> exynos_dp_device *dp)
> >  {
> >       u32 reg;
> >
> > +     if (gpio_is_valid(dp->hpd_gpio))
> > +             return;
> > +
> >       reg = HOTPLUG_CHG | HPD_LOST | PLUG;
> >       writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_4);
> >
> > @@ -337,6 +341,9 @@ void exynos_dp_init_hpd(struct exynos_dp_device *dp)
> >  {
> >       u32 reg;
> >
> > +     if (gpio_is_valid(dp->hpd_gpio))
> > +             return;
> > +
> >       exynos_dp_clear_hotplug_interrupts(dp);
> >
> >       reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
> > @@ -348,6 +355,14 @@ enum dp_irq_type exynos_dp_get_irq_type(struct
> exynos_dp_device *dp)
> >  {
> >       u32 reg;
> >
> > +     if (gpio_is_valid(dp->hpd_gpio)) {
> > +             reg = gpio_get_value(dp->hpd_gpio);
> > +             if (reg)
> > +                     return DP_IRQ_TYPE_HP_CABLE_IN;
> > +             else
> > +                     return DP_IRQ_TYPE_HP_CABLE_OUT;
> > +     }
> > +
>
> Please keep the style. It enhances the readability.
>
> if (gpio_is_valid(dp->hpd_gpio)) {
>         ...
> } else {
>         ...
> }
>
> Ok.

> Then, it can be as bellows.
>
> +       if (gpio_is_valid(dp->hpd_gpio)) {
> +               reg = gpio_get_value(dp->hpd_gpio);
> +               if (reg)
> +                       return DP_IRQ_TYPE_HP_CABLE_IN;
> +               else
> +                       return DP_IRQ_TYPE_HP_CABLE_OUT;
> +       } else {
> +               /* Parse hotplug interrupt status register */
> +               reg = readl(dp->reg_base + EXYNOS_DP_COMMON_INT_STA_4);
> +
> +               if (reg & PLUG)
> +                       return DP_IRQ_TYPE_HP_CABLE_IN;
> +
> +               if (reg & HPD_LOST)
> +                       return DP_IRQ_TYPE_HP_CABLE_OUT;
> +
> +               if (reg & HOTPLUG_CHG)
> +                       return DP_IRQ_TYPE_HP_CHANGE;
> +       }
>
> Will change this.

>         return DP_IRQ_TYPE_UNKNOWN;
> }
>
> Best regards,
> Jingoo Han
>
> >       /* Parse hotplug interrupt status register */
> >       reg = readl(dp->reg_base + EXYNOS_DP_COMMON_INT_STA_4);
> >
> > @@ -402,9 +417,14 @@ int exynos_dp_get_plug_in_status(struct
> exynos_dp_device *dp)
> >  {
> >       u32 reg;
> >
> > -     reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
> > -     if (reg & HPD_STATUS)
> > -             return 0;
> > +     if (gpio_is_valid(dp->hpd_gpio)) {
> > +             if (gpio_get_value(dp->hpd_gpio))
> > +                     return 0;
> > +     } else {
> > +             reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
> > +             if (reg & HPD_STATUS)
> > +                     return 0;
> > +     }
> >
> >       return -EINVAL;
> >  }
> > --
> > 1.8.1.2
>
>
Thanks and Regrads,
Ajay Kumar

--001a113376fe1e1fac04f75638c5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jingoo,<br><div><div class=3D"gmail_extra"><br><br><div=
 class=3D"gmail_quote">On Fri, Apr 18, 2014 at 1:53 PM, Jingoo Han <span di=
r=3D"ltr">&lt;<a href=3D"mailto:jg1.han@samsung.com" target=3D"_blank">jg1.=
han@samsung.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Wednesday, April 16, 2014=
 11:33 PM, Ajay Kumar wrote:<br>
&gt;<br>
&gt; From: Andrew Bresticker &lt;<a href=3D"mailto:abrestic@chromium.org">a=
brestic@chromium.org</a>&gt;<br>
&gt;<br>
&gt; Certain bridge chips use a GPIO to indicate the cable status instead<b=
r>
&gt; of the I_DP_HPD pin. =C2=A0This adds an optional device-tree property,=
<br>
&gt; &quot;samsung,hpd-gpio&quot;, to the exynos-dp controller which indica=
tes that<br>
&gt; the specified GPIO should be used for hotplug detection.<br>
&gt; The GPIO is then set up as an edge-triggered interrupt where the<br>
&gt; rising edge indicates hotplug-in and the falling edge indicates hotplu=
g-out.<br>
&gt;<br>
&gt; Signed-off-by: Andrew Bresticker &lt;<a href=3D"mailto:abrestic@chromi=
um.org">abrestic@chromium.org</a>&gt;<br>
&gt; Signed-off-by: Rahul Sharma &lt;<a href=3D"mailto:rahul.sharma@samsung=
.com">rahul.sharma@samsung.com</a>&gt;<br>
&gt; Signed-off-by: Ajay Kumar &lt;<a href=3D"mailto:ajaykumar.rs@samsung.c=
om">ajaykumar.rs@samsung.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../devicetree/bindings/video/exynos_dp.txt =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| =C2=A04 +++<br>
&gt; =C2=A0drivers/gpu/drm/exynos/exynos_dp_core.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 32 ++++++++++++++++++++--<br>
&gt; =C2=A0drivers/gpu/drm/exynos/exynos_dp_core.h =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A01 +<br>
&gt; =C2=A0drivers/gpu/drm/exynos/exynos_dp_reg.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 26 ++++++++++++++++--<br>
&gt; =C2=A04 files changed, 57 insertions(+), 6 deletions(-)<br>
&gt;<br>
<br>
</div>[.....]<br>
<div><div class=3D"h5"><br>
&gt; --- a/drivers/gpu/drm/exynos/exynos_dp_reg.c<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos_dp_reg.c<br>
&gt; @@ -13,6 +13,7 @@<br>
&gt; =C2=A0#include &lt;linux/device.h&gt;<br>
&gt; =C2=A0#include &lt;linux/io.h&gt;<br>
&gt; =C2=A0#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/gpio.h&gt;<br>
&gt;<br>
&gt; =C2=A0#include &quot;exynos_dp_core.h&quot;<br>
&gt; =C2=A0#include &quot;exynos_dp_reg.h&quot;<br>
&gt; @@ -326,6 +327,9 @@ void exynos_dp_clear_hotplug_interrupts(struct exy=
nos_dp_device *dp)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 u32 reg;<br>
&gt;<br>
&gt; + =C2=A0 =C2=A0 if (gpio_is_valid(dp-&gt;hpd_gpio))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +<br>
&gt; =C2=A0 =C2=A0 =C2=A0 reg =3D HOTPLUG_CHG | HPD_LOST | PLUG;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 writel(reg, dp-&gt;reg_base + EXYNOS_DP_COMMON_IN=
T_STA_4);<br>
&gt;<br>
&gt; @@ -337,6 +341,9 @@ void exynos_dp_init_hpd(struct exynos_dp_device *d=
p)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 u32 reg;<br>
&gt;<br>
&gt; + =C2=A0 =C2=A0 if (gpio_is_valid(dp-&gt;hpd_gpio))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +<br>
&gt; =C2=A0 =C2=A0 =C2=A0 exynos_dp_clear_hotplug_interrupts(dp);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 reg =3D readl(dp-&gt;reg_base + EXYNOS_DP_SYS_CTL=
_3);<br>
&gt; @@ -348,6 +355,14 @@ enum dp_irq_type exynos_dp_get_irq_type(struct ex=
ynos_dp_device *dp)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 u32 reg;<br>
&gt;<br>
&gt; + =C2=A0 =C2=A0 if (gpio_is_valid(dp-&gt;hpd_gpio)) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D gpio_get_value(dp-=
&gt;hpd_gpio);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (reg)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return DP_IRQ_TYPE_HP_CABLE_IN;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return DP_IRQ_TYPE_HP_CABLE_OUT;<br>
&gt; + =C2=A0 =C2=A0 }<br>
&gt; +<br>
<br>
</div></div>Please keep the style. It enhances the readability.<br>
<br>
if (gpio_is_valid(dp-&gt;hpd_gpio)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
}<br>
<br></blockquote><div>Ok. <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Then, it can be as bellows.<br>
<div class=3D""><br>
+ =C2=A0 =C2=A0 =C2=A0 if (gpio_is_valid(dp-&gt;hpd_gpio)) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D gpio_get_value(d=
p-&gt;hpd_gpio);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (reg)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return DP_IRQ_TYPE_HP_CABLE_IN;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return DP_IRQ_TYPE_HP_CABLE_OUT;<br>
</div>+ =C2=A0 =C2=A0 =C2=A0 } else {<br>
<div class=3D"">+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Parse=
 hotplug interrupt status register */<br>
</div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D readl(dp-&=
gt;reg_base + EXYNOS_DP_COMMON_INT_STA_4);<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (reg &amp; PLUG)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return DP_IRQ_TYPE_HP_CABLE_IN;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (reg &amp; HPD_LOST)<=
br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return DP_IRQ_TYPE_HP_CABLE_OUT;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (reg &amp; HOTPLUG_CH=
G)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return DP_IRQ_TYPE_HP_CHANGE;<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
<br></blockquote><div>Will change this. <br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DP_IRQ_TYPE_UNKNOWN;<br>
}<br>
<br>
Best regards,<br>
Jingoo Han<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; =C2=A0 =C2=A0 =C2=A0 /* Parse hotplug interrupt status register */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 reg =3D readl(dp-&gt;reg_base + EXYNOS_DP_COMMON_=
INT_STA_4);<br>
&gt;<br>
&gt; @@ -402,9 +417,14 @@ int exynos_dp_get_plug_in_status(struct exynos_dp=
_device *dp)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 u32 reg;<br>
&gt;<br>
&gt; - =C2=A0 =C2=A0 reg =3D readl(dp-&gt;reg_base + EXYNOS_DP_SYS_CTL_3);<=
br>
&gt; - =C2=A0 =C2=A0 if (reg &amp; HPD_STATUS)<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; + =C2=A0 =C2=A0 if (gpio_is_valid(dp-&gt;hpd_gpio)) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (gpio_get_value(dp-&gt;=
hpd_gpio))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return 0;<br>
&gt; + =C2=A0 =C2=A0 } else {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D readl(dp-&gt;reg_b=
ase + EXYNOS_DP_SYS_CTL_3);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (reg &amp; HPD_STATUS)<=
br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return 0;<br>
&gt; + =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; =C2=A0}<br>
&gt; --<br>
&gt; 1.8.1.2<br>
<br>
</div></div></blockquote></div><br></div><div class=3D"gmail_extra">Thanks =
and Regrads,<br></div><div class=3D"gmail_extra">Ajay Kumar<br></div></div>=
</div>

--001a113376fe1e1fac04f75638c5--

--===============1746825157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1746825157==--
