From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: wm8994: Add wm8994 regulator support on
 smdk5250.
Date: Tue, 28 May 2013 10:19:24 -0400
Message-ID: <20130528141924.GH3660@sirena.org.uk>
References: <1369737322-10907-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6920524425364849973=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1369737322-10907-1-git-send-email-padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============6920524425364849973==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="smOfPzt+Qjm5bNGJ"
Content-Disposition: inline


--smOfPzt+Qjm5bNGJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2013 at 04:05:22PM +0530, Padmavathi Venna wrote:

> +	avdd2:fixed-regulator@0 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "avdd2-supply";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		regulator-always-on;
> +	};

> +	cpvdd:fixed-regulator@1 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "cpvdd-supply";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		regulator-always-on;
> +	};

Several of these look like the same supply (especially the speaker ones)
so it seems like it'd be sensible to define a single regulator for each
of them.  Not much practical difference but it might be neater.

> +
> +	dbvdd:fixed-regulator@2 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "dbvdd-supply";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	spkvdd1:fixed-regulator@3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "spkvdd1-supply";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	spkvdd2:fixed-regulator@4 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "spkvdd2-supply";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
> +	};
> +
>  	i2c@12C70000 {
>  		samsung,i2c-sda-delay =3D <100>;
>  		samsung,i2c-max-bus-freq =3D <20000>;
> @@ -47,8 +87,17 @@
>  		};
> =20
>  		wm8994: wm8994@1a {
> -			 compatible =3D "wlf,wm8994";
> -			 reg =3D <0x1a>;
> +			compatible =3D "wlf,wm8994";
> +			reg =3D <0x1a>;
> +
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +
> +			AVDD2-supply =3D <&avdd2>;
> +			CPVDD-supply =3D <&cpvdd>;
> +			DBVDD-supply =3D <&dbvdd>;
> +			SPKVDD1-supply =3D <&spkvdd1>;
> +			SPKVDD2-supply =3D <&spkvdd2>;
>  		};
>  	};
> =20
> --=20
> 1.7.4.4
>=20
>=20

--smOfPzt+Qjm5bNGJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRpLzoAAoJELSic+t+oim9y5QP/iKrEm5mSbr9glcXsIsIrnUY
vW3loMn06JfoxFNreyn6oDBlVjmlZb1KUPrmsao65F5g9FOT4cHUiv4ncVa+Lf1l
52JVmUIL+cGSwudazKyMXwEH33h8LBMwDTjmRFUcvHL7nQJ9LO0xThqrj2Zt9UWP
dDNUlJOSsPE9L0KYfdLW8oSrz2xeoo46IstHdiDijzyC2FRYOm3JeYcRLK/YzmkE
EIxFx8noOk8Iv89C1hx45TsNfTEYoBpSueOS4kLylh91A3QYvpE+DefErS2rwThR
NEWREPEfXiHjNkuOqxe6Wu3flmQ/ByABV0lMaA69r1D0z/0wd0BioYPgEOys+bPE
khJRQ6pfM7MIRfHqccTkY9z4IHpJVAX+9gg2DsiIOsb3+3Kb7znyYRBkX54q0J4Q
bkpMdklS5SjbNbAnqZ5B/w6QaEFN+JsCMcgBqtzDaonbX1fScwDCgn0A64z6lmsL
1AAqXs3b/eFzFk7atIgxfzpJ5gD5ZnT91GJQteZIEcMISsy6zKhTjtQgVv2Khvxl
MtyPo/Jj1Clyvv8t3gSibl1LlR7c4AWnlKgzrufClXdMEaiuXJ3LVp/EBeTPHe1c
5ux9jIMPV8YVzXQpvozX9DthRKIzBUabRxsybh1I/dxBgNmq5+DDGww6Bg5jzJiY
K7qr4xZTkXQcFp044OL1
=01H1
-----END PGP SIGNATURE-----

--smOfPzt+Qjm5bNGJ--

--===============6920524425364849973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6920524425364849973==--
