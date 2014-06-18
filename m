From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] drm/exynos: dpi: Fix NULL pointer dereference with legacy
 bindings
Date: Wed, 18 Jun 2014 02:09:32 +0200
Message-ID: <53A0D8BC.7050607@gmail.com>
References: <1402433877-10867-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1402433877-10867-1-git-send-email-tomasz.figa@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 10.06.2014 22:57, Tomasz Figa wrote:
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
> 

Ping.

Best regards,
Tomasz
