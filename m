From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: Device node for a controller with two interrupt parents
Date: Fri, 23 Mar 2012 16:18:09 +0530
Message-ID: <CAJuYYwQapeMthSxSgpaJ5fQNQnyvducgGyi-75WrjZut6akh+w@mail.gmail.com>
References: <CAJuYYwT1uKaUDuh98i4B286az-_26YCN31UXXFWsP=_M-UL_vg@mail.gmail.com>
	<20120321034151.GC15997@truffala.fritz.box>
	<CAJuYYwSv9aoCWNJ9=m9LjaaGqvzEA07SHt6wT56HTNLQdkNU2Q@mail.gmail.com>
	<20120321151321.34A813E095F@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:57245 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755799Ab2CWKsK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Mar 2012 06:48:10 -0400
Received: by vbbff1 with SMTP id ff1so1407202vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Mar 2012 03:48:09 -0700 (PDT)
In-Reply-To: <20120321151321.34A813E095F@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: David Gibson <david@gibson.dropbear.id.au>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>

Hi Grant,

On 21 March 2012 20:43, Grant Likely <grant.likely@secretlab.ca> wrote:
> Okay, so you're saying there are three important aspects to this
> device:
> 1) it terminates interrupts from other devices (therefore needs an
> =A0 interrupt controller driver)
> 2) it passes some interrupts through untouched (interrupt controller
> =A0 driver doesn't need to touch them; it directly raises an irq on t=
he
> =A0 gic or combiner)
> 3) It is able generate interrupt signals on it's own (independent of
> =A0 any attached devices)
>
> Do I understand correctly?

#1 is applicable but not #2 and #3 (if I have interpreted the above
correctly). The wakeup interrupt controller looks for an edge or level
on pins (which are connected to external devices) and generates a
interrupt (to gic or combiner) when the set condition on that pin is
found (edge or level).

>
> Your patch above solves the problem for #2 above, but it breaks #1
> because interrupts from external devices can no longer be terminated
> on the wakeup controller node (they'll always get passed through).

Ok.

>
> --- Possible solution 1 ---
> If other devices *don't* use the wakeup node as their interrupt
> parent, then you should be able to simply drop the
> interrupt-controller property and make the other devices directly
> reference the gic and combiner.

Other devices use wakeup node as interrupt controller. The wakeup
interrupt controller supports masking, unmasking and prioritization of
the wakeup interrupts. The interrupt-controller property can be
dropped but then of_irq_init() function cannot be used.

>
> --- Possible solution 2 ---
> Split the interrupt map into a separate node:
>
>
> =A0 =A0 =A0 =A0wakeup_eint: interrupt-controller@11000000 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "samsung,exynos4210-wak=
eup-eint";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x11000000 0x1000>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupt-controller;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#interrupt-cells =3D <1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupt-parent =3D <&wakeup_map>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupts =3D <0 1 2 3 f 5 6 7 8 9 10=
 11 12 13 14 15 16>;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0wakeup_map: interrupt-map {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#interrupt-cells =3D <=
1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#address-cells =3D <0>=
;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupt-map =3D <0 &=
gic 0 16 0>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0<1 &gic 0 17 0>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0<2 &gic 0 18 0>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0<3 &gic 0 19 0>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0<4 &gic 0 20 0>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0<5 &gic 0 21 0>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0<6 &gic 0 22 0>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0<7 &gic 0 23 0>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0<8 &gic 0 24 0>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0<9 &gic 0 25 0>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0<10 &gic 0 26 0>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0<11 &gic 0 27 0>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0<12 &gic 0 28 0>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0<13 &gic 0 29 0>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0<14 &gic 0 30 0>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0<15 &gic 0 31 0>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0<16 &combiner 2 4>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0};

I have tested with this and it works but of_irq_init() function cannot
be used because 'wakeup_map' is set as interrupt parent and
'wakeup_map' is not a interrupt-controller. So of_irq_init() does not
invoke the initialization function for the wakeup node. If the machine
init code explicitly looks for this node and calls the corresponding
initialization function, it works fine.

>
> --- possible solution 3 ---
> 'interrupts' just isn't sufficient for some devices; add a binding fo=
r
> a 'interrupts-multiparent' that can be used instead of 'interrupts'
> and uses the format <phandle> <specifier> [<phandle> <specifier> [...=
]].

This would be the ideal case. In addition to this, the
interrupt-parent property handling should be modified to support
multiple parent phandles like <&parent1 [&parent2] [&parent3] ....>.
This will be useful to extend the capability of of_irq_init() to
handle interrupt-controller node with multiple interrupt parents.

>
> I'm not opposed to this solution since it is a more natural binding
> for multiparented interrupt controllers, but I won't commit to it
> without feedback and agreement from Mitch, Ben, David Gibson, etc.

Ok. For now, I will go ahead and use solution #2 which you and David
have suggested. And correspondingly add explicit lookup of wakeup node
and call to its initialization function in the machine init code.

Thanks for your suggestions.

Regards,
Thomas.

[...]
