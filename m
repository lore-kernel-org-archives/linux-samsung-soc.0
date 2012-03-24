From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device node for a controller with two interrupt parents
Date: Sat, 24 Mar 2012 19:07:49 +0000
Message-ID: <20120324190749.CA6F73E0AE2@localhost>
References: <CAJuYYwT1uKaUDuh98i4B286az-_26YCN31UXXFWsP=_M-UL_vg@mail.gmail.com>
 <20120321034151.GC15997@truffala.fritz.box>
 <CAJuYYwSv9aoCWNJ9=m9LjaaGqvzEA07SHt6wT56HTNLQdkNU2Q@mail.gmail.com>
 <20120321151321.34A813E095F@localhost>
 <CAJuYYwQapeMthSxSgpaJ5fQNQnyvducgGyi-75WrjZut6akh+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6716536112659686775=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAJuYYwQapeMthSxSgpaJ5fQNQnyvducgGyi-75WrjZut6akh+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============6716536112659686775==
Content-Type: text/plain

On Fri, 23 Mar 2012 16:18:09 +0530, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi Grant,
> 
> On 21 March 2012 20:43, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > Okay, so you're saying there are three important aspects to this
> > device:
> > 1) it terminates interrupts from other devices (therefore needs an
> >   interrupt controller driver)
> > 2) it passes some interrupts through untouched (interrupt controller
> >   driver doesn't need to touch them; it directly raises an irq on the
> >   gic or combiner)
> > 3) It is able generate interrupt signals on it's own (independent of
> >   any attached devices)
> >
> > Do I understand correctly?
> 
> #1 is applicable but not #2 and #3 (if I have interpreted the above
> correctly). The wakeup interrupt controller looks for an edge or level
> on pins (which are connected to external devices) and generates a
> interrupt (to gic or combiner) when the set condition on that pin is
> found (edge or level).
> 
> >
> > Your patch above solves the problem for #2 above, but it breaks #1
> > because interrupts from external devices can no longer be terminated
> > on the wakeup controller node (they'll always get passed through).
> 
> Ok.
> 
> >
> > --- Possible solution 1 ---
> > If other devices *don't* use the wakeup node as their interrupt
> > parent, then you should be able to simply drop the
> > interrupt-controller property and make the other devices directly
> > reference the gic and combiner.
> 
> Other devices use wakeup node as interrupt controller. The wakeup
> interrupt controller supports masking, unmasking and prioritization of
> the wakeup interrupts. The interrupt-controller property can be
> dropped but then of_irq_init() function cannot be used.
> 
> >
> > --- Possible solution 2 ---
> > Split the interrupt map into a separate node:
> >
> >
> >        wakeup_eint: interrupt-controller@11000000 {
> >                compatible = "samsung,exynos4210-wakeup-eint";
> >                reg = <0x11000000 0x1000>;
> >                interrupt-controller;
> >                #interrupt-cells = <1>;
> >                interrupt-parent = <&wakeup_map>;
> >                interrupts = <0 1 2 3 f 5 6 7 8 9 10 11 12 13 14 15 16>;
> >
> >                wakeup_map: interrupt-map {
> >                        #interrupt-cells = <1>;
> >                        #address-cells = <0>;
> >                        interrupt-map = <0 &gic 0 16 0>,
> >                                        <1 &gic 0 17 0>,
> >                                        <2 &gic 0 18 0>,
> >                                        <3 &gic 0 19 0>,
> >                                        <4 &gic 0 20 0>,
> >                                        <5 &gic 0 21 0>,
> >                                        <6 &gic 0 22 0>,
> >                                        <7 &gic 0 23 0>,
> >                                        <8 &gic 0 24 0>,
> >                                        <9 &gic 0 25 0>,
> >                                        <10 &gic 0 26 0>,
> >                                        <11 &gic 0 27 0>,
> >                                        <12 &gic 0 28 0>,
> >                                        <13 &gic 0 29 0>,
> >                                        <14 &gic 0 30 0>,
> >                                        <15 &gic 0 31 0>,
> >                                        <16 &combiner 2 4>;
> >                };
> >        };
> 
> I have tested with this and it works but of_irq_init() function cannot
> be used because 'wakeup_map' is set as interrupt parent and
> 'wakeup_map' is not a interrupt-controller. So of_irq_init() does not
> invoke the initialization function for the wakeup node. If the machine
> init code explicitly looks for this node and calls the corresponding
> initialization function, it works fine.

That's a bug in of_irq_init() then.  It should be fixed.

> 
> >
> > --- possible solution 3 ---
> > 'interrupts' just isn't sufficient for some devices; add a binding for
> > a 'interrupts-multiparent' that can be used instead of 'interrupts'
> > and uses the format <phandle> <specifier> [<phandle> <specifier> [...]].
> 
> This would be the ideal case. In addition to this, the
> interrupt-parent property handling should be modified to support
> multiple parent phandles like <&parent1 [&parent2] [&parent3] ....>.
> This will be useful to extend the capability of of_irq_init() to
> handle interrupt-controller node with multiple interrupt parents.
> 
> >
> > I'm not opposed to this solution since it is a more natural binding
> > for multiparented interrupt controllers, but I won't commit to it
> > without feedback and agreement from Mitch, Ben, David Gibson, etc.
> 
> Ok. For now, I will go ahead and use solution #2 which you and David
> have suggested. And correspondingly add explicit lookup of wakeup node
> and call to its initialization function in the machine init code.

I'd really prefer a fix to of_irq_init() instead of hacking around it.

g.


--===============6716536112659686775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6716536112659686775==--
