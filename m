From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RFC PATCH] drm/exynos: Add DECON driver
Date: Tue, 21 Oct 2014 11:11:23 +0530
Message-ID: <CAEC9eQO+KfqkkG-QMEno_i9UobJup1icHJ1PkGV=kyL3FC6=KA@mail.gmail.com>
References: <1412945316-26877-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1412945316-26877-1-git-send-email-ajaykumar.rs@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, Akshu Agrawal <akshu.a@samsung.com>, Prashanth G <prashanth.g@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

ping!

On Fri, Oct 10, 2014 at 6:18 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> This series is based on exynos-drm-next branch of Inki Dae's tree at:
> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>
> DECON(Display and Enhancement Controller) is the new IP
> in exynos7 SOC for generating video signals using pixel data.
>
> DECON driver can be used to drive 2 different interfaces on Exynos7:
> DECON-INT(video controller) and DECON-EXT(Mixer for HDMI)
>
> The existing FIMD driver code was used as a template to create
> DECON driver. Only DECON-INT is supported as of now, and
> DECON-EXT support will be added later.
>
> Signed-off-by: Akshu Agrawal <akshu.a@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  .../devicetree/bindings/video/exynos-decon.txt     |   68 ++
>  drivers/gpu/drm/exynos/Kconfig                     |   11 +-
>  drivers/gpu/drm/exynos/Makefile                    |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_decon.c          | 1086 ++++++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_drv.c            |   17 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.h            |   11 +
>  include/video/samsung_decon.h                      |  346 +++++++
>  7 files changed, 1537 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/video/exynos-decon.txt
>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_decon.c
>  create mode 100644 include/video/samsung_decon.h
>
> diff --git a/Documentation/devicetree/bindings/video/exynos-decon.txt b/Documentation/devicetree/bindings/video/exynos-decon.txt
> new file mode 100644
> index 0000000..e865650
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/exynos-decon.txt
> @@ -0,0 +1,68 @@
> +Device-Tree bindings for Samsung Exynos7 SoC display controller (DECON)
> +
> +DECON (Display and Enhancement Controller) is the Display Controller for the
> +Exynos7 series of SoCs which transfers the image data from a video memory
> +buffer to an external LCD interface.
> +
> +Required properties:
> +- compatible: value should be "samsung,exynos7-decon";
> +
> +- reg: physical base address and length of the DECON registers set.
> +
> +- interrupt-parent: should be the phandle of the decon controller's
> +               parent interrupt controller.
> +
> +- interrupts: should contain a list of all DECON IP block interrupts in the
> +                order: FIFO Level, VSYNC, LCD_SYSTEM. The interrupt specifier
> +                format depends on the interrupt controller used.
> +
> +- interrupt-names: should contain the interrupt names: "fifo", "vsync",
> +       "lcd_sys", in the same order as they were listed in the interrupts
> +        property.
> +
> +- pinctrl-0: pin control group to be used for this controller.
> +
> +- pinctrl-names: must contain a "default" entry.
> +
> +- clocks: must include clock specifiers corresponding to entries in the
> +         clock-names property.
> +
> +- clock-names: list of clock names sorted in the same order as the clocks
> +               property. Must contain "pclk_decon0", "aclk_decon0",
> +              "decon0_eclk", "decon0_vclk", "sclk_dsd", aclk_lh_disp0",
> +              "aclk_disp", "aclk_lh_disp1".
> +
> +Optional Properties:
> +- samsung,power-domain: a phandle to DECON power domain node.
> +
> +Example:
> +
> +SoC specific DT entry:
> +
> +       decon@13930000 {
> +               compatible = "samsung,exynos7-decon";
> +               interrupt-parent = <&combiner>;
> +               reg = <0x13930000 0x1000>;
> +               interrupt-names = "lcd_sys", "vsync", "fifo";
> +               interrupts = <0 188 0>, <0 189 0>, <0 190 0>;
> +               clocks = <&clock_disp PCLK_DECON_INT>,
> +                        <&clock_disp ACLK_DECON_INT>,
> +                        <&clock_disp SCLK_DECON_INT_ECLK>,
> +                        <&clock_disp SCLK_DECON_INT_EXTCLKPLL>,
> +                        <&clock_disp SCLK_DSD>,
> +                        <&clock_bus0 ACLK_LH_DISP0>,
> +                        <&clock_disp ACLK_CP_DISP>,
> +                        <&clock_bus0 ACLK_LH_DISP1>;
> +               clock-names = "pclk_decon0", "aclk_decon0", "decon0_eclk",
> +                               "decon0_vclk", "sclk_dsd", "aclk_lh_disp0",
> +                               "aclk_disp", "aclk_lh_disp1";
> +               status = "disabled";
> +       };
> +
> +Board specific DT entry:
> +
> +       decon@13930000 {
> +               pinctrl-0 = <&lcd_clk &pwm1_out>;
> +               pinctrl-names = "default";
> +               status = "okay";
> +       };
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
> index fd1c070..89275ea 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -31,6 +31,13 @@ config DRM_EXYNOS_FIMD
>         help
>           Choose this option if you want to use Exynos FIMD for DRM.
>
> +config DRM_EXYNOS_DECON
> +       bool "Exynos DRM DECON"
> +       depends on DRM_EXYNOS
> +       select FB_MODE_HELPERS
> +       help
> +         Choose this option if you want to use Exynos DECON for DRM.
> +
>  config DRM_EXYNOS_DPI
>         bool "EXYNOS DRM parallel output support"
>         depends on DRM_EXYNOS_FIMD
> @@ -41,7 +48,7 @@ config DRM_EXYNOS_DPI
>
>  config DRM_EXYNOS_DSI
>         bool "EXYNOS DRM MIPI-DSI driver support"
> -       depends on DRM_EXYNOS_FIMD
> +       depends on (DRM_EXYNOS_FIMD || DRM_EXYNOS_DECON)
>         select DRM_MIPI_DSI
>         select DRM_PANEL
>         default n
> @@ -50,7 +57,7 @@ config DRM_EXYNOS_DSI
>
>  config DRM_EXYNOS_DP
>         bool "EXYNOS DRM DP driver support"
> -       depends on DRM_EXYNOS_FIMD && ARCH_EXYNOS && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
> +       depends on (DRM_EXYNOS_FIMD || DRM_EXYNOS_DECON) && ARCH_EXYNOS && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
>         default DRM_EXYNOS
>         select DRM_PANEL
>         help
> diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
> index 33ae365..c3282ac 100644
> --- a/drivers/gpu/drm/exynos/Makefile
> +++ b/drivers/gpu/drm/exynos/Makefile
> @@ -11,6 +11,7 @@ exynosdrm-y := exynos_drm_drv.o exynos_drm_encoder.o \
>  exynosdrm-$(CONFIG_DRM_EXYNOS_IOMMU) += exynos_drm_iommu.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS_DMABUF) += exynos_drm_dmabuf.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)    += exynos_drm_fimd.o
> +exynosdrm-$(CONFIG_DRM_EXYNOS_DECON)   += exynos_drm_decon.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS_DPI)     += exynos_drm_dpi.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS_DSI)     += exynos_drm_dsi.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS_DP)      += exynos_dp_core.o exynos_dp_reg.o
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_decon.c b/drivers/gpu/drm/exynos/exynos_drm_decon.c
> new file mode 100644
> index 0000000..5ac4557
> --- /dev/null
> +++ b/drivers/gpu/drm/exynos/exynos_drm_decon.c
> @@ -0,0 +1,1086 @@
> +/* exynos_drm_decon.c
> + *
> + * Copyright (C) 2014 Samsung Electronics Co.Ltd
> + * Authors:
> + *     Akshu Agarwal <akshu.a@samsung.com>
> + *     Ajay Kumar <ajaykumar.rs@samsung.com>
> + *
> + * This program is free software; you can redistribute  it and/or modify it
> + * under  the terms of  the GNU General  Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + *
> + */
> +#include <drm/drmP.h>
> +#include <drm/exynos_drm.h>
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <video/of_display_timing.h>
> +#include <video/of_videomode.h>
> +#include <video/samsung_decon.h>
> +
> +#include "exynos_drm_crtc.h"
> +#include "exynos_drm_drv.h"
> +#include "exynos_drm_fbdev.h"
> +#include "exynos_drm_iommu.h"
> +
> +/*
> + * DECON stands for Display and Enhancement controller, and
> + * as a display controller, it transfers contents drawn on memory
> + * to a LCD Panel through Display Interfaces such as RGB or
> + * CPU Interface.
> + */
> +
> +#define DECON_DEFAULT_FRAMERATE 60
> +#define RESET_TIMEOUT 200
> +#define MIN_FB_WIDTH_FOR_16WORD_BURST 128
> +
> +#define WINDOWS_NR     2
> +
> +#define get_decon_manager(mgr) platform_get_drvdata(to_platform_device(dev))
> +
> +struct decon_win_data {
> +       unsigned int            ovl_x;
> +       unsigned int            ovl_y;
> +       unsigned int            offset_x;
> +       unsigned int            offset_y;
> +       unsigned int            ovl_width;
> +       unsigned int            ovl_height;
> +       unsigned int            fb_width;
> +       unsigned int            fb_height;
> +       unsigned int            bpp;
> +       unsigned int            pixel_format;
> +       dma_addr_t              dma_addr;
> +       bool                    enabled;
> +       bool                    resume;
> +};
> +
> +struct decon_context {
> +       struct device                   *dev;
> +       struct drm_device               *drm_dev;
> +       struct clk                      *pclk;
> +       struct clk                      *aclk;
> +       struct clk                      *eclk;
> +       struct clk                      *vclk;
> +       struct clk                      *dsd;
> +       struct clk                      *lh_disp1;
> +       struct clk                      *aclk_disp;
> +       struct clk                      *lh_disp0;
> +       void __iomem                    *regs;
> +       struct drm_display_mode         mode;
> +       struct decon_win_data           win_data[WINDOWS_NR];
> +       unsigned int                    default_win;
> +       unsigned long                   irq_flags;
> +       u32                             vidcon1;
> +       bool                            suspended;
> +       int                             pipe;
> +       wait_queue_head_t               wait_vsync_queue;
> +       atomic_t                        wait_vsync_event;
> +
> +       struct exynos_drm_panel_info panel;
> +};
> +
> +static const struct of_device_id decon_driver_dt_match[] = {
> +       { .compatible = "samsung,exynos7-decon"},
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, decon_driver_dt_match);
> +
> +static void decon_wait_for_vblank(struct exynos_drm_manager *mgr)
> +{
> +       struct decon_context *ctx = mgr->ctx;
> +
> +       if (ctx->suspended)
> +               return;
> +
> +       atomic_set(&ctx->wait_vsync_event, 1);
> +
> +       /*
> +        * wait for decon to signal VSYNC interrupt or return after
> +        * timeout which is set to 50ms (refresh rate of 20).
> +        */
> +       if (!wait_event_timeout(ctx->wait_vsync_queue,
> +                               !atomic_read(&ctx->wait_vsync_event),
> +                               HZ/20))
> +               DRM_DEBUG_KMS("vblank wait timed out.\n");
> +}
> +
> +static void decon_clear_channel(struct exynos_drm_manager *mgr)
> +{
> +       struct decon_context *ctx = mgr->ctx;
> +       int win, ch_enabled = 0;
> +
> +       DRM_DEBUG_KMS("%s\n", __FILE__);
> +
> +       /* Check if any channel is enabled. */
> +       for (win = 0; win < WINDOWS_NR; win++) {
> +               u32 val = readl(ctx->regs + WINCON(win));
> +
> +               if (val & WINCONx_ENWIN) {
> +                       val &= ~WINCONx_ENWIN;
> +                       writel(val, ctx->regs + WINCON(win));
> +                       ch_enabled = 1;
> +               }
> +       }
> +
> +       /* Wait for vsync, as disable channel takes effect at next vsync */
> +       if (ch_enabled) {
> +               unsigned int state = ctx->suspended;
> +
> +               ctx->suspended = 0;
> +               decon_wait_for_vblank(mgr);
> +               ctx->suspended = state;
> +       }
> +}
> +
> +static int decon_mgr_initialize(struct exynos_drm_manager *mgr,
> +                       struct drm_device *drm_dev)
> +{
> +       struct decon_context *ctx = mgr->ctx;
> +       struct exynos_drm_private *priv = drm_dev->dev_private;
> +
> +       mgr->drm_dev = ctx->drm_dev = drm_dev;
> +       mgr->pipe = ctx->pipe = priv->pipe++;
> +
> +       /* attach this sub driver to iommu mapping if supported. */
> +       if (is_drm_iommu_supported(ctx->drm_dev)) {
> +               /*
> +                * If any channel is already active, iommu will throw
> +                * a PAGE FAULT when enabled. So clear any channel if enabled.
> +                */
> +               decon_clear_channel(mgr);
> +               drm_iommu_attach_device(ctx->drm_dev, ctx->dev);
> +       }
> +
> +       return 0;
> +}
> +
> +static void decon_mgr_remove(struct exynos_drm_manager *mgr)
> +{
> +       struct decon_context *ctx = mgr->ctx;
> +
> +       /* detach this sub driver from iommu mapping if supported. */
> +       if (is_drm_iommu_supported(ctx->drm_dev))
> +               drm_iommu_detach_device(ctx->drm_dev, ctx->dev);
> +}
> +
> +static u32 decon_calc_clkdiv(struct decon_context *ctx,
> +               const struct drm_display_mode *mode)
> +{
> +       unsigned long ideal_clk = mode->htotal * mode->vtotal * mode->vrefresh;
> +       u32 clkdiv;
> +
> +       /* Find the clock divider value that gets us closest to ideal_clk */
> +       clkdiv = DIV_ROUND_UP(clk_get_rate(ctx->vclk), ideal_clk);
> +
> +       return (clkdiv < 0x100) ? clkdiv : 0xff;
> +}
> +
> +static bool decon_mode_fixup(struct exynos_drm_manager *mgr,
> +               const struct drm_display_mode *mode,
> +               struct drm_display_mode *adjusted_mode)
> +{
> +       if (adjusted_mode->vrefresh == 0)
> +               adjusted_mode->vrefresh = DECON_DEFAULT_FRAMERATE;
> +
> +       return true;
> +}
> +
> +static void decon_mode_set(struct exynos_drm_manager *mgr,
> +               const struct drm_display_mode *in_mode)
> +{
> +       struct decon_context *ctx = mgr->ctx;
> +
> +       drm_mode_copy(&ctx->mode, in_mode);
> +}
> +
> +static void decon_commit(struct exynos_drm_manager *mgr)
> +{
> +       struct decon_context *ctx = mgr->ctx;
> +       struct drm_display_mode *mode = &ctx->mode;
> +       u32 val, clkdiv;
> +       int vsync_len, vbpd, vfpd, hsync_len, hbpd, hfpd;
> +
> +       if (ctx->suspended)
> +               return;
> +
> +       /* nothing to do if we haven't set the mode yet */
> +       if (mode->htotal == 0 || mode->vtotal == 0)
> +               return;
> +
> +      /* setup vertical timing values. */
> +       vsync_len = mode->crtc_vsync_end - mode->crtc_vsync_start;
> +       vbpd = mode->crtc_vtotal - mode->crtc_vsync_end;
> +       vfpd = mode->crtc_vsync_start - mode->crtc_vdisplay;
> +
> +       val = VIDTCON0_VBPD(vbpd - 1) | VIDTCON0_VFPD(vfpd - 1);
> +       writel(val, ctx->regs + VIDTCON0);
> +
> +       val = VIDTCON1_VSPW(vsync_len - 1);
> +       writel(val, ctx->regs + VIDTCON1);
> +
> +       /* setup horizontal timing values.  */
> +       hsync_len = mode->crtc_hsync_end - mode->crtc_hsync_start;
> +       hbpd = mode->crtc_htotal - mode->crtc_hsync_end;
> +       hfpd = mode->crtc_hsync_start - mode->crtc_hdisplay;
> +
> +       /* setup horizontal timing values.  */
> +       val = VIDTCON2_HBPD(hbpd - 1) | VIDTCON2_HFPD(hfpd - 1);
> +       writel(val, ctx->regs + VIDTCON2);
> +
> +       val = VIDTCON3_HSPW(hsync_len - 1);
> +       writel(val, ctx->regs + VIDTCON3);
> +
> +       /* setup horizontal and vertical display size. */
> +       val = VIDTCON4_LINEVAL(mode->vdisplay - 1) |
> +              VIDTCON4_HOZVAL(mode->hdisplay - 1);
> +       writel(val, ctx->regs + VIDTCON4);
> +
> +       writel(mode->vdisplay - 1, ctx->regs + LINECNT_OP_THRESHOLD);
> +
> +       /*
> +        * fields of register with prefix '_F' would be updated
> +        * at vsync(same as dma start)
> +        */
> +       val = VIDCON0_ENVID | VIDCON0_ENVID_F;
> +       writel(val, ctx->regs + VIDCON0);
> +
> +       clkdiv = decon_calc_clkdiv(ctx, mode);
> +       if (clkdiv > 1) {
> +               val = VCLKCON1_CLKVAL_NUM_VCLK(clkdiv - 1);
> +               writel(val, ctx->regs + VCLKCON1);
> +               writel(val, ctx->regs + VCLKCON2);
> +       }
> +
> +       val = readl(ctx->regs + DECON_UPDATE);
> +       val |= DECON_UPDATE_STANDALONE_F;
> +       writel(val, ctx->regs + DECON_UPDATE);
> +}
> +
> +static int decon_enable_vblank(struct exynos_drm_manager *mgr)
> +{
> +       struct decon_context *ctx = mgr->ctx;
> +       u32 val;
> +
> +       if (ctx->suspended)
> +               return -EPERM;
> +
> +       if (!test_and_set_bit(0, &ctx->irq_flags)) {
> +               val = readl(ctx->regs + VIDINTCON0);
> +
> +               val |= VIDINTCON0_INT_ENABLE;
> +               val |= VIDINTCON0_INT_FRAME;
> +
> +               val &= ~VIDINTCON0_FRAMESEL0_MASK;
> +               val |= VIDINTCON0_FRAMESEL0_VSYNC;
> +
> +               writel(val, ctx->regs + VIDINTCON0);
> +       }
> +
> +       return 0;
> +}
> +
> +static void decon_disable_vblank(struct exynos_drm_manager *mgr)
> +{
> +       struct decon_context *ctx = mgr->ctx;
> +       u32 val;
> +
> +       if (ctx->suspended)
> +               return;
> +
> +       if (test_and_clear_bit(0, &ctx->irq_flags)) {
> +               val = readl(ctx->regs + VIDINTCON0);
> +
> +               val &= ~VIDINTCON0_INT_FRAME;
> +               val &= ~VIDINTCON0_INT_ENABLE;
> +
> +               writel(val, ctx->regs + VIDINTCON0);
> +       }
> +}
> +
> +static void decon_win_mode_set(struct exynos_drm_manager *mgr,
> +                       struct exynos_drm_overlay *overlay)
> +{
> +       struct decon_context *ctx = mgr->ctx;
> +       struct decon_win_data *win_data;
> +       int win, padding;
> +
> +       if (!overlay) {
> +               DRM_ERROR("overlay is NULL\n");
> +               return;
> +       }
> +
> +       win = overlay->zpos;
> +       if (win == DEFAULT_ZPOS)
> +               win = ctx->default_win;
> +
> +       if (win < 0 || win >= WINDOWS_NR)
> +               return;
> +
> +
> +       win_data = &ctx->win_data[win];
> +
> +       padding = (overlay->pitch / (overlay->bpp >> 3)) - overlay->fb_width;
> +       win_data->offset_x = overlay->fb_x;
> +       win_data->offset_y = overlay->fb_y;
> +       win_data->fb_width = overlay->fb_width + padding;
> +       win_data->fb_height = overlay->fb_height;
> +       win_data->ovl_x = overlay->crtc_x;
> +       win_data->ovl_y = overlay->crtc_y;
> +       win_data->ovl_width = overlay->crtc_width;
> +       win_data->ovl_height = overlay->crtc_height;
> +       win_data->dma_addr = overlay->dma_addr[0];
> +       win_data->bpp = overlay->bpp;
> +       win_data->pixel_format = overlay->pixel_format;
> +
> +       DRM_DEBUG_KMS("offset_x = %d, offset_y = %d\n",
> +                       win_data->offset_x, win_data->offset_y);
> +       DRM_DEBUG_KMS("ovl_width = %d, ovl_height = %d\n",
> +                       win_data->ovl_width, win_data->ovl_height);
> +       DRM_DEBUG_KMS("paddr = 0x%lx\n", (unsigned long)win_data->dma_addr);
> +       DRM_DEBUG_KMS("fb_width = %d, crtc_width = %d\n",
> +                       overlay->fb_width, overlay->crtc_width);
> +}
> +
> +static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win)
> +{
> +       struct decon_win_data *win_data = &ctx->win_data[win];
> +       unsigned long val;
> +
> +       val = readl(ctx->regs + WINCON(win));
> +       val &= ~WINCONx_BPPMODE_MASK;
> +
> +       switch (win_data->pixel_format) {
> +       case DRM_FORMAT_RGB565:
> +               val |= WINCONx_BPPMODE_16BPP_565;
> +               val |= WINCONx_BURSTLEN_16WORD;
> +               break;
> +       case DRM_FORMAT_XRGB8888:
> +               val |= WINCONx_BPPMODE_24BPP_xRGB;
> +               val |= WINCONx_BURSTLEN_16WORD;
> +               break;
> +       case DRM_FORMAT_XBGR8888:
> +               val |= WINCONx_BPPMODE_24BPP_xBGR;
> +               val |= WINCONx_BURSTLEN_16WORD;
> +               break;
> +       case DRM_FORMAT_RGBX8888:
> +               val |= WINCONx_BPPMODE_24BPP_RGBx;
> +               val |= WINCONx_BURSTLEN_16WORD;
> +               break;
> +       case DRM_FORMAT_BGRX8888:
> +               val |= WINCONx_BPPMODE_24BPP_BGRx;
> +               val |= WINCONx_BURSTLEN_16WORD;
> +               break;
> +       case DRM_FORMAT_ARGB8888:
> +               val |= WINCONx_BPPMODE_32BPP_ARGB | WINCONx_BLD_PIX |
> +                       WINCONx_ALPHA_SEL;
> +               val |= WINCONx_BURSTLEN_16WORD;
> +               break;
> +       case DRM_FORMAT_ABGR8888:
> +               val |= WINCONx_BPPMODE_32BPP_ABGR | WINCONx_BLD_PIX |
> +                       WINCONx_ALPHA_SEL;
> +               val |= WINCONx_BURSTLEN_16WORD;
> +               break;
> +       case DRM_FORMAT_RGBA8888:
> +               val |= WINCONx_BPPMODE_32BPP_RGBA | WINCONx_BLD_PIX |
> +                       WINCONx_ALPHA_SEL;
> +               val |= WINCONx_BURSTLEN_16WORD;
> +               break;
> +       case DRM_FORMAT_BGRA8888:
> +               val |= WINCONx_BPPMODE_32BPP_BGRA | WINCONx_BLD_PIX |
> +                       WINCONx_ALPHA_SEL;
> +               val |= WINCONx_BURSTLEN_16WORD;
> +               break;
> +       default:
> +               DRM_DEBUG_KMS("invalid pixel size so using unpacked 24bpp.\n");
> +
> +               val |= WINCONx_BPPMODE_24BPP_xRGB;
> +               val |= WINCONx_BURSTLEN_16WORD;
> +               break;
> +       }
> +
> +       DRM_DEBUG_KMS("bpp = %d\n", win_data->bpp);
> +
> +       /*
> +        * In case of exynos, setting dma-burst to 16Word causes permanent
> +        * tearing for very small buffers, e.g. cursor buffer. Burst Mode
> +        * switching which is based on overlay size is not recommended as
> +        * overlay size varies alot towards the end of the screen and rapid
> +        * movement causes unstable DMA which results into iommu crash/tear.
> +        */
> +
> +       if (win_data->fb_width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
> +               val &= ~WINCONx_BURSTLEN_MASK;
> +               val |= WINCONx_BURSTLEN_8WORD;
> +       }
> +
> +       writel(val, ctx->regs + WINCON(win));
> +}
> +
> +static void decon_win_set_colkey(struct decon_context *ctx, unsigned int win)
> +{
> +       unsigned int keycon0 = 0, keycon1 = 0;
> +
> +       keycon0 = ~(WxKEYCON0_KEYBL_EN | WxKEYCON0_KEYEN_F |
> +                       WxKEYCON0_DIRCON) | WxKEYCON0_COMPKEY(0);
> +
> +       keycon1 = WxKEYCON1_COLVAL(0xffffffff);
> +
> +       writel(keycon0, ctx->regs + WKEYCON0_BASE(win));
> +       writel(keycon1, ctx->regs + WKEYCON1_BASE(win));
> +}
> +
> +/**
> + * shadow_protect_win() - disable updating values from shadow registers at vsync
> + *
> + * @win: window to protect registers for
> + * @protect: 1 to protect (disable updates)
> + */
> +static void decon_shadow_protect_win(struct decon_context *ctx,
> +                                                       int win, bool protect)
> +{
> +       u32 reg, bits, val;
> +
> +       reg = SHADOWCON;
> +       bits = SHADOWCON_WINx_PROTECT(win);
> +
> +       val = readl(ctx->regs + reg);
> +       if (protect)
> +               val |= bits;
> +       else
> +               val &= ~bits;
> +       writel(val, ctx->regs + reg);
> +}
> +
> +static void decon_win_commit(struct exynos_drm_manager *mgr, int zpos)
> +{
> +       struct decon_context *ctx = mgr->ctx;
> +       struct decon_win_data *win_data;
> +       int win = zpos;
> +       unsigned long val, alpha, blendeq;
> +       unsigned int last_x;
> +       unsigned int last_y;
> +
> +       if (ctx->suspended)
> +               return;
> +
> +       if (win == DEFAULT_ZPOS)
> +               win = ctx->default_win;
> +
> +       if (win < 0 || win >= WINDOWS_NR)
> +               return;
> +
> +       win_data = &ctx->win_data[win];
> +
> +       /* If suspended, enable this on resume */
> +       if (ctx->suspended) {
> +               win_data->resume = true;
> +               return;
> +       }
> +
> +       /*
> +        * SHADOWCON/PRTCON register is used for enabling timing.
> +        *
> +        * for example, once only width value of a register is set,
> +        * if the dma is started then decon hardware could malfunction so
> +        * with protect window setting, the register fields with prefix '_F'
> +        * wouldn't be updated at vsync also but updated once unprotect window
> +        * is set.
> +        */
> +
> +       /* protect windows */
> +       decon_shadow_protect_win(ctx, win, true);
> +
> +       /* buffer start address */
> +       val = (unsigned long)win_data->dma_addr;
> +       writel(val, ctx->regs + VIDW_BUF_START(win));
> +
> +       /* buffer size */
> +       writel(win_data->fb_width, ctx->regs + VIDW_WHOLE_X(win));
> +       writel(win_data->fb_height, ctx->regs + VIDW_WHOLE_Y(win));
> +
> +       /* offset from the start of the buffer read */
> +       writel(win_data->offset_x, ctx->regs + VIDW_OFFSET_X(win));
> +       writel(win_data->offset_y, ctx->regs + VIDW_OFFSET_Y(win));
> +
> +       DRM_DEBUG_KMS("start addr = 0x%lx\n",
> +                       (unsigned long)win_data->dma_addr);
> +       DRM_DEBUG_KMS("ovl_width = %d, ovl_height = %d\n",
> +                       win_data->ovl_width, win_data->ovl_height);
> +
> +       /* OSD position */
> +       val = VIDOSDxA_TOPLEFT_X(win_data->ovl_x) |
> +               VIDOSDxA_TOPLEFT_Y(win_data->ovl_y);
> +       writel(val, ctx->regs + VIDOSD_A(win));
> +
> +       last_x = win_data->ovl_x + win_data->ovl_width;
> +       if (last_x)
> +               last_x--;
> +       last_y = win_data->ovl_y + win_data->ovl_height;
> +       if (last_y)
> +               last_y--;
> +
> +       val = VIDOSDxB_BOTRIGHT_X(last_x) | VIDOSDxB_BOTRIGHT_Y(last_y);
> +
> +       writel(val, ctx->regs + VIDOSD_B(win));
> +
> +       DRM_DEBUG_KMS("osd pos: tx = %d, ty = %d, bx = %d, by = %d\n",
> +                       win_data->ovl_x, win_data->ovl_y, last_x, last_y);
> +
> +               /* OSD alpha */
> +               alpha = VIDOSDxC_ALPHA0_R_F(0x0) |
> +                               VIDOSDxC_ALPHA0_G_F(0x0) |
> +                               VIDOSDxC_ALPHA0_B_F(0x0);
> +
> +               writel(alpha, ctx->regs + VIDOSD_C(win));
> +
> +               alpha = VIDOSDxD_ALPHA1_R_F(0xff) |
> +                               VIDOSDxD_ALPHA1_G_F(0xff) |
> +                               VIDOSDxD_ALPHA1_B_F(0xff);
> +
> +               writel(alpha, ctx->regs + VIDOSD_D(win));
> +
> +       if (win != 0) {
> +               blendeq = BLENDE_A_FUNC(BLENDE_COEF_ONE) |
> +                       BLENDE_B_FUNC(BLENDE_COEF_ZERO) |
> +                       BLENDE_P_FUNC(BLENDE_COEF_ZERO) |
> +                       BLENDE_Q_FUNC(BLENDE_COEF_ZERO);
> +
> +               writel(blendeq, ctx->regs + BLENDE(win - 1));
> +       }
> +
> +       decon_win_set_pixfmt(ctx, win);
> +
> +       /* hardware window 0 doesn't support color key. */
> +       if (win != 0)
> +               decon_win_set_colkey(ctx, win);
> +
> +       /* wincon */
> +       val = readl(ctx->regs + WINCON(win));
> +       val |= WINCONx_TRIPLE_BUF_MODE;
> +       val |= WINCONx_ENWIN;
> +       writel(val, ctx->regs + WINCON(win));
> +
> +       /* Enable DMA channel and unprotect windows */
> +       decon_shadow_protect_win(ctx, win, false);
> +
> +       val = readl(ctx->regs + DECON_UPDATE);
> +       val |= DECON_UPDATE_STANDALONE_F;
> +       writel(val, ctx->regs + DECON_UPDATE);
> +
> +       win_data->enabled = true;
> +}
> +
> +static void decon_win_disable(struct exynos_drm_manager *mgr, int zpos)
> +{
> +       struct decon_context *ctx = mgr->ctx;
> +       struct decon_win_data *win_data;
> +       int win = zpos;
> +       u32 val;
> +
> +       if (win == DEFAULT_ZPOS)
> +               win = ctx->default_win;
> +
> +       if (win < 0 || win >= WINDOWS_NR)
> +               return;
> +
> +       win_data = &ctx->win_data[win];
> +
> +       if (ctx->suspended) {
> +               /* do not resume this window*/
> +               win_data->resume = false;
> +               return;
> +       }
> +
> +       /* protect windows */
> +       decon_shadow_protect_win(ctx, win, true);
> +
> +       /* wincon */
> +       val = readl(ctx->regs + WINCON(win));
> +       val &= ~WINCONx_ENWIN;
> +       writel(val, ctx->regs + WINCON(win));
> +
> +       decon_shadow_protect_win(ctx, win, false);
> +
> +       win_data->enabled = false;
> +}
> +
> +static void decon_window_suspend(struct exynos_drm_manager *mgr)
> +{
> +       struct decon_context *ctx = mgr->ctx;
> +       struct decon_win_data *win_data;
> +       int i;
> +
> +       for (i = 0; i < WINDOWS_NR; i++) {
> +               win_data = &ctx->win_data[i];
> +               win_data->resume = win_data->enabled;
> +               if (win_data->enabled)
> +                       decon_win_disable(mgr, i);
> +       }
> +       decon_wait_for_vblank(mgr);
> +}
> +
> +static void decon_window_resume(struct exynos_drm_manager *mgr)
> +{
> +       struct decon_context *ctx = mgr->ctx;
> +       struct decon_win_data *win_data;
> +       int i;
> +
> +       for (i = 0; i < WINDOWS_NR; i++) {
> +               win_data = &ctx->win_data[i];
> +               win_data->enabled = win_data->resume;
> +               win_data->resume = false;
> +       }
> +}
> +
> +static void decon_apply(struct exynos_drm_manager *mgr)
> +{
> +       struct decon_context *ctx = mgr->ctx;
> +       struct decon_win_data *win_data;
> +       int i;
> +
> +       for (i = 0; i < WINDOWS_NR; i++) {
> +               win_data = &ctx->win_data[i];
> +               if (win_data->enabled)
> +                       decon_win_commit(mgr, i);
> +               else
> +                       decon_win_disable(mgr, i);
> +       }
> +
> +       decon_commit(mgr);
> +}
> +
> +static int decon_reg_reset(struct decon_context *ctx)
> +{
> +       int tries = RESET_TIMEOUT;
> +
> +       writel(VIDCON0_SWRESET, ctx->regs + VIDCON0);
> +
> +       while (tries) {
> +               if (!(readl(ctx->regs + VIDCON0) & VIDCON0_SWRESET))
> +                       break;
> +               udelay(10);
> +               tries--;
> +       }
> +
> +       if (!tries) {
> +               DRM_ERROR("Failed to reset decon\n");
> +               return -EBUSY;
> +       }
> +
> +       return 0;
> +}
> +
> +static void decon_cmu_enable(struct decon_context *ctx)
> +{
> +       writel(~DECON_CMU_ALL_CLKGATE_ENABLE, ctx->regs + DECON_CMU);
> +}
> +
> +static void decon_blend_alpha_bits(struct decon_context *ctx)
> +{
> +       writel(BLENDCON_NEW_8BIT_ALPHA_VALUE, ctx->regs + BLENDCON);
> +}
> +
> +static void decon_set_vidout(struct decon_context *ctx)
> +{
> +       writel(VIDOUTCON0_LCD_ON | VIDOUTCON0_RGBIF, ctx->regs + VIDOUTCON0);
> +}
> +
> +static void decon_set_crc(struct decon_context *ctx)
> +{
> +       u32 val = readl(ctx->regs + CRCCTRL);
> +
> +       writel(val & ~(CRCCTRL_CRCCLKEN | CRCCTRL_CRCEN | CRCCTRL_CRCSTART_F),
> +                                                       ctx->regs + CRCCTRL);
> +}
> +
> +static void decon_set_clkval(struct decon_context *ctx)
> +{
> +       writel(VCLKCON0_CLKVALUP | VCLKCON0_VCLKFREE, ctx->regs + VCLKCON0);
> +}
> +
> +static void decon_set_fixvclk(struct decon_context *ctx)
> +{
> +       writel(ctx->vidcon1, ctx->regs + VIDCON1(0));
> +}
> +
> +static int decon_poweron(struct exynos_drm_manager *mgr)
> +{
> +       struct decon_context *ctx = mgr->ctx;
> +       int ret;
> +
> +       if (!ctx->suspended)
> +               return 0;
> +
> +       ctx->suspended = false;
> +
> +       pm_runtime_get_sync(ctx->dev);
> +
> +       ret = clk_prepare_enable(ctx->pclk);
> +       if (ret < 0) {
> +               DRM_ERROR("Failed to prepare_enable the pclk [%d]\n", ret);
> +               goto pclk_err;
> +       }
> +
> +       ret = clk_prepare_enable(ctx->aclk);
> +       if  (ret < 0) {
> +               DRM_ERROR("Failed to prepare_enable the aclk [%d]\n", ret);
> +               goto aclk_err;
> +       }
> +
> +       ret = clk_prepare_enable(ctx->eclk);
> +       if  (ret < 0) {
> +               DRM_ERROR("Failed to prepare_enable the eclk [%d]\n", ret);
> +               goto eclk_err;
> +       }
> +
> +       ret = clk_prepare_enable(ctx->vclk);
> +       if  (ret < 0) {
> +               DRM_ERROR("Failed to prepare_enable the vclk [%d]\n", ret);
> +               goto vclk_err;
> +       }
> +
> +       ret = clk_prepare_enable(ctx->dsd);
> +       if  (ret < 0) {
> +               DRM_ERROR("Failed to prepare_enable the dsd [%d]\n", ret);
> +               goto dsd_err;
> +       }
> +
> +       ret = clk_prepare_enable(ctx->lh_disp1);
> +       if  (ret < 0) {
> +               DRM_ERROR("Failed to prepare_enable the lh_disp1 [%d]\n", ret);
> +               goto lh_disp1_err;
> +       }
> +
> +       ret = clk_prepare_enable(ctx->aclk_disp);
> +       if  (ret < 0) {
> +               DRM_ERROR("Failed to prepare_enable the aclk_disp [%d]\n", ret);
> +               goto aclk_disp_err;
> +       }
> +
> +       ret = clk_prepare_enable(ctx->lh_disp0);
> +       if  (ret < 0) {
> +               DRM_ERROR("Failed to prepare_enable the lh_disp0 [%d]\n", ret);
> +               goto lh_disp0_err;
> +       }
> +
> +       ret = decon_reg_reset(mgr->ctx);
> +       if  (ret < 0) {
> +               DRM_ERROR("Failed to reset decon [%d]\n", ret);
> +               goto lh_disp0_err;
> +       }
> +
> +       decon_cmu_enable(mgr->ctx);
> +       decon_blend_alpha_bits(mgr->ctx);
> +       decon_set_vidout(mgr->ctx);
> +       decon_set_crc(mgr->ctx);
> +       decon_set_fixvclk(mgr->ctx);
> +       decon_set_clkval(mgr->ctx);
> +
> +       /* if vblank was enabled status, enable it again. */
> +       if (test_and_clear_bit(0, &ctx->irq_flags)) {
> +               ret = decon_enable_vblank(mgr);
> +               if (ret) {
> +                       DRM_ERROR("Failed to re-enable vblank [%d]\n", ret);
> +                       goto enable_vblank_err;
> +               }
> +       }
> +
> +       decon_window_resume(mgr);
> +
> +       decon_apply(mgr);
> +
> +       return 0;
> +
> +enable_vblank_err:
> +       clk_disable_unprepare(ctx->lh_disp0);
> +lh_disp0_err:
> +       clk_disable_unprepare(ctx->aclk_disp);
> +aclk_disp_err:
> +       clk_disable_unprepare(ctx->lh_disp1);
> +lh_disp1_err:
> +       clk_disable_unprepare(ctx->dsd);
> +dsd_err:
> +       clk_disable_unprepare(ctx->vclk);
> +vclk_err:
> +       clk_disable_unprepare(ctx->eclk);
> +eclk_err:
> +       clk_disable_unprepare(ctx->aclk);
> +aclk_err:
> +       clk_disable_unprepare(ctx->pclk);
> +pclk_err:
> +       ctx->suspended = true;
> +       return ret;
> +}
> +
> +static int decon_poweroff(struct exynos_drm_manager *mgr)
> +{
> +       struct decon_context *ctx = mgr->ctx;
> +
> +       if (ctx->suspended)
> +               return 0;
> +
> +       /*
> +        * We need to make sure that all windows are disabled before we
> +        * suspend that connector. Otherwise we might try to scan from
> +        * a destroyed buffer later.
> +        */
> +       decon_window_suspend(mgr);
> +
> +       clk_disable_unprepare(ctx->pclk);
> +       clk_disable_unprepare(ctx->aclk);
> +       clk_disable_unprepare(ctx->eclk);
> +       clk_disable_unprepare(ctx->vclk);
> +       clk_disable_unprepare(ctx->dsd);
> +       clk_disable_unprepare(ctx->lh_disp1);
> +       clk_disable_unprepare(ctx->aclk_disp);
> +       clk_disable_unprepare(ctx->lh_disp0);
> +
> +       pm_runtime_put_sync(ctx->dev);
> +
> +       ctx->suspended = true;
> +       return 0;
> +}
> +
> +static void decon_dpms(struct exynos_drm_manager *mgr, int mode)
> +{
> +       DRM_DEBUG_KMS("%s, %d\n", __FILE__, mode);
> +
> +       switch (mode) {
> +       case DRM_MODE_DPMS_ON:
> +               decon_poweron(mgr);
> +               break;
> +       case DRM_MODE_DPMS_STANDBY:
> +       case DRM_MODE_DPMS_SUSPEND:
> +       case DRM_MODE_DPMS_OFF:
> +               decon_poweroff(mgr);
> +               break;
> +       default:
> +               DRM_DEBUG_KMS("unspecified mode %d\n", mode);
> +               break;
> +       }
> +}
> +
> +static struct exynos_drm_manager_ops decon_manager_ops = {
> +       .dpms = decon_dpms,
> +       .mode_fixup = decon_mode_fixup,
> +       .mode_set = decon_mode_set,
> +       .commit = decon_commit,
> +       .enable_vblank = decon_enable_vblank,
> +       .disable_vblank = decon_disable_vblank,
> +       .wait_for_vblank = decon_wait_for_vblank,
> +       .win_mode_set = decon_win_mode_set,
> +       .win_commit = decon_win_commit,
> +       .win_disable = decon_win_disable,
> +};
> +
> +static struct exynos_drm_manager decon_manager = {
> +       .type = EXYNOS_DISPLAY_TYPE_LCD,
> +       .ops = &decon_manager_ops,
> +};
> +
> +static irqreturn_t decon_irq_handler(int irq, void *dev_id)
> +{
> +       struct decon_context *ctx = (struct decon_context *)dev_id;
> +       u32 val;
> +
> +       val = readl(ctx->regs + VIDINTCON1);
> +
> +       if (val & VIDINTCON1_INT_FRAME)
> +               /* VSYNC interrupt */
> +               writel(VIDINTCON1_INT_FRAME, ctx->regs + VIDINTCON1);
> +
> +       /* check the crtc is detached already from encoder */
> +       if (ctx->pipe < 0 || !ctx->drm_dev)
> +               goto out;
> +
> +       drm_handle_vblank(ctx->drm_dev, ctx->pipe);
> +       exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
> +
> +       /* set wait vsync event to zero and wake up queue. */
> +       if (atomic_read(&ctx->wait_vsync_event)) {
> +               atomic_set(&ctx->wait_vsync_event, 0);
> +               wake_up(&ctx->wait_vsync_queue);
> +       }
> +out:
> +       return IRQ_HANDLED;
> +}
> +
> +static int decon_bind(struct device *dev, struct device *master, void *data)
> +{
> +       struct drm_device *drm_dev = data;
> +
> +       decon_mgr_initialize(&decon_manager, drm_dev);
> +       exynos_drm_crtc_create(&decon_manager);
> +
> +       return 0;
> +
> +}
> +
> +static void decon_unbind(struct device *dev, struct device *master,
> +                       void *data)
> +{
> +       struct exynos_drm_manager *mgr = dev_get_drvdata(dev);
> +
> +       decon_dpms(mgr, DRM_MODE_DPMS_OFF);
> +       decon_mgr_remove(mgr);
> +}
> +
> +static const struct component_ops decon_component_ops = {
> +       .bind   = decon_bind,
> +       .unbind = decon_unbind,
> +};
> +
> +static int decon_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct decon_context *ctx;
> +       struct resource *res;
> +       int ret = -EINVAL;
> +
> +       ret = exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC,
> +                                       decon_manager.type);
> +       if (ret)
> +               return ret;
> +
> +       if (!dev->of_node) {
> +               ret = -ENODEV;
> +               goto err_del_component;
> +       }
> +
> +       ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +       if (!ctx) {
> +               ret = -ENOMEM;
> +               goto err_del_component;
> +       }
> +
> +       ctx->dev = dev;
> +       ctx->suspended = true;
> +
> +       ctx->pclk = devm_clk_get(dev, "pclk_decon0");
> +       if (IS_ERR(ctx->pclk)) {
> +               dev_err(dev, "failed to get bus clock\n");
> +               ret = PTR_ERR(ctx->pclk);
> +               goto err_del_component;
> +       }
> +
> +       ctx->aclk = devm_clk_get(dev, "aclk_decon0");
> +       if (IS_ERR(ctx->aclk)) {
> +               dev_err(dev, "failed to get aclock\n");
> +               ret = PTR_ERR(ctx->aclk);
> +               goto err_del_component;
> +       }
> +
> +       ctx->eclk = devm_clk_get(dev, "decon0_eclk");
> +       if (IS_ERR(ctx->eclk)) {
> +               dev_err(dev, "failed to get eclock\n");
> +               ret = PTR_ERR(ctx->eclk);
> +               goto err_del_component;
> +       }
> +
> +       ctx->vclk = devm_clk_get(dev, "decon0_vclk");
> +       if (IS_ERR(ctx->vclk)) {
> +               dev_err(dev, "failed to get vclock\n");
> +               ret = PTR_ERR(ctx->vclk);
> +               goto err_del_component;
> +       }
> +
> +       ctx->dsd = devm_clk_get(dev, "sclk_dsd");
> +       if (IS_ERR(ctx->dsd)) {
> +               dev_err(dev, "failed to get dsd clock\n");
> +               ret = PTR_ERR(ctx->dsd);
> +               goto err_del_component;
> +       }
> +
> +       ctx->lh_disp1 = devm_clk_get(dev, "aclk_lh_disp1");
> +       if (IS_ERR(ctx->lh_disp1)) {
> +               dev_err(dev, "failed to get lh_disp1 clock\n");
> +               ret = PTR_ERR(ctx->lh_disp1);
> +               goto err_del_component;
> +       }
> +
> +       ctx->aclk_disp = devm_clk_get(dev, "aclk_disp");
> +       if (IS_ERR(ctx->aclk_disp)) {
> +               dev_err(dev, "failed to get aclk_disp clock\n");
> +               ret = PTR_ERR(ctx->aclk_disp);
> +               goto err_del_component;
> +       }
> +
> +       ctx->lh_disp0 = devm_clk_get(dev, "aclk_lh_disp0");
> +       if (IS_ERR(ctx->lh_disp0)) {
> +               dev_err(dev, "failed to get lh_disp0 clock\n");
> +               ret = PTR_ERR(ctx->lh_disp0);
> +               goto err_del_component;
> +       }
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +       ctx->regs = devm_ioremap_resource(dev, res);
> +       if (IS_ERR(ctx->regs)) {
> +               ret = PTR_ERR(ctx->regs);
> +               goto err_del_component;
> +       }
> +
> +       res = platform_get_resource_byname(pdev, IORESOURCE_IRQ, "vsync");
> +       if (!res) {
> +               dev_err(dev, "irq request failed.\n");
> +               ret = -ENXIO;
> +               goto err_del_component;
> +       }
> +
> +       ret = devm_request_irq(dev, res->start, decon_irq_handler,
> +                                                       0, "drm_decon", ctx);
> +       if (ret) {
> +               dev_err(dev, "irq request failed.\n");
> +               goto err_del_component;
> +       }
> +
> +       init_waitqueue_head(&ctx->wait_vsync_queue);
> +       atomic_set(&ctx->wait_vsync_event, 0);
> +
> +       platform_set_drvdata(pdev, &decon_manager);
> +
> +       decon_manager.ctx = ctx;
> +
> +       pm_runtime_enable(&pdev->dev);
> +
> +       ret = component_add(&pdev->dev, &decon_component_ops);
> +       if (ret)
> +               goto err_disable_pm_runtime;
> +
> +       return ret;
> +
> +err_disable_pm_runtime:
> +       pm_runtime_disable(&pdev->dev);
> +
> +err_del_component:
> +       exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC);
> +       return ret;
> +}
> +
> +static int decon_remove(struct platform_device *pdev)
> +{
> +       pm_runtime_disable(&pdev->dev);
> +
> +       component_del(&pdev->dev, &decon_component_ops);
> +       exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC);
> +
> +       return 0;
> +}
> +
> +struct platform_driver decon_driver = {
> +       .probe          = decon_probe,
> +       .remove         = decon_remove,
> +       .driver         = {
> +               .name   = "exynos-decon",
> +               .owner  = THIS_MODULE,
> +               .of_match_table = decon_driver_dt_match,
> +       },
> +};
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 443a206..44bdc42 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -557,10 +557,16 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
>                 return ret;
>  #endif
>
> +#ifdef CONFIG_DRM_EXYNOS_DECON
> +       ret = platform_driver_register(&decon_driver);
> +       if (ret < 0)
> +               goto err_unregister_fimd_drv;
> +#endif
> +
>  #ifdef CONFIG_DRM_EXYNOS_DP
>         ret = platform_driver_register(&dp_driver);
>         if (ret < 0)
> -               goto err_unregister_fimd_drv;
> +               goto err_unregister_decon_drv;
>  #endif
>
>  #ifdef CONFIG_DRM_EXYNOS_DSI
> @@ -668,6 +674,11 @@ err_unregister_dp_drv:
>
>  #ifdef CONFIG_DRM_EXYNOS_DP
>         platform_driver_unregister(&dp_driver);
> +err_unregister_decon_drv:
> +#endif
> +
> +#ifdef CONFIG_DRM_EXYNOS_DECON
> +       platform_driver_unregister(&decon_driver);
>  err_unregister_fimd_drv:
>  #endif
>
> @@ -709,6 +720,10 @@ static int exynos_drm_platform_remove(struct platform_device *pdev)
>         platform_driver_unregister(&fimd_driver);
>  #endif
>
> +#ifdef CONFIG_DRM_EXYNOS_DECON
> +       platform_driver_unregister(&decon_driver);
> +#endif
> +
>  #ifdef CONFIG_DRM_EXYNOS_DSI
>         platform_driver_unregister(&dsi_driver);
>  #endif
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> index d22e640..25f750d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -352,6 +352,16 @@ int exynos_drm_probe_vidi(void);
>   */
>  void exynos_drm_remove_vidi(void);
>
> +/*
> + * this function registers exynos drm decon platform device/driver.
> + */
> +int exynos_drm_probe_decon(void);
> +
> +/*
> + * this function unregister exynos drm decon platform device/driver.
> + */
> +void exynos_drm_remove_decon(void);
> +
>  /* This function creates a encoder and a connector, and initializes them. */
>  int exynos_drm_create_enc_conn(struct drm_device *dev,
>                                 struct exynos_drm_display *display);
> @@ -364,6 +374,7 @@ void exynos_drm_component_del(struct device *dev,
>                                 enum exynos_drm_device_type dev_type);
>
>  extern struct platform_driver fimd_driver;
> +extern struct platform_driver decon_driver;
>  extern struct platform_driver dp_driver;
>  extern struct platform_driver dsi_driver;
>  extern struct platform_driver mixer_driver;
> diff --git a/include/video/samsung_decon.h b/include/video/samsung_decon.h
> new file mode 100644
> index 0000000..8839120
> --- /dev/null
> +++ b/include/video/samsung_decon.h
> @@ -0,0 +1,346 @@
> +/* include/video/exynos_drm_decon.h
> + *
> + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
> + * Author: Ajay Kumar <ajaykumar.rs@samsung.com>
> + *
> + * This program is free software; you can redistribute  it and/or modify it
> + * under  the terms of  the GNU General  Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */
> +
> +/* VIDCON0 */
> +#define VIDCON0                                        (0x00)
> +
> +#define VIDCON0_SWRESET                                (1 << 28)
> +#define VIDCON0_DECON_STOP_STATUS              (1 << 2)
> +#define VIDCON0_ENVID                          (1 << 1)
> +#define VIDCON0_ENVID_F                                (1 << 0)
> +
> +/* VIDOUTCON0 */
> +#define VIDOUTCON0                             (0x4)
> +
> +#define VIDOUTCON0_LCD_ON                      (0x1 << 24)
> +#define VIDOUTCON0_LCD_OFF                     (0x0 << 24)
> +#define VIDOUTCON0_IF_SHIFT                    (23)
> +#define VIDOUTCON0_IF_MASK                     (0x1 << 23)
> +#define VIDOUTCON0_RGBIF                       (0x0 << 23)
> +#define VIDOUTCON0_I80IF                       (0x1 << 23)
> +
> +/* VIDCON3 */
> +#define VIDCON3                                        (0x8)
> +
> +/* VIDCON4 */
> +#define VIDCON4                                        (0xC)
> +#define VIDCON4_FIFOCNT_START_EN               (1 << 0)
> +
> +/* VCLKCON0 */
> +#define VCLKCON0                               0x10
> +#define VCLKCON0_CLKVALUP                      (1 << 8)
> +#define VCLKCON0_VCLKFREE                      (1 << 0)
> +
> +/* VCLKCON */
> +#define VCLKCON1                               0x14
> +#define VCLKCON1_CLKVAL_NUM_VCLK(val)          (((val) & 0xff) << 0)
> +#define VCLKCON2                               0x18
> +
> +/* SHADOWCON */
> +#define SHADOWCON                              (0x30)
> +
> +#define SHADOWCON_WINx_PROTECT(_win)           (1 << (10 + (_win)))
> +
> +/* WINCONx */
> +#define WINCON(_win)                           (0x50 + ((_win) * 4))
> +
> +#define WINCONx_BUFSTATUS                      (0x3 << 30)
> +#define WINCONx_BUFSEL_MASK                    (0x3 << 28)
> +#define WINCONx_BUFSEL_SHIFT                   (28)
> +#define WINCONx_TRIPLE_BUF_MODE                        (0x1 << 18)
> +#define WINCONx_DOUBLE_BUF_MODE                        (0x0 << 18)
> +#define WINCONx_BURSTLEN_16WORD                        (0x0 << 11)
> +#define WINCONx_BURSTLEN_8WORD                 (0x1 << 11)
> +#define WINCONx_BURSTLEN_MASK                  (0x1 << 11)
> +#define WINCONx_BURSTLEN_SHIFT                 (11)
> +#define WINCONx_BLD_PLANE                      (0 << 8)
> +#define WINCONx_BLD_PIX                                (1 << 8)
> +#define WINCONx_ALPHA_MUL                      (1 << 7)
> +
> +#define WINCONx_BPPMODE_MASK                   (0xf << 2)
> +#define WINCONx_BPPMODE_SHIFT                  (2)
> +#define WINCONx_BPPMODE_16BPP_565              (0x8 << 2)
> +#define WINCONx_BPPMODE_24BPP_BGRx             (0x7 << 2)
> +#define WINCONx_BPPMODE_24BPP_RGBx             (0x6 << 2)
> +#define WINCONx_BPPMODE_24BPP_xBGR             (0x5 << 2)
> +#define WINCONx_BPPMODE_24BPP_xRGB             (0x4 << 2)
> +#define WINCONx_BPPMODE_32BPP_BGRA             (0x3 << 2)
> +#define WINCONx_BPPMODE_32BPP_RGBA             (0x2 << 2)
> +#define WINCONx_BPPMODE_32BPP_ABGR             (0x1 << 2)
> +#define WINCONx_BPPMODE_32BPP_ARGB             (0x0 << 2)
> +#define WINCONx_ALPHA_SEL                      (1 << 1)
> +#define WINCONx_ENWIN                          (1 << 0)
> +
> +#define WINCON1_ALPHA_MUL_F                    (1 << 7)
> +#define WINCON2_ALPHA_MUL_F                    (1 << 7)
> +#define WINCON3_ALPHA_MUL_F                    (1 << 7)
> +#define WINCON4_ALPHA_MUL_F                    (1 << 7)
> +
> +/*  VIDOSDxH: The height for the OSD image(READ ONLY)*/
> +#define VIDOSD_H(_x)                           (0x80 + ((_x) * 4))
> +
> +/* Frame buffer start addresses: VIDWxxADD0n */
> +#define VIDW_BUF_START(_win)                   (0x80 + ((_win) * 0x10))
> +#define VIDW_BUF_START1(_win)                  (0x84 + ((_win) * 0x10))
> +#define VIDW_BUF_START2(_win)                  (0x88 + ((_win) * 0x10))
> +
> +#define VIDW_WHOLE_X(_win)                     (0x0130 + ((_win) * 8))
> +#define VIDW_WHOLE_Y(_win)                     (0x0134 + ((_win) * 8))
> +#define VIDW_OFFSET_X(_win)                    (0x0170 + ((_win) * 8))
> +#define VIDW_OFFSET_Y(_win)                    (0x0174 + ((_win) * 8))
> +#define VIDW_BLKOFFSET(_win)                   (0x01B0 + ((_win) * 4))
> +#define VIDW_BLKSIZE(win)                      (0x0200 + ((_win) * 4))
> +
> +/* Interrupt controls register */
> +#define VIDINTCON2                             (0x228)
> +
> +#define VIDINTCON1_INTEXTRA1_EN                        (1 << 1)
> +#define VIDINTCON1_INTEXTRA0_EN                        (1 << 0)
> +
> +/* Interrupt controls and status register */
> +#define VIDINTCON3                             (0x22C)
> +
> +#define VIDINTCON1_INTEXTRA1_PEND              (1 << 1)
> +#define VIDINTCON1_INTEXTRA0_PEND              (1 << 0)
> +
> +/* VIDOSDxA ~ VIDOSDxE */
> +#define VIDOSD_BASE                            (0x230)
> +
> +#define OSD_STRIDE                             (0x20)
> +
> +#define VIDOSD_A(_win)                         (VIDOSD_BASE + \
> +                                               ((_win) * OSD_STRIDE) + 0x00)
> +#define VIDOSD_B(_win)                         (VIDOSD_BASE + \
> +                                               ((_win) * OSD_STRIDE) + 0x04)
> +#define VIDOSD_C(_win)                         (VIDOSD_BASE + \
> +                                               ((_win) * OSD_STRIDE) + 0x08)
> +#define VIDOSD_D(_win)                         (VIDOSD_BASE + \
> +                                               ((_win) * OSD_STRIDE) + 0x0C)
> +#define VIDOSD_E(_win)                         (VIDOSD_BASE + \
> +                                               ((_win) * OSD_STRIDE) + 0x10)
> +
> +#define VIDOSDxA_TOPLEFT_X_MASK                        (0x1fff << 13)
> +#define VIDOSDxA_TOPLEFT_X_SHIFT               (13)
> +#define VIDOSDxA_TOPLEFT_X_LIMIT               (0x1fff)
> +#define VIDOSDxA_TOPLEFT_X(_x)                 (((_x) & 0x1fff) << 13)
> +
> +#define VIDOSDxA_TOPLEFT_Y_MASK                        (0x1fff << 0)
> +#define VIDOSDxA_TOPLEFT_Y_SHIFT               (0)
> +#define VIDOSDxA_TOPLEFT_Y_LIMIT               (0x1fff)
> +#define VIDOSDxA_TOPLEFT_Y(_x)                 (((_x) & 0x1fff) << 0)
> +
> +#define VIDOSDxB_BOTRIGHT_X_MASK               (0x1fff << 13)
> +#define VIDOSDxB_BOTRIGHT_X_SHIFT              (13)
> +#define VIDOSDxB_BOTRIGHT_X_LIMIT              (0x1fff)
> +#define VIDOSDxB_BOTRIGHT_X(_x)                        (((_x) & 0x1fff) << 13)
> +
> +#define VIDOSDxB_BOTRIGHT_Y_MASK               (0x1fff << 0)
> +#define VIDOSDxB_BOTRIGHT_Y_SHIFT              (0)
> +#define VIDOSDxB_BOTRIGHT_Y_LIMIT              (0x1fff)
> +#define VIDOSDxB_BOTRIGHT_Y(_x)                        (((_x) & 0x1fff) << 0)
> +
> +#define VIDOSDxC_ALPHA0_R_F(_x)                        (((_x) & 0xFF) << 16)
> +#define VIDOSDxC_ALPHA0_G_F(_x)                        (((_x) & 0xFF) << 8)
> +#define VIDOSDxC_ALPHA0_B_F(_x)                        (((_x) & 0xFF) << 0)
> +
> +#define VIDOSDxD_ALPHA1_R_F(_x)                        (((_x) & 0xFF) << 16)
> +#define VIDOSDxD_ALPHA1_G_F(_x)                        (((_x) & 0xFF) << 8)
> +#define VIDOSDxD_ALPHA1_B_F(_x)                        (((_x) & 0xFF) >> 0)
> +
> +/* Window MAP (Color map) */
> +#define WINxMAP(_win)                          (0x340 + ((_win) * 4))
> +
> +#define WINxMAP_MAP                            (1 << 24)
> +#define WINxMAP_MAP_COLOUR_MASK                        (0xffffff << 0)
> +#define WINxMAP_MAP_COLOUR_SHIFT               (0)
> +#define WINxMAP_MAP_COLOUR_LIMIT               (0xffffff)
> +#define WINxMAP_MAP_COLOUR(_x)                 ((_x) << 0)
> +
> +/* Window colour-key control registers */
> +#define WKEYCON                                        (0x370)
> +
> +#define WKEYCON0                               (0x00)
> +#define WKEYCON1                               (0x04)
> +#define WxKEYCON0_KEYBL_EN                     (1 << 26)
> +#define WxKEYCON0_KEYEN_F                      (1 << 25)
> +#define WxKEYCON0_DIRCON                       (1 << 24)
> +#define WxKEYCON0_COMPKEY_MASK                 (0xffffff << 0)
> +#define WxKEYCON0_COMPKEY_SHIFT                        (0)
> +#define WxKEYCON0_COMPKEY_LIMIT                        (0xffffff)
> +#define WxKEYCON0_COMPKEY(_x)                  ((_x) << 0)
> +#define WxKEYCON1_COLVAL_MASK                  (0xffffff << 0)
> +#define WxKEYCON1_COLVAL_SHIFT                 (0)
> +#define WxKEYCON1_COLVAL_LIMIT                 (0xffffff)
> +#define WxKEYCON1_COLVAL(_x)                   ((_x) << 0)
> +
> +/* color key control register for hardware window 1 ~ 4. */
> +#define WKEYCON0_BASE(x)               ((WKEYCON + WKEYCON0) + ((x - 1) * 8))
> +/* color key value register for hardware window 1 ~ 4. */
> +#define WKEYCON1_BASE(x)               ((WKEYCON + WKEYCON1) + ((x - 1) * 8))
> +
> +/* Window KEY Alpha value */
> +#define WxKEYALPHA(_win)                       (0x3A0 + (((_win) - 1) * 0x4))
> +
> +#define Wx_KEYALPHA_R_F_SHIFT                  (16)
> +#define Wx_KEYALPHA_G_F_SHIFT                  (8)
> +#define Wx_KEYALPHA_B_F_SHIFT                  (0)
> +
> +/* Blending equation */
> +#define BLENDE(_win)                           (0x03C0 + ((_win) * 4))
> +#define BLENDE_COEF_ZERO                       0x0
> +#define BLENDE_COEF_ONE                                0x1
> +#define BLENDE_COEF_ALPHA_A                    0x2
> +#define BLENDE_COEF_ONE_MINUS_ALPHA_A          0x3
> +#define BLENDE_COEF_ALPHA_B                    0x4
> +#define BLENDE_COEF_ONE_MINUS_ALPHA_B          0x5
> +#define BLENDE_COEF_ALPHA0                     0x6
> +#define BLENDE_COEF_A                          0xA
> +#define BLENDE_COEF_ONE_MINUS_A                        0xB
> +#define BLENDE_COEF_B                          0xC
> +#define BLENDE_COEF_ONE_MINUS_B                        0xD
> +#define BLENDE_Q_FUNC(_v)                      ((_v) << 18)
> +#define BLENDE_P_FUNC(_v)                      ((_v) << 12)
> +#define BLENDE_B_FUNC(_v)                      ((_v) << 6)
> +#define BLENDE_A_FUNC(_v)                      ((_v) << 0)
> +
> +/* Blending equation control */
> +#define BLENDCON                               (0x3D8)
> +#define BLENDCON_NEW_MASK                      (1 << 0)
> +#define BLENDCON_NEW_8BIT_ALPHA_VALUE          (1 << 0)
> +#define BLENDCON_NEW_4BIT_ALPHA_VALUE          (0 << 0)
> +
> +/* Interrupt control register */
> +#define VIDINTCON0                             (0x500)
> +
> +#define VIDINTCON0_WAKEUP_MASK                 (0x3f << 26)
> +#define VIDINTCON0_INTEXTRAEN                  (1 << 21)
> +
> +#define VIDINTCON0_FRAMESEL0_SHIFT             (15)
> +#define VIDINTCON0_FRAMESEL0_MASK              (0x3 << 15)
> +#define VIDINTCON0_FRAMESEL0_BACKPORCH         (0x0 << 15)
> +#define VIDINTCON0_FRAMESEL0_VSYNC             (0x1 << 15)
> +#define VIDINTCON0_FRAMESEL0_ACTIVE            (0x2 << 15)
> +#define VIDINTCON0_FRAMESEL0_FRONTPORCH                (0x3 << 15)
> +
> +#define VIDINTCON0_INT_FRAME                   (1 << 11)
> +
> +#define VIDINTCON0_FIFOLEVEL_MASK              (0x7 << 3)
> +#define VIDINTCON0_FIFOLEVEL_SHIFT             (3)
> +#define VIDINTCON0_FIFOLEVEL_EMPTY             (0x0 << 3)
> +#define VIDINTCON0_FIFOLEVEL_TO25PC            (0x1 << 3)
> +#define VIDINTCON0_FIFOLEVEL_TO50PC            (0x2 << 3)
> +#define VIDINTCON0_FIFOLEVEL_FULL              (0x4 << 3)
> +
> +#define VIDINTCON0_FIFOSEL_MAIN_EN             (1 << 1)
> +#define VIDINTCON0_INT_FIFO                    (1 << 1)
> +
> +#define VIDINTCON0_INT_ENABLE                  (1 << 0)
> +
> +/* Interrupt controls and status register */
> +#define VIDINTCON1                             (0x504)
> +
> +#define VIDINTCON1_INT_EXTRA                   (1 << 3)
> +#define VIDINTCON1_INT_I80                     (1 << 2)
> +#define VIDINTCON1_INT_FRAME                   (1 << 1)
> +#define VIDINTCON1_INT_FIFO                    (1 << 0)
> +
> +/* VIDCON1 */
> +#define VIDCON1(_x)                            (0x0600 + ((_x) * 0x50))
> +#define VIDCON1_LINECNT_GET(_v)                        (((_v) >> 17) & 0x1fff)
> +#define VIDCON1_VCLK_MASK                      (0x3 << 9)
> +#define VIDCON1_VCLK_HOLD                      (0x0 << 9)
> +#define VIDCON1_VCLK_RUN                       (0x1 << 9)
> +#define VIDCON1_VCLK_RUN_VDEN_DISABLE          (0x3 << 9)
> +#define VIDCON1_RGB_ORDER_O_MASK               (0x7 << 4)
> +#define VIDCON1_RGB_ORDER_O_RGB                        (0x0 << 4)
> +#define VIDCON1_RGB_ORDER_O_GBR                        (0x1 << 4)
> +#define VIDCON1_RGB_ORDER_O_BRG                        (0x2 << 4)
> +#define VIDCON1_RGB_ORDER_O_BGR                        (0x4 << 4)
> +#define VIDCON1_RGB_ORDER_O_RBG                        (0x5 << 4)
> +#define VIDCON1_RGB_ORDER_O_GRB                        (0x6 << 4)
> +
> +/* VIDTCON0 */
> +#define VIDTCON0                               (0x610)
> +
> +#define VIDTCON0_VBPD_MASK                     (0xffff << 16)
> +#define VIDTCON0_VBPD_SHIFT                    (16)
> +#define VIDTCON0_VBPD_LIMIT                    (0xffff)
> +#define VIDTCON0_VBPD(_x)                      ((_x) << 16)
> +
> +#define VIDTCON0_VFPD_MASK                     (0xffff << 0)
> +#define VIDTCON0_VFPD_SHIFT                    (0)
> +#define VIDTCON0_VFPD_LIMIT                    (0xffff)
> +#define VIDTCON0_VFPD(_x)                      ((_x) << 0)
> +
> +/* VIDTCON1 */
> +#define VIDTCON1                               (0x614)
> +
> +#define VIDTCON1_VSPW_MASK                     (0xffff << 16)
> +#define VIDTCON1_VSPW_SHIFT                    (16)
> +#define VIDTCON1_VSPW_LIMIT                    (0xffff)
> +#define VIDTCON1_VSPW(_x)                      ((_x) << 16)
> +
> +/* VIDTCON2 */
> +#define VIDTCON2                               (0x618)
> +
> +#define VIDTCON2_HBPD_MASK                     (0xffff << 16)
> +#define VIDTCON2_HBPD_SHIFT                    (16)
> +#define VIDTCON2_HBPD_LIMIT                    (0xffff)
> +#define VIDTCON2_HBPD(_x)                      ((_x) << 16)
> +
> +#define VIDTCON2_HFPD_MASK                     (0xffff << 0)
> +#define VIDTCON2_HFPD_SHIFT                    (0)
> +#define VIDTCON2_HFPD_LIMIT                    (0xffff)
> +#define VIDTCON2_HFPD(_x)                      ((_x) << 0)
> +
> +/* VIDTCON3 */
> +#define VIDTCON3                               (0x61C)
> +
> +#define VIDTCON3_HSPW_MASK                     (0xffff << 16)
> +#define VIDTCON3_HSPW_SHIFT                    (16)
> +#define VIDTCON3_HSPW_LIMIT                    (0xffff)
> +#define VIDTCON3_HSPW(_x)                      ((_x) << 16)
> +
> +/* VIDTCON4 */
> +#define VIDTCON4                               (0x620)
> +
> +#define VIDTCON4_LINEVAL_MASK                  (0xfff << 16)
> +#define VIDTCON4_LINEVAL_SHIFT                 (16)
> +#define VIDTCON4_LINEVAL_LIMIT                 (0xfff)
> +#define VIDTCON4_LINEVAL(_x)                   (((_x) & 0xfff) << 16)
> +
> +#define VIDTCON4_HOZVAL_MASK                   (0xfff << 0)
> +#define VIDTCON4_HOZVAL_SHIFT                  (0)
> +#define VIDTCON4_HOZVAL_LIMIT                  (0xfff)
> +#define VIDTCON4_HOZVAL(_x)                    (((_x) & 0xfff) << 0)
> +
> +/* LINECNT OP THRSHOLD*/
> +#define LINECNT_OP_THRESHOLD                   (0x630)
> +
> +/* CRCCTRL */
> +#define CRCCTRL                                        (0x6C8)
> +#define CRCCTRL_CRCCLKEN                       (0x1 << 2)
> +#define CRCCTRL_CRCSTART_F                     (0x1 << 1)
> +#define CRCCTRL_CRCEN                          (0x1 << 0)
> +
> +/* DECON_CMU */
> +#define DECON_CMU                              (0x704)
> +
> +#define DECON_CMU_ALL_CLKGATE_ENABLE           (0x3)
> +#define DECON_CMU_SE_CLKGATE_ENABLE            (0x1 << 2)
> +#define DECON_CMU_SFR_CLKGATE_ENABLE           (0x1 << 1)
> +#define DECON_CMU_MEM_CLKGATE_ENABLE           (0x1 << 0)
> +
> +/* DECON_UPDATE */
> +#define DECON_UPDATE                           (0x710)
> +
> +#define DECON_UPDATE_SLAVE_SYNC                        (1 << 4)
> +#define DECON_UPDATE_STANDALONE_F              (1 << 0)
> --
> 1.7.9.5
>
