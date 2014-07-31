From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 4/4] ARM: dts: Add exynos5250-spring device tree
Date: Thu, 31 Jul 2014 21:05:18 +0200
Message-ID: <53DA936E.9060004@gmail.com>
References: <1406822910-6255-1-git-send-email-afaerber@suse.de> <1406822910-6255-5-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406822910-6255-5-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan van Schaik <stephan-zGZ7W/ttz6xN8Ch2cx6nig@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andreas,

Sorry for joining the party a bit late, but there were patches with les=
s
people involved so I preferred to review them first.

You can find my comments inline.

On 31.07.2014 18:08, Andreas F=C3=A4rber wrote:
> Adds initial support for the HP Chromebook 11.

[snip]

> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&power_key_irq>, <&lid_irq>;
> +
> +		power {
> +			label =3D "Power";
> +			gpios =3D <&gpx1 3 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <KEY_POWER>;

I assume the key is debounced in hardware, so there is no need for
debounce-interval here. Is this correct?

> +			gpio-key,wakeup;
> +		};
> +
> +		lid-switch {
> +			label =3D "Lid";
> +			gpios =3D <&gpx3 5 GPIO_ACTIVE_LOW>;
> +			linux,input-type =3D <5>; /* EV_SW */
> +			linux,code =3D <0>; /* SW_LID */
> +			debounce-interval =3D <1>;
> +			gpio-key,wakeup;
> +		};
> +	};
> +
> +	usb3_vbus_reg: regulator-usb3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "P5.0V_USB3CON";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		gpio =3D <&gpe1 0 GPIO_ACTIVE_LOW>;
> +		enable-active-high;
> +	};
> +
> +	usb@12110000 {

Since this is a brand new dts file, it should use the reference based
syntax, which would be something like

&usbhost {
	...
};

below the / { ... }; block.

> +		samsung,vbus-gpio =3D <&gpx1 1 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	usb-hub {
> +		compatible =3D "smsc,usb3503a";
> +		reset-gpios =3D <&hsic_reset>;

Hmm, why a -gpios property points to a pinctrl node? Shouldn't there be
a phandle to GPIO bank + GPIO specifier instead?

> +	};
> +
> +	fixed-rate-clocks {
> +		xxti {
> +			compatible =3D "samsung,clock-xxti";
> +			clock-frequency =3D <24000000>;
> +		};
> +	};

This is also referencing a node from higher level, so it should be done
using a reference.

> +
> +	hdmi {
> +		hpd-gpio =3D <&gpx3 7 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&hdmi_hpd_irq>;
> +		phy =3D <&hdmiphy>;
> +		ddc =3D <&i2c_2>;
> +		hdmi-en-supply =3D <&s5m_ldo8_reg>;
> +		vdd-supply =3D <&s5m_ldo8_reg>;
> +		vdd_osc-supply =3D <&s5m_ldo10_reg>;
> +		vdd_pll-supply =3D <&s5m_ldo8_reg>;
> +	};

Ditto.

> +
> +	fimd@14400000 {
> +		status =3D "okay";
> +		samsung,invert-vclk;
> +	};

Ditto.

> +
> +	dp-controller@145B0000 {
> +		status =3D "okay";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&dp_hpd>;
> +		samsung,color-space =3D <0>;
> +		samsung,dynamic-range =3D <0>;
> +		samsung,ycbcr-coeff =3D <0>;
> +		samsung,color-depth =3D <1>;
> +		samsung,link-rate =3D <0x0a>;
> +		samsung,lane-count =3D <1>;
> +		samsung,hpd-gpio =3D <&gpc3 0 GPIO_ACTIVE_HIGH>;
> +	};

Ditto.

> +};
> +
> +&dp_hpd {
> +	samsung,pins =3D "gpc3-0";
> +	samsung,pin-function =3D <0>;
> +	samsung,pin-pud =3D <3>;
> +	samsung,pin-drv =3D <0>;
> +};

Hmm, what node is this referencing? I believe this should rather
reference the pin controller and add a new board-specific pinconf/pinmu=
x
group instead....

> +
> +&i2c_0 {
> +	status =3D "okay";
> +	samsung,i2c-sda-delay =3D <100>;
> +	samsung,i2c-max-bus-freq =3D <378000>;

[snip]

> +/*
> + * Disabled pullups since external part has its own pullups and
> + * double-pulling gets us out of spec in some cases.
> + */
> +&i2c2_bus {
> +	samsung,pin-pud =3D <0>;
> +};

OK, here overriding a generic pinconf group is justified and nicely
explained by a comment.

> +
> +&i2c_2 {
> +	status =3D "okay";
> +	samsung,i2c-sda-delay =3D <100>;
> +	samsung,i2c-max-bus-freq =3D <66000>;
> +
> +	hdmiddc@50 {
> +		compatible =3D "samsung,exynos4210-hdmiddc";
> +		reg =3D <0x50>;
> +	};

I don't think this matches current Exynos HDMI bindings, which I believ=
e
have been changed to just take a phandle to i2c bus instead.

> +};
> +
> +&i2c_3 {
> +	status =3D "okay";
> +	samsung,i2c-sda-delay =3D <100>;
> +	samsung,i2c-max-bus-freq =3D <66000>;
> +};

[snip]

> +&sd1_clk {
> +	samsung,pin-drv =3D <0>;
> +};
> +
> +&sd1_cmd {
> +	samsung,pin-pud =3D <3>;
> +	samsung,pin-drv =3D <0>;
> +};
> +
> +&sd1_cd {
> +	samsung,pin-drv =3D <0>;
> +};
> +
> +&sd1_bus4 {
> +	samsung,pin-drv =3D <0>;
> +};

Here generic settings are being overridden, so it might be a good idea
to explain why, like with i2c pull-up above.

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
