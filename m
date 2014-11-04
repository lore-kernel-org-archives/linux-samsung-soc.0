From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Tue, 04 Nov 2014 10:22:24 +0100
Message-ID: <1415092944.3701.1.camel@pengutronix.de>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
	 <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
	 <20141027190137.GT26941@phenom.ffwll.local>
	 <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
	 <CAKMK7uEch65=ZuaG=4JY2u3S3w5RND+uNc5+qL=tWxDLfEqEwQ@mail.gmail.com>
	 <CAKMK7uEtNMOTg2j9XYN91_gRWWxHCfnb57HHpsdXki+T-rvwYg@mail.gmail.com>
	 <20141027235734.GX27405@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:57310 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750914AbaKDJWc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Nov 2014 04:22:32 -0500
In-Reply-To: <20141027235734.GX27405@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>, Daniel Vetter <daniel@ffwll.ch>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Ajay kumar <ajaynumb@gmail.com>, Thierry Reding <treding@nvidia.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

Hi Russell,

Am Montag, den 27.10.2014, 23:57 +0000 schrieb Russell King - ARM Linux:
> On Mon, Oct 27, 2014 at 11:26:30PM +0100, Daniel Vetter wrote:
> > Looking at the of_drm_find_panel function I actually wonder how that
> > works - the drm_panel doesn't really need to stick around afaics.
> > After all panel_list is global so some other driver can unload.
> > Russell's of support for possible_crtcs code works differently since
> > it only looks at per-drm_device lists.
> > 
> > This bridge code here though suffers from the same. So to me this
> > looks rather fishy.
> > 
> > It doesn't help that we have drm_of.[hc] around but not all the of
> > code is in there. Adding Russell too.
> 
> I rather dropped the ball with imx-drm when things became difficult with
> asking Greg to pull my git tree - and as a result, I decided that I would
> no longer be helping with patch submission for imx-drm, nor trying to get
> it out of the staging tree anymore.

In that case I'd like to take up the ball.

In my opinion the driver is now in a state in which it could be moved to
gpu/drm first and then fixed up there (all the blockers in
drivers/staging/imx-drm/TODO are gone). That would also give us a single
path for all imx-drm/ipu-v3 related patches again. My main motivation to
put it into staging in the first place was that the device tree bindings
had to be worked out, but now it only results in a coordination
nightmare.

regards
Philipp
