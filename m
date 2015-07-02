From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 02/23] drm/exynos: calculate vrefresh instead of use a
 fixed value
Date: Thu, 2 Jul 2015 18:18:18 -0300
Message-ID: <20150702211818.GA8741@joana>
References: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
 <1435095336-6196-3-git-send-email-gustavo@padovan.org>
 <559530D5.60505@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f45.google.com ([209.85.192.45]:33849 "EHLO
	mail-qg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753059AbbGBVSX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jul 2015 17:18:23 -0400
Received: by qgii30 with SMTP id i30so39001614qgi.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jul 2015 14:18:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <559530D5.60505@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Joonyoung,

2015-07-02 Joonyoung Shim <jy0922.shim@samsung.com>:

> On 06/24/2015 06:35 AM, Gustavo Padovan wrote:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > 
> > When mode's vrefresh is zero we should ask DRM core to calculate vrefresh
> > for us so we can get the correct value instead of relying on fixed value
> > defined in a macro. But if vrefresh is still zero we should fail the
> > update.
> > 
> > Suggested-by: Daniel Stone <daniels@collabora.com>
> > Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > index 1e3bb72..7ba348e 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > @@ -41,7 +41,6 @@
> >   * CPU Interface.
> >   */
> >  
> > -#define FIMD_DEFAULT_FRAMERATE 60
> >  #define MIN_FB_WIDTH_FOR_16WORD_BURST 128
> >  
> >  /* position control register for hardware window 0, 2 ~ 4.*/
> > @@ -403,7 +402,9 @@ static bool fimd_mode_fixup(struct exynos_drm_crtc *crtc,
> >  		struct drm_display_mode *adjusted_mode)
> >  {
> >  	if (adjusted_mode->vrefresh == 0)
> > -		adjusted_mode->vrefresh = FIMD_DEFAULT_FRAMERATE;
> > +		adjusted_mode->vrefresh = drm_mode_vrefresh(mode);
> > +	if (adjusted_mode->vrefresh == 0)
> 
> If adjusted_mode->vrefresh is not 0, it will check two times whether it
> is 0. Check it in first if statement.
> 
> Basically, i'm not sure, why should we check whether
> adjusted_mode->vrefresh is 0 at first? Can't we use just
> 
>         adjusted_mode->vrefresh = drm_mode_vrefresh(mode);
> 	if (adjusted_mode->vrefresh == 0)
> 		...
> 
> without the first checking?

Actually, I don't see why too. I'll remove this and make a second
version. 

	Gustavo
