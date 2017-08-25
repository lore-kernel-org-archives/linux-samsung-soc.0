From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 08/10] drm/exynos/decon5433: use mode info stored in
 CRTC to detect i80 mode
Date: Fri, 25 Aug 2017 11:15:08 +0900
Message-ID: <599F882C.20507@samsung.com>
References: <1503581639-580-1-git-send-email-a.hajda@samsung.com>
        <CGME20170824133411eucas1p1601aabfcb12d8ae39f5b6400d16da99e@eucas1p1.samsung.com>
        <1503581639-580-9-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14725 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754191AbdHYCPM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 22:15:12 -0400
In-reply-to: <1503581639-580-9-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>



2017년 08월 24일 22:33에 Andrzej Hajda 이(가) 쓴 글:
> Since panel's mode of work is propagated properly from panel to DECON,
> there is no need to use redundant private device tree property.
> The only issue with such approach is that check for required interrupts
> should be postponed until panel communicate its requirements, ie to
> mode validation phase - mode_valid callback.

Same patch will be required for other Exynos SoCs for consistency later.


Thanks,
Inki Dae

> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 40 +++++++++++++++++----------
>  1 file changed, 25 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index 0f5acce..da183e0 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -34,9 +34,8 @@
>  #define WINDOWS_NR	3
>  #define MIN_FB_WIDTH_FOR_16WORD_BURST	128
>  
> -#define IFTYPE_I80	(1 << 0)
> -#define I80_HW_TRG	(1 << 1)
> -#define IFTYPE_HDMI	(1 << 2)
> +#define I80_HW_TRG	(1 << 0)
> +#define IFTYPE_HDMI	(1 << 1)
>  
>  static const char * const decon_clks_name[] = {
>  	"pclk",
> @@ -93,7 +92,7 @@ static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
>  	u32 val;
>  
>  	val = VIDINTCON0_INTEN;
> -	if (ctx->out_type & IFTYPE_I80)
> +	if (crtc->i80_mode)
>  		val |= VIDINTCON0_FRAMEDONE;
>  	else
>  		val |= VIDINTCON0_INTFRMEN | VIDINTCON0_FRAMESEL_FP;
> @@ -142,7 +141,7 @@ static u32 decon_get_frame_count(struct decon_context *ctx, bool end)
>  
>  	switch (status & (VIDCON1_VSTATUS_MASK | VIDCON1_I80_ACTIVE)) {
>  	case VIDCON1_VSTATUS_VS:
> -		if (!(ctx->out_type & IFTYPE_I80))
> +		if (!(ctx->crtc->i80_mode))
>  			--frm;
>  		break;
>  	case VIDCON1_VSTATUS_BP:
> @@ -169,7 +168,7 @@ static u32 decon_get_vblank_counter(struct exynos_drm_crtc *crtc)
>  
>  static void decon_setup_trigger(struct decon_context *ctx)
>  {
> -	if (!(ctx->out_type & (IFTYPE_I80 | I80_HW_TRG)))
> +	if (!ctx->crtc->i80_mode && !(ctx->out_type & I80_HW_TRG))
>  		return;
>  
>  	if (!(ctx->out_type & I80_HW_TRG)) {
> @@ -209,7 +208,7 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
>  	val = VIDOUT_LCD_ON;
>  	if (interlaced)
>  		val |= VIDOUT_INTERLACE_EN_F;
> -	if (ctx->out_type & IFTYPE_I80) {
> +	if (crtc->i80_mode) {
>  		val |= VIDOUT_COMMAND_IF;
>  	} else {
>  		val |= VIDOUT_RGB_IF;
> @@ -225,7 +224,7 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
>  			VIDTCON2_HOZVAL(m->hdisplay - 1);
>  	writel(val, ctx->addr + DECON_VIDTCON2);
>  
> -	if (!(ctx->out_type & IFTYPE_I80)) {
> +	if (!crtc->i80_mode) {
>  		int vbp = m->crtc_vtotal - m->crtc_vsync_end;
>  		int vfp = m->crtc_vsync_start - m->crtc_vdisplay;
>  
> @@ -513,6 +512,22 @@ static void decon_clear_channels(struct exynos_drm_crtc *crtc)
>  		clk_disable_unprepare(ctx->clks[i]);
>  }
>  
> +static enum drm_mode_status decon_mode_valid(struct exynos_drm_crtc *crtc,
> +		const struct drm_display_mode *mode)
> +{
> +	struct decon_context *ctx = crtc->ctx;
> +
> +	ctx->irq = crtc->i80_mode ? ctx->irq_lcd_sys : ctx->irq_vsync;
> +
> +	if (ctx->irq)
> +		return MODE_OK;
> +
> +	dev_info(ctx->dev, "Sink requires %s mode, but appropriate interrupt is not provided.\n",
> +			crtc->i80_mode ? "command" : "video");
> +
> +	return MODE_BAD;
> +}
> +
>  static const struct exynos_drm_crtc_ops decon_crtc_ops = {
>  	.enable			= decon_enable,
>  	.disable		= decon_disable,
> @@ -522,6 +537,7 @@ static const struct exynos_drm_crtc_ops decon_crtc_ops = {
>  	.atomic_begin		= decon_atomic_begin,
>  	.update_plane		= decon_update_plane,
>  	.disable_plane		= decon_disable_plane,
> +	.mode_valid		= decon_mode_valid,
>  	.atomic_flush		= decon_atomic_flush,
>  };
>  
> @@ -715,11 +731,8 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
>  	ctx->out_type = (unsigned long)of_device_get_match_data(dev);
>  	spin_lock_init(&ctx->vblank_lock);
>  
> -	if (ctx->out_type & IFTYPE_HDMI) {
> +	if (ctx->out_type & IFTYPE_HDMI)
>  		ctx->first_win = 1;
> -	} else if (of_get_child_by_name(dev->of_node, "i80-if-timings")) {
> -		ctx->out_type |= IFTYPE_I80;
> -	}
>  
>  	for (i = 0; i < ARRAY_SIZE(decon_clks_name); i++) {
>  		struct clk *clk;
> @@ -753,9 +766,6 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
>  		return ret;
>  	ctx->irq_lcd_sys = ret;
>  
> -	ctx->irq = (ctx->out_type & IFTYPE_I80) ? ctx->irq_lcd_sys
> -						: ctx->irq_vsync;
> -
>  	ret = decon_conf_irq(ctx, "te", decon_te_irq_handler,
>  			IRQF_TRIGGER_RISING);
>  	if (ret < 0)
> 
