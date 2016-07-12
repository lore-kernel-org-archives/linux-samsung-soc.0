From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/exynos: make fbdev support really optional
Date: Tue, 12 Jul 2016 12:57:42 +0200
Message-ID: <20160712105742.GG23520@phenom.ffwll.local>
References: <1466769168-31602-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <577D0CD9.9020607@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35747 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751200AbcGLK5q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jul 2016 06:57:46 -0400
Received: by mail-wm0-f68.google.com with SMTP id i5so1677139wmg.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jul 2016 03:57:45 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <577D0CD9.9020607@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, Jul 06, 2016 at 03:51:21PM +0200, Tobias Jakobi wrote:
> Ping!

Applied to drm-misc, thanks for the patch. Aside: I think there's other
drivers which get this wrong, with the generic support to make fbdev
optional in the drm core none of this should be needed anywhere. Can I
volunteer you to double check other Kconfig files in drm for the same
mistake?

Thanks, Daniel
> 
> - Tobias
> 
> Tobias Jakobi wrote:
> > Currently enabling Exynos DRM support automatically pulls in
> > lots of fbdev dependencies. However these deps are
> > unnecessary since DRM core already enables them when
> > needed.
> > 
> > Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> > ---
> >  drivers/gpu/drm/exynos/Kconfig | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
> > index baddf33..590559c 100644
> > --- a/drivers/gpu/drm/exynos/Kconfig
> > +++ b/drivers/gpu/drm/exynos/Kconfig
> > @@ -2,10 +2,6 @@ config DRM_EXYNOS
> >  	tristate "DRM Support for Samsung SoC EXYNOS Series"
> >  	depends on OF && DRM && (ARCH_S3C64XX || ARCH_EXYNOS || ARCH_MULTIPLATFORM)
> >  	select DRM_KMS_HELPER
> > -	select DRM_KMS_FB_HELPER
> > -	select FB_CFB_FILLRECT
> > -	select FB_CFB_COPYAREA
> > -	select FB_CFB_IMAGEBLIT
> >  	select VIDEOMODE_HELPERS
> >  	help
> >  	  Choose this option if you have a Samsung SoC EXYNOS chipset.
> > 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
