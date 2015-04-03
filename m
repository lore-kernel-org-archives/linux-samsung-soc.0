From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 10/10] drm/exynos: atomic dpms support
Date: Fri, 3 Apr 2015 12:06:20 -0300
Message-ID: <20150403150620.GB2208@joana>
References: <1427471939-27345-10-git-send-email-gustavo@padovan.org>
 <1427742717-21469-1-git-send-email-gustavo@padovan.org>
 <551D058A.3010805@samsung.com>
 <20150402140837.GA6970@joana>
 <551E3758.8030109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f172.google.com ([209.85.160.172]:32862 "EHLO
	mail-yk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752709AbbDCPGY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Apr 2015 11:06:24 -0400
Received: by ykfa3 with SMTP id a3so25856614ykf.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Apr 2015 08:06:24 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <551E3758.8030109@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Joonyoung,

2015-04-03 Joonyoung Shim <jy0922.shim@samsung.com>:

> Hi,
>  
> >>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> >>> index e71e331..e0b085b 100644
> >>> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> >>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> >>> @@ -275,9 +275,6 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
> >>>  
> >>>  	}
> >>>  
> >>> -	/* disable all the possible outputs/crtcs before entering KMS mode */
> >>> -	drm_helper_disable_unused_functions(dev);
> >>> -
> >>
> >> I think this is not related with atomic dpms support, if this needs,
> >> could you make another patch?
> > 
> > Yes, it is, once you port exynos to use atomic dpms we start getting warning
> > from this functions, the correct solution is to remove it. Other subsystems
> > followed the same approach.
> 
> As i said, the warning comes from changes of this patch.
> 
> From rcar-du driver, it was handled to a separate patch.
> 
> http://www.spinics.net/lists/linux-sh/msg40384.html

Right, I think make this a new patch is no harm and will make things more clear.

> > 
> > I'm sending an updated patch set in a bit.
> 
> OK, but i didn't get your updated patch 10/10 yet. Could you resend it?

No, I did a mistake with git send-email. Used 000*.patch to send the patches.
That excluded the 0010 one. So I resend a new patchset with the change above
and make sure I don't make the same mistake again.

	Gustavo
