From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 2/2] drm/exynos: cleanup exynos_drm_plane
Date: Fri, 24 Apr 2015 15:13:46 -0300
Message-ID: <20150424181346.GE13025@joana>
References: <1429791146-4410-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1429791146-4410-3-git-send-email-tjakobi@math.uni-bielefeld.de>
 <5539A24B.3080506@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f43.google.com ([209.85.192.43]:34820 "EHLO
	mail-qg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031014AbbDXSNv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Apr 2015 14:13:51 -0400
Received: by qgej70 with SMTP id j70so26512722qge.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Apr 2015 11:13:51 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5539A24B.3080506@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hi Tobias,

2015-04-24 Joonyoung Shim <jy0922.shim@samsung.com>:

> Hi Tobias,
> 
> On 04/23/2015 09:12 PM, Tobias Jakobi wrote:
> > Remove the unused fields of struct exynos_drm_plane.
> > 
> > Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_drv.h | 10 ----------
> >  1 file changed, 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> > index e12ecb5..c80331b 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> > @@ -73,11 +73,6 @@ enum exynos_drm_output_type {
> >   * @zpos: order of overlay layer(z position).
> >   * @index_color: if using color key feature then this value would be used
> >   *			as index color.
> > - * @default_win: a window to be enabled.
> > - * @color_key: color key on or off.
> > - * @local_path: in case of lcd type, local path mode on or off.
> > - * @transparency: transparency on or off.
> > - * @activated: activated or not.
> >   * @enabled: enabled or not.
> >   * @resume: to resume or not.
> >   *
> > @@ -110,11 +105,6 @@ struct exynos_drm_plane {
> >  	unsigned int zpos;
> >  	unsigned int index_color;
> 
> How about remove also index_color?

That one can go too.

> 
> >  
> > -	bool default_win:1;
> > -	bool color_key:1;
> > -	bool local_path:1;
> > -	bool transparency:1;
> > -	bool activated:1;
> >  	bool enabled:1;
> >  	bool resume:1;
> >  };
> > 
> 
> Acked-by: Joonyoung Shim <jy0922.shim@samsung.com>

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
