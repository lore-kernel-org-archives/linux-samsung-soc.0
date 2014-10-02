From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix vblank handling during dpms off
Date: Thu, 02 Oct 2014 17:58:52 +0900
Message-ID: <542D13CC.5000304@samsung.com>
References: <542B9A0E.7020206@samsung.com>
 <1412151287-12845-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1412151287-12845-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrzej,

On 10/01/2014 05:14 PM, Andrzej Hajda wrote:
> The patch disables vblanks during dpms off only if pagefilp has
> not been finished. It also replaces drm_vblank_off with drm_crtc_vblank_put.
> It fixes issue with page_flip ioctl not being able to acquire vblank counter.

This problem isn't related with pageflip, it just causes from
7ffd7a68511c710b84db3548a1997fd2625f580a commit (drm: Always reject
drm_vblank_get() after drm_vblank_off()).

We need to use drm_vblank_on() as a counterpart to drm_vblank_off()
after the commit .

How about below patch?

>From 6de01473746af225c688ee430123001d57d9af2a Mon Sep 17 00:00:00 2001
From: Joonyoung Shim <jy0922.shim@samsung.com>
Date: Thu, 2 Oct 2014 17:48:27 +0900
Subject: [PATCH] drm/exynos: use drm_vblank_on()

We need to use drm_vblank_on() as a counterpart to drm_vblank_off()
after the commit 7ffd7a68511c ("drm: Always reject drm_vblank_get()
after drm_vblank_off()"). If not, drm_vblank_get() will be failed
always after drm_vblank_off().

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 8e38e9f..dfa209a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -71,7 +71,6 @@ static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
 				!atomic_read(&exynos_crtc->pending_flip),
 				HZ/20))
 			atomic_set(&exynos_crtc->pending_flip, 0);
-		drm_vblank_off(crtc->dev, exynos_crtc->pipe);
 	}
 
 	if (manager->ops->dpms)
@@ -90,6 +89,7 @@ static void exynos_drm_crtc_commit(struct drm_crtc *crtc)
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 	struct exynos_drm_manager *manager = exynos_crtc->manager;
 
+	drm_vblank_on(crtc->dev, exynos_crtc->pipe);
 	exynos_drm_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
 
 	exynos_plane_commit(crtc->primary);
@@ -177,10 +177,12 @@ static int exynos_drm_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 
 static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
 {
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 	struct drm_plane *plane;
 	int ret;
 
 	exynos_drm_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
+	drm_vblank_off(crtc->dev, exynos_crtc->pipe);
 
 	drm_for_each_legacy_plane(plane, &crtc->dev->mode_config.plane_list) {
 		if (plane->crtc != crtc)
-- 
1.9.1

Thanks.

> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
> Hi Inki,
> 
> This is fix (or just workaround) of the problem you have reported.
> Please carefully verify it, as I am not familiar with pageflip code.
> 
> Regards
> Andrzej
> ---
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> index 8e38e9f..57fa94d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> @@ -69,9 +69,10 @@ static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
>  		/* wait for the completion of page flip. */
>  		if (!wait_event_timeout(exynos_crtc->pending_flip_queue,
>  				!atomic_read(&exynos_crtc->pending_flip),
> -				HZ/20))
> +				HZ/20)) {
>  			atomic_set(&exynos_crtc->pending_flip, 0);
> -		drm_vblank_off(crtc->dev, exynos_crtc->pipe);
> +			drm_crtc_vblank_put(crtc);
> +		}
>  	}
>  
>  	if (manager->ops->dpms)
> 
