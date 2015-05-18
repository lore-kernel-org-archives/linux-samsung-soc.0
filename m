From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: drm/exynos: Add atomic modesetting support
Date: Mon, 18 May 2015 16:51:01 -0300
Message-ID: <20150518195101.GA18856@joana>
References: <10cea26ae89c8bf2f26c2d258dcabd3a@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f170.google.com ([209.85.216.170]:35624 "EHLO
	mail-qc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754525AbbERTvH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 May 2015 15:51:07 -0400
Received: by qcbgu10 with SMTP id gu10so94470274qcb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2015 12:51:06 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <10cea26ae89c8bf2f26c2d258dcabd3a@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, liquid.acid@gmx.net

Hi Tobias,

2015-05-15 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:

> Hello,
> 
> I did another run with drm.debug=0xff and also tried to figure out where the
> div-by-zero comes from.
> 
> The only division I see is in fimd_calc_clkdiv() (which is called by
> fimd_commit()). So it looks like 'ideal_clk' is zero when calling
> DIV_ROUND_UP().
> 
> 'htotal' and 'vtotal' can't be zero, since this is checked early in
> fimd_commit(). So 'vrefresh' has to be zero. Maybe this helps?

What is is the output when you run with this patch:

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 12ab80c..f5d215d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -310,6 +310,8 @@ static u32 fimd_calc_clkdiv(struct fimd_context *ctx,
        unsigned long ideal_clk = mode->htotal * mode->vtotal * mode->vrefresh;
        u32 clkdiv;
 
+       DRM_DEBUG_KMS("vrefresh %d\n", mode->vrefresh);
+
        if (ctx->i80_if) {
                /*
                 * The frame done interrupt should be occurred prior to the
@@ -328,6 +330,7 @@ static bool fimd_mode_fixup(struct exynos_drm_crtc *crtc,
                const struct drm_display_mode *mode,
                struct drm_display_mode *adjusted_mode)
 {
+       DRM_DEBUG_KMS("vrefresh %d\n", adjusted_mode->vrefresh);
        if (adjusted_mode->vrefresh == 0)
                adjusted_mode->vrefresh = FIMD_DEFAULT_FRAMERATE;
 
