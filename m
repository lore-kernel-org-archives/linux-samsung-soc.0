From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5P64X0: External Interrupt Support
Date: Thu, 21 Jul 2011 02:07:46 +0900
Message-ID: <06cb01cc46ff$8dc9a8f0$a95cfad0$%kim@samsung.com>
References: <1310712094-19831-1-git-send-email-padma.v@samsung.com>
 <20110715090011.GN23270@n2100.arm.linux.org.uk>
 <CAAgF-Bcke26iFsgf0DA3LB5CLv=TkS6UG0y+SBLR=F6TzGYU+A@mail.gmail.com>
 <20110715123429.GP23270@n2100.arm.linux.org.uk>
 <CAAgF-BcBwcoibw8-0d+P=ShcQh2bC3sAyqxznRJN3Bip2PuAyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:64948 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751244Ab1GTRHu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2011 13:07:50 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LON00M4568XNRC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 02:07:49 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LON00EDR691SH@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 02:07:49 +0900 (KST)
In-reply-to: <CAAgF-BcBwcoibw8-0d+P=ShcQh2bC3sAyqxznRJN3Bip2PuAyg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'padma venkat' <padma.kvr@gmail.com>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

padma venkat wrote:
>=20
> Hi Russell,
>=20
> On Fri, Jul 15, 2011 at 6:04 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> > On Fri, Jul 15, 2011 at 05:23:33PM +0530, padma venkat wrote:
> >> Hi Russell,
> >>
> >> On Fri, Jul 15, 2011 at 2:30 PM, Russell King - ARM Linux
> >> <linux@arm.linux.org.uk> wrote:
> >> > On Fri, Jul 15, 2011 at 12:11:34PM +0530, Padmavathi Venna wrote=
:
> >> >> +#define eint_offset(irq) =A0 =A0 ((irq) - IRQ_EINT(0))
> >> >> +#define eint_irq_to_bit(irq) ((u32)(1 << eint_offset(irq)))
> >> >> +
> >> >> +static inline void s5p64x0_irq_eint_mask(struct irq_data *data=
)
> >> >> +{
> >> >> + =A0 =A0 u32 mask;
> >> >> +
> >> >> + =A0 =A0 mask =3D __raw_readl(S5P64X0_EINT0MASK);
> >> >> + =A0 =A0 mask |=3D (u32)data->chip_data;
> >> >> + =A0 =A0 __raw_writel(mask, S5P64X0_EINT0MASK);
> >> >> +}
> >> >> +
> >> >> +static void s5p64x0_irq_eint_unmask(struct irq_data *data)
> >> >> +{
> >> >> + =A0 =A0 u32 mask;
> >> >> +
> >> >> + =A0 =A0 mask =3D __raw_readl(S5P64X0_EINT0MASK);
> >> >> + =A0 =A0 mask &=3D ~((u32)data->chip_data);
> >> >> + =A0 =A0 __raw_writel(mask, S5P64X0_EINT0MASK);
> >> >> +}
> >> >> +
> >> >> +static inline void s5p64x0_irq_eint_ack(struct irq_data *data)
> >> >> +{
> >> >> + =A0 =A0 __raw_writel((u32)data->chip_data, S5P64X0_EINT0PEND)=
;
> >> >> +}
> >> >> +
> >> >> +static void s5p64x0_irq_eint_maskack(struct irq_data *data)
> >> >> +{
> >> >> + =A0 =A0 /* compiler should in-line these */
> >> >> + =A0 =A0 s5p64x0_irq_eint_mask(data);
> >> >> + =A0 =A0 s5p64x0_irq_eint_ack(data);
> >> >> +}
> >> >
> >> > Won't genirqchip support deal with all of the above for you?
> >> As per my understanding, to deal with low level interrupt hardware
access
> >> we need to use the accessor functions. Please suggest me if there =
is
> >> any better way of doing this.
> >
> > I'm not saying don't have these. =A0I'm saying use the _generic_ ir=
qchip
> > support which has the code implemented to set and clear bits in
registers.
> > Something like this:
> >
> > =A0 =A0 =A0 =A0struct irq_chip_generic *gc;
> >
> > =A0 =A0 =A0 =A0gc =3D irq_alloc_generic_chip(name, 1, first_irq,
base_of_controller,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0handler);
> >
> > =A0 =A0 =A0 =A0gc->chip_types->chip.irq_ack =3D irq_gc_ack;
> > =A0 =A0 =A0 =A0gc->chip_types->chip.irq_mask =3D irq_gc_mask_set_bi=
t;
> > =A0 =A0 =A0 =A0gc->chip_types->chip.irq_unmask =3D irq_gc_mask_clr_=
bit;
> >
> > =A0 =A0 =A0 =A0/* replace the two below with the _real_ offset, rat=
her than
these
> calculations */
> > =A0 =A0 =A0 =A0gc->chip_types->reg.ack =3D S5P64X0_EINT0PEND - base=
_of_controller;
> > =A0 =A0 =A0 =A0gc->chip_types->reg.mask =3D S5P64X0_EINT0MASK -
base_of_controller;
> >
> > =A0 =A0 =A0 =A0irq_setup_generic_chip(gc, mask_of_irqs_to_setup,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0IRQ_GC_INIT_MASK_CACHE, flags_to_cle=
ar, flags_to_set);
> >
> Thanks for your explanation.
> I will remake the patch based on generic_irq_chip support and resend =
the
same.
>=20
Hmm...any updated patch on this?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
