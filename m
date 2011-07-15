From: padma venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH] ARM: S5P64X0: External Interrupt Support
Date: Fri, 15 Jul 2011 17:23:33 +0530
Message-ID: <CAAgF-Bcke26iFsgf0DA3LB5CLv=TkS6UG0y+SBLR=F6TzGYU+A@mail.gmail.com>
References: <1310712094-19831-1-git-send-email-padma.v@samsung.com>
	<20110715090011.GN23270@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:56284 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767Ab1GOLzl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2011 07:55:41 -0400
Received: by wyg8 with SMTP id 8so751783wyg.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Jul 2011 04:55:40 -0700 (PDT)
In-Reply-To: <20110715090011.GN23270@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Padmavathi Venna <padma.v@samsung.com>, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Russell,

On Fri, Jul 15, 2011 at 2:30 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Fri, Jul 15, 2011 at 12:11:34PM +0530, Padmavathi Venna wrote:
>> +#define eint_offset(irq) =A0 =A0 ((irq) - IRQ_EINT(0))
>> +#define eint_irq_to_bit(irq) ((u32)(1 << eint_offset(irq)))
>> +
>> +static inline void s5p64x0_irq_eint_mask(struct irq_data *data)
>> +{
>> + =A0 =A0 u32 mask;
>> +
>> + =A0 =A0 mask =3D __raw_readl(S5P64X0_EINT0MASK);
>> + =A0 =A0 mask |=3D (u32)data->chip_data;
>> + =A0 =A0 __raw_writel(mask, S5P64X0_EINT0MASK);
>> +}
>> +
>> +static void s5p64x0_irq_eint_unmask(struct irq_data *data)
>> +{
>> + =A0 =A0 u32 mask;
>> +
>> + =A0 =A0 mask =3D __raw_readl(S5P64X0_EINT0MASK);
>> + =A0 =A0 mask &=3D ~((u32)data->chip_data);
>> + =A0 =A0 __raw_writel(mask, S5P64X0_EINT0MASK);
>> +}
>> +
>> +static inline void s5p64x0_irq_eint_ack(struct irq_data *data)
>> +{
>> + =A0 =A0 __raw_writel((u32)data->chip_data, S5P64X0_EINT0PEND);
>> +}
>> +
>> +static void s5p64x0_irq_eint_maskack(struct irq_data *data)
>> +{
>> + =A0 =A0 /* compiler should in-line these */
>> + =A0 =A0 s5p64x0_irq_eint_mask(data);
>> + =A0 =A0 s5p64x0_irq_eint_ack(data);
>> +}
>
> Won't genirqchip support deal with all of the above for you?
As per my understanding, to deal with low level interrupt hardware acce=
ss
we need to use the accessor functions. Please suggest me if there is
any better way of doing this.
>
>> +
>> +static int s5p64x0_irq_eint_set_type(struct irq_data *data, unsigne=
d int type)
>> +{
>> + =A0 =A0 int offs =3D eint_offset(data->irq);
>> + =A0 =A0 int shift;
>> + =A0 =A0 u32 ctrl, mask;
>> + =A0 =A0 u32 newvalue =3D 0;
>> + =A0 =A0 unsigned int id;
>> +
>> + =A0 =A0 if (offs > 15)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 switch (type) {
>> + =A0 =A0 case IRQ_TYPE_NONE:
>> + =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "No edge setting!\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> +
>> + =A0 =A0 case IRQ_TYPE_EDGE_RISING:
>> + =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S3C2410_EXTINT_RISEEDGE;
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> +
>> + =A0 =A0 case IRQ_TYPE_EDGE_FALLING:
>> + =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S3C2410_EXTINT_FALLEDGE;
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> +
>> + =A0 =A0 case IRQ_TYPE_EDGE_BOTH:
>> + =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S3C2410_EXTINT_BOTHEDGE;
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> +
>> + =A0 =A0 case IRQ_TYPE_LEVEL_LOW:
>> + =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S3C2410_EXTINT_LOWLEV;
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> +
>> + =A0 =A0 case IRQ_TYPE_LEVEL_HIGH:
>> + =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S3C2410_EXTINT_HILEV;
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> +
>> + =A0 =A0 default:
>> + =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "No such irq type %d", typ=
e);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -1;
>
> NO! =A0Stop this right now and never do it again. =A0Please _always_ =
look
> up the right error code and use it.
>
> 'return -1' is almost never valid.
I will correct this.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
