From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 01/18] drm/exynos: dsi: move the EoT packets configuration
 point
Date: Tue, 20 May 2014 11:50:33 +0200
Message-ID: <537B2569.8010805@samsung.com>
References: <1400048825-6052-1-git-send-email-yj44.cho@samsung.com>
 <1400048825-6052-2-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1400048825-6052-2-git-send-email-yj44.cho@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YoungJun Cho <yj44.cho@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com, s.trumtrar@pengutronix.de
List-Id: linux-samsung-soc@vger.kernel.org

On 05/14/2014 08:26 AM, YoungJun Cho wrote:
> This configuration could be used in MIPI DSI command mode also.
>
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 84661fe..0a4e3ce 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -473,8 +473,6 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
>  
>  		if (!(dsi->mode_flags & MIPI_DSI_MODE_VSYNC_FLUSH))
>  			reg |= DSIM_MFLUSH_VS;
> -		if (!(dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
> -			reg |= DSIM_EOT_DISABLE;
>  		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
>  			reg |= DSIM_SYNC_INFORM;
>  		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> @@ -491,6 +489,9 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
>  			reg |= DSIM_HSA_MODE;
>  	}
>  
> +	if (!(dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
> +		reg |= DSIM_EOT_DISABLE;
> +
>  	switch (dsi->format) {
>  	case MIPI_DSI_FMT_RGB888:
>  		reg |= DSIM_MAIN_PIX_FORMAT_RGB888;
