From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for ps8622 DT properties
Date: Thu, 16 Oct 2014 12:04:42 +0300
Message-ID: <15883554.FBq3UbZUdh@avalon>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <20141008070918.GA4999@ulmo> <CAEC9eQPn2GAn6nrSvgso2QTXQErtY+8dH5-LbZS9mGTYcYC5Gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36708 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751239AbaJPJEb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Oct 2014 05:04:31 -0400
In-Reply-To: <CAEC9eQPn2GAn6nrSvgso2QTXQErtY+8dH5-LbZS9mGTYcYC5Gw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Hi Ajay,

On Friday 10 October 2014 18:33:05 Ajay kumar wrote:
> On Wed, Oct 8, 2014 at 12:39 PM, Thierry Reding wrote:
> > On Tue, Oct 07, 2014 at 05:49:24PM +0300, Laurent Pinchart wrote:
> >> On Tuesday 07 October 2014 16:06:55 Ajay kumar wrote:
> >> > On Tue, Oct 7, 2014 at 4:00 PM, Tomi Valkeinen wrote:
> >> > > On 20/09/14 14:22, Ajay kumar wrote:
> >> > >> Well, I am okay with using video ports to describe the relationship
> >> > >> between the encoder, bridge and the panel.
> >> > >> But, its just that I need to make use of 2 functions when phandle
> >> > >> does it using just one function ;)
> >> > >> -        panel_node = of_parse_phandle(dev->of_node, "panel", 0)
> >> > >> +       endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> >> > >> +       if (!endpoint)
> >> > >> +               return -EPROBE_DEFER;
> >> > >> +
> >> > >> +       panel_node = of_graph_get_remote_port_parent(endpoint);
> >> > >> +       if (!panel_node)
> >> > >> +               return -EPROBE_DEFER;
> >> > >> 
> >> > >> 
> >> > >> If nobody else has objections over using of_graph functions instead
> >> > >> of phandles, I can respin this patchset by making use of video
> >> > >> ports.
> >> > > 
> >> > > The discussion did digress somewhat.
> >> > > 
> >> > > As a clarification, I'm in no way nack'ing this series because it
> >> > > doesn't use the graphs for video connections. I don't see the simple
> >> > > phandle bindings used here as broken as such.
> >> > 
> >> > Well, I am okay with any approach you guys decide on. I desperately
> >> > want this to get this in since it has been floating around for quite
> >> > sometime. The more we drag this, the more rework for me since the
> >> > number of platforms using bridge support is increasing daily!
> >> 
> >> I won't nack this patch either. I'm however concerned that we'll run
> >> straight into the wall if we don't come up with an agreement on a
> >> standard way to describe connections in DT for display devices, which is
> >> why I would prefer the ps8622 bindings to use OF graph to describe
> >> connections.
> > 
> > I think there's not really an easy way out here. It's pretty bold trying
> > to come up with a common way to describe bridges when we have only a
> > single one (and a single use-case at that). The worst that can happen is
> > that we need to change the binding at some point, in which case we may
> > have to special-case early drivers, but I really don't think that's as
> > much of an issue as everybody seems to think.
> > 
> > This series has been floating around for months because we're being
> > overly prudent to accept a binding that /may/ turn out to not be generic
> > enough.
> 
> Right. It would be great if you guys come to agreement ASAP!

I don't think we'll agree any time soon, so I believe it's up to you to decide 
which option is best based on all arguments that have been presented.

If you ask me, of course, OF graph is best :-)

-- 
Regards,

Laurent Pinchart
