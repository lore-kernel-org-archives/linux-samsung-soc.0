From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v4 4/4] ARM: dts: Add exynos5250-spring device tree
Date: Thu, 31 Jul 2014 21:20:41 +0200
Message-ID: <53DA9709.10602@suse.de>
References: <1406822910-6255-1-git-send-email-afaerber@suse.de> <1406822910-6255-5-git-send-email-afaerber@suse.de> <53DA936E.9060004@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39497 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750781AbaGaTUt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 15:20:49 -0400
In-Reply-To: <53DA936E.9060004@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>

Hi Tomasz,

Am 31.07.2014 21:05, schrieb Tomasz Figa:
> Hi Andreas,
>=20
> Sorry for joining the party a bit late, but there were patches with l=
ess
> people involved so I preferred to review them first.
>=20
> You can find my comments inline.
>=20
> On 31.07.2014 18:08, Andreas F=C3=A4rber wrote:
>> Adds initial support for the HP Chromebook 11.
>=20
> [snip]
>=20
>> +	gpio-keys {
>> +		compatible =3D "gpio-keys";
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&power_key_irq>, <&lid_irq>;
>> +
>> +		power {
>> +			label =3D "Power";
>> +			gpios =3D <&gpx1 3 GPIO_ACTIVE_LOW>;
>> +			linux,code =3D <KEY_POWER>;
>=20
> I assume the key is debounced in hardware, so there is no need for
> debounce-interval here. Is this correct?

You're asking the wrong person... This is copied from
-cros-common/-snow. Downstream 3.8 does not have a debounce-interval
property.

>=20
>> +			gpio-key,wakeup;
>> +		};
>> +
>> +		lid-switch {
>> +			label =3D "Lid";
>> +			gpios =3D <&gpx3 5 GPIO_ACTIVE_LOW>;
>> +			linux,input-type =3D <5>; /* EV_SW */
>> +			linux,code =3D <0>; /* SW_LID */
>> +			debounce-interval =3D <1>;
>> +			gpio-key,wakeup;
>> +		};
>> +	};
>> +
>> +	usb3_vbus_reg: regulator-usb3 {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "P5.0V_USB3CON";
>> +		regulator-min-microvolt =3D <5000000>;
>> +		regulator-max-microvolt =3D <5000000>;
>> +		gpio =3D <&gpe1 0 GPIO_ACTIVE_LOW>;
>> +		enable-active-high;
>> +	};
>> +
>> +	usb@12110000 {
>=20
> Since this is a brand new dts file, it should use the reference based
> syntax, which would be something like
>=20
> &usbhost {
> 	...
> };
>=20
> below the / { ... }; block.

You will find that I already did that for all nodes that have a label.
Since there are lots of usb nodes, please suggest specific label names.

I originally tried to stay out of existing code, then I was asked to fi=
x
-cros-common, clean up -snow too, now the SoC, ... ;)

>> +		samsung,vbus-gpio =3D <&gpx1 1 GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>> +	usb-hub {
>> +		compatible =3D "smsc,usb3503a";
>> +		reset-gpios =3D <&hsic_reset>;
>=20
> Hmm, why a -gpios property points to a pinctrl node? Shouldn't there =
be
> a phandle to GPIO bank + GPIO specifier instead?

Dunno, can change it. Can I just copy the gpio property from the
regulator above?

>> +	};
>> +
>> +	fixed-rate-clocks {
>> +		xxti {
>> +			compatible =3D "samsung,clock-xxti";
>> +			clock-frequency =3D <24000000>;
>> +		};
>> +	};
>=20
> This is also referencing a node from higher level, so it should be do=
ne
> using a reference.
>=20
>> +
>> +	hdmi {
>> +		hpd-gpio =3D <&gpx3 7 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&hdmi_hpd_irq>;
>> +		phy =3D <&hdmiphy>;
>> +		ddc =3D <&i2c_2>;
>> +		hdmi-en-supply =3D <&s5m_ldo8_reg>;
>> +		vdd-supply =3D <&s5m_ldo8_reg>;
>> +		vdd_osc-supply =3D <&s5m_ldo10_reg>;
>> +		vdd_pll-supply =3D <&s5m_ldo8_reg>;
>> +	};
>=20
> Ditto.

hdmi?

>=20
>> +
>> +	fimd@14400000 {
>> +		status =3D "okay";
>> +		samsung,invert-vclk;
>> +	};
>=20
> Ditto.

fimd?

>=20
>> +
>> +	dp-controller@145B0000 {
>> +		status =3D "okay";
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&dp_hpd>;
>> +		samsung,color-space =3D <0>;
>> +		samsung,dynamic-range =3D <0>;
>> +		samsung,ycbcr-coeff =3D <0>;
>> +		samsung,color-depth =3D <1>;
>> +		samsung,link-rate =3D <0x0a>;
>> +		samsung,lane-count =3D <1>;
>> +		samsung,hpd-gpio =3D <&gpc3 0 GPIO_ACTIVE_HIGH>;
>> +	};
>=20
> Ditto.

dp_controller? display_port_controller?

>=20
>> +};
>> +
>> +&dp_hpd {
>> +	samsung,pins =3D "gpc3-0";
>> +	samsung,pin-function =3D <0>;
>> +	samsung,pin-pud =3D <3>;
>> +	samsung,pin-drv =3D <0>;
>> +};
>=20
> Hmm, what node is this referencing? I believe this should rather
> reference the pin controller and add a new board-specific pinconf/pin=
mux
> group instead....

It's a -pinctrl node. See v3->v4 change log and discussion on v3.

>> +
>> +&i2c_0 {
>> +	status =3D "okay";
>> +	samsung,i2c-sda-delay =3D <100>;
>> +	samsung,i2c-max-bus-freq =3D <378000>;
>=20
> [snip]
>=20
>> +/*
>> + * Disabled pullups since external part has its own pullups and
>> + * double-pulling gets us out of spec in some cases.
>> + */
>> +&i2c2_bus {
>> +	samsung,pin-pud =3D <0>;
>> +};
>=20
> OK, here overriding a generic pinconf group is justified and nicely
> explained by a comment.

You seem to assume that I actually understand these things. ;)
Just copied from -cros-common/-snow.

>> +
>> +&i2c_2 {
>> +	status =3D "okay";
>> +	samsung,i2c-sda-delay =3D <100>;
>> +	samsung,i2c-max-bus-freq =3D <66000>;
>> +
>> +	hdmiddc@50 {
>> +		compatible =3D "samsung,exynos4210-hdmiddc";
>> +		reg =3D <0x50>;
>> +	};
>=20
> I don't think this matches current Exynos HDMI bindings, which I beli=
eve
> have been changed to just take a phandle to i2c bus instead.

Copied from -cros-common/-snow.

>> +};
>> +
>> +&i2c_3 {
>> +	status =3D "okay";
>> +	samsung,i2c-sda-delay =3D <100>;
>> +	samsung,i2c-max-bus-freq =3D <66000>;
>> +};
>=20
> [snip]
>=20
>> +&sd1_clk {
>> +	samsung,pin-drv =3D <0>;
>> +};
>> +
>> +&sd1_cmd {
>> +	samsung,pin-pud =3D <3>;
>> +	samsung,pin-drv =3D <0>;
>> +};
>> +
>> +&sd1_cd {
>> +	samsung,pin-drv =3D <0>;
>> +};
>> +
>> +&sd1_bus4 {
>> +	samsung,pin-drv =3D <0>;
>> +};
>=20
> Here generic settings are being overridden, so it might be a good ide=
a
> to explain why, like with i2c pull-up above.

Snow does not have an explanation either, so please suggest what commen=
t
you'd like to see. Consider me just a user with no specs. :)

Cheers,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
