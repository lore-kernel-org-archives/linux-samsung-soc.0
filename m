From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/3] drm/exynos: Add device tree support for fimc ipp
 driver
Date: Sun, 21 Apr 2013 01:21:08 +0900
Message-ID: <CAAQKjZM_WmKHSrUgN9_PxoFt5BemTp113JEXzj1huu5B-V32=A@mail.gmail.com>
References: <1366133486-22973-1-git-send-email-s.nawrocki@samsung.com>
 <1366133486-22973-4-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4877827129283162131=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366133486-22973-4-git-send-email-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============4877827129283162131==
Content-Type: multipart/alternative; boundary=047d7b3a8436200f1304dacd3959

--047d7b3a8436200f1304dacd3959
Content-Type: text/plain; charset=ISO-8859-1

2013/4/17 Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

> This patch adds OF initialization support for the FIMC driver.
> The binding documentation can be found at Documentation/devicetree/
> bindings/media/samsung-fimc.txt.
>
> The syscon regmap interface is used to serialize access to the
> shared CAMBLK registers from within the V4L2 FIMC-IS and the DRM
> FIMC drivers. The DRM driver uses this interface for setting up
> the FIFO data link between FIMD and FIMC IP blocks, while the V4L2
> one for setting up a data link between the camera ISP and FIMC for
> camera capture. The CAMBLK registers are not accessed any more
> through a statically mapped IO. Synchronized access to these
> registers is required for simultaneous operation of the camera
> ISP and the DRM IPP on Exynos4x12.
>
> Exynos4 is going to be a dt-only platform since 3.10, thus the
> driver data and driver_ids static data structures are removed.
>
> Camera input signal polarities are not currently parsed from the
> device tree.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/gpu/drm/exynos/Kconfig           |    2 +-
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c |  101
> +++++++++++++++---------------
>  drivers/gpu/drm/exynos/regs-fimc.h       |    7 +--
>  3 files changed, 53 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/Kconfig
> b/drivers/gpu/drm/exynos/Kconfig
> index 406f32a..5c4be2a 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -56,7 +56,7 @@ config DRM_EXYNOS_IPP
>
>  config DRM_EXYNOS_FIMC
>         bool "Exynos DRM FIMC"
> -       depends on DRM_EXYNOS_IPP
> +       depends on DRM_EXYNOS_IPP && MFD_SYSCON && OF
>         help
>           Choose this option if you want to use Exynos FIMC for DRM.
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> index 9bea585..f25801e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -12,11 +12,12 @@
>   *
>   */
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/clk.h>
>  #include <linux/pm_runtime.h>
> -#include <plat/map-base.h>
>
>  #include <drm/drmP.h>
>  #include <drm/exynos_drm.h>
> @@ -140,15 +141,6 @@ struct fimc_capability {
>  };
>
>  /*
> - * A structure of fimc driver data.
> - *
> - * @parent_clk: name of parent clock.
> - */
> -struct fimc_driverdata {
> -       char    *parent_clk;
> -};
> -
> -/*
>   * A structure of fimc context.
>   *
>   * @ippdrv: prepare initialization using ippdrv.
> @@ -158,6 +150,7 @@ struct fimc_driverdata {
>   * @lock: locking of operations.
>   * @clocks: fimc clocks.
>   * @clk_frequency: LCLK clock frequency.
> + * @sysreg: handle to SYSREG block regmap.
>   * @sc: scaler infomations.
>   * @pol: porarity of writeback.
>   * @id: fimc id.
> @@ -172,8 +165,8 @@ struct fimc_context {
>         struct mutex    lock;
>         struct clk      *clocks[FIMC_CLKS_MAX];
>         u32             clk_frequency;
> +       struct regmap   *sysreg;
>         struct fimc_scaler      sc;
> -       struct fimc_driverdata  *ddata;
>         struct exynos_drm_ipp_pol       pol;
>         int     id;
>         int     irq;
> @@ -217,17 +210,13 @@ static void fimc_sw_reset(struct fimc_context *ctx)
>         fimc_write(0x0, EXYNOS_CIFCNTSEQ);
>  }
>
> -static void fimc_set_camblk_fimd0_wb(struct fimc_context *ctx)
> +static int fimc_set_camblk_fimd0_wb(struct fimc_context *ctx)
>  {
> -       u32 camblk_cfg;
> -
>         DRM_DEBUG_KMS("%s\n", __func__);
>
> -       camblk_cfg = readl(SYSREG_CAMERA_BLK);
> -       camblk_cfg &= ~(SYSREG_FIMD0WB_DEST_MASK);
> -       camblk_cfg |= ctx->id << (SYSREG_FIMD0WB_DEST_SHIFT);
> -
> -       writel(camblk_cfg, SYSREG_CAMERA_BLK);
> +       return regmap_update_bits(ctx->sysreg, SYSREG_CAMERA_BLK,
> +                                 SYSREG_FIMD0WB_DEST_MASK,
> +                                 ctx->id << SYSREG_FIMD0WB_DEST_SHIFT);
>  }
>
>  static void fimc_set_type_ctrl(struct fimc_context *ctx, enum fimc_wb wb)
> @@ -1628,7 +1617,9 @@ static int fimc_ippdrv_start(struct device *dev,
> enum drm_exynos_ipp_cmd cmd)
>                 fimc_handle_lastend(ctx, true);
>
>                 /* setup FIMD */
> -               fimc_set_camblk_fimd0_wb(ctx);
> +               ret = fimc_set_camblk_fimd0_wb(ctx);
> +               if (ret < 0)
> +                       return ret;
>
>                 set_wb.enable = 1;
>                 set_wb.refresh = property->refresh_rate;
> @@ -1784,26 +1775,50 @@ e_clk_free:
>         return ret;
>  }
>
> +static int fimc_parse_dt(struct fimc_context *ctx)
> +{
> +       struct device_node *node = ctx->dev->of_node;
> +
> +       if (!of_property_read_bool(node, "samsung,lcd-wb"))
> +               return -ENODEV;
>


Isn't the above property really needed? This makes the use of write-back
feature to be forced. I think some machines might not need this feature so
their dts files have no that property.
 So in this case, drm fimc driver probing will be failed. is that correct
action and your intention?


> +
> +       if (of_property_read_u32(node, "clock-frequency",
> +                                       &ctx->clk_frequency))
> +               ctx->clk_frequency = FIMC_DEFAULT_LCLK_FREQUENCY;
> +
> +       ctx->id = of_alias_get_id(node, "fimc");
> +       if (ctx->id < 0)
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
>  static int fimc_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
>         struct fimc_context *ctx;
>         struct resource *res;
>         struct exynos_drm_ippdrv *ippdrv;
> -       struct exynos_drm_fimc_pdata *pdata;
> -       struct fimc_driverdata *ddata;
>         int ret;
>
> -       pdata = pdev->dev.platform_data;
> -       if (!pdata) {
> -               dev_err(dev, "no platform data specified.\n");
> -               return -EINVAL;
> -       }
> +       if (!dev->of_node)
> +               return -ENODEV;
>
>         ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>         if (!ctx)
>                 return -ENOMEM;
>
> +       ctx->dev = dev;
> +
> +       ret = fimc_parse_dt(ctx);
> +       if (ret < 0)
> +               return ret;
> +
> +       ctx->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
> +                                               "samsung,sysreg");
> +       if (IS_ERR(ctx->sysreg))
> +               return PTR_ERR(ctx->sysreg);
> +
>         /* resource memory */
>         ctx->regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         ctx->regs = devm_ioremap_resource(dev, ctx->regs_res);
> @@ -1828,10 +1843,6 @@ static int fimc_probe(struct platform_device *pdev)
>         ret = fimc_setup_clocks(ctx);
>         if (ret < 0)
>                 goto err_free_irq;
> -       /* context initailization */
> -       ctx->id = pdev->id;
> -       ctx->pol = pdata->pol;
> -       ctx->ddata = ddata;
>
>         ippdrv = &ctx->ippdrv;
>         ippdrv->dev = dev;
> @@ -1941,36 +1952,22 @@ static int fimc_runtime_resume(struct device *dev)
>  }
>  #endif
>
> -static struct fimc_driverdata exynos4210_fimc_data = {
> -       .parent_clk = "mout_mpll",
> -};
> -
> -static struct fimc_driverdata exynos4410_fimc_data = {
> -       .parent_clk = "mout_mpll_user",
> -};
> -
> -static struct platform_device_id fimc_driver_ids[] = {
> -       {
> -               .name           = "exynos4210-fimc",
> -               .driver_data    = (unsigned long)&exynos4210_fimc_data,
> -       }, {
> -               .name           = "exynos4412-fimc",
> -               .driver_data    = (unsigned long)&exynos4410_fimc_data,
> -       },
> -       {},
> -};
> -MODULE_DEVICE_TABLE(platform, fimc_driver_ids);
> -
>  static const struct dev_pm_ops fimc_pm_ops = {
>         SET_SYSTEM_SLEEP_PM_OPS(fimc_suspend, fimc_resume)
>         SET_RUNTIME_PM_OPS(fimc_runtime_suspend, fimc_runtime_resume, NULL)
>  };
>
> +static const struct of_device_id fimc_of_match[] = {
> +       { .compatible = "samsung,exynos4210-fimc" },
> +       { .compatible = "samsung,exynos4212-fimc" },
> +       { },
> +};
> +
>  struct platform_driver fimc_driver = {
>         .probe          = fimc_probe,
>         .remove         = fimc_remove,
> -       .id_table       = fimc_driver_ids,
>         .driver         = {
> +               .of_match_table = fimc_of_match,
>                 .name   = "exynos-drm-fimc",
>                 .owner  = THIS_MODULE,
>                 .pm     = &fimc_pm_ops,
> diff --git a/drivers/gpu/drm/exynos/regs-fimc.h
> b/drivers/gpu/drm/exynos/regs-fimc.h
> index b4f9ca1..3049613 100644
> --- a/drivers/gpu/drm/exynos/regs-fimc.h
> +++ b/drivers/gpu/drm/exynos/regs-fimc.h
> @@ -661,9 +661,8 @@
>  #define EXYNOS_CLKSRC_SCLK                             (1 << 1)
>
>  /* SYSREG for FIMC writeback */
> -#define SYSREG_CAMERA_BLK                      (S3C_VA_SYS + 0x0218)
> -#define SYSREG_ISP_BLK                         (S3C_VA_SYS + 0x020c)
> -#define SYSREG_FIMD0WB_DEST_MASK       (0x3 << 23)
> -#define SYSREG_FIMD0WB_DEST_SHIFT      23
> +#define SYSREG_CAMERA_BLK                      (0x0218)
> +#define SYSREG_FIMD0WB_DEST_MASK               (0x3 << 23)
> +#define SYSREG_FIMD0WB_DEST_SHIFT              23
>
>  #endif /* EXYNOS_REGS_FIMC_H */
> --
> 1.7.9.5
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--047d7b3a8436200f1304dacd3959
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">2013/4/17 Sylwester Nawrocki <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" target=3D"_blank">s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<=
/span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">This patch adds OF initialization support fo=
r the FIMC driver.<br>
The binding documentation can be found at Documentation/devicetree/<br>
bindings/media/samsung-fimc.txt.<br>
<br>
The syscon regmap interface is used to serialize access to the<br>
shared CAMBLK registers from within the V4L2 FIMC-IS and the DRM<br>
FIMC drivers. The DRM driver uses this interface for setting up<br>
the FIFO data link between FIMD and FIMC IP blocks, while the V4L2<br>
one for setting up a data link between the camera ISP and FIMC for<br>
camera capture. The CAMBLK registers are not accessed any more<br>
through a statically mapped IO. Synchronized access to these<br>
registers is required for simultaneous operation of the camera<br>
ISP and the DRM IPP on Exynos4x12.<br>
<br>
Exynos4 is going to be a dt-only platform since 3.10, thus the<br>
driver data and driver_ids static data structures are removed.<br>
<br>
Camera input signal polarities are not currently parsed from the<br>
device tree.<br>
<br>
Signed-off-by: Sylwester Nawrocki &lt;<a href=3D"mailto:s.nawrocki@samsung.=
com">s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
Signed-off-by: Kyungmin Park &lt;<a href=3D"mailto:kyungmin.park-Sze3O3UU22KIwRZHo2/mJg@public.gmane.org=
m">kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
---<br>
=A0drivers/gpu/drm/exynos/Kconfig =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-<br>
=A0drivers/gpu/drm/exynos/exynos_drm_fimc.c | =A0101 +++++++++++++++-------=
--------<br>
=A0drivers/gpu/drm/exynos/regs-fimc.h =A0 =A0 =A0 | =A0 =A07 +--<br>
=A03 files changed, 53 insertions(+), 57 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfi=
g<br>
index 406f32a..5c4be2a 100644<br>
--- a/drivers/gpu/drm/exynos/Kconfig<br>
+++ b/drivers/gpu/drm/exynos/Kconfig<br>
@@ -56,7 +56,7 @@ config DRM_EXYNOS_IPP<br>
<br>
=A0config DRM_EXYNOS_FIMC<br>
=A0 =A0 =A0 =A0 bool &quot;Exynos DRM FIMC&quot;<br>
- =A0 =A0 =A0 depends on DRM_EXYNOS_IPP<br>
+ =A0 =A0 =A0 depends on DRM_EXYNOS_IPP &amp;&amp; MFD_SYSCON &amp;&amp; OF=
<br>
=A0 =A0 =A0 =A0 help<br>
=A0 =A0 =A0 =A0 =A0 Choose this option if you want to use Exynos FIMC for D=
RM.<br>
<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exy=
nos/exynos_drm_fimc.c<br>
index 9bea585..f25801e 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c<br>
@@ -12,11 +12,12 @@<br>
=A0 *<br>
=A0 */<br>
=A0#include &lt;linux/kernel.h&gt;<br>
+#include &lt;linux/mfd/syscon.h&gt;<br>
=A0#include &lt;linux/module.h&gt;<br>
=A0#include &lt;linux/platform_device.h&gt;<br>
+#include &lt;linux/regmap.h&gt;<br>
=A0#include &lt;linux/clk.h&gt;<br>
=A0#include &lt;linux/pm_runtime.h&gt;<br>
-#include &lt;plat/map-base.h&gt;<br>
<br>
=A0#include &lt;drm/drmP.h&gt;<br>
=A0#include &lt;drm/exynos_drm.h&gt;<br>
@@ -140,15 +141,6 @@ struct fimc_capability {<br>
=A0};<br>
<br>
=A0/*<br>
- * A structure of fimc driver data.<br>
- *<br>
- * @parent_clk: name of parent clock.<br>
- */<br>
-struct fimc_driverdata {<br>
- =A0 =A0 =A0 char =A0 =A0*parent_clk;<br>
-};<br>
-<br>
-/*<br>
=A0 * A structure of fimc context.<br>
=A0 *<br>
=A0 * @ippdrv: prepare initialization using ippdrv.<br>
@@ -158,6 +150,7 @@ struct fimc_driverdata {<br>
=A0 * @lock: locking of operations.<br>
=A0 * @clocks: fimc clocks.<br>
=A0 * @clk_frequency: LCLK clock frequency.<br>
+ * @sysreg: handle to SYSREG block regmap.<br>
=A0 * @sc: scaler infomations.<br>
=A0 * @pol: porarity of writeback.<br>
=A0 * @id: fimc id.<br>
@@ -172,8 +165,8 @@ struct fimc_context {<br>
=A0 =A0 =A0 =A0 struct mutex =A0 =A0lock;<br>
=A0 =A0 =A0 =A0 struct clk =A0 =A0 =A0*clocks[FIMC_CLKS_MAX];<br>
=A0 =A0 =A0 =A0 u32 =A0 =A0 =A0 =A0 =A0 =A0 clk_frequency;<br>
+ =A0 =A0 =A0 struct regmap =A0 *sysreg;<br>
=A0 =A0 =A0 =A0 struct fimc_scaler =A0 =A0 =A0sc;<br>
- =A0 =A0 =A0 struct fimc_driverdata =A0*ddata;<br>
=A0 =A0 =A0 =A0 struct exynos_drm_ipp_pol =A0 =A0 =A0 pol;<br>
=A0 =A0 =A0 =A0 int =A0 =A0 id;<br>
=A0 =A0 =A0 =A0 int =A0 =A0 irq;<br>
@@ -217,17 +210,13 @@ static void fimc_sw_reset(struct fimc_context *ctx)<b=
r>
=A0 =A0 =A0 =A0 fimc_write(0x0, EXYNOS_CIFCNTSEQ);<br>
=A0}<br>
<br>
-static void fimc_set_camblk_fimd0_wb(struct fimc_context *ctx)<br>
+static int fimc_set_camblk_fimd0_wb(struct fimc_context *ctx)<br>
=A0{<br>
- =A0 =A0 =A0 u32 camblk_cfg;<br>
-<br>
=A0 =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;%s\n&quot;, __func__);<br>
<br>
- =A0 =A0 =A0 camblk_cfg =3D readl(SYSREG_CAMERA_BLK);<br>
- =A0 =A0 =A0 camblk_cfg &amp;=3D ~(SYSREG_FIMD0WB_DEST_MASK);<br>
- =A0 =A0 =A0 camblk_cfg |=3D ctx-&gt;id &lt;&lt; (SYSREG_FIMD0WB_DEST_SHIF=
T);<br>
-<br>
- =A0 =A0 =A0 writel(camblk_cfg, SYSREG_CAMERA_BLK);<br>
+ =A0 =A0 =A0 return regmap_update_bits(ctx-&gt;sysreg, SYSREG_CAMERA_BLK,<=
br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SYSREG_FI=
MD0WB_DEST_MASK,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctx-&gt;i=
d &lt;&lt; SYSREG_FIMD0WB_DEST_SHIFT);<br>
=A0}<br>
<br>
=A0static void fimc_set_type_ctrl(struct fimc_context *ctx, enum fimc_wb wb=
)<br>
@@ -1628,7 +1617,9 @@ static int fimc_ippdrv_start(struct device *dev, enum=
 drm_exynos_ipp_cmd cmd)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fimc_handle_lastend(ctx, true);<br>
<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* setup FIMD */<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 fimc_set_camblk_fimd0_wb(ctx);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D fimc_set_camblk_fimd0_wb(ctx);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret &lt; 0)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_wb.enable =3D 1;<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_wb.refresh =3D property-&gt;refresh_rat=
e;<br>
@@ -1784,26 +1775,50 @@ e_clk_free:<br>
=A0 =A0 =A0 =A0 return ret;<br>
=A0}<br>
<br>
+static int fimc_parse_dt(struct fimc_context *ctx)<br>
+{<br>
+ =A0 =A0 =A0 struct device_node *node =3D ctx-&gt;dev-&gt;of_node;<br>
+<br>
+ =A0 =A0 =A0 if (!of_property_read_bool(node, &quot;samsung,lcd-wb&quot;))=
<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;<br></blockquote><div><br><br>=
Isn&#39;t the above property really needed? This makes the use of write-bac=
k feature to be forced. I think some machines might not need this feature s=
o their dts files have no that property.<br>
</div><div>=A0So in this case, drm fimc driver probing will be failed. is t=
hat correct action and your intention?<br></div><div>=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">

+<br>
+ =A0 =A0 =A0 if (of_property_read_u32(node, &quot;clock-frequency&quot;,<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 &amp;ctx-&gt;clk_frequency))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctx-&gt;clk_frequency =3D FIMC_DEFAULT_LCLK_F=
REQUENCY;<br>
+<br>
+ =A0 =A0 =A0 ctx-&gt;id =3D of_alias_get_id(node, &quot;fimc&quot;);<br>
+ =A0 =A0 =A0 if (ctx-&gt;id &lt; 0)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;<br>
+<br>
+ =A0 =A0 =A0 return 0;<br>
+}<br>
+<br>
=A0static int fimc_probe(struct platform_device *pdev)<br>
=A0{<br>
=A0 =A0 =A0 =A0 struct device *dev =3D &amp;pdev-&gt;dev;<br>
=A0 =A0 =A0 =A0 struct fimc_context *ctx;<br>
=A0 =A0 =A0 =A0 struct resource *res;<br>
=A0 =A0 =A0 =A0 struct exynos_drm_ippdrv *ippdrv;<br>
- =A0 =A0 =A0 struct exynos_drm_fimc_pdata *pdata;<br>
- =A0 =A0 =A0 struct fimc_driverdata *ddata;<br>
=A0 =A0 =A0 =A0 int ret;<br>
<br>
- =A0 =A0 =A0 pdata =3D pdev-&gt;dev.platform_data;<br>
- =A0 =A0 =A0 if (!pdata) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, &quot;no platform data specified=
.\n&quot;);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;<br>
- =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 if (!dev-&gt;of_node)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;<br>
<br>
=A0 =A0 =A0 =A0 ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);<br>
=A0 =A0 =A0 =A0 if (!ctx)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;<br>
<br>
+ =A0 =A0 =A0 ctx-&gt;dev =3D dev;<br>
+<br>
+ =A0 =A0 =A0 ret =3D fimc_parse_dt(ctx);<br>
+ =A0 =A0 =A0 if (ret &lt; 0)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
+<br>
+ =A0 =A0 =A0 ctx-&gt;sysreg =3D syscon_regmap_lookup_by_phandle(dev-&gt;of=
_node,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 &quot;samsung,sysreg&quot;);<br>
+ =A0 =A0 =A0 if (IS_ERR(ctx-&gt;sysreg))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return PTR_ERR(ctx-&gt;sysreg);<br>
+<br>
=A0 =A0 =A0 =A0 /* resource memory */<br>
=A0 =A0 =A0 =A0 ctx-&gt;regs_res =3D platform_get_resource(pdev, IORESOURCE=
_MEM, 0);<br>
=A0 =A0 =A0 =A0 ctx-&gt;regs =3D devm_ioremap_resource(dev, ctx-&gt;regs_re=
s);<br>
@@ -1828,10 +1843,6 @@ static int fimc_probe(struct platform_device *pdev)<=
br>
=A0 =A0 =A0 =A0 ret =3D fimc_setup_clocks(ctx);<br>
=A0 =A0 =A0 =A0 if (ret &lt; 0)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_free_irq;<br>
- =A0 =A0 =A0 /* context initailization */<br>
- =A0 =A0 =A0 ctx-&gt;id =3D pdev-&gt;id;<br>
- =A0 =A0 =A0 ctx-&gt;pol =3D pdata-&gt;pol;<br>
- =A0 =A0 =A0 ctx-&gt;ddata =3D ddata;<br>
<br>
=A0 =A0 =A0 =A0 ippdrv =3D &amp;ctx-&gt;ippdrv;<br>
=A0 =A0 =A0 =A0 ippdrv-&gt;dev =3D dev;<br>
@@ -1941,36 +1952,22 @@ static int fimc_runtime_resume(struct device *dev)<=
br>
=A0}<br>
=A0#endif<br>
<br>
-static struct fimc_driverdata exynos4210_fimc_data =3D {<br>
- =A0 =A0 =A0 .parent_clk =3D &quot;mout_mpll&quot;,<br>
-};<br>
-<br>
-static struct fimc_driverdata exynos4410_fimc_data =3D {<br>
- =A0 =A0 =A0 .parent_clk =3D &quot;mout_mpll_user&quot;,<br>
-};<br>
-<br>
-static struct platform_device_id fimc_driver_ids[] =3D {<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D &quot;exynos421=
0-fimc&quot;,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =A0 =A0=3D (unsigned long)&amp;e=
xynos4210_fimc_data,<br>
- =A0 =A0 =A0 }, {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D &quot;exynos441=
2-fimc&quot;,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =A0 =A0=3D (unsigned long)&amp;e=
xynos4410_fimc_data,<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {},<br>
-};<br>
-MODULE_DEVICE_TABLE(platform, fimc_driver_ids);<br>
-<br>
=A0static const struct dev_pm_ops fimc_pm_ops =3D {<br>
=A0 =A0 =A0 =A0 SET_SYSTEM_SLEEP_PM_OPS(fimc_suspend, fimc_resume)<br>
=A0 =A0 =A0 =A0 SET_RUNTIME_PM_OPS(fimc_runtime_suspend, fimc_runtime_resum=
e, NULL)<br>
=A0};<br>
<br>
+static const struct of_device_id fimc_of_match[] =3D {<br>
+ =A0 =A0 =A0 { .compatible =3D &quot;samsung,exynos4210-fimc&quot; },<br>
+ =A0 =A0 =A0 { .compatible =3D &quot;samsung,exynos4212-fimc&quot; },<br>
+ =A0 =A0 =A0 { },<br>
+};<br>
+<br>
=A0struct platform_driver fimc_driver =3D {<br>
=A0 =A0 =A0 =A0 .probe =A0 =A0 =A0 =A0 =A0=3D fimc_probe,<br>
=A0 =A0 =A0 =A0 .remove =A0 =A0 =A0 =A0 =3D fimc_remove,<br>
- =A0 =A0 =A0 .id_table =A0 =A0 =A0 =3D fimc_driver_ids,<br>
=A0 =A0 =A0 =A0 .driver =A0 =A0 =A0 =A0 =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D fimc_of_match,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D &quot;exynos-drm-fimc&quot;,<=
br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =A0=3D THIS_MODULE,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pm =A0 =A0 =3D &amp;fimc_pm_ops,<br>
diff --git a/drivers/gpu/drm/exynos/regs-fimc.h b/drivers/gpu/drm/exynos/re=
gs-fimc.h<br>
index b4f9ca1..3049613 100644<br>
--- a/drivers/gpu/drm/exynos/regs-fimc.h<br>
+++ b/drivers/gpu/drm/exynos/regs-fimc.h<br>
@@ -661,9 +661,8 @@<br>
=A0#define EXYNOS_CLKSRC_SCLK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (1 &lt;&lt; 1)<br>
<br>
=A0/* SYSREG for FIMC writeback */<br>
-#define SYSREG_CAMERA_BLK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(S3C_=
VA_SYS + 0x0218)<br>
-#define SYSREG_ISP_BLK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (S3=
C_VA_SYS + 0x020c)<br>
-#define SYSREG_FIMD0WB_DEST_MASK =A0 =A0 =A0 (0x3 &lt;&lt; 23)<br>
-#define SYSREG_FIMD0WB_DEST_SHIFT =A0 =A0 =A023<br>
+#define SYSREG_CAMERA_BLK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x02=
18)<br>
+#define SYSREG_FIMD0WB_DEST_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x3 &lt;&lt;=
 23)<br>
+#define SYSREG_FIMD0WB_DEST_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A023<br>
<br>
=A0#endif /* EXYNOS_REGS_FIMC_H */<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">dri-devel-PD4FTy7X32lzq7FAFJ/aeQ@public.gmane.org=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</font></span></blockquote></div><br></div></div>

--047d7b3a8436200f1304dacd3959--

--===============4877827129283162131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4877827129283162131==--
