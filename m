From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Wed, 29 Oct 2014 08:43:14 +0100
Message-ID: <20141029074314.GL26941@phenom.ffwll.local>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
 <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
 <20141027190137.GT26941@phenom.ffwll.local>
 <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
 <CAKMK7uEch65=ZuaG=4JY2u3S3w5RND+uNc5+qL=tWxDLfEqEwQ@mail.gmail.com>
 <CAKMK7uEtNMOTg2j9XYN91_gRWWxHCfnb57HHpsdXki+T-rvwYg@mail.gmail.com>
 <20141028143548.GB17770@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:55200 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752283AbaJ2HnF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Oct 2014 03:43:05 -0400
Received: by mail-wi0-f181.google.com with SMTP id n3so3774813wiv.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2014 00:43:02 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20141028143548.GB17770@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, Thierry Reding <treding@nvidia.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Ajay kumar <ajaynumb@gmail.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

On Tue, Oct 28, 2014 at 03:35:50PM +0100, Thierry Reding wrote:
> On Mon, Oct 27, 2014 at 11:26:30PM +0100, Daniel Vetter wrote:
> > On Mon, Oct 27, 2014 at 11:20 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Mon, Oct 27, 2014 at 8:58 PM, Sean Paul <seanpaul@chromium.org> wrote:
> > >>>> @@ -660,8 +662,11 @@ struct drm_bridge_funcs {
> > >>>>   * @driver_private: pointer to the bridge driver's internal context
> > >>>>   */
> > >>>>  struct drm_bridge {
> > >>>> -     struct drm_device *dev;
> > >>>> +     struct device *dev;
> > >>>
> > >>> Please don't rename the ->dev pointer into drm. Because _all_ the other
> > >>> drm structures still call it ->dev. Also, can't we use struct device_node
> > >>> here like we do in the of helpers Russell added? See 7e435aad38083
> > >>>
> > >>
> > >> I think this is modeled after the naming in drm_panel, FWIW. However,
> > >> seems reasonable to keep the device_node instead.
> > >
> > > Hm, indeed. Tbh I vote to rename drm_panel->drm to ->dev and like with
> > > drm_crtc drop the struct device and go directly to a struct
> > > device_node. Since we don't really need the sturct device, the only
> > > thing we care about is the of_node. For added bonus wrap an #ifdef
> > > CONFIG_OF around all the various struct device_node in drm_foo.h.
> > > Should be all fairly simple to pull off with cocci.
> > >
> > > Thierry?
> > 
> > Looking at the of_drm_find_panel function I actually wonder how that
> > works - the drm_panel doesn't really need to stick around afaics.
> > After all panel_list is global so some other driver can unload.
> > Russell's of support for possible_crtcs code works differently since
> > it only looks at per-drm_device lists.
> 
> I don't understand. Panels are global resources that get registered by
> some driver that isn't tied to the DRM device until attached. It can't
> be in a per-DRM device list, because it's external to the device.
> 
> And yes, they can go away when a driver is unloaded, though it's not the
> typical use-case.
> 
> > This bridge code here though suffers from the same. So to me this
> > looks rather fishy.
> 
> Well, this version of the DRM bridge support was written to be close to
> DRM panel, so it isn't really surprising that it's similar =), but like
> I said, I don't really understand what you think is wrong with it.

You have a mutex to protect the global list of bridges/panels. But if you
do a lookup you don't grab a reference count on the panel, so the moment
you drop the list mutex the panel/bridge can go away.

Yes usually you don't unload a driver on a soc but soc isn't everything
and designing new stuff to not be hotunplug save isn't great either.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
