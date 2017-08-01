From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 4/7] drm/exynos: propagate info about command mode from
 panel
Date: Tue, 01 Aug 2017 18:49:33 +0900
Message-ID: <59804EAD.5020009@samsung.com>
References: <1492519203-23537-1-git-send-email-a.hajda@samsung.com>
        <CGME20170418124013eucas1p15b1db76e79fb76f825be90793525c9b3@eucas1p1.samsung.com>
        <1492519203-23537-5-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48138 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751056AbdHAJth (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Aug 2017 05:49:37 -0400
In-reply-to: <1492519203-23537-5-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org



2017년 04월 18일 21:40에 Andrzej Hajda 이(가) 쓴 글:
> mipi_dsi framework provides information about panel's mode of work.
> This info should be propagated upstream to configure all elements of
> the pipeline. As CRTC is the common nominator of the pipeline we can put
> such info into its structures.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.h | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> index 527bf1d..96b9d49 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -165,6 +165,7 @@ struct exynos_drm_crtc {
>  	const struct exynos_drm_crtc_ops	*ops;
>  	void				*ctx;
>  	struct exynos_drm_clk		*pipe_clk;
> +	bool				i80_mode : 1;
>  };
>  
>  static inline void exynos_drm_pipe_clk_enable(struct exynos_drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 515090f..79df1c9 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1545,6 +1545,8 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>  		drm_panel_attach(dsi->panel, &dsi->connector);
>  		dsi->connector.status = connector_status_connected;
>  	}
> +	exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
> +			!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);

No place to use i80_mode in this patch. Seems this patch, patch 5 and portion of using i80_mode in patch 6 should become one patch. 

Thanks,
Inki Dae

>  
>  	mutex_unlock(&drm->mode_config.mutex);
>  
> 
