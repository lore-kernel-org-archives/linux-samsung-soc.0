From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v3 21/32] drm/exynos: Move dp driver from video/ to drm/
Date: Fri, 01 Nov 2013 08:55:12 +0900
Message-ID: <003801ced694$a3342310$e99c6930$%han@samsung.com>
References: <1383063198-10526-1-git-send-email-seanpaul@chromium.org>
 <1598437.V5FBHdEq6k@flatron> <000801ced690$47480520$d5d80f60$%han@samsung.com>
 <10329504.DMev7iL3eL@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46680 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751088Ab3JaXzO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Oct 2013 19:55:14 -0400
In-reply-to: <10329504.DMev7iL3eL@flatron>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: 'Inki Dae' <inki.dae@samsung.com>, 'Sean Paul' <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org, 'Tomi Valkeinen' <tomi.valkeinen@ti.com>, 'Jean-Christophe PLAGNIOL-VILLARD' <plagnioj@jcrosoft.com>, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, airlied@linux.ie, marcheu@chromium.org, 'Jingoo Han' <jg1.han@samsung.com>

On Friday, November 01, 2013 8:27 AM, Tomasz Figa wrote:
> On Friday 01 of November 2013 08:23:59 Jingoo Han wrote:
> > On Friday, November 01, 2013 8:12 AM, Tomasz Figa wrote:
> > > On Friday 01 of November 2013 08:06:00 Jingoo Han wrote:
> > > > On Thursday, October 31, 2013 7:47 PM, Inki Dae wrote:
> > > > > CCing Jingoo,
> > > > >
> > > > > Is that ok to remove eDP driver from video/exynos? Isn't this
> > > > > driver
> > > > > really used by Linux framebuffer driver, s3c-fb.c?
> > > >
> > > > +cc Tomi Valkeinen, Jean-Christophe PLAGNIOL-VILLARD,
> > > >
> > > >      linux-fbdev list, linux-samsung-soc list
> > > >
> > > > Yes, it is used by s3c-fb.c.
> > > >
> > > > > Of course, now s3c-fb driver is dead code because this driver
> > > > > doesn't
> > > > > support device tree yet but we would need more reviews and
> > > > > discussions
> > > > > about moving this driver into drm side. Let's watch new rules for
> > > > > device tree bindings of DRM world. So I'd not like to merge this
> > > > > driver yet.
> > > >
> > > > 's3c-fb' driver is still used for other mass products projects.
> > > > Just, device tree support patch is not yet submitted.
> > >
> > > Current in-tree users of s3c-fb drivers are s3c2443, non-DT s3c64xx
> > > and
> > > all s5p* SoCs. It is not used on Exynos SoCs anymore.
> >
> > Hi Tomasz Figa,
> 
> Just Tomasz. ;)

Hi Tomasz, :-)

> 
> > Some mass product projects using Exynos5250 and etc, use s3c-fb driver
> > and dp driver. Also, these projects are still using Framebuffer, not
> > DRM.
> 
> Well, those are based on vendor trees anyway, so do not really affect
> mainline kernel.

OK, I see.

> 
> > > As for Exynos DP driver, what SoCs does it support? If only Exynos (as
> > > the name suggests) then there is no point in keeping it at
> > > video/exynos and making it a part of Exynos DRM driver seems
> > > reasonable to me.
> >
> > However, when considering only mainline kernel, I have no strong
> > objection. As you know, many Linux kernel based OS projects using
> > Exynos, are using DRM, not Framebuffer.
> 
> Generally, fbdev is strongly discouraged in any new systems and DRM is the
> way to go, so I don't think we should ever want to bring s3c-fb support
> back to Exynos platforms.

Yes, you're right.
Personally, I think that all Exynos platforms should go into DRM, not FB.

One more thing, then how about moving Exynos MIPI to DRM side?
Is there any plan on Exynos MIPI?

Best regards,
Jingoo Han

> 
> >
> > Also, if moving DP driver to DRM, MAINTAINERS entry for Exynos DP driver
> > should be updated, too.
> 
> That's correct.
