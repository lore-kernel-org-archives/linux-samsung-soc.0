From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for ps8622 DT properties
Date: Tue, 23 Sep 2014 14:12:52 +0300
Message-ID: <8067599.NmrXQIO5A1@avalon>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <54213DAC.5010806@ti.com> <20140923095314.GS30514@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:44289 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753736AbaIWLMx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 07:12:53 -0400
In-Reply-To: <20140923095314.GS30514@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com

On Tuesday 23 September 2014 11:53:15 Thierry Reding wrote:
> On Tue, Sep 23, 2014 at 12:30:20PM +0300, Tomi Valkeinen wrote:
> > On 23/09/14 09:21, Thierry Reding wrote:
> > >> Well, I can write almost any kind of bindings, and then evidently my
> > >> device would work. For me, on my board.
> > > 
> > > Well, that's the whole problem with DT. For many devices we only have a
> > > single setup to test against. And even when we have several they often
> > > are derived from each other. But the alternative would be to defer
> > > (possibly indefinitely) merging support for a device until a second,
> > > wildly different setup shows up. That's completely unreasonable and we
> > > need to start somewhere.
> > 
> > Yes, but in this case we know of existing boards that have complex
> > setups. It's not theoretical.
> 
> Complex setups involving /this particular/ bridge and binding are
> theoretical at this point, however.
> 
> > > phandles should simply point to the next element in the pipeline and the
> > > OS abstractions should be good enough to handle the details about how to
> > > chain the elements.
> > 
> > I, on the other hand, would rather see the links the other way around.
> > Panel having a link to the video source, etc.
> 
> Why? It seems much more natural to describe this using the natural flow
> of data. The device furthest away from the CPU should be the target of
> the phandle. That way the DT can be used to trace the flow of data down
> the pipeline.
> 
> > The video graphs have two-way links, which of course is the safest
> > options, but also more verbose and redundant.
> 
> Right. If we take that line of thinking to the extreme we end up listing
> individual registers in DT so that we can safely assume that we can
> control all possible aspects of the device.

And the other extreme would be to have a single DT node for the logical video 
device with all information pertaining to it stored in C code. Extremes are 
never good, we need to find a reasonable middle-ground here. I believe OF 
graph fulfills that requirement, it might be slightly more verbose than a 
single phandle, but it's also much more versatile. 

> Like I said, this seems to be the latest response to DT ABI stability
> requirement. Add as much data to a DT node as possible so that it has
> higher chances of being complete. The result is often overly complex DT
> content that doesn't add any real value.
> 
> > When this was discussed earlier, it was unclear which way the links
> > should be. It's true that only links to one direction are strictly
> > needed, but the question raised was that if in the drivers we end up
> > always going the links the other way, the performance penalty may be
> > somewhat big. (If I recall right).
> 
> I doubt that graphs will become so complex that walking it would become
> a performance bottleneck. In fact if we're constantly walking the graph
> we're already doing something wrong. It should only be necessary when
> the pipeline configuration changes, which should hopefully not be very
> often (i.e. not several times per second).

-- 
Regards,

Laurent Pinchart
