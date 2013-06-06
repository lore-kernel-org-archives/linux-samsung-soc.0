From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] drm/exynos: fimd: Get signal polarities from device tree
Date: Thu, 06 Jun 2013 11:47:34 +0200
Message-ID: <7834763.hzyJ5Gt3Ez@flatron>
References: <1367435169-15025-1-git-send-email-tomasz.figa@gmail.com> <2077448.BOZFWf0KVq@flatron> <51B01079.6060701@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f52.google.com ([209.85.214.52]:61893 "EHLO
	mail-bk0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751882Ab3FFJri (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Jun 2013 05:47:38 -0400
Received: by mail-bk0-f52.google.com with SMTP id d7so1049038bkh.25
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Jun 2013 02:47:37 -0700 (PDT)
In-Reply-To: <51B01079.6060701@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, =?utf-8?B?J+uMgOyduOq4sC9Nb2JpbGUgUy9XIFBsYXRmb3JtIExhYi4o7Ya17Iug7JewKS9FMyjsgqzsm5ApL+yCvOyEseyghOyekCc=?= <inki.dae@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Hi Joonyoung,

On Thursday 06 of June 2013 13:30:49 Joonyoung Shim wrote:
> On 05/19/2013 08:32 PM, Tomasz Figa wrote:
> > Hi,
> > 
> > On Wednesday 01 of May 2013 22:00:25 Daniel Vetter wrote:
> >> On Wed, May 01, 2013 at 09:06:09PM +0200, Tomasz Figa wrote:
> >>> This patch modifies the driver to perform two stage parsing of video
> >>> timings from device tree, to get timing information as struct
> >>> videomode, which contains more data than struct fb_videomode.
> >>> 
> >>> Thanks to this change, information about polarity of control signals
> >>> (VSYNC, HSYNC, VDEN, VCLK) can be retrieved, in addition to standard
> >>> video timings.
> >>> 
> >>> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> >> 
> >> Since the drm mode struct also contains flags for sync polarity ...
> >> why
> >> is there no direct of -> drm_mode function? Going through an fb
> >> videomode in a kms drm driver looks _really_ backwards to me.
> >> 
> >> Cc'in Dave for the fun of it ;-)
> > 
> > Struct fb_videomode is what exynos_drm_fimd driver uses internally.
> > Sure it should use drm_mode, but this is not really related to this
> > patch, because the code added in this patch only fills in the pdata
> > struct, which for compatibility reasons (the same structure is used
> > for both fbdev and drm drivers) contains struct fb_videomode.
> > 
> > OK, now after having a bit of fun, could we merge this patch to at
> > least have usable support of parallel displays using this driver?
> 
> I think it's better to use struct display_timings instead of struct
> fb_videomode in exynos_drm.

I agree that fb_videomode struct is a bit unfortunate here, but it seems 
to be widely used in the exynos_drm_fimd driver.

Actually, if I understood it properly, the correct struct to use in DRM 
drivers is drm_display_mode, but there is no conversion function from 
struct display_timing to it.

IMHO a separate patch introducing such conversion and then another one 
which modifies the driver to use drm_display_mode everywhere would be the 
best solution.

Best regards,
Tomasz
