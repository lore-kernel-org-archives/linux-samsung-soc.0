From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for ps8622 DT properties
Date: Tue, 23 Sep 2014 14:10:32 +0300
Message-ID: <1976136.tncNOd9b1d@avalon>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <54213DAC.5010806@ti.com> <54214545.2090308@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:44281 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754825AbaIWLKe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 07:10:34 -0400
In-Reply-To: <54214545.2090308@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Thierry Reding <thierry.reding@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com

On Tuesday 23 September 2014 12:02:45 Andrzej Hajda wrote:
> On 09/23/2014 11:30 AM, Tomi Valkeinen wrote:
> > On 23/09/14 09:21, Thierry Reding wrote:
> >>> Well, I can write almost any kind of bindings, and then evidently my
> >>> device would work. For me, on my board.
> >> 
> >> Well, that's the whole problem with DT. For many devices we only have a
> >> single setup to test against. And even when we have several they often
> >> are derived from each other. But the alternative would be to defer
> >> (possibly indefinitely) merging support for a device until a second,
> >> wildly different setup shows up. That's completely unreasonable and we
> >> need to start somewhere.
> > 
> > Yes, but in this case we know of existing boards that have complex
> > setups. It's not theoretical.
> > 
> > I'm not saying we should stop everything until we have a 100% solution
> > for the rare complex cases. But we should keep them in mind and, when
> > possible, solve problems in a way that will work for the complex cases
> > also.> 
> >>> I guess non-video devices haven't had need for those. I have had lots of
> >>> boards with video setup that cannot be represented with simple phandles.
> >>> I'm not sure if I have just been unlucky or what, but my understand is
> >>> that other people have encountered such boards also. Usually the
> >>> problems encountered there have been circumvented with some hacky video
> >>> driver for that specific board, or maybe a static configuration handled
> >>> by the boot loader.
> >> 
> >> I have yet to encounter such a setup. Can you point me at a DTS for one
> >> such setup? I do remember a couple of hypothetical cases being discussed
> >> at one time or another, but I haven't seen any actual DTS content where
> >> this was needed.
> > 
> > No, I can't point to them as they are not in the mainline (at least the
> > ones I've been working on), for obvious reasons.
> > 
> > With a quick glance, I have the following devices in my cabinet that
> > have more complex setups: OMAP 4430 SDP, BeagleBoneBlack + LCD, AM43xx
> > EVM. Many Nokia devices used to have such setups, usually so that the
> > LCD and tv-out were connected to the same video source.
> > 
> >>> Do we have a standard way of representing the video pipeline with simple
> >>> phandles? Or does everyone just do their own version? If there's no
> >>> standard way, it sounds it'll be a mess to support in the future.
> >> 
> >> It doesn't matter all that much whether the representation is standard.
> > 
> > Again, I disagree.
> > 
> >> phandles should simply point to the next element in the pipeline and the
> >> OS abstractions should be good enough to handle the details about how to
> >> chain the elements.
> > 
> > I, on the other hand, would rather see the links the other way around.
> > Panel having a link to the video source, etc.
> > 
> > The video graphs have two-way links, which of course is the safest
> > options, but also more verbose and redundant.
> > 
> > When this was discussed earlier, it was unclear which way the links
> > should be. It's true that only links to one direction are strictly
> > needed, but the question raised was that if in the drivers we end up
> > always going the links the other way, the performance penalty may be
> > somewhat big. (If I recall right).
> 
> I do not see why performance may drop significantly?
> If the link is one-way it should probably work as below:
> - the destination registers itself in some framework,
> - the source looks for the destination in this framework using phandle,
> - the source starts to communicate with the destination - since now full
> two way link can be established dynamically.
> 
> Where do you see here big performance penalty?

The performance-related problems arise when you need to locate the remote 
device in the direction opposite to the phandle link direction. Traversing a 
link forward just involves a phandle lookup, but traversing it backwards isn't 
possible the same way.

-- 
Regards,

Laurent Pinchart
