From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 4/4] ARM: dts: Add exynos5250-spring device tree
Date: Thu, 31 Jul 2014 21:40:25 +0200
Message-ID: <53DA9BA9.60808@gmail.com>
References: <1406822910-6255-1-git-send-email-afaerber@suse.de> <1406822910-6255-5-git-send-email-afaerber@suse.de> <53DA936E.9060004@gmail.com> <53DA9709.10602@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:53370 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750806AbaGaTkb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 15:40:31 -0400
In-Reply-To: <53DA9709.10602@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>

Andreas,

On 31.07.2014 21:20, Andreas F=C3=A4rber wrote:
> Am 31.07.2014 21:05, schrieb Tomasz Figa:
>> On 31.07.2014 18:08, Andreas F=C3=A4rber wrote:
>>> Adds initial support for the HP Chromebook 11.
>>
>> [snip]
>>
>>> +	gpio-keys {
>>> +		compatible =3D "gpio-keys";
>>> +		pinctrl-names =3D "default";
>>> +		pinctrl-0 =3D <&power_key_irq>, <&lid_irq>;
>>> +
>>> +		power {
>>> +			label =3D "Power";
>>> +			gpios =3D <&gpx1 3 GPIO_ACTIVE_LOW>;
>>> +			linux,code =3D <KEY_POWER>;
>>
>> I assume the key is debounced in hardware, so there is no need for
>> debounce-interval here. Is this correct?
>=20
> You're asking the wrong person... This is copied from
> -cros-common/-snow. Downstream 3.8 does not have a debounce-interval
> property.

Doug, Vincent?

>=20
>>
>>> +			gpio-key,wakeup;
>>> +		};

[snip]

>>> +
>>> +	usb@12110000 {
>>
>> Since this is a brand new dts file, it should use the reference base=
d
>> syntax, which would be something like
>>
>> &usbhost {
>> 	...
>> };
>>
>> below the / { ... }; block.
>=20
> You will find that I already did that for all nodes that have a label=
=2E
> Since there are lots of usb nodes, please suggest specific label name=
s.
>=20
> I originally tried to stay out of existing code, then I was asked to =
fix
> -cros-common, clean up -snow too, now the SoC, ... ;)

Well, adding labels should be pretty trivial and IMHO could be squashed
into this patch. For usb@1211000 the right label would be "ehci".

>=20
>>> +		samsung,vbus-gpio =3D <&gpx1 1 GPIO_ACTIVE_HIGH>;
>>> +	};
>>> +
>>> +	usb-hub {
>>> +		compatible =3D "smsc,usb3503a";
>>> +		reset-gpios =3D <&hsic_reset>;
>>
>> Hmm, why a -gpios property points to a pinctrl node? Shouldn't there=
 be
>> a phandle to GPIO bank + GPIO specifier instead?
>=20
> Dunno, can change it. Can I just copy the gpio property from the
> regulator above?

Reading what Vincent posted earlier I would consider this as the right
thing to do and it might even let you remove the fake regulator node.

>=20
>>> +	};
>>> +
>>> +	fixed-rate-clocks {
>>> +		xxti {
>>> +			compatible =3D "samsung,clock-xxti";
>>> +			clock-frequency =3D <24000000>;
>>> +		};
>>> +	};
>>
>> This is also referencing a node from higher level, so it should be d=
one
>> using a reference.
>>
>>> +
>>> +	hdmi {
>>> +		hpd-gpio =3D <&gpx3 7 GPIO_ACTIVE_HIGH>;
>>> +		pinctrl-names =3D "default";
>>> +		pinctrl-0 =3D <&hdmi_hpd_irq>;
>>> +		phy =3D <&hdmiphy>;
>>> +		ddc =3D <&i2c_2>;
>>> +		hdmi-en-supply =3D <&s5m_ldo8_reg>;
>>> +		vdd-supply =3D <&s5m_ldo8_reg>;
>>> +		vdd_osc-supply =3D <&s5m_ldo10_reg>;
>>> +		vdd_pll-supply =3D <&s5m_ldo8_reg>;
>>> +	};
>>
>> Ditto.
>=20
> hdmi?

Sounds good.

>=20
>>
>>> +
>>> +	fimd@14400000 {
>>> +		status =3D "okay";
>>> +		samsung,invert-vclk;
>>> +	};
>>
>> Ditto.
>=20
> fimd?

OK.

>=20
>>
>>> +
>>> +	dp-controller@145B0000 {
>>> +		status =3D "okay";
>>> +		pinctrl-names =3D "default";
>>> +		pinctrl-0 =3D <&dp_hpd>;
>>> +		samsung,color-space =3D <0>;
>>> +		samsung,dynamic-range =3D <0>;
>>> +		samsung,ycbcr-coeff =3D <0>;
>>> +		samsung,color-depth =3D <1>;
>>> +		samsung,link-rate =3D <0x0a>;
>>> +		samsung,lane-count =3D <1>;
>>> +		samsung,hpd-gpio =3D <&gpc3 0 GPIO_ACTIVE_HIGH>;
>>> +	};
>>
>> Ditto.
>=20
> dp_controller? display_port_controller?

dp?

>=20
>>
>>> +};
>>> +
>>> +&dp_hpd {
>>> +	samsung,pins =3D "gpc3-0";
>>> +	samsung,pin-function =3D <0>;
>>> +	samsung,pin-pud =3D <3>;
>>> +	samsung,pin-drv =3D <0>;
>>> +};
>>
>> Hmm, what node is this referencing? I believe this should rather
>> reference the pin controller and add a new board-specific pinconf/pi=
nmux
>> group instead....
>=20
> It's a -pinctrl node. See v3->v4 change log and discussion on v3.
>=20

Well, this is clearly a board specific node anyway, because it does not
refer to a special function, but simply an input/interrupt GPIO. If it
somehow has landed in generic pinctrl dtsi then it should be removed
from there and this patch should simply introduce its own instance of
dp_hpd node, so you did the right thing in v3.

>>> +
>>> +&i2c_0 {
>>> +	status =3D "okay";
>>> +	samsung,i2c-sda-delay =3D <100>;
>>> +	samsung,i2c-max-bus-freq =3D <378000>;
>>
>> [snip]
>>
>>> +/*
>>> + * Disabled pullups since external part has its own pullups and
>>> + * double-pulling gets us out of spec in some cases.
>>> + */
>>> +&i2c2_bus {
>>> +	samsung,pin-pud =3D <0>;
>>> +};
>>
>> OK, here overriding a generic pinconf group is justified and nicely
>> explained by a comment.
>=20
> You seem to assume that I actually understand these things. ;)
> Just copied from -cros-common/-snow.
>=20

It is good if those things are being done with some level of
understanding. The DT mechanics are quite well documented in
Documentation/devicetree/bindings, while for HW-specific bits I believe
Chromium guys could give you a hand.

>>> +
>>> +&i2c_2 {
>>> +	status =3D "okay";
>>> +	samsung,i2c-sda-delay =3D <100>;
>>> +	samsung,i2c-max-bus-freq =3D <66000>;
>>> +
>>> +	hdmiddc@50 {
>>> +		compatible =3D "samsung,exynos4210-hdmiddc";
>>> +		reg =3D <0x50>;
>>> +	};
>>
>> I don't think this matches current Exynos HDMI bindings, which I bel=
ieve
>> have been changed to just take a phandle to i2c bus instead.
>=20
> Copied from -cros-common/-snow.
>=20

This means that somebody probably forgot to update -cros-common/-snow
dts(i). Not the first and I guess probably not the last time...

>>> +};
>>> +
>>> +&i2c_3 {
>>> +	status =3D "okay";
>>> +	samsung,i2c-sda-delay =3D <100>;
>>> +	samsung,i2c-max-bus-freq =3D <66000>;
>>> +};
>>
>> [snip]
>>
>>> +&sd1_clk {
>>> +	samsung,pin-drv =3D <0>;
>>> +};
>>> +
>>> +&sd1_cmd {
>>> +	samsung,pin-pud =3D <3>;
>>> +	samsung,pin-drv =3D <0>;
>>> +};
>>> +
>>> +&sd1_cd {
>>> +	samsung,pin-drv =3D <0>;
>>> +};
>>> +
>>> +&sd1_bus4 {
>>> +	samsung,pin-drv =3D <0>;
>>> +};
>>
>> Here generic settings are being overridden, so it might be a good id=
ea
>> to explain why, like with i2c pull-up above.
>=20
> Snow does not have an explanation either, so please suggest what comm=
ent
> you'd like to see. Consider me just a user with no specs. :)

Doug, Vincent, someone else?

Best regards,
Tomasz
