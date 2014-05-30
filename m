From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] drm/exynos: hdmi: remove the i2c drivers and use devtree -
 continued
Date: Fri, 30 May 2014 10:36:04 +0900
Message-ID: <000701cf7ba7$85530880$8ff91980$%han@samsung.com>
References: <1401381377-29973-1-git-send-email-lee.jones@linaro.org>
 <53876359.8070304@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:10739 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753549AbaE3BgG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 May 2014 21:36:06 -0400
In-reply-to: <53876359.8070304@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Lee Jones' <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, irlied@linux.ie, kernel@stlinux.com, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, 'Inki Dae' <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, 'Jingoo Han' <jg1.han@samsung.com>

On Friday, May 30, 2014 1:42 AM, Tomasz Figa wrote:
> On 29.05.2014 18:36, Lee Jones wrote:
> > There appears to have been a merge error on commit:
> >
> >   2b76813: drm/exynos: hdmi: remove the i2c drivers and use
> >
> > The original submission can be found at:
> >
> >   https://patchwork.kernel.org/patch/3559541/
> >
> > It looks like the commit was only half applied.  This patch aims
> > to finish what was started by Daniel.

(+cc Inki Dae)

Hi Lee Jones,

A similar patch was already applied to drm-exynos git. [1]
However, 'drivers/gpu/drm/exynos/exynos_hdmi.h' was not
removed yet. Thus, additional patch to remove this
'exynos_hdmi.h' should be submitted. Thank you.


[1]
http://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/commit/?h=exynos-drm-next&id=73c0a75ca9919c12525fd02eb49f9c3a34e0
d2d9

Best regards,
Jingoo Han

> >
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/gpu/drm/exynos/exynos_ddc.c     | 63 --------------------------------
> >  drivers/gpu/drm/exynos/exynos_hdmi.h    | 23 ------------
> >  drivers/gpu/drm/exynos/exynos_hdmiphy.c | 65 ---------------------------------
> >  3 files changed, 151 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/exynos/exynos_ddc.c
> >  delete mode 100644 drivers/gpu/drm/exynos/exynos_hdmi.h
> >  delete mode 100644 drivers/gpu/drm/exynos/exynos_hdmiphy.c
> >
> 
> Obviously there is nothing to review, but still:
> 
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> 
> Thanks for the patch.
> 
> Best regards,
> Tomasz
