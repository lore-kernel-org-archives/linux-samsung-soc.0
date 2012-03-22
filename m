From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: Device node for a controller with two interrupt parents
Date: Thu, 22 Mar 2012 12:05:24 +1100
Message-ID: <20120322010524.GI15997@truffala.fritz.box>
References: <CAJuYYwT1uKaUDuh98i4B286az-_26YCN31UXXFWsP=_M-UL_vg@mail.gmail.com>
 <20120321034151.GC15997@truffala.fritz.box>
 <CAJuYYwSv9aoCWNJ9=m9LjaaGqvzEA07SHt6wT56HTNLQdkNU2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:48021 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754967Ab2CVBY3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Mar 2012 21:24:29 -0400
Content-Disposition: inline
In-Reply-To: <CAJuYYwSv9aoCWNJ9=m9LjaaGqvzEA07SHt6wT56HTNLQdkNU2Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>

On Wed, Mar 21, 2012 at 07:05:26PM +0530, Thomas Abraham wrote:
> Hi David,
>=20
> On 21 March 2012 09:11, David Gibson <david@gibson.dropbear.id.au> wr=
ote:
> > On Wed, Mar 21, 2012 at 07:55:43AM +0530, Thomas Abraham wrote:
> >> Hi,
> >>
> >> Exynos5 includes a gpio wakeup interrupt controller that generates=
 32
> >> interrupts. The first 16 interrupts are routed to the interrupt
> >> combiner controller. The last 16 are muxed into one interrupt and =
this
> >> interrupt line is connected to the GIC interrupt controller.
> >>
> >> So, the wakeup interrupt controller node in device tree requires t=
wo
> >> interrupt parents. I do not know how to handle this. Any suggestio=
ns
> >> will be very helpful.
> >
> > This has occurred before, for example on the MAL device on 440EP (s=
ee
> > the bamboo board dts for example). =A0The semi-standard approach is=
 to
> > make the node an interrupt-nexus for itself. =A0That is in the node=
's
> > interrupts property, just list 0..N giving as many interrupts as yo=
u
> > need. =A0Set the node's interrupt-parent to point to the node itsel=
f,
> > then add interrupt-map and interrupt-map-mask properties which rema=
p
> > those interrupts 0..N to the correct interrupts on the actual
> > interrupt controllers. =A0Each entry in the interrupt map specifies=
 an
> > interrupt parent phandle, so you can distribute the irqs to multipl=
e
> > interrupt controllers that way.
>=20
> Thanks for your suggestion and pointing out an example. I tried this
> approach for Exynos4 and Exynos5. It mostly works but there are two
> issues here.
>=20
> 1. In the Exynos5 case, the wakeup interrupt controller (which has tw=
o
> separate interrupt parents - gic and combiner) is itself a interrupt
> controller and has the 'interrupt-controller' property. So
> of_irq_map_raw() function does not process the interrupt-map in the
> wakeup interrupt controller device node. I did the following change t=
o
> get past this but I am not sure if this the correct thing to do.

That might work, but it obviously won't help you with existing
kernels.  I think a better idea is not to try to make the
interrupt-controller and interrupt-nexus the same node in this case.
Instead add an intermediate nexus node to remap the
interrupt-controller's output interrupts into it's various parents.
You could make this fake nexus node a subnode of the interrupt
controller itself.

It's a bit of a hack, but it should work with existing parsing code,
and I think it's better than inventing a whole new convention to cover
this case.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _oth=
er_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
