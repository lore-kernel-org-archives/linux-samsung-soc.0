From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH V8 00/14] drm/exynos: few patches to enhance bridge chip
 support
Date: Mon, 19 Jan 2015 15:01:25 -0200
Message-ID: <20150119170125.GH2001@joana>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>
 <CAEC9eQOrKw2Z1q-ztFfadXmsL3CTcAkkv9kcS2QnDOAVSh2AuQ@mail.gmail.com>
 <548ABAB6.6010200@collabora.co.uk>
 <3197445.qizQc0zeRb@avalon>
 <54914D7D.9060108@collabora.co.uk>
 <CAPj87rN4HZzDt5JBLyTRmKZs7XcOG=0ha7ZQf9hmjPAFgTyhYQ@mail.gmail.com>
 <20150105135015.GA12010@ulmo.nvidia.com>
 <54BCDC28.7080003@collabora.co.uk>
 <20150119163043.GB7751@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f176.google.com ([209.85.216.176]:47328 "EHLO
	mail-qc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751530AbbASRBd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jan 2015 12:01:33 -0500
Content-Disposition: inline
In-Reply-To: <20150119163043.GB7751@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Daniel Stone <daniel@fooishbar.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Ajay kumar <ajaynumb@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

2015-01-19 Thierry Reding <thierry.reding@gmail.com>:

> On Mon, Jan 19, 2015 at 11:27:52AM +0100, Javier Martinez Canillas wrote:
> > Hello Thierry,
> > 
> > On 01/05/2015 02:50 PM, Thierry Reding wrote:
> > > On Fri, Jan 02, 2015 at 01:10:14PM +0000, Daniel Stone wrote:
> > >> >
> > >> > Ajay's series don't apply cleanly anymore because it has been a while since
> > >> > he posted it but he can rebase on top of 3.19-rc1 once it is released and
> > >> > re-resend.
> > >> >
> > >> 
> > >> Do you have any plans to rebase this so it's ready for merging?
> > >> 
> > >> Thierry, Daniel, Dave - whose tree would this be best to merge through?
> > > 
> > > The plan is for me to take the bridge patches through the drm/panel
> > > tree. I'm going to look at these patches again later this week but from
> > > a very quick peek there don't seem to be any major issues left.
> > >
> > 
> > I know you probably are very busy but it would be great if you can take a look
> > to this series to avoid another kernel release to be missed since we are already
> > at v3.19-rc5.
> > 
> > Only this version was posted 2 months ago and the first version of the series
> > was sent on May, 2014 so it has been on the list for almost a year now...
> > 
> > Tomi and Laurent had already agreed with the DT binging so I think that we can
> > already merge these and if there are any remaining issues, those can be fixed
> > during the 3.20 -rc cycle.
> 
> I see only a single Tested-by on this series and that seems to be with a
> bunch of out-of-tree patches applied on top. Does this now actually work
> applied on top of upstream? Also it seems like many people actually want
> this to get merged but there's been no Reviewed-bys and only a single
> Tested-by? Is that as good as it's going to get?

I've been using this series on top of exynos-drm for more than a month and it 
works fine for me so..

Tested-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
