From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Mon, 3 Nov 2014 09:11:14 +0100
Message-ID: <20141103081114.GB26941@phenom.ffwll.local>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
 <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
 <20141027190137.GT26941@phenom.ffwll.local>
 <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
 <CAKMK7uEch65=ZuaG=4JY2u3S3w5RND+uNc5+qL=tWxDLfEqEwQ@mail.gmail.com>
 <20141028142946.GA17770@ulmo>
 <20141029075127.GM26941@phenom.ffwll.local>
 <20141029091648.GC27900@ulmo>
 <20141031155940.GS26941@phenom.ffwll.local>
 <20141103080602.GB21002@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:65218 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750826AbaKCILC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Nov 2014 03:11:02 -0500
Received: by mail-wi0-f177.google.com with SMTP id ex7so5617213wid.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2014 00:11:00 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20141103080602.GB21002@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, Thierry Reding <treding@nvidia.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Ajay kumar <ajaynumb@gmail.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

On Mon, Nov 03, 2014 at 09:06:04AM +0100, Thierry Reding wrote:
> On Fri, Oct 31, 2014 at 04:59:40PM +0100, Daniel Vetter wrote:
> > On Wed, Oct 29, 2014 at 10:16:49AM +0100, Thierry Reding wrote:
> > > On Wed, Oct 29, 2014 at 08:51:27AM +0100, Daniel Vetter wrote:
> > > > On Tue, Oct 28, 2014 at 03:29:47PM +0100, Thierry Reding wrote:
> > > > > On Mon, Oct 27, 2014 at 11:20:31PM +0100, Daniel Vetter wrote:
> > > > > > On Mon, Oct 27, 2014 at 8:58 PM, Sean Paul <seanpaul@chromium.org> wrote:
> > > > > > >>> @@ -660,8 +662,11 @@ struct drm_bridge_funcs {
> > > > > > >>>   * @driver_private: pointer to the bridge driver's internal context
> > > > > > >>>   */
> > > > > > >>>  struct drm_bridge {
> > > > > > >>> -     struct drm_device *dev;
> > > > > > >>> +     struct device *dev;
> > > > > > >>
> > > > > > >> Please don't rename the ->dev pointer into drm. Because _all_ the other
> > > > > > >> drm structures still call it ->dev. Also, can't we use struct device_node
> > > > > > >> here like we do in the of helpers Russell added? See 7e435aad38083
> > > > > > >>
> > > > > > >
> > > > > > > I think this is modeled after the naming in drm_panel, FWIW. However,
> > > > > > > seems reasonable to keep the device_node instead.
> > > > > > 
> > > > > > Hm, indeed. Tbh I vote to rename drm_panel->drm to ->dev and like with
> > > > > > drm_crtc drop the struct device and go directly to a struct
> > > > > > device_node. Since we don't really need the sturct device, the only
> > > > > > thing we care about is the of_node. For added bonus wrap an #ifdef
> > > > > > CONFIG_OF around all the various struct device_node in drm_foo.h.
> > > > > > Should be all fairly simple to pull off with cocci.
> > > > > > 
> > > > > > Thierry?
> > > > > 
> > > > > The struct device * is in DRM panel because there's nothing device tree
> > > > > specific about the concept. Having a struct device_node * instead would
> > > > > indicate that it can only be used with a device tree, whereas the
> > > > > framework doesn't care the tiniest bit what type of device we have.
> > > > > 
> > > > > While the trend clearly is to use more device tree, I don't think we
> > > > > should make it impossible for anybody else to use these frameworks.
> > > > > 
> > > > > There are other advantages to keeping a struct device *, like having
> > > > > access to the proper device and its name. Also you get access to the
> > > > > device_node * via dev->of_node anyway. I don't see any advantage in
> > > > > switching to just a struct device_node *, only disadvantages.
> > > > 
> > > > Well the idea is to make the lookup key specific, and conditional on
> > > > #CONFIG_OF. If there's going to be another neat way to enumerate platform
> > > > devices then I think we should add that, too. Or maybe we should have a
> > > > void *platform_data or so.
> > > > 
> > > > The reason I really don't want a struct device * in core drm structures is
> > > > that two releases down the road people will have found tons of really
> > > > great ways to abuse them and re-create a midlayer. DRM core really should
> > > > only care about the sw objects and not be hw specific at all. Heck there's
> > > > not even an requirement to have any piece of actual hw, you could write a
> > > > completely fake drm driver (for e.g. testing like the new v4l driver).
> > > > 
> > > > Tbh I wonder a bit why we even have this registery embedded into the core
> > > > drm objects. Essentially the only thing you're doing is a list that maps
> > > > some platform specific key onto some subsystem specific driver structure
> > > > or fails the lookup. So instead of putting all these low-level details
> > > > into drm core structures can't we just have a generic hashtable/list for
> > > > this, plus some static inline helpers that cast the void * you get into
> > > > the one you want?
> > > > 
> > > > I also get the feeling that this really should be in the driver core (like
> > > > the component helpers), and that we should think a lot harder about
> > > > lifetimes and refcounting (see my other reply on that).
> > > 
> > > Yes, that sounds very useful indeed. Also see my reply to yours. =)
> > 
> > Just replying here with some of the irc discussions we've had. Since
> > drm_bridge/panel isn't a core drm interface object exposed to userspace
> > it's less critical. I still think that wasting a few brain cycles to have
> > a clear separation between the abstract interface object and how to bind
> > and unbind the pieces together is worthwhile, even though the cost when
> > getting it wrong is much less severe than in the case of a mandatory piece
> > of core infrastructure.
> > 
> > I think in general the recent armsoc motivated drm infrastructure lacks a
> > bit in attention to these details. E.g. the cma helpers are built into the
> > drm.ko module, but clearly are auxilliary library code. So they should be
> > pulled out and the headers clean up, so that we have a clear separation
> > between core and helpers. Otherwise someone will sooner or later screw up
> > and insert a helper depency into the core, and then we've started with the
> > midlayer mess. Same goes with drm_bridge/panel, which didn't even bother
> > to have separate headers from the core modeset header drm_crtc.h.
> 
> DRM panel does have a separate header. It's still built into the core
> DRM module, but using a separate drm-$(CONFIG_DRM_PANEL) += drm_panel.o
> entry in the makefile. At the time it didn't seem worth to add a
> completely separate module given the size of the code and the overhead
> associated with having a separate module.
> 
> Do you still want me to split it off into a separate module to clarify
> that it isn't part of the core?

Oh, it doesn't need to be a complete standalone module, smashing it into
drm_kms_helper is imo totally ok. It's just to make really sure that
helpers are helpers and there's never a depency from drm.ko to any
optional helper code. Having a separate module for all the helper code
helps a lot in ensure that. Also, everything a helper can do, a driver
should be able to do too. Again a separate helper ensures that you haven't
missed any EXPORT_SYMBOL. Which should then be a good reminder to update
the kerneldoc ;-)

> > So would be great if someone could invest a bit of time into cleaning this
> > up. Writing proper api docs also helps a lot with achieving a clean and
> > sensible split ;-)
> 
> There's a bit of API documentation for panels, but I'll see if I can
> find some time to enhance it.

Imo pulling into the DocBook template is also important, since if you do
that the 0-day tester will complain if the kerneldoc gets out of sync.
Which does increases the changes of it staying up-to-date a lot.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
