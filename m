From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v3 6/6] irqchip: s3c24xx: add s3c2450 interrupt definitions
Date: Mon, 18 Mar 2013 21:28:59 -0500
Message-ID: <5147CD6B.80107@gmail.com>
References: <201303171404.06146.heiko@sntech.de> <201303181753.16547.heiko@sntech.de> <514791DC.9070600@gmail.com> <201303190034.49875.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:35733 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754529Ab3CSC3C (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Mar 2013 22:29:02 -0400
Received: by mail-oa0-f44.google.com with SMTP id h1so6410234oag.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Mar 2013 19:29:01 -0700 (PDT)
In-Reply-To: <201303190034.49875.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>

On 03/18/2013 06:34 PM, Heiko St=FCbner wrote:
> Am Montag, 18. M=E4rz 2013, 23:14:52 schrieb Rob Herring:
>> On 03/18/2013 11:53 AM, Heiko St=FCbner wrote:
>>> Hi Rob,
>>>
>>> Am Montag, 18. M=E4rz 2013, 16:54:03 schrieb Rob Herring:
>>>> On 03/17/2013 08:09 AM, Heiko St=FCbner wrote:
>>>>> The s3c2450 is special in that it shares the cpu identification w=
ith
>>>>> the s3c2416 but provides more interrupts for its additional
>>>>> components.
>>>>>
>>>>> It also shares the layout of the main interrupt register with the
>>>>> s3c2443 and therefore reuses this definition.
>>>>>
>>>>> As no non-dt boards are present, the s3c2450 irqs will only be
>>>>> accessible thru devicetree.
>>
>> [snip]
>>
>>>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA4 */
>>>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA5 */
>>>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 18 }, /* UART3-R=
X */
>>>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 18 }, /* UART3-T=
X */
>>>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 18 }, /* UART3-E=
RR */
>>>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 9 }, /* WDT */
>>>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 9 }, /* AC97 */
>>>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA6 */
>>>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA7 */
>>>>
>>>> This all seems like information that should come from DT.
>>>
>>> In the first iterations [0] of theis series it was done this way, b=
ut was
>>> suggested that these informations _might_ be implementation specifi=
c and
>>> not describing the hardware.
>>>
>>> As I didn't get any "final" feedback on the matter, I tried it this=
 way
>>> this time. Personally I also did like the previous variant better, =
as
>>> the driver could loose all the declaration stuff when platforms mov=
e to
>>> dt.
>>>
>>> I would be glad for a hint if the first approach was the correct on=
e.
>>>
>>>
>>> [0] "irqchip: irq-s3c24xx: add devicetree support" from 2013-02-18,=
 also
>>> with you in the recipient list
>>
>> I'm inclined to say the prior way is more in the right direction.
>> However, I'm not really clear what you are trying to describe.
>>
>>> +		s3c24xx,irqlist =3D <2 0 /* 2D */
>>> +				   2 0 /* IIC1 */
>>> +				   0 0 /* reserved */
>>> +				   0 0 /* reserved */
>>> +				   2 0 /* PCM0 */
>>> +				   2 0 /* PCM1 */
>>> +				   2 0 /* I2S0 */
>>> +				   2 0>; /* I2S1 */
>=20
> The s3c24xx SoCs contain one (or two) main interrupt controllers. Tha=
t are the=20
> nodes that gets checked by handle_irq. Additionally they contain some=
thing=20
> called a sub-register which provides more specific irq for some of th=
em.
>=20
> The list you quoted, is meant to describe which bits of the interrupt=
 register=20
> contain a valid interrupt at all (!=3D 0), which handler should be us=
ed (2 for=20
> the edge handler, 3 for level handler). The second argument contains =
the bit=20
> in the parent interrupt register that contains the parent interrupt, =
that gets=20
> checked in the irq_entry function.
>=20
> The original code (which I reworked into this more declarative form)=20
> distinguished very much between using the edge handler for some and t=
he level=20
> handler for other interrupts.
>=20
> This list is essentially the same representation of the list you quot=
ed above=20
> and which also can be found in [0]
>=20
> Going this way makes it easy to map datasheet values to interrupt num=
ber. When=20
> I read the ac97 interrupt is in bit 28 of the sub-register I can simp=
ly=20
> reference it as
> 		interrupt-parent =3D <&subintc>;
> 		interrupts =3D <28>;
>=20
>=20
> So these lists only desribe the internal structure of the interrupt c=
ontroller=20
> registers, which vary for each s3c24xx variant.
>=20
>=20
>> My first thought here is this information should not be centralized =
in
>> the controller node, but placed with each source node (2D, I2C1, etc=
).
>=20
> I'm not sure I can follow currently :-)
>=20
> I'll try an example:
>=20
> The s3c serial driver expects the interrupts for uart tx and rx and t=
he dt=20
> entry would look like:
>=20
> 	serial@50000000 {
> 		compatible =3D "samsung,s3c2410-uart";
> 		reg =3D <0x50000000 0x4000>;
> 		interrupt-parent =3D <&subintc>;
> 		interrupts =3D <0>, <1>;

So what does 0 and 1 correspond to? These are the bits in the subintc?

> 	};
>=20
> the map for these in the subintc looks like
>                s3c24xx,irqlist =3D <3 28 /* UART0-RX */
>                                   3 28 /* UART0-TX */
>                                   3 28 /* UART0-ERR */
>=20
> marking them as using the level-handler and being children of the int=
errupt in=20
> bit 28 of the intc handler.
>=20
> So the irq_entry would check the intc, see the waiting interrupt in b=
it 28,=20
> jump to the demux function which would then handle which ever of rx,t=
x or err=20
> would be waiting, which then get sent to the serial driver.
>=20
> These mappings between sub- and parent irqs also vary very much betwe=
en the=20
> different s3c24xx variants, as can be seen by the multitude of lists =
in [0]=20
> and the parent interrupts are only used for demuxing purposes.
>=20
> -----
> A notable speciality are the AC97 (sound) and watchdog interrupts (bi=
ts 27 and=20
> 28 of the subregister), as they share a common parent interrupt (bit =
9 of the=20
> main interrupt register).
>=20
> So irq_entry checks the main register, sees bit 9 (ac97/watchdog), de=
muxes it=20
> to either coming from the ac97 or watchdog and sends it to the releva=
nt=20
> driver.
>=20
> I don't think this should be exposed to the drivers at all :-) .
> -------
>=20
> So I'm not sure, how this would be able to go in the driver nodes.

The information in an interrupts property is transparent to the driver,
but can contain extra cells with whatever information you need. The GIC
binding has SPI or PPI interrupt type information for example.

> The only thing I could think of, would be to make the handler adjusta=
ble via=20
> the regular interrupts properties (i.e. as two_cell) which would brin=
g the=20
> list down to only list the parent relationships.
>=20
> Hmm ... and this parent list might be doable via the regular interrup=
ts=20
> property, so the subintc would look like:
>=20
> subintc: subintc =3D {
> 	interrupt-parent =3D <&intc>;
> 	interrupts =3D <28 0>, <28 0>, <28 0>, <23 0>, <23 0>, .....
> 	/*		     bit0    bit1    bit2    bit3    bit4   ..... */
> }
>=20
> i.e. naming the parent interrupt for each of the interrupt bits of th=
e sub-
> controller. Would this be the right direction?

I think you may want to use an interrupt-map property. That should allo=
w
you to do arbitrary mappings from one interrupt controller's numbering
to another's numbering. The VExpress and several PPC platforms have
examples.

Rob
