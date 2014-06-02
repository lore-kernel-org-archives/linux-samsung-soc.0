From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/exynos: remove hardware overlays disable from fimd
 probe
Date: Mon, 02 Jun 2014 11:11:32 +0200
Message-ID: <538C3FC4.6090509@samsung.com>
References: <1401257471-31994-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1401257471-31994-1-git-send-email-rahul.sharma@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rahul Sharma <rahul.sharma@samsung.com>, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, joshi@samsung.com, linux-samsung-soc@vger.kernel.org, "Szyprowski, Marek" <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Rahul,

On 05/28/2014 08:11 AM, Rahul Sharma wrote:
> System hangs when FIMD registers are accessed to disable
> hardware overlays. This is because of the clocks which are
> not enabled before register access.
> 
> 'Hardware overlay disable' is cleaned from the FIMD probe.
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>

This patch causes regression on some exynos4210-universal_c210 devices,
everything works expect colors are incorrect - it seems blue component
is very dark, almost black.

Regards
Andrzej

> ---
> Based on exynos-drm-next branch.
> 
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |   17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index bd30d0c..2ec634f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -703,19 +703,6 @@ static void fimd_win_disable(struct exynos_drm_manager *mgr, int zpos)
>  	win_data->enabled = false;
>  }
>  
> -static void fimd_clear_win(struct fimd_context *ctx, int win)
> -{
> -	writel(0, ctx->regs + WINCON(win));
> -	writel(0, ctx->regs + VIDOSD_A(win));
> -	writel(0, ctx->regs + VIDOSD_B(win));
> -	writel(0, ctx->regs + VIDOSD_C(win));
> -
> -	if (win == 1 || win == 2)
> -		writel(0, ctx->regs + VIDOSD_D(win));
> -
> -	fimd_shadow_protect_win(ctx, win, false);
> -}
> -
>  static void fimd_window_suspend(struct exynos_drm_manager *mgr)
>  {
>  	struct fimd_context *ctx = mgr->ctx;
> @@ -898,16 +885,12 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
>  {
>  	struct fimd_context *ctx = fimd_manager.ctx;
>  	struct drm_device *drm_dev = data;
> -	int win;
>  
>  	fimd_mgr_initialize(&fimd_manager, drm_dev);
>  	exynos_drm_crtc_create(&fimd_manager);
>  	if (ctx->display)
>  		exynos_drm_create_enc_conn(drm_dev, ctx->display);
>  
> -	for (win = 0; win < WINDOWS_NR; win++)
> -		fimd_clear_win(ctx, win);
> -
>  	return 0;
>  
>  }
> 
