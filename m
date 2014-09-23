From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: DT property to selectively disable device features (was [PATCH V7 11/12] Documentation: bridge: Add documentation for ps8622 DT properties)
Date: Tue, 23 Sep 2014 14:47:51 +0300
Message-ID: <2775083.bzdkLLq8Lp@avalon>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <7550026.qs7FRi8hDC@avalon> <20140923055533.GC30514@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:44317 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753537AbaIWLrx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 07:47:53 -0400
In-Reply-To: <20140923055533.GC30514@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Hi Thierry,

On Tuesday 23 September 2014 07:55:34 Thierry Reding wrote:
> On Tue, Sep 23, 2014 at 03:00:37AM +0300, Laurent Pinchart wrote:
> > On Monday 22 September 2014 13:35:15 Thierry Reding wrote:
> >> On Mon, Sep 22, 2014 at 04:53:22PM +0530, Ajay kumar wrote:
> >>> On Mon, Sep 22, 2014 at 4:11 PM, Thierry Reding wrote:
> >>>> On Mon, Sep 22, 2014 at 02:01:38PM +0530, Ajay kumar wrote:

[snip]

> >>>> I think you misunderstood what I said, or maybe I didn't explain
> >>>> clearly what I meant. If the PS8622 provides a backlight there's
> >>>> nothing wrong with always exposing it. The bridge itself isn't going
> >>>> to be using the backlight anyway. Rather the panel itself should be
> >>>> using the backlight device exposed by PS8622 or some separate
> >>>> backlight device.
> >>>> 
> >>>> To illustrate by an example:
> >>>>         ps8622: ... {
> >>>>                 compatible = "parade,ps8622";
> >>>>                 ...
> >>>>         };
> >>>>         
> >>>>         panel {
> >>>>                 ...
> >>>>                 backlight = <&ps8622>;
> >>>>                 ...
> >>>>         };
> >>> 
> >>> No, if ps8622 backlight control is used, we need not specify the
> >>> backlight phandle for the panel driver. Somehow, ps8622 internal
> >>> circuitry keeps the bootup glitch free :)
> >>> Backlight control and panel controls can be separate then.
> >> 
> >> But they shouldn't. Your panel driver should always be the one to
> >> control backlight. How else is the bridge supposed to know when to turn
> >> backlight on or off?
> >> 
> >>>> What you did in v6 of this series was look up a backlight device and
> >>>> then not use it. That seemed unnecessary. Looking at v6 again the
> >>>> reason for getting a phandle to the backlight was so that the device
> >>>> itself did not expose its own backlight controlling circuitry if an
> >>>> external one was being used. But since the bridge has no business
> >>>> controlling the backlight, having the backlight phandle in the
> >>>> bridge is not correct.
> >>>> 
> >>>> So I think what you could do in the driver instead is always expose
> >>>> the backlight device. If the panel used a different backlight, the
> >>>> PS8622's internal on simply wouldn't be accessed. It would still be
> >>>> possible to control the backlight in sysfs, but that shouldn't be a
> >>>> problem (only root can access it)
> >>> 
> >>> That would be like simple exposing a feature which cannot be used
> >>> by the user, ideally which "should not be" used by the user.
> >> 
> >> And it won't be used unless they access the sysfs files directly. There
> >> are a lot of cases where we expose functionality that cannot be
> >> meaningfully used by the user. For example, a GPIO may not be routed to
> >> anything on a board, yet we don't explicitly hide any specific GPIOs
> >> from users.
> >> 
> >>>> That said, I have no strong objections to the boolean property if
> >>>> you feel like it's really necessary.
> >>> 
> >>> Won't you think having a boolean property for an optional
> >>> feature of the device, is better than all these?
> >> 
> >> Like I said, I'm indifferent on the matter. I don't think it's necessary
> >> to hide the backlight device, but if you want to, please feel free to do
> >> so.
> > 
> > DT typically use
> > 
> > 	status = "disabled"
> > 
> > to disable devices. In this case we don't want to disable the ps8622
> > completely, but just one of its functions. Maybe a "backlight-status"
> > property could be used for that ? If that's considered too verbose, I
> > would be fine with a "disable-<feature>" boolean property too.
> 
> Another alternative would be to make the backlight a subnode:
> 
> 	ps8622: bridge@... {
> 		compatible = "parade,ps8622";
> 		...
> 
> 		backlight {
> 			...
> 			status = "disabled";
> 			...
> 		};
> 	};

I've thought about that as well. I feel it's getting a bit complex for little 
added benefit, but I don't have a very strong opinion.

Devices that expose several functions are not the odd case, and the need to 
selectively mark some of them as disabled in DT seems pretty common to me. I 
wonder if we should try to decide on standard bindings for that. To recap the 
proposals, we could have

- a boolean "disable-<feature>" property
- a text "<feature>-status" property
- a "<features>" subnode with a "status" text property

Anything else ?

-- 
Regards,

Laurent Pinchart
