From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH 1/3] drm/exynos: Control DISP1BLK system register in FIMD
Date: Thu, 26 Jun 2014 11:39:26 +0530
Message-ID: <CAPdUM4P-FPNPShCNcWyobbVeXnWHJqoELVifwWuDHrSLrxKVyg@mail.gmail.com>
References: <1403705752-24469-1-git-send-email-ajaykumar.rs@samsung.com>
	<1403705752-24469-2-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:53677 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752109AbaFZGJ1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 02:09:27 -0400
Received: by mail-wg0-f52.google.com with SMTP id b13so3056432wgh.35
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2014 23:09:26 -0700 (PDT)
In-Reply-To: <1403705752-24469-2-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Ajay kumar <ajaynumb@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, vikas.sajjan@samsung.com

Hi Ajay,

On 25 June 2014 19:45, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Exynos SOC have a DISP1BLK register where we can select
> the path for FIMD output. We can redirect the video data
> directly to DP/MIPI interface, or we can pass it via
> image enhancement chips.
>
> Since we don't use any image enhancement chips in exynos-drm,
> we need to set FIMD BYPASS in DISP1BLK.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  .../devicetree/bindings/video/samsung-fimd.txt     |    2 ++
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   19 +++++++++++++++++++
>  include/video/samsung_fimd.h                       |    5 +++++
>  3 files changed, 26 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/video/samsung-fimd.txt
> index 2dad41b..034e3458 100644
> --- a/Documentation/devicetree/bindings/video/samsung-fimd.txt
> +++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
> @@ -44,6 +44,8 @@ Optional Properties:
>  - display-timings: timing settings for FIMD, as described in document [1].
>                 Can be used in case timings cannot be provided otherwise
>                 or to override timings provided by the panel.
> +- samsung,sysreg-phandle - handle to syscon node, used to control the system
> +                          registers for DISP1BLK.
>
>  The device node can contain 'port' child nodes according to the bindings defined
>  in [2]. The following are properties specific to those nodes:
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 33161ad..a3c855b 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -20,6 +20,8 @@
>  #include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/component.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
>
>  #include <video/of_display_timing.h>
>  #include <video/of_videomode.h>
> @@ -68,6 +70,7 @@
>
>  struct fimd_driver_data {
>         unsigned int timing_base;
> +       unsigned int sysreg_disp1blk_offset;
>
>         unsigned int has_shadowcon:1;
>         unsigned int has_clksel:1;
> @@ -83,11 +86,13 @@ static struct fimd_driver_data s3c64xx_fimd_driver_data = {
>  static struct fimd_driver_data exynos4_fimd_driver_data = {
>         .timing_base = 0x0,
>         .has_shadowcon = 1,
> +       .sysreg_disp1blk_offset = 0x210,

offset should be defined as Macros in reg file.

>  };
>
>  static struct fimd_driver_data exynos5_fimd_driver_data = {
>         .timing_base = 0x20000,
>         .has_shadowcon = 1,
> +       .sysreg_disp1blk_offset = 0x214,
>  };

Same as above. Rest looks fine to me.

Regards,
Rahul Sharma.

>
>  struct fimd_win_data {
> @@ -112,6 +117,7 @@ struct fimd_context {
>         struct clk                      *bus_clk;
>         struct clk                      *lcd_clk;
>         void __iomem                    *regs;
> +       struct regmap                   *sysreg;
>         struct drm_display_mode         mode;
>         struct fimd_win_data            win_data[WINDOWS_NR];
>         unsigned int                    default_win;
> @@ -760,6 +766,12 @@ static int fimd_poweron(struct exynos_drm_manager *mgr)
>
>         pm_runtime_get_sync(ctx->dev);
>
> +       if (ctx->sysreg)
> +               regmap_update_bits(ctx->sysreg,
> +                                  ctx->driver_data->sysreg_disp1blk_offset,
> +                                  FIMDBYPASS_MASK,
> +                                  FIMDBYPASS << FIMDBYPASS_SHIFT);
> +
>         ret = clk_prepare_enable(ctx->bus_clk);
>         if (ret < 0) {
>                 DRM_ERROR("Failed to prepare_enable the bus clk [%d]\n", ret);
> @@ -998,6 +1010,13 @@ static int fimd_probe(struct platform_device *pdev)
>         if (IS_ERR(ctx->display))
>                 return PTR_ERR(ctx->display);
>
> +       ctx->sysreg = syscon_regmap_lookup_by_phandle(
> +                               pdev->dev.of_node, "samsung,sysreg-phandle");
> +       if (IS_ERR(ctx->sysreg)) {
> +               DRM_INFO("DISP1BLK system register is not configured\n");
> +               ctx->sysreg = NULL;
> +       }
> +
>         pm_runtime_enable(&pdev->dev);
>
>         ret = component_add(&pdev->dev, &fimd_component_ops);
> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
> index b039320..b92267d 100644
> --- a/include/video/samsung_fimd.h
> +++ b/include/video/samsung_fimd.h
> @@ -462,3 +462,8 @@
>  #define FIMD_V8_VIDTCON2       0x20018
>  #define FIMD_V8_VIDTCON3       0x2001C
>  #define FIMD_V8_VIDCON1                0x20004
> +
> +/* SYSREG DISP1BLK definitions */
> +#define FIMDBYPASS_SHIFT                       15
> +#define FIMDBYPASS_MASK                        (1 << FIMDBYPASS_SHIFT)
> +#define FIMDBYPASS                             1
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
