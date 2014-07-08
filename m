From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v5 06/14] drm/exynos: fimd: support LCD I80 interface
Date: Wed, 9 Jul 2014 01:10:28 +0900
Message-ID: <CAAQKjZPDUqJhj5Y4+f9m0ZTHsLU=BqFpHbxJ0MJpvtvzrir-nw@mail.gmail.com>
References: <1404779987-5337-1-git-send-email-yj44.cho@samsung.com>
	<1404779987-5337-7-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:45818 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751656AbaGHQKa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 12:10:30 -0400
In-Reply-To: <1404779987-5337-7-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com

2014-07-08 9:39 GMT+09:00 YoungJun Cho <yj44.cho@samsung.com>:
> To support MIPI command mode based I80 interface panel,
> FIMD should do followings:
> - Sets LCD I80 interface timings configuration.
> - Uses "lcd_sys" as an IRQ resource and sets relevant IRQ configuration.
> - Sets LCD block configuration for I80 interface.
> - Sets ideal(pixel) clock is 2 times faster than the original one
>   to generate frame done IRQ prior to the next TE signal.
> - Implements trigger feature that transfers image data if there is page
>   flip request, and implements TE handler to call trigger function.
>
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/gpu/drm/exynos/Kconfig           |   1 +
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 276 ++++++++++++++++++++++++++-----
>  include/video/samsung_fimd.h             |   3 +-
>  3 files changed, 235 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
> index 178d2a9..9ba1aae 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -28,6 +28,7 @@ config DRM_EXYNOS_FIMD
>         bool "Exynos DRM FIMD"
>         depends on DRM_EXYNOS && !FB_S3C
>         select FB_MODE_HELPERS
> +       select MFD_SYSCON
>         help
>           Choose this option if you want to use Exynos FIMD for DRM.
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 33161ad..207872d 100644
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
> @@ -61,6 +63,24 @@
>  /* color key value register for hardware window 1 ~ 4. */
>  #define WKEYCON1_BASE(x)               ((WKEYCON1 + 0x140) + ((x - 1) * 8))
>
> +/* I80 / RGB trigger control register */
> +#define TRIGCON                                0x1A4
> +#define TRGMODE_I80_RGB_ENABLE_I80     (1 << 0)
> +#define SWTRGCMD_I80_RGB_ENABLE                (1 << 1)
> +
> +/* display mode change control register except exynos4 */
> +#define VIDOUT_CON                     0x000
> +#define VIDOUT_CON_F_I80_LDI0          (0x2 << 8)
> +
> +/* I80 interface control for main LDI register */
> +#define I80IFCONFAx(x)                 (0x1B0 + (x) * 4)
> +#define I80IFCONFBx(x)                 (0x1B8 + (x) * 4)
> +#define LCD_CS_SETUP(x)                        ((x) << 16)
> +#define LCD_WR_SETUP(x)                        ((x) << 12)
> +#define LCD_WR_ACTIVE(x)               ((x) << 8)
> +#define LCD_WR_HOLD(x)                 ((x) << 4)
> +#define I80IFEN_ENABLE                 (1 << 0)
> +
>  /* FIMD has totally five hardware windows. */
>  #define WINDOWS_NR     5
>
> @@ -68,10 +88,14 @@
>
>  struct fimd_driver_data {
>         unsigned int timing_base;
> +       unsigned int lcdblk_offset;
> +       unsigned int lcdblk_vt_shift;
> +       unsigned int lcdblk_bypass_shift;
>
>         unsigned int has_shadowcon:1;
>         unsigned int has_clksel:1;
>         unsigned int has_limited_fmt:1;
> +       unsigned int has_vidoutcon:1;
>  };
>
>  static struct fimd_driver_data s3c64xx_fimd_driver_data = {
> @@ -82,12 +106,19 @@ static struct fimd_driver_data s3c64xx_fimd_driver_data = {
>
>  static struct fimd_driver_data exynos4_fimd_driver_data = {
>         .timing_base = 0x0,
> +       .lcdblk_offset = 0x210,
> +       .lcdblk_vt_shift = 10,
> +       .lcdblk_bypass_shift = 1,
>         .has_shadowcon = 1,
>  };
>
>  static struct fimd_driver_data exynos5_fimd_driver_data = {
>         .timing_base = 0x20000,
> +       .lcdblk_offset = 0x214,
> +       .lcdblk_vt_shift = 24,
> +       .lcdblk_bypass_shift = 15,
>         .has_shadowcon = 1,
> +       .has_vidoutcon = 1,
>  };
>
>  struct fimd_win_data {
> @@ -112,15 +143,22 @@ struct fimd_context {
>         struct clk                      *bus_clk;
>         struct clk                      *lcd_clk;
>         void __iomem                    *regs;
> +       struct regmap                   *sysreg;
>         struct drm_display_mode         mode;
>         struct fimd_win_data            win_data[WINDOWS_NR];
>         unsigned int                    default_win;
>         unsigned long                   irq_flags;
> +       u32                             vidcon0;
>         u32                             vidcon1;
> +       u32                             vidout_con;
> +       u32                             i80ifcon;
> +       bool                            i80_if;
>         bool                            suspended;
>         int                             pipe;
>         wait_queue_head_t               wait_vsync_queue;
>         atomic_t                        wait_vsync_event;
> +       atomic_t                        win_updated;
> +       atomic_t                        triggering;
>
>         struct exynos_drm_panel_info panel;
>         struct fimd_driver_data *driver_data;
> @@ -243,6 +281,14 @@ static u32 fimd_calc_clkdiv(struct fimd_context *ctx,
>         unsigned long ideal_clk = mode->htotal * mode->vtotal * mode->vrefresh;
>         u32 clkdiv;
>
> +       if (ctx->i80_if) {
> +               /*
> +                * The frame done interrupt should be occurred prior to the
> +                * next TE signal.
> +                */
> +               ideal_clk *= 2;
> +       }
> +
>         /* Find the clock divider value that gets us closest to ideal_clk */
>         clkdiv = DIV_ROUND_UP(clk_get_rate(ctx->lcd_clk), ideal_clk);
>
> @@ -271,11 +317,10 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
>  {
>         struct fimd_context *ctx = mgr->ctx;
>         struct drm_display_mode *mode = &ctx->mode;
> -       struct fimd_driver_data *driver_data;
> -       u32 val, clkdiv, vidcon1;
> -       int vsync_len, vbpd, vfpd, hsync_len, hbpd, hfpd;
> +       struct fimd_driver_data *driver_data = ctx->driver_data;
> +       void *timing_base = ctx->regs + driver_data->timing_base;
> +       u32 val, clkdiv;
>
> -       driver_data = ctx->driver_data;
>         if (ctx->suspended)
>                 return;
>
> @@ -283,33 +328,65 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
>         if (mode->htotal == 0 || mode->vtotal == 0)
>                 return;
>
> -       /* setup polarity values */
> -       vidcon1 = ctx->vidcon1;
> -       if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> -               vidcon1 |= VIDCON1_INV_VSYNC;
> -       if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> -               vidcon1 |= VIDCON1_INV_HSYNC;
> -       writel(vidcon1, ctx->regs + driver_data->timing_base + VIDCON1);
> -
> -       /* setup vertical timing values. */
> -       vsync_len = mode->crtc_vsync_end - mode->crtc_vsync_start;
> -       vbpd = mode->crtc_vtotal - mode->crtc_vsync_end;
> -       vfpd = mode->crtc_vsync_start - mode->crtc_vdisplay;
> -
> -       val = VIDTCON0_VBPD(vbpd - 1) |
> -               VIDTCON0_VFPD(vfpd - 1) |
> -               VIDTCON0_VSPW(vsync_len - 1);
> -       writel(val, ctx->regs + driver_data->timing_base + VIDTCON0);
> -
> -       /* setup horizontal timing values.  */
> -       hsync_len = mode->crtc_hsync_end - mode->crtc_hsync_start;
> -       hbpd = mode->crtc_htotal - mode->crtc_hsync_end;
> -       hfpd = mode->crtc_hsync_start - mode->crtc_hdisplay;
> -
> -       val = VIDTCON1_HBPD(hbpd - 1) |
> -               VIDTCON1_HFPD(hfpd - 1) |
> -               VIDTCON1_HSPW(hsync_len - 1);
> -       writel(val, ctx->regs + driver_data->timing_base + VIDTCON1);
> +       if (ctx->i80_if) {
> +               val = ctx->i80ifcon | I80IFEN_ENABLE;
> +               writel(val, timing_base + I80IFCONFAx(0));
> +
> +               /* disable auto frame rate */
> +               writel(0, timing_base + I80IFCONFBx(0));
> +
> +               if (ctx->vidout_con)
> +                       writel(ctx->vidout_con, timing_base + VIDOUT_CON);

VIDOUT_CON register should be set in case of video mode also if
has_vidoutcon is 1. Can you re-send only this patch fixing it up?

Thanks,
Inki Dae
