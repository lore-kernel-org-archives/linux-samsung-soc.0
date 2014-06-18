From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] drm/exynos: dpi: Fix NULL pointer dereference with legacy
 bindings
Date: Wed, 18 Jun 2014 10:07:48 +0900
Message-ID: <004d01cf8a91$b8b849d0$2a28dd70$%han@samsung.com>
References: <1402433877-10867-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:14224 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755054AbaFRBHv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jun 2014 21:07:51 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7C00G05B51SHC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Jun 2014 10:07:49 +0900 (KST)
In-reply-to: <1402433877-10867-1-git-send-email-tomasz.figa@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Inki Dae' <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 'Andrzej Hajda' <a.hajda@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Wednesday, June 11, 2014 5:58 AM, Tomasz Figa wrote:
> 
> If there is no panel node in DT and instead display timings are provided
> directly in FIMD node, there is no panel object created and ctx->panel
> becomes NULL. However during Exynos DRM initialization
> drm_helper_hpd_irq_event() is called, which in turns calls
> exynos_dpi_detect(), which dereferences ctx->panel without a check,
> causing a NULL pointer derefrence.
> 
> This patch fixes the issue by adding necessary NULL pointer check.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

(+cc Inki Dae)

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> index f1b8587..f44bd90 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> @@ -40,7 +40,7 @@ exynos_dpi_detect(struct drm_connector *connector, bool force)
>  {
>  	struct exynos_dpi *ctx = connector_to_dpi(connector);
> 
> -	if (!ctx->panel->connector)
> +	if (ctx->panel && !ctx->panel->connector)
>  		drm_panel_attach(ctx->panel, &ctx->connector);
> 
>  	return connector_status_connected;
> --
