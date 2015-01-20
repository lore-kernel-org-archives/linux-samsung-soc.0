From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V8 00/14] drm/exynos: few patches to enhance bridge chip support
Date: Wed, 21 Jan 2015 01:37:17 +0200
Message-ID: <13166907.g68bKfaUGl@avalon>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com> <20150119163043.GB7751@ulmo.nvidia.com> <54BD3943.80402@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58092 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751462AbbATXgo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jan 2015 18:36:44 -0500
In-Reply-To: <54BD3943.80402@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Thierry Reding <thierry.reding@gmail.com>, Daniel Stone <daniel@fooishbar.org>, dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Ajay kumar <ajaynumb@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi,

On Monday 19 January 2015 18:05:07 Javier Martinez Canillas wrote:
> On 01/19/2015 05:30 PM, Thierry Reding wrote:
> >> I know you probably are very busy but it would be great if you can take a
> >> look to this series to avoid another kernel release to be missed since
> >> we are already at v3.19-rc5.
> >> 
> >> Only this version was posted 2 months ago and the first version of the
> >> series was sent on May, 2014 so it has been on the list for almost a
> >> year now...
> >> 
> >> Tomi and Laurent had already agreed with the DT binging so I think that
> >> we can already merge these and if there are any remaining issues, those
> >> can be fixed during the 3.20 -rc cycle.
> > 
> > I see only a single Tested-by on this series and that seems to be with a
> > bunch of out-of-tree patches applied on top. Does this now actually work
> > applied on top of upstream? Also it seems like many people actually want
> > this to get merged but there's been no Reviewed-bys and only a single
> > Tested-by? Is that as good as it's going to get?
> 
> Good point, I provided some feedback on an early version of the series but
> I'm not an DRM expert so I couldn't review it in detail to provide my
> Reviewed-by.
> 
> I did provide my Tested-by a long time ago though but looking at the patches
> it seems those were dropped so here goes again:
> 
> For the whole series on an Exynos5420 Peach Pit and an Exynos5250 Snow
> Chromebooks:
> 
> Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> 
> > Also I think the last update was that Ajay was going to resend this
> > based on v3.19-rc1 or something. Is that still going to happen?
> > Otherwise I can probably try to apply as-is, but not sure how well it
> > will.
> 
> Ajay,
> 
> Are you going to rebase and resend this series with all the provided tags?
> Gustavo and I have a rebased branch on top of 3.19-rc5 and one of us can
> post your series if you are not planning to do it.
> 
> Laurent and Tomi,
> 
> You said that you are OK with the DT bindings now, does that count as an
> Acked-by or Reviewed-by for you at least for the DT bindings changes in the
> series?

It counts as an Acked-by for the DT bindings.

-- 
Regards,

Laurent Pinchart
