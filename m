From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC PATCH 11/11] drm: exynos: mixer: Add interconnect support
Date: Wed, 24 Jul 2019 20:52:34 +0200
Message-ID: <20190724185234.GB14346@kozik-lap>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122029eucas1p2915f536d9ef43a7bd043a878a553439f@eucas1p2.samsung.com>
 <20190723122016.30279-12-a.swigon@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190723122016.30279-12-a.swigon@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jul 23, 2019 at 02:20:16PM +0200, Artur Świgoń wrote:
> From: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> This patch adds interconnect support to exynos-mixer. Please note that the
> mixer works the same as before when CONFIG_INTERCONNECT is 'n'.
> 
> Co-developed-by: Artur Świgoń <a.swigon@partner.samsung.com>
> Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 68 +++++++++++++++++++++++++--
>  1 file changed, 63 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 7b24338fad3c..fb763854b300 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -13,6 +13,7 @@
>  #include <linux/component.h>
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
> +#include <linux/interconnect.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/kernel.h>
> @@ -97,6 +98,7 @@ struct mixer_context {
>  	struct exynos_drm_crtc	*crtc;
>  	struct exynos_drm_plane	planes[MIXER_WIN_NR];
>  	unsigned long		flags;
> +	struct icc_path		*soc_path;
>  
>  	int			irq;
>  	void __iomem		*mixer_regs;
> @@ -931,6 +933,37 @@ static void mixer_disable_vblank(struct exynos_drm_crtc *crtc)
>  	mixer_reg_writemask(mixer_ctx, MXR_INT_EN, 0, MXR_INT_EN_VSYNC);
>  }
>  
> +static void mixer_set_memory_bandwidth(struct exynos_drm_crtc *crtc)
> +{
> +	struct drm_display_mode *mode = &crtc->base.state->adjusted_mode;
> +	struct mixer_context *ctx = crtc->ctx;
> +	unsigned long bw, bandwidth = 0;
> +	int i, j, sub;
> +

Early exit if !ctx->soc_path, no need to figure out the bandwidth.
Optionally check it before calling mixer_set_memory_bandwidth() - should
not hurt readability.

> +	for (i = 0; i < MIXER_WIN_NR; i++) {
> +		struct drm_plane *plane = &ctx->planes[i].base;
> +		const struct drm_format_info *format;
> +
> +		if (plane->state && plane->state->crtc && plane->state->fb) {
> +			format = plane->state->fb->format;
> +			bw = mode->hdisplay * mode->vdisplay *
> +							drm_mode_vrefresh(mode);
> +			if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> +				bw /= 2;
> +			for (j = 0; j < format->num_planes; j++) {
> +				sub = j ? (format->vsub * format->hsub) : 1;
> +				bandwidth += format->cpp[j] * bw / sub;
> +			}
> +		}
> +	}
> +
> +	/* add 20% safety margin */
> +	bandwidth = 5UL * bandwidth / 4;
> +
> +	pr_info("exynos-mixer: safe bandwidth %ld Bps\n", bandwidth);

dev_dbg()

Best regards,
Krzysztof
