From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Wed, 29 Oct 2014 08:58:23 +0100
Message-ID: <20141029075823.GN26941@phenom.ffwll.local>
References: <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
 <20141027190137.GT26941@phenom.ffwll.local>
 <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
 <CAEC9eQPQaYjL3ZxtDZBdKi2z5yANcHQ9s4ikYkxN95K9qvu01Q@mail.gmail.com>
 <CAKMK7uGoO5TBgLh4HSDjxUM=-WRfsQoDHusLmOYxLio-QBMEPQ@mail.gmail.com>
 <CAEC9eQNJb1TgK1ihvzvC0VjSJhm48WaFO5SVigPsqTOurK2UQw@mail.gmail.com>
 <CAKMK7uFX7rENLBmwE58rtCBXZ_pSF_uS5Poiuks7xfi+r=e9gw@mail.gmail.com>
 <20141028144126.GC17770@ulmo>
 <CAEC9eQNqDNS0HgCSCOkVBYzSypHCt+aMxYZaX1vmTr8SKn2cbA@mail.gmail.com>
 <20141028150532.GF17770@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:58640 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755603AbaJ2H6N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Oct 2014 03:58:13 -0400
Received: by mail-wi0-f174.google.com with SMTP id d1so899114wiv.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2014 00:58:11 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20141028150532.GF17770@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Jingoo Han <jg1.han@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>

On Tue, Oct 28, 2014 at 04:05:34PM +0100, Thierry Reding wrote:
> On Tue, Oct 28, 2014 at 08:16:44PM +0530, Ajay kumar wrote:
> > On Tue, Oct 28, 2014 at 8:11 PM, Thierry Reding
> > <thierry.reding@gmail.com> wrote:
> > > On Tue, Oct 28, 2014 at 03:19:36PM +0100, Daniel Vetter wrote:
> > >> On Tue, Oct 28, 2014 at 1:28 PM, Ajay kumar <ajaynumb@gmail.com> wrote:
> > >> > On Tue, Oct 28, 2014 at 3:31 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > [...]
> > >> >> Hm, if you do this can you pls also update drm_panel accordingly? It
> > >> >> shouldn't be a lot of fuzz and would make things around drm+dt more
> > >> >> consistent.
> > >> > Are you talking about using struct device_node instead of struct device?
> > >> > I guess you have misplaced the comment under the wrong section!
> > >>
> > >> Yeah, that should have been one up ;-)
> > >
> > > Like I said earlier, I don't think dropping struct device * in favour of
> > > struct device_node * is a good idea.
> > I am not sure about drm_panel.
> > But, I am not really doing anything with the struct device pointer in
> > case of bridge.
> > So, just wondering if it is really needed?
> 
> I think it's useful to have it just to send the right message. DRM panel
> and DRM bridge aren't specific to device tree. They are completely
> generic and can work with any type of device, whether it was
> instantiated from the device tree or some other infrastructure. Dropping
> struct device * will make it effectively useless on anything but DT. I
> don't think we should strive for that, even if only DT-enabled platforms
> currently use them.

See my other reply, but I now think we should put neither into drm
structures. This "find me the driver structures for this device" problem
looks really generic, and it has nothing to do with the drm structures and
concepts like bridges/panels at all. It shouldn't be in there at all.

Adding it looks very much like reintroducing the drm midlayer that we just
finally made obsolete, just not at the top-level (struct drm_device) but
at a bunch of leaf nodes. I expect all the same issues though. And I'm
definitely not looking to de-midlayer more stuff that we're just adding.

Imo this should be solved as a separate helper thing, maybe in the driver
core akin to the component helpers from Russell.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
