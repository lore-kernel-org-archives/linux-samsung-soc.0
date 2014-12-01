From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH V2] drm/exynos: Add DECON driver
Date: Mon, 1 Dec 2014 13:36:49 +0530
Message-ID: <CAGcde9E26iJdOusOeJDP65fmhQ98-KALYLkU3qur6ifToRvq_w@mail.gmail.com>
References: <1417173337-27862-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:43863 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752390AbaLAIHK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Dec 2014 03:07:10 -0500
In-Reply-To: <1417173337-27862-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, jy0922.shim@samsung.com, jg1.han@samsung.com, Sean Paul <seanpaul@google.com>, Ajay kumar <ajaynumb@gmail.com>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Akshu Agrawal <akshua@gmail.com>

Hi Ajay,

On 28 November 2014 at 16:45, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
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
> Signed-off-by: Akshu Agrawal <akshua@gmail.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
> Changes since V1:
>         -- Address comments from Pankaj and do few cleanups.
>

Thanks, but still I can see this needs modification, please see my comments:

>  .../devicetree/bindings/video/exynos7-decon.txt    |   67 ++
>  drivers/gpu/drm/exynos/Kconfig                     |   13 +-
>  drivers/gpu/drm/exynos/Makefile                    |    1 +
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c         | 1037 ++++++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_drv.c            |    4 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.h            |    1 +
>  include/video/exynos7_decon.h                      |  346 +++++++
>  7 files changed, 1466 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/video/exynos7-decon.txt
>  create mode 100644 drivers/gpu/drm/exynos/exynos7_drm_decon.c
>  create mode 100644 include/video/exynos7_decon.h
>

[snip]

> +static int decon_mgr_initialize(struct exynos_drm_manager *mgr,
> +                       struct drm_device *drm_dev)
> +{
> +       struct decon_context *ctx = mgr_to_decon(mgr);
> +       struct exynos_drm_private *priv = drm_dev->dev_private;
> +       int ret;
> +
> +       mgr->drm_dev = drm_dev;
> +       mgr->pipe = ctx->pipe = priv->pipe++;
> +

Do we really need 'pipe' in exynos_drm_manager and decon_context both?

> +       /* attach this sub driver to iommu mapping if supported. */
> +       if (is_drm_iommu_supported(mgr->drm_dev)) {

[snip]

> +static void decon_win_mode_set(struct exynos_drm_manager *mgr,
> +                       struct exynos_drm_overlay *overlay)
> +{
> +       struct decon_context *ctx = mgr_to_decon(mgr);
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

As I mentioned in V1, since these 5 lines are getting repeating better
we move it in one static function. It will help in reducing code
footprint.


[snip]

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

How about using SHADOWCON directly instead of using local variable?

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
> +       struct decon_context *ctx = mgr_to_decon(mgr);
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

[snip]

> +static int decon_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct decon_context *ctx;
> +       struct resource *res;
> +       int ret = -EINVAL;
> +
> +       if (!dev->of_node)
> +               return -ENODEV;
> +
> +       ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +       if (!ctx)
> +               return -ENOMEM;
> +
> +       ctx->manager.type = EXYNOS_DISPLAY_TYPE_LCD;
> +       ctx->manager.ops = &decon_manager_ops;
> +
> +       ret = exynos_drm_component_add(dev, EXYNOS_DEVICE_TYPE_CRTC,
> +                                       ctx->manager.type);
> +       if (ret)
> +               return ret;
> +
> +       ctx->dev = dev;
> +       ctx->suspended = true;
> +
> +       ctx->pclk = devm_clk_get(dev, "pclk_decon0");
> +       if (IS_ERR(ctx->pclk)) {
> +               dev_err(dev, "failed to get bus clock pclk\n");
> +               ret = PTR_ERR(ctx->pclk);
> +               goto err_del_component;
> +       }
> +
> +       ctx->aclk = devm_clk_get(dev, "aclk_decon0");
> +       if (IS_ERR(ctx->aclk)) {
> +               dev_err(dev, "failed to get bus clock aclk\n");
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
> +       ctx->regs = of_iomap(dev->of_node, 0);

This is OK, but we should handle unmapping of ctx->regs in error
conditions below.

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
> +       platform_set_drvdata(pdev, ctx);
> +
> +       ctx->display = exynos_dpi_probe(dev);
> +       if (IS_ERR(ctx->display)) {
> +               ret = PTR_ERR(ctx->display);
> +               goto err_del_component;
> +       }
> +
> +       pm_runtime_enable(dev);
> +
> +       ret = component_add(dev, &decon_component_ops);
> +       if (ret)
> +               goto err_disable_pm_runtime;
> +
> +       return ret;
> +
> +err_disable_pm_runtime:
> +       pm_runtime_disable(dev);
> +
> +err_del_component:
> +       exynos_drm_component_del(dev, EXYNOS_DEVICE_TYPE_CRTC);
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

This is no more required.

> +               .of_match_table = decon_driver_dt_match,
> +       },
> +};
> --

Thanks,
Pankaj Dubey

> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
