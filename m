From: Markus Reichl <m.reichl-SRyzfwRm/0rPTwkrwQOX7A@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH v2 RESEND] ARM: dts: Support audio on Exynos5422-odroidxu3
 using simple-audio-card
Date: Fri, 10 Apr 2015 11:02:28 +0200
Message-ID: <552791A4.40203@fivetechno.de>
References: <1428651178-18186-1-git-send-email-ideal.song@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="L3w8C4n3h9VU3397X6nq9tibdDdWnNsaN"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428651178-18186-1-git-send-email-ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Inha Song <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--L3w8C4n3h9VU3397X6nq9tibdDdWnNsaN
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Inha,

I have tested this on XU3 (Headphone output).

Tested-by: Markus Reichl <m.reichl-SRyzfwRm/0rPTwkrwQOX7A@public.gmane.org>

Best Regards
--
Markus Reichl

Am 10.04.2015 um 09:32 schrieb Inha Song:
> Add MAX98090 audio codec, I2S interface and the sound nodes to support
> audio on Exynos5422 SoC Based Odroid-XU3 board. Now we can support audi=
o
> in Odroid-XU3 board using simple-audio-card DT binding.
>=20
> Signed-off-by: Inha Song <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi          |  9 +++++
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 59 ++++++++++++++++++++++=
++++++++
>  2 files changed, 68 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exyn=
os5420.dtsi
> index ac6f860..73886d6 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -415,6 +415,9 @@
>  			<&clock_audss EXYNOS_I2S_BUS>,
>  			<&clock_audss EXYNOS_SCLK_I2S>;
>  		clock-names =3D "iis", "i2s_opclk0", "i2s_opclk1";
> +		#clock-cells =3D <1>;
> +		clock-output-names =3D "i2s_cdclk0";
> +		#sound-dai-cells =3D <1>;
>  		samsung,idma-addr =3D <0x03000000>;
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&i2s0_bus>;
> @@ -429,6 +432,9 @@
>  		dma-names =3D "tx", "rx";
>  		clocks =3D <&clock CLK_I2S1>, <&clock CLK_SCLK_I2S1>;
>  		clock-names =3D "iis", "i2s_opclk0";
> +		#clock-cells =3D <1>;
> +		clock-output-names =3D "i2s_cdclk1";
> +		#sound-dai-cells =3D <1>;
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&i2s1_bus>;
>  		status =3D "disabled";
> @@ -442,6 +448,9 @@
>  		dma-names =3D "tx", "rx";
>  		clocks =3D <&clock CLK_I2S2>, <&clock CLK_SCLK_I2S2>;
>  		clock-names =3D "iis", "i2s_opclk0";
> +		#clock-cells =3D <1>;
> +		clock-output-names =3D "i2s_cdclk2";
> +		#sound-dai-cells =3D <1>;
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&i2s2_bus>;
>  		status =3D "disabled";
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot=
/dts/exynos5422-odroidxu3.dts
> index edc25cf..c038f0d 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -11,6 +11,7 @@
>  */
> =20
>  /dts-v1/;
> +#include <dt-bindings/sound/samsung-i2s.h>
>  #include "exynos5800.dtsi"
> =20
>  / {
> @@ -285,6 +286,64 @@
>  	rtc@101E0000 {
>  		status =3D "okay";
>  	};
> +
> +	sound: sound {
> +		compatible =3D "simple-audio-card";
> +
> +		simple-audio-card,name =3D "Odroid-XU3";
> +		simple-audio-card,widgets =3D
> +			"Headphone", "Headphone Jack",
> +			"Speakers", "Speakers";
> +		simple-audio-card,routing =3D
> +			"Headphone Jack", "HPL",
> +			"Headphone Jack", "HPR",
> +			"Headphone Jack", "MICBIAS",
> +			"IN1", "Headphone Jack",
> +			"Speakers", "SPKL",
> +			"Speakers", "SPKR";
> +
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,bitclock-master =3D <&link0_codec>;
> +		simple-audio-card,frame-master =3D <&link0_codec>;
> +
> +		simple-audio-card,cpu {
> +			sound-dai =3D <&i2s0 0>;
> +			system-clock-frequency =3D <19200000>;
> +		};
> +
> +		link0_codec: simple-audio-card,codec {
> +			sound-dai =3D <&max98090>;
> +			clocks =3D <&i2s0 CLK_I2S_CDCLK>;
> +		};
> +	};
> +};
> +
> +&clock_audss {
> +	assigned-clocks =3D <&clock_audss EXYNOS_MOUT_AUDSS>,
> +			<&clock_audss EXYNOS_MOUT_I2S>,
> +			<&clock_audss EXYNOS_DOUT_AUD_BUS>;
> +	assigned-clock-parents =3D <&clock CLK_FIN_PLL>,
> +			<&clock_audss EXYNOS_MOUT_AUDSS>;
> +	assigned-clock-rates =3D <0>,
> +			<0>,
> +			<19200000>;
> +};
> +
> +&hsi2c_5 {
> +	status =3D "okay";
> +	max98090: max98090@10 {
> +		compatible =3D "maxim,max98090";
> +		reg =3D <0x10>;
> +		interrupt-parent =3D <&gpx3>;
> +		interrupts =3D <2 0>;
> +		clocks =3D <&i2s0 CLK_I2S_CDCLK>;
> +		clock-names =3D "mclk";
> +		#sound-dai-cells =3D <0>;
> +	};
> +};
> +
> +&i2s0 {
> +	status =3D "okay";
>  };
> =20
>  &hdmi {
>=20


--L3w8C4n3h9VU3397X6nq9tibdDdWnNsaN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUnkagACgkQ7DLr+WDJfp4aGgCgm0ObG/AkLglvBjCm/9pcR6VJ
73wAniNmh/mgc0c+Bm9wltjo0ahSwyj3
=HiiC
-----END PGP SIGNATURE-----

--L3w8C4n3h9VU3397X6nq9tibdDdWnNsaN--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
