From: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Subject: Re: [PATCH] ARM: dts: s5pv210: Fix onenand's unit address format warning
Date: Wed, 09 Jan 2019 15:31:06 +0100
Message-ID: <2629067.mKC4sQJUgE@acerlaptop>
References: <1547041383-16924-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547041383-16924-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Dnia =C5=9Broda, 9 stycznia 2019 14:43:03 CET Krzysztof Kozlowski pisze:
> According to Devicetree specification, the unit-address must match the
> first address specified in the reg property of the node.  Fix the DTC
> warning onenand node:
>=20
>     arch/arm/boot/dts/s5pv210.dtsi:81.29-93.5:
>         Warning (simple_bus_reg): /soc/onenand@b0000000: simple-bus unit =
address format error, expected "b0600000"
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>=20
> ---
>=20
> The remaining warning is wrong clock-controller subnode of fimc camera.
>     arch/arm/boot/dts/s5pv210.dtsi:578.32-580.6: Warning (simple_bus_reg)=
: /soc/camera/clock-controller: missing or empty reg/ranges property
> The subnode in my understanding does not follow bindings and the driver.
> The driver with current s5pv210.dtsi will not register a clock provider..=
=2E but
> I do not have a device to confirm this.
> ---
>  arch/arm/boot/dts/s5pv210.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.d=
tsi
> index cc22c9db80d2..26ea5c66d8ce 100644
> --- a/arch/arm/boot/dts/s5pv210.dtsi
> +++ b/arch/arm/boot/dts/s5pv210.dtsi
> @@ -78,7 +78,7 @@
>  			};
>  		};
> =20
> -		onenand: onenand@b0000000 {
> +		onenand: onenand@b0600000 {
>  			compatible =3D "samsung,s5pv210-onenand";
>  			reg =3D <0xb0600000 0x2000>,
>  				<0xb0000000 0x20000>,
>=20
Checked on Samsung Galaxy S (with local, not yet submited patches for devic=
etree support for onenand, which is missing in mainline) and it looks ok (d=
evice probed, was able to use ubi tools).
Tested-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
