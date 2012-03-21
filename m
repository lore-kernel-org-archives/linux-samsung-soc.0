From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: Device node for a controller with two interrupt parents
Date: Wed, 21 Mar 2012 14:41:51 +1100
Message-ID: <20120321034151.GC15997@truffala.fritz.box>
References: <CAJuYYwT1uKaUDuh98i4B286az-_26YCN31UXXFWsP=_M-UL_vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:42613 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751808Ab2CUDl6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Mar 2012 23:41:58 -0400
Content-Disposition: inline
In-Reply-To: <CAJuYYwT1uKaUDuh98i4B286az-_26YCN31UXXFWsP=_M-UL_vg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>

On Wed, Mar 21, 2012 at 07:55:43AM +0530, Thomas Abraham wrote:
> Hi,
> 
> Exynos5 includes a gpio wakeup interrupt controller that generates 32
> interrupts. The first 16 interrupts are routed to the interrupt
> combiner controller. The last 16 are muxed into one interrupt and this
> interrupt line is connected to the GIC interrupt controller.
> 
> So, the wakeup interrupt controller node in device tree requires two
> interrupt parents. I do not know how to handle this. Any suggestions
> will be very helpful.

This has occurred before, for example on the MAL device on 440EP (see
the bamboo board dts for example).  The semi-standard approach is to
make the node an interrupt-nexus for itself.  That is in the node's
interrupts property, just list 0..N giving as many interrupts as you
need.  Set the node's interrupt-parent to point to the node itself,
then add interrupt-map and interrupt-map-mask properties which remap
those interrupts 0..N to the correct interrupts on the actual
interrupt controllers.  Each entry in the interrupt map specifies an
interrupt parent phandle, so you can distribute the irqs to multiple
interrupt controllers that way.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
