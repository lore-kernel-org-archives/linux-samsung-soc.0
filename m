From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH] drm/exynos: Add fallback option to get non physically
 contiguous memory for gem_dumb_create
Date: Tue, 27 Aug 2013 13:14:18 +0900
Message-ID: <02b501cea2db$e61ef890$b25ce9b0$%dae@samsung.com>
References: <1377239706-17804-1-git-send-email-vikas.sajjan@linaro.org>
 <02a401cea2cf$57be6ab0$073b4010$%dae@samsung.com>
 <CAD025yQArMU6ps5Pn=E5skDyei0=Rv2vxq2gqGoPXkb4+0OHrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45307 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752629Ab3H0EOU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 00:14:20 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MS60074V92W8B40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Aug 2013 13:14:18 +0900 (KST)
In-reply-to: <CAD025yQArMU6ps5Pn=E5skDyei0=Rv2vxq2gqGoPXkb4+0OHrg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vikas Sajjan' <vikas.sajjan@linaro.org>
Cc: 'DRI mailing list' <dri-devel@lists.freedesktop.org>, "'kgene.kim'" <kgene.kim@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Rob Clark' <robdclark@gmail.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Laurent Pinchart' <laurent.pinchart@ideasonboard.com>, 'Patch Tracking' <patches@linaro.org>, linaro-dev@lists.linaro.org, 'sunil joshi' <joshi@samsung.com>, linux-samsung-soc@vger.kernel.org


One more thing, changed the subject to "Consider fallback option to
allocation fail". The subject is too long :)

Thanks,
Inki Dae


> -----Original Message-----
> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-soc-
> owner@vger.kernel.org] On Behalf Of Vikas Sajjan
> Sent: Tuesday, August 27, 2013 12:05 PM
> To: Inki Dae
> Cc: DRI mailing list; kgene.kim; Sylwester Nawrocki; Rob Clark; Tomasz
> Figa; Laurent Pinchart; Patch Tracking; linaro-dev@lists.linaro.org; sunil
> joshi; linux-samsung-soc@vger.kernel.org
> Subject: Re: [PATCH] drm/exynos: Add fallback option to get non physically
> contiguous memory for gem_dumb_create
> 
> Thanks.
> 
> On 27 August 2013 08:14, Inki Dae <inki.dae@samsung.com> wrote:
> > Applied.
> >
> > Thanks,
> > Inki Dae
> >
> >> -----Original Message-----
> >> From: Vikas Sajjan [mailto:vikas.sajjan@linaro.org]
> >> Sent: Friday, August 23, 2013 3:35 PM
> >> To: dri-devel@lists.freedesktop.org; inki.dae@samsung.com
> >> Cc: kgene.kim@samsung.com; s.nawrocki@samsung.com; robdclark@gmail.com;
> >> tomasz.figa@gmail.com; laurent.pinchart@ideasonboard.com;
> >> patches@linaro.org; linaro-dev@lists.linaro.org
> >> Subject: [PATCH] drm/exynos: Add fallback option to get non physically
> >> contiguous memory for gem_dumb_create
> >>
> >> To address the case where physically contiguous memory MAY NOT be a
> >> mandatory
> >> requirement for framebuffer for the application calling
> >> exynos_drm_gem_dumb_create,
> >> the patch adds a feature to get non physically contiguous memory for
> >> framebuffer,
> >> if physically contiguous memory allocation fails and if IOMMU is
> > supported.
> >>
> >> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> >> Signed-off-by: Arun Kumar <arun.kk@samsung.com>
> >> ---
> >>  drivers/gpu/drm/exynos/exynos_drm_gem.c |   13 +++++++++++++
> >>  1 file changed, 13 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> >> b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> >> index 2eabe1a..66d1b40 100644
> >> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> >> @@ -17,6 +17,7 @@
> >>  #include "exynos_drm_drv.h"
> >>  #include "exynos_drm_gem.h"
> >>  #include "exynos_drm_buf.h"
> >> +#include "exynos_drm_iommu.h"
> >>
> >>  static unsigned int convert_to_vm_err_msg(int msg)
> >>  {
> >> @@ -666,6 +667,18 @@ int exynos_drm_gem_dumb_create(struct drm_file
> >> *file_priv,
> >>
> >>       exynos_gem_obj = exynos_drm_gem_create(dev, EXYNOS_BO_CONTIG |
> >>                                               EXYNOS_BO_WC,
args->size);
> >> +     /*
> >> +      * If physically contiguous memory allocation fails and if IOMMU
> is
> >> +      * supported then try to get buffer from non physically
contiguous
> >> +      * memory area.
> >> +      */
> >> +     if (IS_ERR(exynos_gem_obj) && is_drm_iommu_supported(dev)) {
> >> +             dev_warn(dev->dev, "contiguous FB allocation failed,
falling
> >> back to non-contiguous\n");
> >> +             exynos_gem_obj = exynos_drm_gem_create(dev,
> >> +                                     EXYNOS_BO_NONCONTIG |
EXYNOS_BO_WC,
> >> +                                     args->size);
> >> +     }
> >> +
> >>       if (IS_ERR(exynos_gem_obj))
> >>               return PTR_ERR(exynos_gem_obj);
> >>
> >> --
> >> 1.7.9.5
> >
> 
> 
> 
> --
> Thanks and Regards
>  Vikas Sajjan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-
> soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
