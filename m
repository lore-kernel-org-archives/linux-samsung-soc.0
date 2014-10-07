From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for ps8622 DT properties
Date: Tue, 07 Oct 2014 19:14:39 +0300
Message-ID: <1624504.9igBAHRpEu@avalon>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <5749335.iMpaHR0UO8@avalon> <5433A394.4000406@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:56636 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753937AbaJGQOb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Oct 2014 12:14:31 -0400
In-Reply-To: <5433A394.4000406@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Ajay kumar <ajaynumb@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Hi Tomi,

On Tuesday 07 October 2014 11:25:56 Tomi Valkeinen wrote:
> On 07/10/14 10:23, Laurent Pinchart wrote:
> >> You mean the bridge driver would somehow take a peek into panel1 and
> >> panel2 nodes, looking for bridge specific properties? Sounds somewhat
> >> fragile to me... How would the bridge driver know a property is for the
> >> bridge?
> > 
> > No, I mean the bridge driver should call the API provided by the panel
> > objects to get information about the panels, and compute its
> > configuration parameters from those. I'm not sure if that's possible
> > though, it depends on whether the bridge parameters can be computed from
> > information provided by the panel.
>
> Right. My example tried to show a case where they can't be queried. The
> board or the wiring causes signal degradation, which can be fixed by
> increasing the bridge output voltage slightly.
> 
> So it has nothing really to do with the panel, but the board.
> 
> I fully admit that it is a purely theoretical case, and I don't have any
> real use cases in mind right now.

Still, I agree with you that we might need to configure the bridge differently 
depending on the selected output with parameters that are not specific to the 
bridge.

There's two use cases I can think of. In the first one the panels are 
connected directly to the bridge. The bridge should have two links from its 
output port, one to each panel. If we use the OF graph bindings then the 
bridge output port node would have two endpoint nodes, and configuration 
parameters can be stored in the endpoint nodes.

In the second use case another element would be present between the bridge and 
the two panels. In that case there would be a single link between the bridge 
and that other element. If the bridge needs to be configured differently 
depending on the selected panel using parameters that can't be queried from 
the panels, then we'll have a problem. I'm not sure whether this use case has 
practical applications as board-related parameters seem to me that they 
pertain to physical links.

-- 
Regards,

Laurent Pinchart
