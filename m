From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: Re: [PATCH] drm/exynos: Add fallback option to get non physically
 contiguous memory for gem_dumb_create
Date: Tue, 27 Aug 2013 09:52:12 +0530
Message-ID: <CAD025yTmsFx75mtR=cE_MVL6hdDtwkWdW33xmcBMCW1NpQOHYw@mail.gmail.com>
References: <1377239706-17804-1-git-send-email-vikas.sajjan@linaro.org>
 <02a401cea2cf$57be6ab0$073b4010$%dae@samsung.com> <CAD025yQArMU6ps5Pn=E5skDyei0=Rv2vxq2gqGoPXkb4+0OHrg@mail.gmail.com>
 <02b501cea2db$e61ef890$b25ce9b0$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:49866 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752456Ab3H0EWe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 00:22:34 -0400
Received: by mail-lb0-f177.google.com with SMTP id p5so2098319lbi.36
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Aug 2013 21:22:32 -0700 (PDT)
In-Reply-To: <02b501cea2db$e61ef890$b25ce9b0$%dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, "kgene.kim" <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Clark <robdclark@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Patch Tracking <patches@linaro.org>, linaro-dev@lists.linaro.org, sunil joshi <joshi@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

OK.

On 27 August 2013 09:44, Inki Dae <inki.dae@samsung.com> wrote:
>
> One more thing, changed the subject to "Consider fallback option to
> allocation fail". The subject is too long :)
>
> Thanks,
> Inki Dae
>
>
>> -----Original Message-----
>> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-soc-
>> owner@vger.kernel.org] On Behalf Of Vikas Sajjan
>> Sent: Tuesday, August 27, 2013 12:05 PM
>> To: Inki Dae
>> Cc: DRI mailing list; kgene.kim; Sylwester Nawrocki; Rob Clark; Tomasz
>> Figa; Laurent Pinchart; Patch Tracking; linaro-dev@lists.linaro.org; sunil
>> joshi; linux-samsung-soc@vger.kernel.org
>> Subject: Re: [PATCH] drm/exynos: Add fallback option to get non physically
>> contiguous memory for gem_dumb_create
>>
>> Thanks.
>>
>> On 27 August 2013 08:14, Inki Dae <inki.dae@samsung.com> wrote:
>> > Applied.
>> >
>> > Thanks,
>> > Inki Dae
>> >
>> >> -----Original Message-----
>> >> From: Vikas Sajjan [mailto:vikas.sajjan@linaro.org]
>> >> Sent: Friday, August 23, 2013 3:35 PM
>> >> To: dri-devel@lists.freedesktop.org; inki.dae@samsung.com
>> >> Cc: kgene.kim@samsung.com; s.nawrocki@samsung.com; robdclark@gmail.com;
>> >> tomasz.figa@gmail.com; laurent.pinchart@ideasonboard.com;
>> >> patches@linaro.org; linaro-dev@lists.linaro.org
>> >> Subject: [PATCH] drm/exynos: Add fallback option to get non physically
>> >> contiguous memory for gem_dumb_create
>> >>
>> >> To address the case where physically contiguous memory MAY NOT be a
>> >> mandatory
>> >> requirement for framebuffer for the application calling
>> >> exynos_drm_gem_dumb_create,
>> >> the patch adds a feature to get non physically contiguous memory for
>> >> framebuffer,
>> >> if physically contiguous memory allocation fails and if IOMMU is
>> > supported.
>> >>
>> >> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
>> >> Signed-off-by: Arun Kumar <arun.kk@samsung.com>
>> >> ---
>> >>  drivers/gpu/drm/exynos/exynos_drm_gem.c |   13 +++++++++++++
>> >>  1 file changed, 13 insertions(+)
>> >>
>> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> >> b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> >> index 2eabe1a..66d1b40 100644
>> >> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> >> @@ -17,6 +17,7 @@
>> >>  #include "exynos_drm_drv.h"
>> >>  #include "exynos_drm_gem.h"
>> >>  #include "exynos_drm_buf.h"
>> >> +#include "exynos_drm_iommu.h"
>> >>
>> >>  static unsigned int convert_to_vm_err_msg(int msg)
>> >>  {
>> >> @@ -666,6 +667,18 @@ int exynos_drm_gem_dumb_create(struct drm_file
>> >> *file_priv,
>> >>
>> >>       exynos_gem_obj = exynos_drm_gem_create(dev, EXYNOS_BO_CONTIG |
>> >>                                               EXYNOS_BO_WC,
> args->size);
>> >> +     /*
>> >> +      * If physically contiguous memory allocation fails and if IOMMU
>> is
>> >> +      * supported then try to get buffer from non physically
> contiguous
>> >> +      * memory area.
>> >> +      */
>> >> +     if (IS_ERR(exynos_gem_obj) && is_drm_iommu_supported(dev)) {
>> >> +             dev_warn(dev->dev, "contiguous FB allocation failed,
> falling
>> >> back to non-contiguous\n");
>> >> +             exynos_gem_obj = exynos_drm_gem_create(dev,
>> >> +                                     EXYNOS_BO_NONCONTIG |
> EXYNOS_BO_WC,
>> >> +                                     args->size);
>> >> +     }
>> >> +
>> >>       if (IS_ERR(exynos_gem_obj))
>> >>               return PTR_ERR(exynos_gem_obj);
>> >>
>> >> --
>> >> 1.7.9.5
>> >
>>
>>
>>
>> --
>> Thanks and Regards
>>  Vikas Sajjan
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-
>> soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
Thanks and Regards
 Vikas Sajjan
