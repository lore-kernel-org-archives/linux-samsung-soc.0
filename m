From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 1/3] ARM: dts: Add Peach Pit dts entry for Atmel touchpad
Date: Wed, 27 Aug 2014 15:11:48 +0200
Message-ID: <53FDD914.5090208@suse.de>
References: <1409066937-3574-1-git-send-email-javier.martinez@collabora.co.uk> <1409066937-3574-2-git-send-email-javier.martinez@collabora.co.uk> <53FD1001.30701@suse.de> <53FD8528.7090504@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35275 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933467AbaH0NLx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 09:11:53 -0400
In-Reply-To: <53FD8528.7090504@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Nick Dyer <nick.dyer@itdev.co.uk>, Yufeng Shen <miletus@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Tomasz Figa <tomasz.figa@gmail.com>

Hi Javier,

Am 27.08.2014 09:13, schrieb Javier Martinez Canillas:
> On 08/27/2014 12:53 AM, Andreas F=E4rber wrote:
>>> =20
>>> +&hsi2c_8 {
>>> +	status =3D "okay";
>>> +	clock-frequency =3D <333000>;
>>> +
>>> +	trackpad@4b {
>>> +		compatible=3D"atmel,maxtouch";
>>> +		reg=3D<0x4b>;
>>> +		interrupt-parent=3D<&gpx1>;
>>> +		interrupts=3D<1 IRQ_TYPE_EDGE_FALLING>;
>>
>> Nit: Here's a style break (4x spaces around '=3D' missing).
>>
>=20
> True, these bits were copied from the downstream Chrome OS verbatim a=
nd
> the missing space around '=3D' was there, I missed that when reviewin=
g.
>=20
> I'll re-spin and fix those style issues.
>=20
>>> +		wakeup-source;
>>> +		pinctrl-names =3D "default";
>>> +		pinctrl-0 =3D <&trackpad_irq>;
>>> +		linux,gpio-keymap =3D < KEY_RESERVED
>>> +				      KEY_RESERVED
>>> +				      0		/* GPIO 0 */
>>> +				      0		/* GPIO 1 */
>>> +				      0		/* GPIO 2 */
>>> +				      BTN_LEFT 	/* GPIO 3 */
>>> +				      KEY_RESERVED
>>> +				      KEY_RESERVED >;
>>> +	};
>>
>> Coincidentally, I experimentally came up with a very similar DT node=
 for
>> Spring the weekend:
>>
>> +	trackpad@4b {
>> +		compatible =3D "atmel,maxtouch";
>> +		reg =3D <0x4b>;
>> +		interrupt-parent =3D <&gpx1>;
>> +		interrupts =3D <2 IRQ_TYPE_NONE>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&trackpad_irq>;
>> +		linux,gpio-keymap =3D <KEY_RESERVED
>> +		                     KEY_RESERVED
>> +		                     KEY_RESERVED
>> +		                     KEY_RESERVED
>> +		                     KEY_RESERVED
>> +		                     BTN_LEFT>;
>> +		wakeup-source;
>> +	};
>>
>> 0 =3D=3D KEY_RESERVED, so you can consistently use it for GPIO 0-2, =
too. :)
>>
>=20
> I know that the value of KEY_RESERVED is 0 but I didn't use KEY_RESER=
VED
> for the GPIO on purpose.
>=20
> What I understood is that the SPT_GPIOPWN_T19 object sends messages u=
sing
> a status byte so you have a maximum of 8 GPIO but not every maXTouch
> devices use all of them. So in the particular case of the device in t=
he
> Peach Pit, from the 8 possible GPIO only 4 can be used and these are =
pins
> 2-5. So in theory you could connect 3 more GPIO in case you had more
> buttons (e.g: BTN_RIGHT, BTN_MIDDLE) but only 1 is used since the
> Chromebook just have BTN_LEFT.

=46WIW when I press to the bottom right of my touchpad, I do get
right-click functionality even with just BTN_LEFT specified in the
keymap. Magic. :)

> Nick sent a patch [0] that extend the atmel touchpad DT binding and t=
he
> doc says "Use KEY_RESERVED for unused padding values". But is not cle=
ar
> what value you should use for GPIO that are actually supported by the
> device but have no keycode associated.
>=20
> So by using 0 instead of KEY_RESERVED I wanted to document that pins =
2-4
> are actually supported and not reserved by the device but there is no
> keycode associated with that GPIO.

You already documented that via comments though.

> If there was a BTN_NONE or KEY_UNUSED it would had been better but I =
think
> that making a distinction between these two cases (reserved pin vs GP=
IO
> available but not used) is useful.

Maybe Nick can comment here.

>> I probably should add the two trailing _RESERVEDs, too?
>>
>=20
> I see that is used for properties that are arrays, for example
> "linux,keymap" in Documentation/devicetree/bindings/input/matrix-keym=
ap.txt.

That does not answer my question: Do all maxTouch touchpads (or
specifically that in Spring) need eight entries, padded with said
KEY_RESERVED? In my experiments using just six entries (i.e., until the
non-zero entry) worked okay - so does this T19 message have specificall=
y
eight bits? Tegra used just four entries iirc.

>> With my above snippet I got an awful lot of "Interrupt triggered but
>> zero messages" warnings (which I simply commented out as quickfix).
>> Is that why you are using _EDGE_FALLING? Or pin-function 0xf?
>> (In my case the ChromeOS DT had IRQ_TYPE_NONE and pin-function 0x0.)
>>
>=20
> These are two separate but related things:
>=20
> a) IRQF_TRIGGER_FALLING:
>=20
> Yes, the Chrome OS DT for Peach Pit also has IRQ_TYPE_NONE but the DT=
S is
> not correct.
>=20
> If you look at the Chrome OS atmel driver
> (drivers/input/touchscreen/atmel_mxt_ts.c), it passes IRQF_TRIGGER_FA=
LLING
> to request_threaded_irq():
>=20
> /* Default to falling edge if no platform data provided */
> irqflags =3D data->pdata ? data->pdata->irqflags : IRQF_TRIGGER_FALLI=
NG;
> error =3D request_threaded_irq(client->irq, NULL, mxt_interrupt,
> 			     irqflags | IRQF_ONESHOT,
> 			     client->name, data);
>=20
> The above code is wrong since is overwriting the edge/level type flag=
s set
> by OF when parsing the "interrupts" property so you have to use the
> expected IRQ flags in your DTS.
>=20
> b) pin-function 0xf instead of 0x0:
>=20
> The pin-function 0x0 is GPIO input while 0xf is GPIO IRQ. Usually on =
other
> SoCs to use a GPIO IRQ you just configure the pad as GPIO input and t=
hen
> enable the pin as an interrupt but on Exynos SoC these are really two
> different functions. So if you configure the pin as GPIO input and th=
is
> happens after the pin is configured as GPIO IRQ, interrupts are not t=
riggered.
>=20
> I faced that issue before [1] and was solved with Tomasz's commit:
>=20
> f6a8249 pinctrl: exynos: Lock GPIOs as interrupts when used as EINTs
>=20
> which changes the pinctrl-exynos driver to setup a pin as GPIO IRQ on
> .irq_request_resources instead of .irq_set_type. So, with that patch =
even
> when pin-function re-configures the function to GPIO input, is then
> configured as GPIO IRQ when request_threaded_irq() is called.
>=20
> So probably is working for you just because you tested on linux-next =
that
> already has Tomasz's changes but still the correct thing to do is to =
setup
> the pin as 0xf. This change probably is needed on other pins used as =
GPIO
> IRQ that are using 0x0 now.
>=20
> Sorry, the email became longer than I wanted but I hope is helpful to=
 you.

Thanks for the explanations, I'll test those settings on Spring then.

Could you point me to what ChromeOS tree and branch I should be looking
at? For instance, the linux-next.git chromeos-3.8 branch did not have
any DT for Spring. Therefore my series is based on /proc/device-tree
rather than any ChromeOS source code.

Thanks,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
