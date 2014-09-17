From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/2] drm/exynos: use drm generic mmap interface
Date: Wed, 17 Sep 2014 17:18:20 +0200
Message-ID: <20140917151820.GG31703@phenom.ffwll.local>
References: <1410961726-2533-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1410961726-2533-1-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 17, 2014 at 10:48:44PM +0900, Inki Dae wrote:
> This patch set removes unnecessary DRM_EXYNOS_GEM_MAP_OFFSET interface
> which isn't used anymore and also uses drm generic mmap interface
> instead of a mmap interface specific to Exynos drm. So this patch set
> removes a existing mmap interface and relevant codes specific to Exynos
> drm.
> 
> Inki Dae (2):
>   drm/exynos: remove DRM_EXYNOS_GEM_MAP_OFFSET ioctl
>   drm/exynos: use drm generic mmap interface

Thanks for doing this. Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
-Daniel

> 
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |   28 ---------
>  drivers/gpu/drm/exynos/exynos_drm_drv.h |    1 -
>  drivers/gpu/drm/exynos/exynos_drm_gem.c |  101 +++++--------------------------
>  drivers/gpu/drm/exynos/exynos_drm_gem.h |   14 -----
>  include/uapi/drm/exynos_drm.h           |   40 ------------
>  5 files changed, 14 insertions(+), 170 deletions(-)
> 
> -- 
> 1.7.9.5
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
