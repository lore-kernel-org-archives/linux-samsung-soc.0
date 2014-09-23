From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for ps8622 DT properties
Date: Tue, 23 Sep 2014 14:33:37 +0300
Message-ID: <1759800.o4NVcCqF5N@avalon>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <542140D3.8080806@samsung.com> <20140923101032.GU30514@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:44309 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751393AbaIWLdk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 07:33:40 -0400
In-Reply-To: <20140923101032.GU30514@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

Hi Thierry,

On Tuesday 23 September 2014 12:10:33 Thierry Reding wrote:
> On Tue, Sep 23, 2014 at 11:43:47AM +0200, Andrzej Hajda wrote:
> > On 09/23/2014 10:35 AM, Thierry Reding wrote:
> [...]
> 
> > > But I agree that it would be nice to unify bridges and encoders more. It
> > > should be possible to make encoder always a bridge (or perhaps even
> > > replace encoders with bridges altogether). Then once you're out of the
> > > DRM device everything would be a bridge until you get to a panel.
> > 
> > I agree that some sort of unification of bridges, (slave) encoders is a
> > good thing, this way we stay only with bridges and panels as receivers.> 
> > But we will still have to deal with the code like:
> >
> >     if (on the other end of the link is panel)
> >         do panel framework specific things
> >     else
> >         do bridge framework specific things
> > 
> > The code in both branches usually does similar things but due to framework
> > differences it is difficult to merge.
> 
> That's because they are inherently different entities. You can perform
> operations on a panel that don't make sense for a bridge and vice-versa.

But a subset of the operations are common, so it's annoying to have to 
explicitly deal with both objects in code that only cares about the common 
subset of operations.

> > Ideally it would be best to get rid of such constructs. For example by
> > trying to make frameworks per interface type exposed by device (eg.
> > video_sink) and not by device type (drm_bridge, drm_panel).
> 
> But then you loose all information about the real type of device. Or you
> have to create a common base class. And then you're still back to dealing
> with the two specific cases in many places, so the gain seems rather
> minimal.

We would need to experiment with the concept, but a single abstract class 
works surprisingly well in V4L. Devices as diverse as camera sensors, HDMI 
receivers or video scalers expose a single API, and drivers for the logical 
capture devices (roughly equivalent to the DRM display controller drivers) 
turned out not to need much knowledge about what the connected devices really 
are in order to use them. This was implemented with a superset of operations, 
with many of them being optional to implement for component drivers. Of course 
knowing the exact type of a component can still be sometimes useful, but that 
would be pretty easy to implement through a query operation exposed by the 
components.

We're digressing here, but my point is that the encoder/bridge merge that we 
seem to agree about should, in my opinion, be followed by a merge with panels. 
I am, however, more interested at this point by the encoder/bridge merge, as 
having two separate frameworks there is the biggest pain point for my use 
cases.

-- 
Regards,

Laurent Pinchart
