From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v2 1/3] ARM: dts: Add Peach Pit dts entry for Atmel touchpad
Date: Wed, 27 Aug 2014 16:22:42 +0200
Message-ID: <53FDE9B2.4040001@collabora.co.uk>
References: <1409066937-3574-1-git-send-email-javier.martinez@collabora.co.uk> <1409066937-3574-2-git-send-email-javier.martinez@collabora.co.uk> <53FD1001.30701@suse.de> <53FD8528.7090504@collabora.co.uk> <53FDD914.5090208@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53FDD914.5090208@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Nick Dyer <nick.dyer@itdev.co.uk>, Yufeng Shen <miletus@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Tomasz Figa <tomasz.figa@gmail.com>, Daniel Stone <daniels@collabora.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Andreas,

On 08/27/2014 03:11 PM, Andreas F=E4rber wrote:
> Hi Javier,
>>>
>>> +	trackpad@4b {
>>> +		compatible =3D "atmel,maxtouch";
>>> +		reg =3D <0x4b>;
>>> +		interrupt-parent =3D <&gpx1>;
>>> +		interrupts =3D <2 IRQ_TYPE_NONE>;
>>> +		pinctrl-names =3D "default";
>>> +		pinctrl-0 =3D <&trackpad_irq>;
>>> +		linux,gpio-keymap =3D <KEY_RESERVED
>>> +		                     KEY_RESERVED
>>> +		                     KEY_RESERVED
>>> +		                     KEY_RESERVED
>>> +		                     KEY_RESERVED
>>> +		                     BTN_LEFT>;
>>> +		wakeup-source;
>>> +	};
>>>
>>> 0 =3D=3D KEY_RESERVED, so you can consistently use it for GPIO 0-2,=
 too. :)
>>>
>>=20
>> I know that the value of KEY_RESERVED is 0 but I didn't use KEY_RESE=
RVED
>> for the GPIO on purpose.
>>=20
>> What I understood is that the SPT_GPIOPWN_T19 object sends messages =
using
>> a status byte so you have a maximum of 8 GPIO but not every maXTouch
>> devices use all of them. So in the particular case of the device in =
the
>> Peach Pit, from the 8 possible GPIO only 4 can be used and these are=
 pins
>> 2-5. So in theory you could connect 3 more GPIO in case you had more
>> buttons (e.g: BTN_RIGHT, BTN_MIDDLE) but only 1 is used since the
>> Chromebook just have BTN_LEFT.
>=20
> FWIW when I press to the bottom right of my touchpad, I do get
> right-click functionality even with just BTN_LEFT specified in the
> keymap. Magic. :)
>

Right, I'm not an expert in input but after asking a colleague he
explained to me that user-space input drivers deal with the MT tracking
for you, but there is still a single event code reported (BTN_LEFT) as =
an
indication that the touchpad has been physically clicked. That's why yo=
u
are having right click even when the hardware is not reporting it.

You can confirm that by running plain evdev or by clicking on the touch=
pad
using an object (e.g: a pencil) so ABS_MT_* events won't be reported.

>> Nick sent a patch [0] that extend the atmel touchpad DT binding and =
the
>> doc says "Use KEY_RESERVED for unused padding values". But is not cl=
ear
>> what value you should use for GPIO that are actually supported by th=
e
>> device but have no keycode associated.
>>=20
>> So by using 0 instead of KEY_RESERVED I wanted to document that pins=
 2-4
>> are actually supported and not reserved by the device but there is n=
o
>> keycode associated with that GPIO.
>=20
> You already documented that via comments though.
>

Yes but still I don't like to use KEY_RESERVED for all the pins since s=
ome
of them are not really reserved. Can we agree on disagree here and afte=
r
Nick answer I can post as a follow-up patch after this series gets merg=
ed?

>> If there was a BTN_NONE or KEY_UNUSED it would had been better but I=
 think
>> that making a distinction between these two cases (reserved pin vs G=
PIO
>> available but not used) is useful.
>=20
> Maybe Nick can comment here.
>=20
>>> I probably should add the two trailing _RESERVEDs, too?
>>>
>>=20
>> I see that is used for properties that are arrays, for example
>> "linux,keymap" in Documentation/devicetree/bindings/input/matrix-key=
map.txt.
>=20
> That does not answer my question: Do all maxTouch touchpads (or
> specifically that in Spring) need eight entries, padded with said
> KEY_RESERVED? In my experiments using just six entries (i.e., until t=
he
> non-zero entry) worked okay - so does this T19 message have specifica=
lly
> eight bits? Tegra used just four entries iirc.
>=20

I guess there are other touchpads that have a different offset (e.g: us=
ing
the last 4 pins) so I think that is good as a way of documenting the
layout even if not strictly necessary for the driver.

But again, without proper documentation is hard to say so I'll let Nick=
 to
answer that.

>>> With my above snippet I got an awful lot of "Interrupt triggered bu=
t
>>> zero messages" warnings (which I simply commented out as quickfix).
>>> Is that why you are using _EDGE_FALLING? Or pin-function 0xf?
>>> (In my case the ChromeOS DT had IRQ_TYPE_NONE and pin-function 0x0.=
)
>>>
>>=20
>> These are two separate but related things:
>>=20
>> a) IRQF_TRIGGER_FALLING:
>>=20
>> Yes, the Chrome OS DT for Peach Pit also has IRQ_TYPE_NONE but the D=
TS is
>> not correct.
>>=20
>> If you look at the Chrome OS atmel driver
>> (drivers/input/touchscreen/atmel_mxt_ts.c), it passes IRQF_TRIGGER_F=
ALLING
>> to request_threaded_irq():
>>=20
>> /* Default to falling edge if no platform data provided */
>> irqflags =3D data->pdata ? data->pdata->irqflags : IRQF_TRIGGER_FALL=
ING;
>> error =3D request_threaded_irq(client->irq, NULL, mxt_interrupt,
>> 			     irqflags | IRQF_ONESHOT,
>> 			     client->name, data);
>>=20
>> The above code is wrong since is overwriting the edge/level type fla=
gs set
>> by OF when parsing the "interrupts" property so you have to use the
>> expected IRQ flags in your DTS.
>>=20
>> b) pin-function 0xf instead of 0x0:
>>=20
>> The pin-function 0x0 is GPIO input while 0xf is GPIO IRQ. Usually on=
 other
>> SoCs to use a GPIO IRQ you just configure the pad as GPIO input and =
then
>> enable the pin as an interrupt but on Exynos SoC these are really tw=
o
>> different functions. So if you configure the pin as GPIO input and t=
his
>> happens after the pin is configured as GPIO IRQ, interrupts are not =
triggered.
>>=20
>> I faced that issue before [1] and was solved with Tomasz's commit:
>>=20
>> f6a8249 pinctrl: exynos: Lock GPIOs as interrupts when used as EINTs
>>=20
>> which changes the pinctrl-exynos driver to setup a pin as GPIO IRQ o=
n
>> .irq_request_resources instead of .irq_set_type. So, with that patch=
 even
>> when pin-function re-configures the function to GPIO input, is then
>> configured as GPIO IRQ when request_threaded_irq() is called.
>>=20
>> So probably is working for you just because you tested on linux-next=
 that
>> already has Tomasz's changes but still the correct thing to do is to=
 setup
>> the pin as 0xf. This change probably is needed on other pins used as=
 GPIO
>> IRQ that are using 0x0 now.
>>=20
>> Sorry, the email became longer than I wanted but I hope is helpful t=
o you.
>=20
> Thanks for the explanations, I'll test those settings on Spring then.
>=20
> Could you point me to what ChromeOS tree and branch I should be looki=
ng
> at? For instance, the linux-next.git chromeos-3.8 branch did not have
> any DT for Spring. Therefore my series is based on /proc/device-tree
> rather than any ChromeOS source code.
>=20

I use as a reference
https://chromium.googlesource.com/chromiumos/third_party/kernel branch
chromeos-3.8

> Thanks,
> Andreas
>=20

Best regards,
Javier
