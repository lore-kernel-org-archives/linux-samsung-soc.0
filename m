From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 6/6] irqchip: s3c24xx: add s3c2450 interrupt definitions
Date: Mon, 18 Mar 2013 17:14:52 -0500
Message-ID: <514791DC.9070600@gmail.com>
References: <201303171404.06146.heiko@sntech.de>
 <201303171409.07774.heiko@sntech.de> <5147389B.5060105@gmail.com>
 <201303181753.16547.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201303181753.16547.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 03/18/2013 11:53 AM, Heiko St=FCbner wrote:
> Hi Rob,
> =

> Am Montag, 18. M=E4rz 2013, 16:54:03 schrieb Rob Herring:
>> On 03/17/2013 08:09 AM, Heiko St=FCbner wrote:
>>> The s3c2450 is special in that it shares the cpu identification with the
>>> s3c2416 but provides more interrupts for its additional components.
>>>
>>> It also shares the layout of the main interrupt register with the s3c24=
43
>>> and therefore reuses this definition.
>>>
>>> As no non-dt boards are present, the s3c2450 irqs will only be
>>> accessible thru devicetree.

[snip]

>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA4 */
>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA5 */
>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 18 }, /* UART3-RX */
>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 18 }, /* UART3-TX */
>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 18 }, /* UART3-ERR */
>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 9 }, /* WDT */
>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 9 }, /* AC97 */
>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA6 */
>>> +	{ .type =3D S3C_IRQTYPE_LEVEL, .parent_irq =3D 17 }, /* DMA7 */
>>
>> This all seems like information that should come from DT.
> =

> In the first iterations [0] of theis series it was done this way, but was =

> suggested that these informations _might_ be implementation specific and =
not =

> describing the hardware.
> =

> As I didn't get any "final" feedback on the matter, I tried it this way t=
his =

> time. Personally I also did like the previous variant better, as the driv=
er =

> could loose all the declaration stuff when platforms move to dt.
> =

> I would be glad for a hint if the first approach was the correct one.
> =

> =

> [0] "irqchip: irq-s3c24xx: add devicetree support" from 2013-02-18, also =
with =

> you in the recipient list

I'm inclined to say the prior way is more in the right direction.
However, I'm not really clear what you are trying to describe.

> +		s3c24xx,irqlist =3D <2 0 /* 2D */
> +				   2 0 /* IIC1 */
> +				   0 0 /* reserved */
> +				   0 0 /* reserved */
> +				   2 0 /* PCM0 */
> +				   2 0 /* PCM1 */
> +				   2 0 /* I2S0 */
> +				   2 0>; /* I2S1 */

My first thought here is this information should not be centralized in
the controller node, but placed with each source node (2D, I2C1, etc).

Rob
