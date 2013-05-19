From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] drm/exynos: fimd: Get signal polarities from device tree
Date: Sun, 19 May 2013 13:32:53 +0200
Message-ID: <2077448.BOZFWf0KVq@flatron>
References: <1367435169-15025-1-git-send-email-tomasz.figa@gmail.com> <20130501200025.GE5763@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f176.google.com ([209.85.215.176]:37137 "EHLO
	mail-ea0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754029Ab3ESLc6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 19 May 2013 07:32:58 -0400
Received: by mail-ea0-f176.google.com with SMTP id k11so3135093eaj.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 May 2013 04:32:57 -0700 (PDT)
In-Reply-To: <20130501200025.GE5763@phenom.ffwll.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Dave Airlie <airlied@gmail.com>

Hi,

On Wednesday 01 of May 2013 22:00:25 Daniel Vetter wrote:
> On Wed, May 01, 2013 at 09:06:09PM +0200, Tomasz Figa wrote:
> > This patch modifies the driver to perform two stage parsing of video
> > timings from device tree, to get timing information as struct
> > videomode, which contains more data than struct fb_videomode.
> > 
> > Thanks to this change, information about polarity of control signals
> > (VSYNC, HSYNC, VDEN, VCLK) can be retrieved, in addition to standard
> > video timings.
> > 
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> 
> Since the drm mode struct also contains flags for sync polarity ... why
> is there no direct of -> drm_mode function? Going through an fb
> videomode in a kms drm driver looks _really_ backwards to me.
> 
> Cc'in Dave for the fun of it ;-)

Struct fb_videomode is what exynos_drm_fimd driver uses internally. Sure 
it should use drm_mode, but this is not really related to this patch, 
because the code added in this patch only fills in the pdata struct, which 
for compatibility reasons (the same structure is used for both fbdev and 
drm drivers) contains struct fb_videomode.

OK, now after having a bit of fun, could we merge this patch to at least 
have usable support of parallel displays using this driver?

Best regards,
Tomasz

> Cheers, Daniel
> 
> > ---
> > 
> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 18 ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > b/drivers/gpu/drm/exynos/exynos_drm_fimd.c index a1669d4..9023efa
> > 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > @@ -21,7 +21,9 @@
> > 
> >  #include <linux/pm_runtime.h>
> >  
> >  #include <video/of_display_timing.h>
> > 
> > +#include <video/of_videomode.h>
> > 
> >  #include <video/samsung_fimd.h>
> > 
> > +#include <video/videomode.h>
> > 
> >  #include <drm/exynos_drm.h>
> >  
> >  #include "exynos_drm_drv.h"
> > 
> > @@ -928,18 +930,30 @@ static int fimd_probe(struct platform_device
> > *pdev)> 
> >  	DRM_DEBUG_KMS("%s\n", __FILE__);
> >  	
> >  	if (pdev->dev.of_node) {
> > 
> > +		struct videomode vm;
> > +
> > 
> >  		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> >  		if (!pdata) {
> >  		
> >  			DRM_ERROR("memory allocation for pdata failed\n");
> >  			return -ENOMEM;
> >  		
> >  		}
> > 
> > -		ret = of_get_fb_videomode(dev->of_node, &pdata-
>panel.timing,
> > -					OF_USE_NATIVE_MODE);
> > +		ret = of_get_videomode(dev->of_node, &vm, 
OF_USE_NATIVE_MODE);
> > 
> >  		if (ret) {
> >  		
> >  			DRM_ERROR("failed: of_get_fb_videomode() : %d\n", 
ret);
> >  			return ret;
> >  		
> >  		}
> > 
> > +
> > +		fb_videomode_from_videomode(&vm, &pdata->panel.timing);
> > +
> > +		if (vm.flags & DISPLAY_FLAGS_VSYNC_LOW)
> > +			pdata->vidcon1 |= VIDCON1_INV_VSYNC;
> > +		if (vm.flags & DISPLAY_FLAGS_HSYNC_LOW)
> > +			pdata->vidcon1 |= VIDCON1_INV_HSYNC;
> > +		if (vm.flags & DISPLAY_FLAGS_DE_LOW)
> > +			pdata->vidcon1 |= VIDCON1_INV_VDEN;
> > +		if (vm.flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
> > +			pdata->vidcon1 |= VIDCON1_INV_VCLK;
> > 
> >  	} else {
> >  	
> >  		pdata = pdev->dev.platform_data;
> >  		if (!pdata) {
