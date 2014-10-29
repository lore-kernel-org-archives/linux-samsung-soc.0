From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Wed, 29 Oct 2014 08:51:27 +0100
Message-ID: <20141029075127.GM26941@phenom.ffwll.local>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
 <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
 <20141027190137.GT26941@phenom.ffwll.local>
 <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
 <CAKMK7uEch65=ZuaG=4JY2u3S3w5RND+uNc5+qL=tWxDLfEqEwQ@mail.gmail.com>
 <20141028142946.GA17770@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:40798 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754084AbaJ2HvR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Oct 2014 03:51:17 -0400
Received: by mail-wg0-f45.google.com with SMTP id x12so1235430wgg.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2014 00:51:16 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20141028142946.GA17770@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, Thierry Reding <treding@nvidia.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Ajay kumar <ajaynumb@gmail.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

On Tue, Oct 28, 2014 at 03:29:47PM +0100, Thierry Reding wrote:
> On Mon, Oct 27, 2014 at 11:20:31PM +0100, Daniel Vetter wrote:
> > On Mon, Oct 27, 2014 at 8:58 PM, Sean Paul <seanpaul@chromium.org> wrote:
> > >>> @@ -660,8 +662,11 @@ struct drm_bridge_funcs {
> > >>>   * @driver_private: pointer to the bridge driver's internal context
> > >>>   */
> > >>>  struct drm_bridge {
> > >>> -     struct drm_device *dev;
> > >>> +     struct device *dev;
> > >>
> > >> Please don't rename the ->dev pointer into drm. Because _all_ the other
> > >> drm structures still call it ->dev. Also, can't we use struct device_node
> > >> here like we do in the of helpers Russell added? See 7e435aad38083
> > >>
> > >
> > > I think this is modeled after the naming in drm_panel, FWIW. However,
> > > seems reasonable to keep the device_node instead.
> > 
> > Hm, indeed. Tbh I vote to rename drm_panel->drm to ->dev and like with
> > drm_crtc drop the struct device and go directly to a struct
> > device_node. Since we don't really need the sturct device, the only
> > thing we care about is the of_node. For added bonus wrap an #ifdef
> > CONFIG_OF around all the various struct device_node in drm_foo.h.
> > Should be all fairly simple to pull off with cocci.
> > 
> > Thierry?
> 
> The struct device * is in DRM panel because there's nothing device tree
> specific about the concept. Having a struct device_node * instead would
> indicate that it can only be used with a device tree, whereas the
> framework doesn't care the tiniest bit what type of device we have.
> 
> While the trend clearly is to use more device tree, I don't think we
> should make it impossible for anybody else to use these frameworks.
> 
> There are other advantages to keeping a struct device *, like having
> access to the proper device and its name. Also you get access to the
> device_node * via dev->of_node anyway. I don't see any advantage in
> switching to just a struct device_node *, only disadvantages.

Well the idea is to make the lookup key specific, and conditional on
#CONFIG_OF. If there's going to be another neat way to enumerate platform
devices then I think we should add that, too. Or maybe we should have a
void *platform_data or so.

The reason I really don't want a struct device * in core drm structures is
that two releases down the road people will have found tons of really
great ways to abuse them and re-create a midlayer. DRM core really should
only care about the sw objects and not be hw specific at all. Heck there's
not even an requirement to have any piece of actual hw, you could write a
completely fake drm driver (for e.g. testing like the new v4l driver).

Tbh I wonder a bit why we even have this registery embedded into the core
drm objects. Essentially the only thing you're doing is a list that maps
some platform specific key onto some subsystem specific driver structure
or fails the lookup. So instead of putting all these low-level details
into drm core structures can't we just have a generic hashtable/list for
this, plus some static inline helpers that cast the void * you get into
the one you want?

I also get the feeling that this really should be in the driver core (like
the component helpers), and that we should think a lot harder about
lifetimes and refcounting (see my other reply on that).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
