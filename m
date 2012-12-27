From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] video: drm: exynos: mie bypass enable for fimd
Date: Thu, 27 Dec 2012 15:17:12 +0900
Message-ID: <CAAQKjZOPQtCPE6BHnyJ7mqfi04VWbg3VWeVf9fcjxZC3jjUYdQ@mail.gmail.com>
References: <1356503854-28100-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1973959736=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1356503854-28100-1-git-send-email-l.krishna@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============1973959736==
Content-Type: multipart/alternative; boundary=e89a8fb1f7ee6d512e04d1cf7fb2

--e89a8fb1f7ee6d512e04d1cf7fb2
Content-Type: text/plain; charset=ISO-8859-1

Hi,

DISP1BLK_CFG register is related to GScaler, HDCP and MIXER as well. So
it's not good that this register is controlled in fimd module. And I think
the function to control the register should be placed in SoC common file .
In other words, other drivers should be able to control the register
through common thing also.

Thanks,
Inki Dae

2012/12/26 Leela Krishna Amudala <l.krishna@samsung.com>

> Bypasses the mie for fimd by parsing the register and bit offset values
> from "mie-bypass" node, if "mie-bypass" node is present in the dts file.
>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 55
> ++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index bf0d9ba..f8ad259 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -118,6 +118,12 @@ static const struct of_device_id
> fimd_driver_dt_match[] = {
>  MODULE_DEVICE_TABLE(of, fimd_driver_dt_match);
>  #endif
>
> +struct mie_bypass {
> +       u32                             enable_bypass;
> +       void __iomem                    *bypass_reg;
> +       u32                             bypass_bit_offset;
> +};
> +
>  static inline struct fimd_driver_data *drm_fimd_get_driver_data(
>         struct platform_device *pdev)
>  {
> @@ -133,6 +139,41 @@ static inline struct fimd_driver_data
> *drm_fimd_get_driver_data(
>                 platform_get_device_id(pdev)->driver_data;
>  }
>
> +static struct mie_bypass *parse_mie_bypass_for_fimd(struct device *dev,
> +                                       struct device_node
> *mie_bypass_node)
> +{
> +       struct mie_bypass *bypass_data;
> +       u32 phy_address;
> +
> +       bypass_data = devm_kzalloc(dev, sizeof(*bypass_data), GFP_KERNEL);
> +       if (!bypass_data) {
> +               dev_err(dev, "memory allocation for bypass data failed\n");
> +               return ERR_PTR(-ENOMEM);
> +       }
> +       of_property_read_u32(mie_bypass_node, "samsung,mie-bypass-enable",
> +                       &bypass_data->enable_bypass);
> +       of_property_read_u32(mie_bypass_node, "samsung,disp1blk-cfg-reg",
> +                       &phy_address);
> +       of_property_read_u32(mie_bypass_node, "samsung,bypass-bit-offset",
> +                       &bypass_data->bypass_bit_offset);
> +
> +       bypass_data->bypass_reg = ioremap(phy_address, SZ_4);
>
+       if (!bypass_data->bypass_reg) {
> +               dev_err(dev, "failed to ioremap phy_address\n");
> +               return ERR_PTR(-ENOMEM);
> +       }
> +       return bypass_data;
> +}
>
+
> +static void mie_bypass_for_fimd(struct mie_bypass *bypass_data)
> +{
> +       u32 reg;
> +
> +       reg = __raw_readl(bypass_data->bypass_reg);
> +       reg |= (1 << bypass_data->bypass_bit_offset);
> +       __raw_writel(reg, bypass_data->bypass_reg);
> +}
> +
>  static bool fimd_display_is_connected(struct device *dev)
>  {
>         DRM_DEBUG_KMS("%s\n", __FILE__);
> @@ -906,12 +947,26 @@ static int __devinit fimd_probe(struct
> platform_device *pdev)
>         struct exynos_drm_fimd_pdata *pdata;
>         struct exynos_drm_panel_info *panel;
>         struct resource *res;
> +       struct device_node *mie_bypass_node;
> +       struct mie_bypass *bypass_data = NULL;
>         int win;
>         int ret = -EINVAL;
>
>         DRM_DEBUG_KMS("%s\n", __FILE__);
>
>         pdata = pdev->dev.platform_data;
> +       if (pdev->dev.of_node) {
> +               mie_bypass_node = of_find_node_by_name(pdev->dev.of_node,
> +                                                       "mie-bypass");
> +               if (mie_bypass_node) {
> +                       bypass_data = parse_mie_bypass_for_fimd(&pdev->dev,
> +                                                       mie_bypass_node);
>
+                       if (IS_ERR(bypass_data))
> +                               return PTR_ERR(bypass_data);
> +                       if (bypass_data->enable_bypass)
> +                               mie_bypass_for_fimd(bypass_data);
> +               }
> +       }
>         if (!pdata) {
>                 dev_err(dev, "no platform data specified\n");
>                 return -EINVAL;
> --
> 1.8.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--e89a8fb1f7ee6d512e04d1cf7fb2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<br><br>DISP1BLK_CFG register is related to GScaler, HDCP and MIXER as w=
ell. So it&#39;s not good that this register is controlled in fimd module. =
And I think the function to control the register should be placed in SoC co=
mmon file . In other words, other drivers should be able to control the reg=
ister through common thing also.<br>
<br>Thanks,<br>Inki Dae<br><br><div class=3D"gmail_quote">2012/12/26 Leela =
Krishna Amudala <span dir=3D"ltr">&lt;<a href=3D"mailto:l.krishna@samsung.c=
om" target=3D"_blank">l.krishna@samsung.com</a>&gt;</span><br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
Bypasses the mie for fimd by parsing the register and bit offset values<br>
from &quot;mie-bypass&quot; node, if &quot;mie-bypass&quot; node is present=
 in the dts file.<br>
<br>
Signed-off-by: Leela Krishna Amudala &lt;<a href=3D"mailto:l.krishna@samsun=
g.com">l.krishna@samsung.com</a>&gt;<br>
---<br>
=A0drivers/gpu/drm/exynos/exynos_drm_fimd.c | 55 ++++++++++++++++++++++++++=
++++++<br>
=A01 file changed, 55 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exy=
nos/exynos_drm_fimd.c<br>
index bf0d9ba..f8ad259 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
@@ -118,6 +118,12 @@ static const struct of_device_id fimd_driver_dt_match[=
] =3D {<br>
=A0MODULE_DEVICE_TABLE(of, fimd_driver_dt_match);<br>
=A0#endif<br>
<br>
+struct mie_bypass {<br>
+ =A0 =A0 =A0 u32 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 e=
nable_bypass;<br>
+ =A0 =A0 =A0 void __iomem =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*bypass_r=
eg;<br>
+ =A0 =A0 =A0 u32 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 b=
ypass_bit_offset;<br>
+};<br>
+<br>
=A0static inline struct fimd_driver_data *drm_fimd_get_driver_data(<br>
=A0 =A0 =A0 =A0 struct platform_device *pdev)<br>
=A0{<br>
@@ -133,6 +139,41 @@ static inline struct fimd_driver_data *drm_fimd_get_dr=
iver_data(<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 platform_get_device_id(pdev)-&gt;driver_dat=
a;<br>
=A0}<br>
<br>
+static struct mie_bypass *parse_mie_bypass_for_fimd(struct device *dev,<br=
>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 struct device_node *mie_bypass_node)<br>
+{<br>
+ =A0 =A0 =A0 struct mie_bypass *bypass_data;<br>
+ =A0 =A0 =A0 u32 phy_address;<br>
+<br>
+ =A0 =A0 =A0 bypass_data =3D devm_kzalloc(dev, sizeof(*bypass_data), GFP_K=
ERNEL);<br>
+ =A0 =A0 =A0 if (!bypass_data) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, &quot;memory allocation for bypa=
ss data failed\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ERR_PTR(-ENOMEM);<br>
+ =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 of_property_read_u32(mie_bypass_node, &quot;samsung,mie-bypas=
s-enable&quot;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &amp;bypass_data-&gt;enable_b=
ypass);<br>
+ =A0 =A0 =A0 of_property_read_u32(mie_bypass_node, &quot;samsung,disp1blk-=
cfg-reg&quot;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &amp;phy_address);<br>
+ =A0 =A0 =A0 of_property_read_u32(mie_bypass_node, &quot;samsung,bypass-bi=
t-offset&quot;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &amp;bypass_data-&gt;bypass_b=
it_offset);<br>
+<br>
+ =A0 =A0 =A0 bypass_data-&gt;bypass_reg =3D ioremap(phy_address, SZ_4);<br=
></blockquote><div></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+ =A0 =A0 =A0 if (!bypass_data-&gt;bypass_reg) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, &quot;failed to ioremap phy_addr=
ess\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ERR_PTR(-ENOMEM);<br>
+ =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 return bypass_data;<br>
+} <br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+<br>
+static void mie_bypass_for_fimd(struct mie_bypass *bypass_data)<br>
+{<br>
+ =A0 =A0 =A0 u32 reg;<br>
+<br>
+ =A0 =A0 =A0 reg =3D __raw_readl(bypass_data-&gt;bypass_reg);<br>
+ =A0 =A0 =A0 reg |=3D (1 &lt;&lt; bypass_data-&gt;bypass_bit_offset);<br>
+ =A0 =A0 =A0 __raw_writel(reg, bypass_data-&gt;bypass_reg);<br>
+}<br>
+<br>
=A0static bool fimd_display_is_connected(struct device *dev)<br>
=A0{<br>
=A0 =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;%s\n&quot;, __FILE__);<br>
@@ -906,12 +947,26 @@ static int __devinit fimd_probe(struct platform_devic=
e *pdev)<br>
=A0 =A0 =A0 =A0 struct exynos_drm_fimd_pdata *pdata;<br>
=A0 =A0 =A0 =A0 struct exynos_drm_panel_info *panel;<br>
=A0 =A0 =A0 =A0 struct resource *res;<br>
+ =A0 =A0 =A0 struct device_node *mie_bypass_node;<br>
+ =A0 =A0 =A0 struct mie_bypass *bypass_data =3D NULL;<br>
=A0 =A0 =A0 =A0 int win;<br>
=A0 =A0 =A0 =A0 int ret =3D -EINVAL;<br>
<br>
=A0 =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;%s\n&quot;, __FILE__);<br>
<br>
=A0 =A0 =A0 =A0 pdata =3D pdev-&gt;dev.platform_data;<br>
+ =A0 =A0 =A0 if (pdev-&gt;dev.of_node) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 mie_bypass_node =3D of_find_node_by_name(pdev=
-&gt;dev.of_node,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;mie-bypass&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (mie_bypass_node) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bypass_data =3D parse_mie_byp=
ass_for_fimd(&amp;pdev-&gt;dev,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mie_bypass_node);<br></blockquote><div>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (IS_ERR(bypass_data))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return PTR_ER=
R(bypass_data);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (bypass_data-&gt;enable_by=
pass)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mie_bypass_fo=
r_fimd(bypass_data);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 }<br>
=A0 =A0 =A0 =A0 if (!pdata) {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, &quot;no platform data specifi=
ed\n&quot;);<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.0<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</font></span></blockquote></div><br>

--e89a8fb1f7ee6d512e04d1cf7fb2--

--===============1973959736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1973959736==--
