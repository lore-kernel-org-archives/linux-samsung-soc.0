From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V6 6/8] drm/bridge: Modify drm_bridge core to support driver model
Date: Wed, 17 Sep 2014 12:27:13 +0300
Message-ID: <3764548.s4ysdtHE5z@avalon>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com> <2567411.1uGei9I2NP@avalon> <CAEC9eQMYTELvK_0bcrs+wNk=qYXzS69bOqYGr-yLf6h18bfM4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39422 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755199AbaIQJ1N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 05:27:13 -0400
In-Reply-To: <CAEC9eQMYTELvK_0bcrs+wNk=qYXzS69bOqYGr-yLf6h18bfM4Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Clark <robdclark@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Sean Cross <xobs@kosagi.com>

Hi Ajay,

On Wednesday 17 September 2014 14:37:30 Ajay kumar wrote:
> On Mon, Sep 15, 2014 at 11:07 PM, Laurent Pinchart wrote:
> > Hi Ajay,
> > 
> > Thank you for the patch.
> > 
> > I think we're moving in the right direction, but we're not there yet.
> > 
> > On Saturday 26 July 2014 00:52:08 Ajay Kumar wrote:
> >> This patch tries to seperate drm_bridge implementation
> >> into 2 parts, a drm part and a non_drm part.
> >> 
> >> A set of helper functions are defined in this patch to make
> >> bridge driver probe independent of the drm flow.
> >> 
> >> The bridge devices register themselves on a lookup table
> >> when they get probed by calling "drm_bridge_add_for_lookup".
> >> 
> >> The parent encoder driver waits till the bridge is available in the
> >> lookup table(by calling "of_drm_find_bridge") and then continues with
> >> its initialization.
> > 
> > Before the introduction of the component framework I would have said this
> > is the way to go. Now, I think bridges should register themselves as
> > components, and the DRM master driver should use the component framework
> > to get a reference to the bridges it needs.
> 
> Well, I have modified the bridge framework exactly the way Thierry wanted it
> to be, I mean the same way the current panel framework is.
> And, I don't think there is a problem with that.
> What problem are you facing with current bridge implementation?
> What is the advantage of using the component framework to register bridges?

There are several advantages.

- The component framework has been designed with this exact problem in mind, 
piecing multiple components into a display device. This patch set introduces 
yet another framework, without any compelling reason as far as I can see. 
Today DRM drivers already need to use three different frameworks (component, 
I2C slave encoder and panel), and we're adding a fourth one to make the mess 
even messier. This is really a headlong rush, we need to stop and fix the 
design mistakes.

- The component framework solves the probe ordering problem. Bridges can use 
deferred probing, but when a bridge requires a resources (such as a clock for 
instance) provided by the display controller, this will break.

> >> The encoder driver should call "drm_bridge_attach_encoder" to pass on
> >> the drm_device and the encoder pointers to the bridge object.
> >> 
> >> Now that the drm_device pointer is available, the encoder then calls
> >> "bridge->funcs->post_encoder_init" to allow the bridge to continue
> >> registering itself with the drm core.
> > 
> > This is what really bothers me with DRM bridge.
> > 
> > The framework assumes that a bridge will always bridge an encoder and a
> > connector. Beside lacking support for chained bridges, this creates an
> > artificial split between bridges and encoders by modeling the same
> > components using drm_encoder or drm_bridge depending on their position in
> > the video output pipeline.
> > 
> > I would like to see drm_bridge becoming more self-centric, removing the
> > awareness of the upstream encoder and downstream connector. I'll give this
> > a try, but it will conflict with this patch, so I'd like to share
> > opinions and coordinate efforts sooner than later if possible.
> 
> I am not really able to understand how you want "drm_bridge" to be.
> As of now, there are many platforms using drm_bridge and they don't
> have a problem with current implementation.
> Regarding chained bridges: Can't you add this once my patchset is merged?
> As an additional feature?

Yes, as I mentioned in another e-mail this can be fixed later. I want to start 
discussing it though.

> To be honest, I have spent quite sometime for working on this patchset.
> All I started with was to add drm_panel support to drm_bridge.
> When I sent the first patchset for that, Daniel, Rob and Thierry raised a
> concern that current bridge framework itself is not proper and hence
> they asked me to fix that first. And we have reached till here based on
> their comments only.
> 
> Without this patchset, you cannot bring an X server
> based display on snow and peach_pit. Also, day by day the number of
> platforms using drm_bridge is increasing.

That's exactly why I'd like to use the component framework now, as the 
conversion will become more complex as time goes by.

> And, I don't really see a problem with the current approach(which is exactly
> the same way panel framework is). And, I am no decision maker here. I would
> expect the top guys to comment!

-- 
Regards,

Laurent Pinchart
