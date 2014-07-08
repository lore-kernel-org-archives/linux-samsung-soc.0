From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [RFC] drm/exynos: abort commit when framebuffer is removed from
 plane
Date: Wed, 9 Jul 2014 00:55:20 +0900
Message-ID: <CAAQKjZMwVGHrrWNxn9ShrkZcnouOEhrH4kfCv9b3n4Zt1+vGqg@mail.gmail.com>
References: <1403190809-8413-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1403190809-8413-1-git-send-email-rahul.sharma@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, joshi@samsung.com, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

2014-06-20 0:13 GMT+09:00 Rahul Sharma <rahul.sharma@samsung.com>:
> This situation arises when userspace remove the frambuffer object
> and call setmode ioctl.
>
> drm_mode_rmfb --> drm_plane_force_disable --> plane->crtc = NULL;
> and
> drm_mode_setcrtc --> exynos_plane_commit --> passes plane->crtc to
> exynos_drm_crtc_plane_commit which is NULL.

If user process requested drm_mode_rmfb with a fb_id, fb object to the
fb_id must be removed from crtc_idr table. So drm_mode_setcrtc should
be failed because there is no the fb object in the crtc_idr table
anymore.
I cannot understand how exynos_drm_crtc_plane_commit function could be
called. Can you give me more details?

Thanks,
Inki Dae

>
> This crashes the system.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
> This works fine but I am not confident on the correctness of the
> solution.
>
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c |    6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> index 95c9435..da4efe4 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> @@ -165,6 +165,12 @@ static int exynos_drm_crtc_mode_set_commit(struct drm_crtc *crtc, int x, int y,
>                 return -EPERM;
>         }
>
> +       /* when framebuffer is removed, commit should not proceed. */
> +       if(!plane->fb){
> +               DRM_ERROR("framebuffer has been removed from plane.\n");
> +               return -EFAULT;
> +       }
> +
>         crtc_w = crtc->primary->fb->width - x;
>         crtc_h = crtc->primary->fb->height - y;
>
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
