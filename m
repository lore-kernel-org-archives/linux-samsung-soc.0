From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: Device node for a controller with two interrupt parents
Date: Wed, 21 Mar 2012 19:05:26 +0530
Message-ID: <CAJuYYwSv9aoCWNJ9=m9LjaaGqvzEA07SHt6wT56HTNLQdkNU2Q@mail.gmail.com>
References: <CAJuYYwT1uKaUDuh98i4B286az-_26YCN31UXXFWsP=_M-UL_vg@mail.gmail.com>
	<20120321034151.GC15997@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:60118 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752459Ab2CUNf2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Mar 2012 09:35:28 -0400
Received: by vbbff1 with SMTP id ff1so466692vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Mar 2012 06:35:27 -0700 (PDT)
In-Reply-To: <20120321034151.GC15997@truffala.fritz.box>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>

Hi David,

On 21 March 2012 09:11, David Gibson <david@gibson.dropbear.id.au> wrot=
e:
> On Wed, Mar 21, 2012 at 07:55:43AM +0530, Thomas Abraham wrote:
>> Hi,
>>
>> Exynos5 includes a gpio wakeup interrupt controller that generates 3=
2
>> interrupts. The first 16 interrupts are routed to the interrupt
>> combiner controller. The last 16 are muxed into one interrupt and th=
is
>> interrupt line is connected to the GIC interrupt controller.
>>
>> So, the wakeup interrupt controller node in device tree requires two
>> interrupt parents. I do not know how to handle this. Any suggestions
>> will be very helpful.
>
> This has occurred before, for example on the MAL device on 440EP (see
> the bamboo board dts for example). =A0The semi-standard approach is t=
o
> make the node an interrupt-nexus for itself. =A0That is in the node's
> interrupts property, just list 0..N giving as many interrupts as you
> need. =A0Set the node's interrupt-parent to point to the node itself,
> then add interrupt-map and interrupt-map-mask properties which remap
> those interrupts 0..N to the correct interrupts on the actual
> interrupt controllers. =A0Each entry in the interrupt map specifies a=
n
> interrupt parent phandle, so you can distribute the irqs to multiple
> interrupt controllers that way.

Thanks for your suggestion and pointing out an example. I tried this
approach for Exynos4 and Exynos5. It mostly works but there are two
issues here.

1. In the Exynos5 case, the wakeup interrupt controller (which has two
separate interrupt parents - gic and combiner) is itself a interrupt
controller and has the 'interrupt-controller' property. So
of_irq_map_raw() function does not process the interrupt-map in the
wakeup interrupt controller device node. I did the following change to
get past this but I am not sure if this the correct thing to do.

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 9cf0060..892ac95 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -152,7 +152,8 @@ int of_irq_map_raw(struct device_node *parent,
const __be32 *intspec,
                /* Now check if cursor is an interrupt-controller and i=
f it is
                 * then we are done
                 */
-               if (of_get_property(ipar, "interrupt-controller", NULL)=
 !=3D
+               if (!of_get_property(ipar, "interrupt-map", &imaplen) &=
&
+                       of_get_property(ipar, "interrupt-controller", N=
ULL) !=3D
                                NULL) {
                        pr_debug(" -> got it !\n");
                        for (i =3D 0; i < intsize; i++)


2. The of_irq_init() function (mainly used on the arm platforms) looks
for nodes with 'interrupt-controller' and initializes them with the
parents initialized first. In the Exynos4/5 case, the wakeup interrupt
has two interrupt parents and of_irq_init() function does not seem to
be consider this case. And hence, the wakeup interrupt controller is
being initialized, without the combiner being initialized.

The following are the interrupt-controller nodes, that I have been
testing with (slightly modified for testing)

       gic:interrupt-controller@10490000 {
               compatible =3D "arm,cortex-a9-gic";
               #interrupt-cells =3D <3>;
               #address-cells =3D <0>;
               #size-cells =3D <0>;
               interrupt-controller;
               cpu-offset =3D <0x8000>;
               reg =3D <0x10490000 0x1000>, <0x10480000 0x100>;
       };

       combiner:interrupt-controller@10440000 {
               compatible =3D "samsung,exynos4210-combiner";
               #interrupt-cells =3D <2>;
               interrupt-controller;
               samsung,combiner-nr =3D <16>;
               reg =3D <0x10440000 0x1000>;
               interrupts =3D <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
                            <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
                            <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
                            <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>;
       };

       wakeup_eint: interrupt-controller@11000000 {
               compatible =3D "samsung,exynos4210-wakeup-eint";
               reg =3D <0x11000000 0x1000>;
               interrupt-controller;
               #interrupt-cells =3D <1>;
               interrupt-parent =3D <&wakeup_eint>;
               interrupts =3D <0x0>, <0x1>, <0x2>, <0x3>,
                               <0x4>, <0x5>, <0x6>, <0x7>,
                               <0x8>, <0x9>, <0xa>, <0xb>,
                               <0xc>, <0xd>, <0xe>, <0xf>,
                               <0x10>;
               #address-cells =3D <0>;
               #size-cells =3D <0>;
               interrupt-map =3D <0x0 &gic 0 16 0>,
                               <0x1 &gic 0 17 0>,
                               <0x2 &gic 0 18 0>,
                               <0x3 &gic 0 19 0>,
                               <0x4 &gic 0 20 0>,
                               <0x5 &gic 0 21 0>,
                               <0x6 &gic 0 22 0>,
                               <0x7 &gic 0 23 0>,
                               <0x8 &gic 0 24 0>,
                               <0x9 &gic 0 25 0>,
                               <0xa &gic 0 26 0>,
                               <0xb &gic 0 27 0>,
                               <0xc &gic 0 28 0>,
                               <0xd &gic 0 29 0>,
                               <0xe &gic 0 30 0>,
                               <0xf &gic 0 31 0>,
                               <0x10 &combiner 2 4>;
       };

Thanks,
Thomas.
