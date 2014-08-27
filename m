From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v2 1/3] ARM: dts: Add Peach Pit dts entry for Atmel touchpad
Date: Wed, 27 Aug 2014 09:13:44 +0200
Message-ID: <53FD8528.7090504@collabora.co.uk>
References: <1409066937-3574-1-git-send-email-javier.martinez@collabora.co.uk> <1409066937-3574-2-git-send-email-javier.martinez@collabora.co.uk> <53FD1001.30701@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:47329 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751998AbaH0HNx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 03:13:53 -0400
In-Reply-To: <53FD1001.30701@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Nick Dyer <nick.dyer@itdev.co.uk>, Yufeng Shen <miletus@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Tomasz Figa <tomasz.figa@gmail.com>

Hello Andreas,

On 08/27/2014 12:53 AM, Andreas F=E4rber wrote:
>> =20
>> +&hsi2c_8 {
>> +	status =3D "okay";
>> +	clock-frequency =3D <333000>;
>> +
>> +	trackpad@4b {
>> +		compatible=3D"atmel,maxtouch";
>> +		reg=3D<0x4b>;
>> +		interrupt-parent=3D<&gpx1>;
>> +		interrupts=3D<1 IRQ_TYPE_EDGE_FALLING>;
>=20
> Nit: Here's a style break (4x spaces around '=3D' missing).
>

True, these bits were copied from the downstream Chrome OS verbatim and
the missing space around '=3D' was there, I missed that when reviewing.

I'll re-spin and fix those style issues.

>> +		wakeup-source;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&trackpad_irq>;
>> +		linux,gpio-keymap =3D < KEY_RESERVED
>> +				      KEY_RESERVED
>> +				      0		/* GPIO 0 */
>> +				      0		/* GPIO 1 */
>> +				      0		/* GPIO 2 */
>> +				      BTN_LEFT 	/* GPIO 3 */
>> +				      KEY_RESERVED
>> +				      KEY_RESERVED >;
>> +	};
>=20
> Coincidentally, I experimentally came up with a very similar DT node =
for
> Spring the weekend:
>=20
> +	trackpad@4b {
> +		compatible =3D "atmel,maxtouch";
> +		reg =3D <0x4b>;
> +		interrupt-parent =3D <&gpx1>;
> +		interrupts =3D <2 IRQ_TYPE_NONE>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&trackpad_irq>;
> +		linux,gpio-keymap =3D <KEY_RESERVED
> +		                     KEY_RESERVED
> +		                     KEY_RESERVED
> +		                     KEY_RESERVED
> +		                     KEY_RESERVED
> +		                     BTN_LEFT>;
> +		wakeup-source;
> +	};
>=20
> 0 =3D=3D KEY_RESERVED, so you can consistently use it for GPIO 0-2, t=
oo. :)
>=20

I know that the value of KEY_RESERVED is 0 but I didn't use KEY_RESERVE=
D
for the GPIO on purpose.

What I understood is that the SPT_GPIOPWN_T19 object sends messages usi=
ng
a status byte so you have a maximum of 8 GPIO but not every maXTouch
devices use all of them. So in the particular case of the device in the
Peach Pit, from the 8 possible GPIO only 4 can be used and these are pi=
ns
2-5. So in theory you could connect 3 more GPIO in case you had more
buttons (e.g: BTN_RIGHT, BTN_MIDDLE) but only 1 is used since the
Chromebook just have BTN_LEFT.

Nick sent a patch [0] that extend the atmel touchpad DT binding and the
doc says "Use KEY_RESERVED for unused padding values". But is not clear
what value you should use for GPIO that are actually supported by the
device but have no keycode associated.

So by using 0 instead of KEY_RESERVED I wanted to document that pins 2-=
4
are actually supported and not reserved by the device but there is no
keycode associated with that GPIO.

If there was a BTN_NONE or KEY_UNUSED it would had been better but I th=
ink
that making a distinction between these two cases (reserved pin vs GPIO
available but not used) is useful.

> I probably should add the two trailing _RESERVEDs, too?
>=20

I see that is used for properties that are arrays, for example
"linux,keymap" in Documentation/devicetree/bindings/input/matrix-keymap=
=2Etxt.

> With my above snippet I got an awful lot of "Interrupt triggered but
> zero messages" warnings (which I simply commented out as quickfix).
> Is that why you are using _EDGE_FALLING? Or pin-function 0xf?
> (In my case the ChromeOS DT had IRQ_TYPE_NONE and pin-function 0x0.)
>

These are two separate but related things:

a) IRQF_TRIGGER_FALLING:

Yes, the Chrome OS DT for Peach Pit also has IRQ_TYPE_NONE but the DTS =
is
not correct.

If you look at the Chrome OS atmel driver
(drivers/input/touchscreen/atmel_mxt_ts.c), it passes IRQF_TRIGGER_FALL=
ING
to request_threaded_irq():

/* Default to falling edge if no platform data provided */
irqflags =3D data->pdata ? data->pdata->irqflags : IRQF_TRIGGER_FALLING=
;
error =3D request_threaded_irq(client->irq, NULL, mxt_interrupt,
			     irqflags | IRQF_ONESHOT,
			     client->name, data);

The above code is wrong since is overwriting the edge/level type flags =
set
by OF when parsing the "interrupts" property so you have to use the
expected IRQ flags in your DTS.

b) pin-function 0xf instead of 0x0:

The pin-function 0x0 is GPIO input while 0xf is GPIO IRQ. Usually on ot=
her
SoCs to use a GPIO IRQ you just configure the pad as GPIO input and the=
n
enable the pin as an interrupt but on Exynos SoC these are really two
different functions. So if you configure the pin as GPIO input and this
happens after the pin is configured as GPIO IRQ, interrupts are not tri=
ggered.

I faced that issue before [1] and was solved with Tomasz's commit:

f6a8249 pinctrl: exynos: Lock GPIOs as interrupts when used as EINTs

which changes the pinctrl-exynos driver to setup a pin as GPIO IRQ on
=2Eirq_request_resources instead of .irq_set_type. So, with that patch =
even
when pin-function re-configures the function to GPIO input, is then
configured as GPIO IRQ when request_threaded_irq() is called.

So probably is working for you just because you tested on linux-next th=
at
already has Tomasz's changes but still the correct thing to do is to se=
tup
the pin as 0xf. This change probably is needed on other pins used as GP=
IO
IRQ that are using 0x0 now.

Sorry, the email became longer than I wanted but I hope is helpful to y=
ou.

> Regards,
> Andreas
>=20

Best regards,
Javier

[0]: https://lkml.org/lkml/2014/8/15/244
[1]: https://lkml.org/lkml/2014/8/8/621
