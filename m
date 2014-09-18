From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip support
Date: Thu, 18 Sep 2014 12:54:02 +0300
Message-ID: <3187222.N10z9QsVIV@avalon>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com> <2405684.4GKZfmgcCP@avalon> <CAEC9eQOKYSVi+CG__wzo3bwMZTBc+y10WZuYnoz7A5=RJV2D2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:40286 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754935AbaIRJx5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Sep 2014 05:53:57 -0400
In-Reply-To: <CAEC9eQOKYSVi+CG__wzo3bwMZTBc+y10WZuYnoz7A5=RJV2D2Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Thierry Reding <thierry.reding@gmail.com>, Doug Anderson <dianders@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Prashanth G <prashanth.g@samsung.com>, Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>

Hi Ajay,

On Wednesday 17 September 2014 15:43:04 Ajay kumar wrote:
> Hi Laurent,
> 
> Please find the latest series here:
> http://www.spinics.net/lists/dri-devel/msg66740.html

Thank you. My comment was meant to be general though, not just for your patch 
series.

> On Wed, Sep 17, 2014 at 3:23 PM, Laurent Pinchart wrote:
> > On Wednesday 30 July 2014 11:40:54 Thierry Reding wrote:

[snip]

> >> One other thing: how does the bridge know which mode to drive? I suspect
> >> that it can drive more than one mode? Can it freely be configured or
> >> does it have a predefined set of modes? If the latter, then according to
> >> what you said above there needs to be a way to configure the bridge (via
> >> DT?) so that it reports the mode matching the panel. I wonder if that
> >> should be handled completely in code, so that for example a bridge has a
> >> panel attached it can use the panel's .get_modes() and select a matching
> >> mode among the set that it supports.
> > 
> > Yes, pretty please :-) I don't think it would be a good idea to duplicate
> > mode information in the bridge DT node, as that's not a property of the
> > bridge. Querying the mode at runtime is in my opinion a much better
> > option, and would also allow switching between different modes at runtime
> > when that makes sense.
> > 
> > Now, I'm not sure whether it should be the bridge driver querying the
> > panel driver directly, or the display controller driver doing it and then
> > configuring the bridge accordingly. The latter seems more generic to me
> > and doesn't rely on the assumption that the bridge output will always be
> > directly connected to a panel.

-- 
Regards,

Laurent Pinchart
