From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RFC 2/4] drm: exynos: add MDNIE post processor
Date: Fri, 21 Mar 2014 20:00:45 +0530
Message-ID: <CAEC9eQMHAqEG33=L9Cyey0KZTXAs0OX2LuDdgdXkmutZDUQ46A@mail.gmail.com>
References: <1395238975-24600-1-git-send-email-ajaykumar.rs@samsung.com>
 <1395238975-24600-3-git-send-email-ajaykumar.rs@samsung.com>
 <CAK9yfHzD50i1pVjbxFa2Ya1t_fkGKhq6dm8G9At79xOX2P695A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0168419773=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAK9yfHzD50i1pVjbxFa2Ya1t_fkGKhq6dm8G9At79xOX2P695A@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Shirish S <s.shirish@samsung.com>, seanpaul@google.com, Seung-Woo Kim <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, marcheu@chromium.org, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0168419773==
Content-Type: multipart/alternative; boundary=bcaec543079a39db1604f51ebb09

--bcaec543079a39db1604f51ebb09
Content-Type: text/plain; charset=ISO-8859-1

Hi Sachin,


On Wed, Mar 19, 2014 at 10:51 PM, Sachin Kamat <sachin.kamat@linaro.org>wrote:

> Hi Ajay,
>
> On 19 March 2014 19:52, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> > Add post processor ops for MDNIE and their support functions.
> > Expose an interface for the FIMD to register MDNIE PP.
> >
> > Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> > Signed-off-by: Shirish S <s.shirish@samsung.com>
> > Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> > ---
> >  drivers/gpu/drm/exynos/Makefile            |   2 +-
> >  drivers/gpu/drm/exynos/exynos_mdnie.c      | 707
> +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/exynos/exynos_mdnie_regs.h | 154 +++++++
> >  3 files changed, 862 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/exynos/exynos_mdnie.c
> >  create mode 100644 drivers/gpu/drm/exynos/exynos_mdnie_regs.h
> >
> > diff --git a/drivers/gpu/drm/exynos/Makefile
> b/drivers/gpu/drm/exynos/Makefile
> > index 02dde22..653eab5 100644
> > --- a/drivers/gpu/drm/exynos/Makefile
> > +++ b/drivers/gpu/drm/exynos/Makefile
> > @@ -10,7 +10,7 @@ exynosdrm-y := exynos_drm_drv.o exynos_drm_encoder.o \
> >
> >  exynosdrm-$(CONFIG_DRM_EXYNOS_IOMMU) += exynos_drm_iommu.o
> >  exynosdrm-$(CONFIG_DRM_EXYNOS_DMABUF) += exynos_drm_dmabuf.o
> > -exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)    += exynos_drm_fimd.o
> > +exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)    += exynos_drm_fimd.o
> exynos_mdnie.o
> >  exynosdrm-$(CONFIG_DRM_EXYNOS_DSI)     += exynos_drm_dsi.o
> >  exynosdrm-$(CONFIG_DRM_EXYNOS_DP)      += exynos_dp_core.o
> exynos_dp_reg.o
> >  exynosdrm-$(CONFIG_DRM_EXYNOS_HDMI)    += exynos_hdmi.o exynos_mixer.o
> > diff --git a/drivers/gpu/drm/exynos/exynos_mdnie.c
> b/drivers/gpu/drm/exynos/exynos_mdnie.c
> > new file mode 100644
> > index 0000000..a043853
> > --- /dev/null
> > +++ b/drivers/gpu/drm/exynos/exynos_mdnie.c
> > @@ -0,0 +1,707 @@
> > +/* drivers/gpu/drm/exynos/exynos_mdnie.c
> > + *
> > + * Samsung mDNIe driver
> > + *
> > + * Copyright (C) 2014 Samsung Electronics Co., Ltd.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> it
> > + * under the terms of the GNU General Public License as published by the
> > + * Free Software Foundation; either version 2 of the License, or (at
> your
> > + * option) any later version.
> > +*/
> > +
> > +#include <linux/clk.h>
> > +#include <linux/errno.h>
> > +#include <linux/of_device.h>
> > +
> > +#include <video/samsung_fimd.h>
> > +
> > +#include <drm/drmP.h>
> > +
> > +#include "exynos_drm_drv.h"
> > +#include "exynos_fimd_pp.h"
> > +#include "exynos_mdnie_regs.h"
> > +
> > +#define GAMMA_RAMP_LENGTH      17
> > +#define COLOR_COMPONENTS       3
> > +
> > +#define MDNIE_ON       1
> > +#define MDNIE_OFF      0
> > +
> > +#define PARAM_IN_RANGE(r, p, l, u)                                     \
> > +       do {                                                    \
> > +               r = ((p >= l) && (p <= u)) ? 0 : 1;             \
> > +               if (r) \
> > +                       DRM_ERROR("Wrong param: %s:%llu\n", #p, (u64)p);
> \
> > +       } while (0)
> > +
>
> [snip]
>
> > +static int mdnie_set_color_saturation_params(
> > +               struct mdnie_context *mdnie,
> > +               const struct drm_mode_color_saturation *params)
> > +{
> > +       int ret;
> > +
> > +       PARAM_IN_RANGE(ret, params->hue_gain_red, HG_MIN, HG_MAX);
> > +       PARAM_IN_RANGE(ret, params->hue_gain_green, HG_MIN, HG_MAX);
> > +       PARAM_IN_RANGE(ret, params->hue_gain_blue, HG_MIN, HG_MAX);
> > +       PARAM_IN_RANGE(ret, params->hue_gain_cyan, HG_MIN, HG_MAX);
> > +       PARAM_IN_RANGE(ret, params->hue_gain_magenta, HG_MIN, HG_MAX);
> > +       PARAM_IN_RANGE(ret, params->hue_gain_yellow, HG_MIN, HG_MAX);
> > +       PARAM_IN_RANGE(ret, params->hue_gain_overall, HG_MIN, HG_MAX);
> > +
> > +       if (ret)
> > +               return -EINVAL;
>
> This would be applicable only for the last macro call as ret would get
> overwritten after
> each call.
>
> Nice catch. I will fix it.

>
> > +       memcpy(&mdnie->params.cs_params, params, sizeof(*params));
> > +
> > +       return 0;
> > +}
> > +
> > +static int mdnie_set_color_reproduction_params(
> > +               struct mdnie_context *mdnie,
> > +               const struct drm_mode_color_reproduction *params)
> > +{
> > +       int ret;
> > +
> > +       PARAM_IN_RANGE(ret, params->red_rgb[0], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->red_rgb[1], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->red_rgb[2], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->green_rgb[0], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->green_rgb[1], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->green_rgb[2], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->blue_rgb[0], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->blue_rgb[1], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->blue_rgb[2], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->cyan_rgb[0], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->cyan_rgb[1], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->cyan_rgb[2], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->magenta_rgb[0], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->magenta_rgb[1], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->magenta_rgb[2], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->yellow_rgb[0], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->yellow_rgb[1], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->yellow_rgb[2], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->white_rgb[0], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->white_rgb[1], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->white_rgb[2], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->black_rgb[0], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->black_rgb[1], CC_MIN, CC_MAX);
> > +       PARAM_IN_RANGE(ret, params->black_rgb[2], CC_MIN, CC_MAX);
> > +
> > +       if (ret)
> > +               return -EINVAL;
> >
> ditto
>
> Ok.

> > +       memcpy(&mdnie->params.cr_params, params, sizeof(*params));
> > +       return 0;
> > +}
> > +
> > +static int mdnie_set_edge_enhancement_params(
> > +               struct mdnie_context *mdnie,
> > +               const struct drm_mode_edge_enhancement *params)
> > +{
> > +       int ret;
> > +
> > +       PARAM_IN_RANGE(ret, params->edge_th, TH_MIN, TH_MAX);
> > +       PARAM_IN_RANGE(ret, params->background_th, TH_MIN, TH_MAX);
> > +       PARAM_IN_RANGE(ret, params->pg_edge, GAIN_MIN, GAIN_MAX);
> > +       PARAM_IN_RANGE(ret, params->pg_flat, GAIN_MIN, GAIN_MAX);
> > +       PARAM_IN_RANGE(ret, params->pg_background, GAIN_MIN, GAIN_MAX);
> > +       PARAM_IN_RANGE(ret, params->ng_edge, GAIN_MIN, GAIN_MAX);
> > +       PARAM_IN_RANGE(ret, params->ng_flat, GAIN_MIN, GAIN_MAX);
> > +       PARAM_IN_RANGE(ret, params->ng_background, GAIN_MIN, GAIN_MAX);
>
> ditto
>
Ok.

>
> > +       if (ret)
> > +               return -EINVAL;
> > +
> > +       memcpy(&mdnie->params.de_params, params, sizeof(*params));
> > +       return 0;
> > +}
> > +
> > +static int mdnie_set_window_params(
> > +               struct mdnie_context *mdnie,
> > +               const struct drm_exynos_mdnie_window *params)
> > +{
> > +       int ret;
> > +
> > +       PARAM_IN_RANGE(ret, params->win_x, X_MIN, X_MAX);
> > +       PARAM_IN_RANGE(ret, params->win_y, Y_MIN, Y_MAX);
> > +       PARAM_IN_RANGE(ret, params->win_w, params->win_x, X_MAX);
> > +       PARAM_IN_RANGE(ret, params->win_h, params->win_y, Y_MAX);
>
> ditto and all other places of similar usage.
>
> Ok.

>
>
>
>
>
>
> [snip]
>
> > +int exynos_mdnie_init(struct device *dev, struct exynos_fimd_pp **pp)
> > +{
> > +       struct device_node *np = dev->of_node;
> > +       struct device_node *mdnie_np;
> > +       struct mdnie_context *mdnie = NULL;
> > +       u32 disp1blk_phyaddr;
> > +       int ret = 0;
> > +       u32 buf[2];
> > +
> > +       mdnie_np = of_parse_phandle(np, "samsung,mdnie", 0);
> > +       if (!mdnie_np) {
> > +               DRM_INFO("No mdnie node present, "
> > +                               "MDNIE feature will be disabled\n");
> > +               ret = -EINVAL;
> > +               goto err0;
>
> return directly from here.
>
> Ok.

> > +       }
> > +
> > +       if (of_property_read_u32_array(mdnie_np, "reg", buf, 2)) {
> > +               DRM_ERROR("failed to get base address for MDNIE\n");
> > +               ret = -ENOMEM;
> > +               goto err0;
>
> ditto
>
Ok.

>
>
> +       }
> > +
> > +       mdnie = kzalloc(sizeof(struct mdnie_context), GFP_KERNEL);
>
> nit: use sizeof(*mdnie)
>
> Ok.

> > +       if (!mdnie) {
> > +               DRM_ERROR("failed to allocate mdnie\n");
>
> This message is not needed as kzalloc prints OOM message upon failure.
>
Ok.

>
> > +               ret = -ENOMEM;
> > +               goto err0;
> > +       }
>
> return directly.

Ok.

>
> > +
> > +       mdnie->exynos_mdnie_base = ioremap(buf[0], buf[1]);
> > +       if (!mdnie->exynos_mdnie_base) {
> > +               DRM_ERROR("failed to ioremap mdnie device\n");
> > +               ret = -ENOMEM;
> > +               goto err1;
> > +       }
> > +
> > +       if (dt_parse_disp1blk_cfg(dev, &disp1blk_phyaddr)) {
> > +               DRM_ERROR("failed to get disp1blk property.\n");
> > +               ret = -ENODEV;
> > +               goto err1;
> > +       }
> > +
> > +       if (exynos_iomap_disp1blk(mdnie, disp1blk_phyaddr)) {
> > +               DRM_ERROR("failed to iopmap disp1blk sysreg.\n");
>
> s/iopmap/iomap
>
> Ok.

>
> --
> With warm regards,
> Sachin
>

I will address your comments in next patchset.

Thanks,
Ajay

--bcaec543079a39db1604f51ebb09
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Sachin,<br><div class=3D"gmail_extra"><br><br><div clas=
s=3D"gmail_quote">On Wed, Mar 19, 2014 at 10:51 PM, Sachin Kamat <span dir=
=3D"ltr">&lt;<a href=3D"mailto:sachin.kamat@linaro.org" target=3D"_blank">s=
achin.kamat@linaro.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Ajay,<br>
<div><div class=3D"h5"><br>
On 19 March 2014 19:52, Ajay Kumar &lt;<a href=3D"mailto:ajaykumar.rs@samsu=
ng.com">ajaykumar.rs@samsung.com</a>&gt; wrote:<br>
&gt; Add post processor ops for MDNIE and their support functions.<br>
&gt; Expose an interface for the FIMD to register MDNIE PP.<br>
&gt;<br>
&gt; Signed-off-by: Ajay Kumar &lt;<a href=3D"mailto:ajaykumar.rs@samsung.c=
om">ajaykumar.rs@samsung.com</a>&gt;<br>
&gt; Signed-off-by: Shirish S &lt;<a href=3D"mailto:s.shirish@samsung.com">=
s.shirish@samsung.com</a>&gt;<br>
&gt; Signed-off-by: Rahul Sharma &lt;<a href=3D"mailto:rahul.sharma@samsung=
.com">rahul.sharma@samsung.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0drivers/gpu/drm/exynos/Makefile =A0 =A0 =A0 =A0 =A0 =A0| =A0 2 +-<b=
r>
&gt; =A0drivers/gpu/drm/exynos/exynos_mdnie.c =A0 =A0 =A0| 707 ++++++++++++=
+++++++++++++++++<br>
&gt; =A0drivers/gpu/drm/exynos/exynos_mdnie_regs.h | 154 +++++++<br>
&gt; =A03 files changed, 862 insertions(+), 1 deletion(-)<br>
&gt; =A0create mode 100644 drivers/gpu/drm/exynos/exynos_mdnie.c<br>
&gt; =A0create mode 100644 drivers/gpu/drm/exynos/exynos_mdnie_regs.h<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/=
Makefile<br>
&gt; index 02dde22..653eab5 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/Makefile<br>
&gt; +++ b/drivers/gpu/drm/exynos/Makefile<br>
&gt; @@ -10,7 +10,7 @@ exynosdrm-y :=3D exynos_drm_drv.o exynos_drm_encoder=
.o \<br>
&gt;<br>
&gt; =A0exynosdrm-$(CONFIG_DRM_EXYNOS_IOMMU) +=3D exynos_drm_iommu.o<br>
&gt; =A0exynosdrm-$(CONFIG_DRM_EXYNOS_DMABUF) +=3D exynos_drm_dmabuf.o<br>
&gt; -exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD) =A0 =A0+=3D exynos_drm_fimd.o<br>
&gt; +exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD) =A0 =A0+=3D exynos_drm_fimd.o exy=
nos_mdnie.o<br>
&gt; =A0exynosdrm-$(CONFIG_DRM_EXYNOS_DSI) =A0 =A0 +=3D exynos_drm_dsi.o<br=
>
&gt; =A0exynosdrm-$(CONFIG_DRM_EXYNOS_DP) =A0 =A0 =A0+=3D exynos_dp_core.o =
exynos_dp_reg.o<br>
&gt; =A0exynosdrm-$(CONFIG_DRM_EXYNOS_HDMI) =A0 =A0+=3D exynos_hdmi.o exyno=
s_mixer.o<br>
&gt; diff --git a/drivers/gpu/drm/exynos/exynos_mdnie.c b/drivers/gpu/drm/e=
xynos/exynos_mdnie.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..a043853<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos_mdnie.c<br>
&gt; @@ -0,0 +1,707 @@<br>
&gt; +/* drivers/gpu/drm/exynos/exynos_mdnie.c<br>
&gt; + *<br>
&gt; + * Samsung mDNIe driver<br>
&gt; + *<br>
&gt; + * Copyright (C) 2014 Samsung Electronics Co., Ltd.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy it<br>
&gt; + * under the terms of the GNU General Public License as published by =
the<br>
&gt; + * Free Software Foundation; either version 2 of the License, or (at =
your<br>
&gt; + * option) any later version.<br>
&gt; +*/<br>
&gt; +<br>
&gt; +#include &lt;linux/clk.h&gt;<br>
&gt; +#include &lt;linux/errno.h&gt;<br>
&gt; +#include &lt;linux/of_device.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;video/samsung_fimd.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/drmP.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;exynos_drm_drv.h&quot;<br>
&gt; +#include &quot;exynos_fimd_pp.h&quot;<br>
&gt; +#include &quot;exynos_mdnie_regs.h&quot;<br>
&gt; +<br>
&gt; +#define GAMMA_RAMP_LENGTH =A0 =A0 =A017<br>
&gt; +#define COLOR_COMPONENTS =A0 =A0 =A0 3<br>
&gt; +<br>
&gt; +#define MDNIE_ON =A0 =A0 =A0 1<br>
&gt; +#define MDNIE_OFF =A0 =A0 =A00<br>
&gt; +<br>
&gt; +#define PARAM_IN_RANGE(r, p, l, u) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \<br>
&gt; + =A0 =A0 =A0 do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 r =3D ((p &gt;=3D l) &amp;&amp; (p &lt;=
=3D u)) ? 0 : 1; =A0 =A0 =A0 =A0 =A0 =A0 \<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (r) \<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;Wrong pa=
ram: %s:%llu\n&quot;, #p, (u64)p); \<br>
&gt; + =A0 =A0 =A0 } while (0)<br>
&gt; +<br>
<br>
</div></div>[snip]<br>
<div class=3D""><br>
&gt; +static int mdnie_set_color_saturation_params(<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct mdnie_context *mdnie,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct drm_mode_color_saturation *=
params)<br>
&gt; +{<br>
&gt; + =A0 =A0 =A0 int ret;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;hue_gain_red, HG_MIN, HG_=
MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;hue_gain_green, HG_MIN, H=
G_MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;hue_gain_blue, HG_MIN, HG=
_MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;hue_gain_cyan, HG_MIN, HG=
_MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;hue_gain_magenta, HG_MIN,=
 HG_MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;hue_gain_yellow, HG_MIN, =
HG_MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;hue_gain_overall, HG_MIN,=
 HG_MAX);<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 if (ret)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;<br>
<br>
</div>This would be applicable only for the last macro call as ret would ge=
t<br>
overwritten after<br>
each call.<br>
<div><div class=3D"h5"><br></div></div></blockquote><div>Nice catch. I will=
 fix it.=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5">
<br>
&gt; + =A0 =A0 =A0 memcpy(&amp;mdnie-&gt;params.cs_params, params, sizeof(*=
params));<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int mdnie_set_color_reproduction_params(<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct mdnie_context *mdnie,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct drm_mode_color_reproduction=
 *params)<br>
&gt; +{<br>
&gt; + =A0 =A0 =A0 int ret;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;red_rgb[0], CC_MIN, CC_MA=
X);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;red_rgb[1], CC_MIN, CC_MA=
X);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;red_rgb[2], CC_MIN, CC_MA=
X);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;green_rgb[0], CC_MIN, CC_=
MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;green_rgb[1], CC_MIN, CC_=
MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;green_rgb[2], CC_MIN, CC_=
MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;blue_rgb[0], CC_MIN, CC_M=
AX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;blue_rgb[1], CC_MIN, CC_M=
AX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;blue_rgb[2], CC_MIN, CC_M=
AX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;cyan_rgb[0], CC_MIN, CC_M=
AX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;cyan_rgb[1], CC_MIN, CC_M=
AX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;cyan_rgb[2], CC_MIN, CC_M=
AX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;magenta_rgb[0], CC_MIN, C=
C_MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;magenta_rgb[1], CC_MIN, C=
C_MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;magenta_rgb[2], CC_MIN, C=
C_MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;yellow_rgb[0], CC_MIN, CC=
_MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;yellow_rgb[1], CC_MIN, CC=
_MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;yellow_rgb[2], CC_MIN, CC=
_MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;white_rgb[0], CC_MIN, CC_=
MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;white_rgb[1], CC_MIN, CC_=
MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;white_rgb[2], CC_MIN, CC_=
MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;black_rgb[0], CC_MIN, CC_=
MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;black_rgb[1], CC_MIN, CC_=
MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;black_rgb[2], CC_MIN, CC_=
MAX);<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 if (ret)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;<br>
&gt;<br>
</div></div>ditto<br>
<div class=3D""><br></div></blockquote><div>Ok.=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div class=3D"">
&gt; + =A0 =A0 =A0 memcpy(&amp;mdnie-&gt;params.cr_params, params, sizeof(*=
params));<br>
&gt; + =A0 =A0 =A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int mdnie_set_edge_enhancement_params(<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct mdnie_context *mdnie,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct drm_mode_edge_enhancement *=
params)<br>
&gt; +{<br>
&gt; + =A0 =A0 =A0 int ret;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;edge_th, TH_MIN, TH_MAX);=
<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;background_th, TH_MIN, TH=
_MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;pg_edge, GAIN_MIN, GAIN_M=
AX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;pg_flat, GAIN_MIN, GAIN_M=
AX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;pg_background, GAIN_MIN, =
GAIN_MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;ng_edge, GAIN_MIN, GAIN_M=
AX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;ng_flat, GAIN_MIN, GAIN_M=
AX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;ng_background, GAIN_MIN, =
GAIN_MAX);<br>
<br>
</div>ditto<br></blockquote><div>Ok.=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<div class=3D""><br>
&gt; + =A0 =A0 =A0 if (ret)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 memcpy(&amp;mdnie-&gt;params.de_params, params, sizeof(*=
params));<br>
&gt; + =A0 =A0 =A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int mdnie_set_window_params(<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct mdnie_context *mdnie,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct drm_exynos_mdnie_window *pa=
rams)<br>
&gt; +{<br>
&gt; + =A0 =A0 =A0 int ret;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;win_x, X_MIN, X_MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;win_y, Y_MIN, Y_MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;win_w, params-&gt;win_x, =
X_MAX);<br>
&gt; + =A0 =A0 =A0 PARAM_IN_RANGE(ret, params-&gt;win_h, params-&gt;win_y, =
Y_MAX);<br>
<br>
</div>ditto and all other places of similar usage.<br>
<br></blockquote><div>Ok.=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
<br>
<br>
<br>
<br>
[snip]<br>
<div class=3D""><br>
&gt; +int exynos_mdnie_init(struct device *dev, struct exynos_fimd_pp **pp)=
<br>
&gt; +{<br>
&gt; + =A0 =A0 =A0 struct device_node *np =3D dev-&gt;of_node;<br>
&gt; + =A0 =A0 =A0 struct device_node *mdnie_np;<br>
&gt; + =A0 =A0 =A0 struct mdnie_context *mdnie =3D NULL;<br>
&gt; + =A0 =A0 =A0 u32 disp1blk_phyaddr;<br>
&gt; + =A0 =A0 =A0 int ret =3D 0;<br>
&gt; + =A0 =A0 =A0 u32 buf[2];<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 mdnie_np =3D of_parse_phandle(np, &quot;samsung,mdnie&qu=
ot;, 0);<br>
&gt; + =A0 =A0 =A0 if (!mdnie_np) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_INFO(&quot;No mdnie node present, &q=
uot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;MD=
NIE feature will be disabled\n&quot;);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err0;<br>
<br>
</div>return directly from here.<br>
<div class=3D""><br></div></blockquote><div>Ok.=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div class=3D"">
&gt; + =A0 =A0 =A0 }<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 if (of_property_read_u32_array(mdnie_np, &quot;reg&quot;=
, buf, 2)) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to get base addre=
ss for MDNIE\n&quot;);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err0;<br>
<br>
</div>ditto<br></blockquote><div>Ok.=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<div class=3D"">=A0<br></div></blockquote><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv class=3D"">
&gt; + =A0 =A0 =A0 }<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 mdnie =3D kzalloc(sizeof(struct mdnie_context), GFP_KERN=
EL);<br>
<br>
</div>nit: use sizeof(*mdnie)<br>
<div class=3D""><br></div></blockquote><div>Ok.=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div class=3D"">
&gt; + =A0 =A0 =A0 if (!mdnie) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to allocate mdnie=
\n&quot;);<br>
<br>
</div>This message is not needed as kzalloc prints OOM message upon failure=
.<br></blockquote><div>Ok.=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D""><br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err0;<br>
&gt; + =A0 =A0 =A0 }<br>
<br>
</div>return directly.=A0</blockquote><div>Ok.=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<div class=3D""><br>
&gt; +<br>
&gt; + =A0 =A0 =A0 mdnie-&gt;exynos_mdnie_base =3D ioremap(buf[0], buf[1]);=
<br>
&gt; + =A0 =A0 =A0 if (!mdnie-&gt;exynos_mdnie_base) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to ioremap mdnie =
device\n&quot;);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err1;<br>
&gt; + =A0 =A0 =A0 }<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 if (dt_parse_disp1blk_cfg(dev, &amp;disp1blk_phyaddr)) {=
<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to get disp1blk p=
roperty.\n&quot;);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENODEV;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err1;<br>
&gt; + =A0 =A0 =A0 }<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 if (exynos_iomap_disp1blk(mdnie, disp1blk_phyaddr)) {<br=
>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to iopmap disp1bl=
k sysreg.\n&quot;);<br>
<br>
</div>s/iopmap/iomap<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div>Ok.=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"HOEnZb"><=
font color=3D"#888888">
<br>
--<br>
With warm regards,<br>
Sachin<br></font></span></blockquote><div>=A0</div></div>I will address you=
r comments in next patchset.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Thanks,</div><div class=3D"gmail_extra">Ajay</div></=
div>

--bcaec543079a39db1604f51ebb09--

--===============0168419773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0168419773==--
