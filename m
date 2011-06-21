From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/6] serial: samsung: Add device tree support for s5pv210
 uart driver
Date: Tue, 21 Jun 2011 16:56:23 +0530
Message-ID: <BANLkTikNXfCXF1ZH=wTeeuSz2DC7BE_5Cg@mail.gmail.com>
References: <1308567752-13451-1-git-send-email-thomas.abraham@linaro.org>
	<1308567752-13451-3-git-send-email-thomas.abraham@linaro.org>
	<BANLkTi=+FKz-uPtSv572y5ORorMeGR8Anw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:42057 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756393Ab1FUL0Y convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 07:26:24 -0400
Received: by qwk3 with SMTP id 3so1223162qwk.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jun 2011 04:26:23 -0700 (PDT)
In-Reply-To: <BANLkTi=+FKz-uPtSv572y5ORorMeGR8Anw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

Hi Grant,

On 20 June 2011 22:13, Grant Likely <grant.likely@secretlab.ca> wrote:
>
> For custom properties, you should prefix the property name with 'sams=
ung,'.
>
> This looks very much like directly encoding the Linux flags into the
> device tree. =A0The binding should be completely contained within
> itself, and not refer to OS implementation details. =A0It is fine to =
use
> the same values that Linux happens to use, but they need to still be
> explicitly documented as to what they mean. =A0Also, a 'flags' proper=
ty
> usually isn't very friendly to mere-mortals when the explicit
> behaviour can be enabled with the presence of a named property. =A0Fo=
r
> example; something like a "samsung,uart-has-rtscts" to enable rts/cts=
=2E

I will ensure that the next version of the patch do not have any linux
specific bindings.

>
>> +
>> +- has_fracval : Set to 1, if the controller supports fractional par=
t of
>> + =A0 =A0 =A0 for the baud divisor, otherwise, set to 0.
>
> Boolean stuff often doesn't need a value. =A0If the property is prese=
nt,
> it is a '1'. =A0If it isn't, then it is a '0'.
>
>> +
>> +- ucon_default : Default board specific setting of UCON register.
>> +
>> +- ulcon_default : Default board specific setting of ULCON register.
>> +
>> +- ufcon_default : Default board specific setting of UFCON register.
>
> I think I've commented on this before, but I do try to avoid direct
> coding registers into the DT. =A0That said, sometimes there really is=
n't
> a nice human-friendly way of encoding things and direct register
> values is the best approach.

Instead of default register values, is it acceptable to include custom
properties like "samsung,txfifo-trig-level" and then convert it to
corresponding register settings?

>
>> +
>> +- uart_clksrc : One or more child nodes representing the clock sour=
ces that
>> + =A0 =A0 =A0 could be used to derive the buad rate. Each of these c=
hild nodes
>> + =A0 =A0 =A0 has four required properties.
>> +
>> + =A0 =A0 =A0 - name : Name of the parent clock.
>> + =A0 =A0 =A0 - divisor : divisor from the clock to the uart control=
ler.
>> + =A0 =A0 =A0 - min_baud : Minimum baud rate for which this clock ca=
n be used.
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Set to zero, if there =
is no limitation.
>> + =A0 =A0 =A0 - max_buad : Maximum baud rate for which this clock ca=
n be used.
>
> typo: s/buad/baud/
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Set to zero, if there =
is no limitation.
>
> This looks to be directly encoding the current Linux implementation
> details into the device tree (it is a direct copy of the config
> structure members), and it doesn't use the common clock binding. =A0I=
t's
> fine to use sub nodes for each clock attachment, particularly because
> it looks like the uart is able to apply it's own divisor to the clock
> input, but I would definitely encode the data using the existing
> struct clock binding.
>
>> +
>> +Optional properties:
>> +- fifosize: Size of the tx/rx fifo used in the controller. If not s=
pecified,
>> + =A0 =A0 =A0 the default value of the fifosize is 16.
>> diff --git a/drivers/tty/serial/s5pv210.c b/drivers/tty/serial/s5pv2=
10.c
>> index 3b2021a..9aacbda 100644
>> --- a/drivers/tty/serial/s5pv210.c
>> +++ b/drivers/tty/serial/s5pv210.c
>> @@ -18,6 +18,7 @@
>> =A0#include <linux/init.h>
>> =A0#include <linux/serial_core.h>
>> =A0#include <linux/serial.h>
>> +#include <linux/of.h>
>>
>> =A0#include <asm/irq.h>
>> =A0#include <mach/hardware.h>
>> @@ -131,15 +132,39 @@ static struct s3c24xx_uart_info *s5p_uart_inf[=
] =3D {
>> =A0/* device management */
>> =A0static int s5p_serial_probe(struct platform_device *pdev)
>> =A0{
>> - =A0 =A0 =A0 return s3c24xx_serial_probe(pdev, s5p_uart_inf[pdev->i=
d]);
>> + =A0 =A0 =A0 const void *prop;
>> + =A0 =A0 =A0 unsigned int port =3D pdev->id;
>> + =A0 =A0 =A0 unsigned int fifosize =3D 16;
>> + =A0 =A0 =A0 static unsigned int probe_index;
>> +
>> + =A0 =A0 =A0 if (pdev->dev.of_node) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop =3D of_get_property(pdev->dev.of_=
node, "fifosize", NULL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (prop)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fifosize =3D be32_to_c=
pu(*(u32 *)prop);
>
> Okay, this is getting ugly (not your fault, but this pattern has
> become too common. =A0Can you craft and post a patch that adds the
> following functions to drivers/of/base.c and include/linux/of.h
>
> /* offset in cells, not bytes */
> int dt_decode_u32(struct *property, int offset, u32 *out_val)
> {
> =A0 =A0 =A0 =A0if (!property || !property->value)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0if ((offset + 1) * 4 > property->length)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0*out_val =3D of_read_number(property->value + (offset =
* 4), 1);
> =A0 =A0 =A0 =A0return 0;
> }
> int dt_decode_u64(struct *property, int offset, u64 *out_val)
> {
> ...
> }
> int dt_decode_string(struct *property, int index, char **out_string);
> {
> ...
> }
>
> Plus a set of companion functions:
> int dt_getprop_u32(struct device_node *np, char *propname, int offset=
,
> u32 *out_val)
> {
> =A0 =A0 =A0 =A0return dt_decode_u32(of_find_property(np, propname, NU=
LL),
> offset, out_val);
> }
> int dt_getprop_u64(struct *device_node, char *propname, int offset,
> u64 *out_val);
> {
> ...
> }
> int dt_getprop_string(struct *device_node, char *propname, int index,
> char **out_string);
> {
> ...
> }
>
> Then you'll be able to simply do the following to decode each
> property, with fifosize being left alone if the property cannot be
> found or decoded:
>
> dt_getprop_u32(pdev->dev.of_node, "samsung,fifosize", &fifosize);

Sure. I will write the above listed functions and submit a patch.

Thanks,
Thomas.
