From: padma venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH] ARM: S5P64X0: External Interrupt Support
Date: Mon, 18 Jul 2011 11:16:45 +0530
Message-ID: <CAAgF-BcBwcoibw8-0d+P=ShcQh2bC3sAyqxznRJN3Bip2PuAyg@mail.gmail.com>
References: <1310712094-19831-1-git-send-email-padma.v@samsung.com>
	<20110715090011.GN23270@n2100.arm.linux.org.uk>
	<CAAgF-Bcke26iFsgf0DA3LB5CLv=TkS6UG0y+SBLR=F6TzGYU+A@mail.gmail.com>
	<20110715123429.GP23270@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:61116 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751046Ab1GRFqq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 01:46:46 -0400
Received: by wwe5 with SMTP id 5so2839038wwe.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Jul 2011 22:46:45 -0700 (PDT)
In-Reply-To: <20110715123429.GP23270@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Padmavathi Venna <padma.v@samsung.com>, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Russell,

On Fri, Jul 15, 2011 at 6:04 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Fri, Jul 15, 2011 at 05:23:33PM +0530, padma venkat wrote:
>> Hi Russell,
>>
>> On Fri, Jul 15, 2011 at 2:30 PM, Russell King - ARM Linux
>> <linux@arm.linux.org.uk> wrote:
>> > On Fri, Jul 15, 2011 at 12:11:34PM +0530, Padmavathi Venna wrote:
>> >> +#define eint_offset(irq) =A0 =A0 ((irq) - IRQ_EINT(0))
>> >> +#define eint_irq_to_bit(irq) ((u32)(1 << eint_offset(irq)))
>> >> +
>> >> +static inline void s5p64x0_irq_eint_mask(struct irq_data *data)
>> >> +{
>> >> + =A0 =A0 u32 mask;
>> >> +
>> >> + =A0 =A0 mask =3D __raw_readl(S5P64X0_EINT0MASK);
>> >> + =A0 =A0 mask |=3D (u32)data->chip_data;
>> >> + =A0 =A0 __raw_writel(mask, S5P64X0_EINT0MASK);
>> >> +}
>> >> +
>> >> +static void s5p64x0_irq_eint_unmask(struct irq_data *data)
>> >> +{
>> >> + =A0 =A0 u32 mask;
>> >> +
>> >> + =A0 =A0 mask =3D __raw_readl(S5P64X0_EINT0MASK);
>> >> + =A0 =A0 mask &=3D ~((u32)data->chip_data);
>> >> + =A0 =A0 __raw_writel(mask, S5P64X0_EINT0MASK);
>> >> +}
>> >> +
>> >> +static inline void s5p64x0_irq_eint_ack(struct irq_data *data)
>> >> +{
>> >> + =A0 =A0 __raw_writel((u32)data->chip_data, S5P64X0_EINT0PEND);
>> >> +}
>> >> +
>> >> +static void s5p64x0_irq_eint_maskack(struct irq_data *data)
>> >> +{
>> >> + =A0 =A0 /* compiler should in-line these */
>> >> + =A0 =A0 s5p64x0_irq_eint_mask(data);
>> >> + =A0 =A0 s5p64x0_irq_eint_ack(data);
>> >> +}
>> >
>> > Won't genirqchip support deal with all of the above for you?
>> As per my understanding, to deal with low level interrupt hardware a=
ccess
>> we need to use the accessor functions. Please suggest me if there is
>> any better way of doing this.
>
> I'm not saying don't have these. =A0I'm saying use the _generic_ irqc=
hip
> support which has the code implemented to set and clear bits in regis=
ters.
> Something like this:
>
> =A0 =A0 =A0 =A0struct irq_chip_generic *gc;
>
> =A0 =A0 =A0 =A0gc =3D irq_alloc_generic_chip(name, 1, first_irq, base=
_of_controller,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0handler);
>
> =A0 =A0 =A0 =A0gc->chip_types->chip.irq_ack =3D irq_gc_ack;
> =A0 =A0 =A0 =A0gc->chip_types->chip.irq_mask =3D irq_gc_mask_set_bit;
> =A0 =A0 =A0 =A0gc->chip_types->chip.irq_unmask =3D irq_gc_mask_clr_bi=
t;
>
> =A0 =A0 =A0 =A0/* replace the two below with the _real_ offset, rathe=
r than these calculations */
> =A0 =A0 =A0 =A0gc->chip_types->reg.ack =3D S5P64X0_EINT0PEND - base_o=
f_controller;
> =A0 =A0 =A0 =A0gc->chip_types->reg.mask =3D S5P64X0_EINT0MASK - base_=
of_controller;
>
> =A0 =A0 =A0 =A0irq_setup_generic_chip(gc, mask_of_irqs_to_setup,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0IRQ_GC_INIT_MASK_CACHE, flags_to_clear=
, flags_to_set);
>
Thanks for your explanation.
I will remake the patch based on generic_irq_chip support and resend th=
e same.

Best Regards
Padma
