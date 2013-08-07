From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH v4] drm/exynos: Add fallback option to get non physically
 contiguous memory for fb
Date: Wed, 07 Aug 2013 13:48:11 +0900
Message-ID: <010d01ce9329$51942a90$f4bc7fb0$%dae@samsung.com>
References: <1375789924-10515-1-git-send-email-vikas.sajjan@linaro.org>
 <CAK9yfHya4a2Wxofs8wMpkgY5MWxqpseL65u9QqOLuVb2a_26LA@mail.gmail.com>
 <CAGm_ybhocw7WhVfV9FVP-H9M6sh6-6vfiZD+d50eN9kbthRa4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49185 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752560Ab3HGEsN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 00:48:13 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MR5003SN9C3QTM0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Aug 2013 13:48:11 +0900 (KST)
In-reply-to: <CAGm_ybhocw7WhVfV9FVP-H9M6sh6-6vfiZD+d50eN9kbthRa4w@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vikas Sajjan' <sajjan.linux@gmail.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: 'Vikas Sajjan' <vikas.sajjan@linaro.org>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, dri-devel@lists.freedesktop.org, 'Kukjin Kim' <kgene.kim@samsung.com>, s.nawrocki@samsung.com, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Rob Clark' <robdclark@gmail.com>, arun.kk@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org, 'sunil joshi' <joshi@samsung.com>



> -----Original Message-----
> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-soc-
> owner@vger.kernel.org] On Behalf Of Vikas Sajjan
> Sent: Wednesday, August 07, 2013 1:11 PM
> To: Sachin Kamat
> Cc: Vikas Sajjan; linux-samsung-soc; dri-devel@lists.freedesktop.org;
> Kukjin Kim; InKi Dae; s.nawrocki@samsung.com; Marek Szyprowski; Tomasz
> Figa; Rob Clark; arun.kk@samsung.com; patches@linaro.org; linaro-
> kernel@lists.linaro.org; sunil joshi
> Subject: Re: [PATCH v4] drm/exynos: Add fallback option to get non
> physically contiguous memory for fb
> 
> Hi Inki,
> 
> On Tue, Aug 6, 2013 at 5:27 PM, Sachin Kamat <sachin.kamat@linaro.org>
> wrote:
> > On 6 August 2013 17:22, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> >> While trying to get boot-logo up on exynos5420 SMDK which has eDP panel
> >> connected with resolution 2560x1600, following error occured even with
> >> IOMMU enabled:
> >> [0.880000] [drm:lowlevel_buffer_allocate] *ERROR* failed to allocate
> buffer.
> >> [0.890000] [drm] Initialized exynos 1.0.0 20110530 on minor 0
> >>
> >> To address the cases where physically contiguous memory MAY NOT be a
> >> mandatory requirement for fb, the patch adds a feature to get non
> physically
> >> contiguous memory for fb if physically contiguous memory allocation
> fails
> >> and if IOMMU is supported.
> >>
> >> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> >> Signed-off-by: Arun Kumar <arun.kk@samsung.com>
> >> Reviewed-by: Rob Clark <robdclark@gmail.com>
> >> ---
> >> changes since v3:
> >>         - addressed nits pointed out by Sylwester Nawrocki
> <s.nawrocki@samsung.com>
> >>         and Sachin Kamat <sachin.kamat@linaro.org>.
> >>
> >> changes since v2:
> >>         - addressed comments given by Tomasz Figa
<tomasz.figa@gmail.com>.
> >>
> >> changes since v1:
> >>          - Modified to add the fallback patch if CONTIG alloc fails as
> suggested
> >>          by Rob Clark robdclark@gmail.com and Tomasz Figa
> <tomasz.figa@gmail.com>.
> >>
> >>          - changed the commit message.
> >> ---
> >>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c |   15 +++++++++++++--
> >>  1 file changed, 13 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> >> index 8e60bd6..5292fc7 100644
> >> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> >> @@ -16,6 +16,7 @@
> >>  #include <drm/drm_crtc.h>
> >>  #include <drm/drm_fb_helper.h>
> >>  #include <drm/drm_crtc_helper.h>
> >> +#include <drm/exynos_drm.h>
> >>
> >>  #include "exynos_drm_drv.h"
> >>  #include "exynos_drm_fb.h"
> >> @@ -165,8 +166,18 @@ static int exynos_drm_fbdev_create(struct
> drm_fb_helper *helper,
> >>
> >>         size = mode_cmd.pitches[0] * mode_cmd.height;
> >>
> >> -       /* 0 means to allocate physically continuous memory */
> >> -       exynos_gem_obj = exynos_drm_gem_create(dev, 0, size);
> >> +       exynos_gem_obj = exynos_drm_gem_create(dev, EXYNOS_BO_CONTIG,
> size);
> >> +       /*
> >> +        * If physically contiguous memory allocation fails and if
IOMMU
> is
> >> +        * supported then try to get buffer from non physically
> contiguous
> >> +        * memory area.
> >> +        */
> >> +       if (IS_ERR(exynos_gem_obj) && is_drm_iommu_supported(dev)) {
> >> +               dev_warn(&pdev->dev, "contiguous FB allocation failed,
> falling back to non-contiguous\n");
> >> +               exynos_gem_obj = exynos_drm_gem_create(dev,
> EXYNOS_BO_NONCONTIG,
> >> +                                                       size);
> >> +       }
> >> +
> >>         if (IS_ERR(exynos_gem_obj)) {
> >>                 ret = PTR_ERR(exynos_gem_obj);
> >>                 goto err_release_framebuffer;
> >> --
> >> 1.7.9.5
> >
> > Looks good to me.
> >
> 
> Can you apply this patch.

Looks good to me. Applied.

Thanks,
Inki Dae

> 
> 
> > --
> > With warm regards,
> > Sachin
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-samsung-
> soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-
> soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
