From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for ps8622 DT properties
Date: Tue, 07 Oct 2014 10:23:46 +0300
Message-ID: <5749335.iMpaHR0UO8@avalon>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <353158006.4Zqtrv9CtX@avalon> <543390E2.1080108@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:56266 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214AbaJGHXj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Oct 2014 03:23:39 -0400
In-Reply-To: <543390E2.1080108@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Ajay kumar <ajaynumb@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Hi Tomi,

On Tuesday 07 October 2014 10:06:10 Tomi Valkeinen wrote:
> On 06/10/14 17:40, Laurent Pinchart wrote:
> >> But seriously speaking, I was thinking about this. I'd really like to
> >> have a generic video-mux node, that would still somehow allow us to have
> >> device specific configurations for the video sources and sinks (which
> >> the endpoints provide us), without endpoints.
> >> 
> >> The reason endpoints don't feel right in this case is that it makes
> >> sense that the mux has a single input and two outputs, but with
> >> endpoints we need two endpoints from the bridge (which is still ok), but
> >> we also need two endpoitns in the mux's input side, which doesn't feel
> >> right.
> >> 
> >> I came up with the following. It's quite ugly, though. I hope someone
> >> has ideas how it could be done in a neater way:
> >> 
> >> bridge1234 {
> >> 
> >> 	bridge1234-cfg1: config1 {
> >> 	
> >> 		high-voltage;
> >> 	
> >> 	};
> >> 	
> >> 	bridge1234-cfg2: config2 {
> >> 	
> >> 		low-voltage;
> >> 	
> >> 	};
> >> 	
> >> 	output = <&mux>;
> >> 
> >> };
> >> 
> >> mux: video-gpio-mux {
> >> 
> >> 	gpio = <123>;
> >> 	
> >> 	outputs = <&panel1 &panel2>;
> >> 	input-configs = <&bridge1234-cfg1 &bridge1234-cfg2>;
> >> 
> >> };
> >> 
> >> panel1: panel-foo {
> >> 
> >> };
> >> 
> >> panel2: panel-foo {
> >> 
> >> };
> >> 
> >> So the bridge node has configuration sets. These might be compared to
> >> pinmux nodes. And the mux has a list of input-configs. When panel1 is to
> >> be enabled, "bridge1234-cfg1" config becomes active, and the bridge is
> >> given this configuration.
> >> 
> >> I have to say the endpoint system feels cleaner than the above, but
> >> perhaps it's possible to improve the method above somehow.
> > 
> > Isn't it possible for the bridge to compute its configuration at runtime
> > by querying properties of the downstream video entities ? That would solve
> > the problem neatly.
> 
> You mean the bridge driver would somehow take a peek into panel1 and
> panel2 nodes, looking for bridge specific properties? Sounds somewhat
> fragile to me... How would the bridge driver know a property is for the
> bridge?

No, I mean the bridge driver should call the API provided by the panel objects 
to get information about the panels, and compute its configuration parameters 
from those. I'm not sure if that's possible though, it depends on whether the 
bridge parameters can be computed from information provided by the panel.

-- 
Regards,

Laurent Pinchart
