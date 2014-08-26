From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 1/3] ARM: dts: Add Peach Pit dts entry for Atmel touchpad
Date: Wed, 27 Aug 2014 00:53:53 +0200
Message-ID: <53FD1001.30701@suse.de>
References: <1409066937-3574-1-git-send-email-javier.martinez@collabora.co.uk> <1409066937-3574-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52891 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755000AbaHZWx6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Aug 2014 18:53:58 -0400
In-Reply-To: <1409066937-3574-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Nick Dyer <nick.dyer@itdev.co.uk>, Yufeng Shen <miletus@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Tomasz Figa <tomasz.figa@gmail.com>

Hi Javier,

Am 26.08.2014 17:28, schrieb Javier Martinez Canillas:
> From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
>=20
> The Peach Pit board has an Atmel maXTouch trackpad device.
> Add the needed Device Tree nodes to support it.
>=20
> This Device Tree change is based on the Chrome OS 3.8 tree
> but adapted to use the mainline Atmel maXTouch DT binding.
>=20
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> [javier.martinez: added linux,gpio-keymap property and changed IRQ ty=
pe]
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>=20
> Changes since v1:
>  - Change trackpad IRQ pad function from 0x0 (GPIO input) to 0xf (GPI=
O IRQ).
>    suggested by Tomasz Figa.
>  - Remove BTN_TOOL_* from "linux,gpio-keymap" property since those ar=
e set
>    by input mt core if INPUT_MT_POINTER is set. Suggested by Nick Dye=
r.
>  - Use correct values for "linux,gpio-keymap" property. Suggested by =
Nick Dyer.
>  - Remove support for Peach Pi board since it uses a different Atmel =
touchpad
>    that requires an Atmel object protocol  (T100) not supported by th=
e driver.
>  - Use IRQ type constants from <dt-bindings/interrupt-controller/irq.=
h> instead
>    of magic numbers. Suggested by Andreas Farber.
> ---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 31 ++++++++++++++++++++=
++++++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/bo=
ot/dts/exynos5420-peach-pit.dts
> index 228a6b1..e4f82d5 100644
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -11,6 +11,7 @@
>  /dts-v1/;
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>  #include "exynos5420.dtsi"
> =20
>  / {
> @@ -157,6 +158,29 @@
>  	};
>  };
> =20
> +&hsi2c_8 {
> +	status =3D "okay";
> +	clock-frequency =3D <333000>;
> +
> +	trackpad@4b {
> +		compatible=3D"atmel,maxtouch";
> +		reg=3D<0x4b>;
> +		interrupt-parent=3D<&gpx1>;
> +		interrupts=3D<1 IRQ_TYPE_EDGE_FALLING>;

Nit: Here's a style break (4x spaces around '=3D' missing).

> +		wakeup-source;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&trackpad_irq>;
> +		linux,gpio-keymap =3D < KEY_RESERVED
> +				      KEY_RESERVED
> +				      0		/* GPIO 0 */
> +				      0		/* GPIO 1 */
> +				      0		/* GPIO 2 */
> +				      BTN_LEFT 	/* GPIO 3 */
> +				      KEY_RESERVED
> +				      KEY_RESERVED >;
> +	};

Coincidentally, I experimentally came up with a very similar DT node fo=
r
Spring the weekend:

+	trackpad@4b {
+		compatible =3D "atmel,maxtouch";
+		reg =3D <0x4b>;
+		interrupt-parent =3D <&gpx1>;
+		interrupts =3D <2 IRQ_TYPE_NONE>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&trackpad_irq>;
+		linux,gpio-keymap =3D <KEY_RESERVED
+		                     KEY_RESERVED
+		                     KEY_RESERVED
+		                     KEY_RESERVED
+		                     KEY_RESERVED
+		                     BTN_LEFT>;
+		wakeup-source;
+	};

0 =3D=3D KEY_RESERVED, so you can consistently use it for GPIO 0-2, too=
=2E :)

I probably should add the two trailing _RESERVEDs, too?

With my above snippet I got an awful lot of "Interrupt triggered but
zero messages" warnings (which I simply commented out as quickfix).
Is that why you are using _EDGE_FALLING? Or pin-function 0xf?
(In my case the ChromeOS DT had IRQ_TYPE_NONE and pin-function 0x0.)

Regards,
Andreas

> +};
> +
>  &hsi2c_9 {
>  	status =3D "okay";
>  	clock-frequency =3D <400000>;
> @@ -249,6 +273,13 @@
>  		samsung,pin-drv =3D <0>;
>  	};
> =20
> +	trackpad_irq: trackpad-irq {
> +		samsung,pins =3D "gpx1-1";
> +		samsung,pin-function =3D <0xf>;
> +		samsung,pin-pud =3D <0>;
> +		samsung,pin-drv =3D <0>;
> +	};
> +
>  	power_key_irq: power-key-irq {
>  		samsung,pins =3D "gpx1-2";
>  		samsung,pin-function =3D <0>;

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
