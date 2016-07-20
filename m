From: Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: Odroid U2 Kernel 4.7rc7+ Hang on reboot
Date: Wed, 20 Jul 2016 08:53:04 -0400
Message-ID: <1469019184.16008.6.camel@ndufresne.ca>
References: <1468525055.4843.4.camel@ndufresne.ca>
 <1468525558.4843.6.camel@ndufresne.ca>
 <5787EF8E.2010401@math.uni-bielefeld.de>
 <1468528408.4843.9.camel@ndufresne.ca> <578896DB.7060708@samsung.com>
 <5788CA67.5090200@samsung.com> <5788E1EB.4030003@math.uni-bielefeld.de>
 <5788E31D.6010606@samsung.com> <5788E3CB.5080103@math.uni-bielefeld.de>
 <5788E457.6060202@samsung.com> <5788F449.6060202@math.uni-bielefeld.de>
 <1468598213.3819.2.camel@ndufresne.ca> <578E0F28.6010600@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53959 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752789AbcGTMxJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2016 08:53:09 -0400
In-Reply-To: <578E0F28.6010600@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>

Hi=C2=A0Krzysztof,

I'm leaving for a long vacation (6w) today and didn't find the time to
test your patch. I'd like to thank you for looking into this issue. I
will we able to test this patch at my return.

I do understand now (and with the following mail), that this hardware
have problematic constraints that are specific to the Hardkernel
integration.

regards,
Nicolas

Le mardi 19 juillet 2016 =C3=A0 13:29 +0200, Krzysztof Kozlowski a =C3=A9=
crit=C2=A0:
> On 07/15/2016 05:56 PM, Nicolas Dufresne wrote:
> > Le vendredi 15 juillet 2016 =C3=A0 16:33 +0200, Tobias Jakobi a =C3=
=A9crit :
> > > I can confirm that this indeed doesn't work.
> > >=20
> > > chidori ~ # echo 1 > /proc/sys/kernel/sysrq
> > > chidori ~ # echo s > /proc/sysrq-trigger
> > > chidori ~ # echo u > /proc/sysrq-trigger
> > > chidori ~ # echo b > /proc/sysrq-trigger
> > > <board hangs, only red power LED on>
> > >=20
> > > I guess Nicolas is seeing a different or another problem here
> > > though.
> >=20
> > Well for me both method hangs. On an extra note, reset inside Uboot
> > works, but reboot in Linux hang. I tried adding a trace
> > in syscon_restart_handle(), but the trace is never displayed. I'm
> > wondering if that handler is ever called, or if it's just that the
> > serial console was shut down already.
> >=20
> > Any idea what else should I trace ?
>=20
> This is weird... reboot should work. Just to confirm it - can you
> test
> following patch in both scenarios (this should fix both of them... at
> least on Odroid U3 but your board might have different SPL/BL1):
>=20
> -- >8 --
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index 58ad48e7b8f7..7d963d36e96d 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -423,7 +423,8 @@
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0buck2_reg: BUCK2 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regulator-name =3D "=
vdd_arm";
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regulator-min-microvolt =3D=
 <900000>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0//regulator-min-microvolt =
=3D <900000>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regulator-min-microvolt =3D=
 <1000000>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regulator-max-microv=
olt =3D <1350000>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regulator-always-on;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regulator-boot-on;
>=20
>=20
>=20
>=20
