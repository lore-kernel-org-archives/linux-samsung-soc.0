From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [RFC] drm/exynos: abort commit when framebuffer is removed from plane
Date: Tue, 8 Jul 2014 15:33:25 +0530
Message-ID: <CAPdUM4PkQtjkPAZ3Bww7U0pt2YgfvHHg5C6oA1UfW85BwvBn9w@mail.gmail.com>
References: <1403190809-8413-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:62894 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753041AbaGHKD0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 06:03:26 -0400
Received: by mail-wg0-f47.google.com with SMTP id y10so314298wgg.30
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Jul 2014 03:03:25 -0700 (PDT)
In-Reply-To: <1403190809-8413-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, Rahul Sharma <rahul.sharma@samsung.com>

Hi Inki,

What do you think about the following fix? I need your inputs for this.

Regards,
Rahul Sharma


On 19 June 2014 20:43, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> This situation arises when userspace remove the frambuffer object
> and call setmode ioctl.
>
> drm_mode_rmfb --> drm_plane_force_disable --> plane->crtc = NULL;
> and
> drm_mode_setcrtc --> exynos_plane_commit --> passes plane->crtc to
> exynos_drm_crtc_plane_commit which is NULL.
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
