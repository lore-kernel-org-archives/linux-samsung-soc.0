From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/1] ARM: dts: Add PMIC support to arndale-octa
Date: Tue, 10 Dec 2013 18:54:16 +0000
Message-ID: <20131210185416.GH11468@sirena.org.uk>
References: <1386656958-28292-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IbVRjBtIbJdbeK1C"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:41882 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751806Ab3LJSyk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Dec 2013 13:54:40 -0500
Content-Disposition: inline
In-Reply-To: <1386656958-28292-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com


--IbVRjBtIbJdbeK1C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2013 at 11:59:18AM +0530, Sachin Kamat wrote:

> Added PMIC node to Arndale-Octa board.

Is there a bootloader posted for this anywhere yet?

> +			regulators {
> +				ldo1_reg: LDO1 {
> +					regulator-name =3D "vdd_ldo1";

So, there is a label on the schematic for PVDD_LDO1 but it's not
entirely obvious why that's there as throughout the rest of the
schematic it's got the rather more constructive name PVDD_ALIVE_1V0. =20
We should really be using the more readable versions of the names
in the DT since the whole point in overriding the driver default
names is to make it easier to associate the kernel diagnostics with
the schematic, what the DT is doing here serves no purpose.

The same comment applies to all the LDO supplies.

> +				buck2_reg: BUCK2 {
> +					regulator-name =3D "vdd_arm";
> +					regulator-min-microvolt =3D <800000>;
> +					regulator-max-microvolt =3D <1500000>;
> +					regulator-always-on;
> +					regulator-boot-on;
> +				};

Why are you specifying boot-on?  It doesn't seem terribly plausible that
the cores won't be powered on boot, or that we can't tell what the state
is by reading the registers.

Same for all the DCDCs.

> +				buck7_reg: BUCK7 {
> +					regulator-name =3D "vdd_1.0v_ldo";
> +					regulator-min-microvolt =3D <800000>;
> +					regulator-max-microvolt =3D <1500000>;
> +					regulator-always-on;
> +					regulator-boot-on;
> +				};

This doesn't correspond to the schematic which says that BUCK7 is
supplying VIN_LLDO_1V4 (the input for some of the LDOs).  The voltage
range specified there doesn't seem terribly sensible either, are you
sure you haven't just got the underlying voltage range for the DCDC?
I can't see why you'd want to raise the voltage over 1.4V (that's rather
defeating the point) and while it'd be nice to have the core be able to
vary supply to track the headroom needed by the LDOs none of the LDOs
were configured with variable voltage so even if we implemented that
it'd never be used.

Similar issues apply to the other bucks being used to drop the battery
voltage for LDO supplies.

--IbVRjBtIbJdbeK1C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSp2NUAAoJELSic+t+oim9V+IP/R6qpbCeakBJ3zaPfcTGROdg
Law/Dm248qNFtMsfPGhYg0j9+KUobwrUIaJfqpgOfo0bG28gtXOGJD52irOh0E38
gMrBnxskOXSfQY7+WirpRK1LvaQMbUO7osDzcxEx+/Kfz5jiFmxocgEkdEv9JxnY
CSapz9+XVD2xA6XXdqEwfX9WoqVkQY/XRBcXsAeNgJ3cEHpmf1Y7Cb89kUeqddhp
Ti5aZZiIsml3WckR8EeOuNCbHf2R5G5w0PFHVGGrFCqW2z9JBHF/AHEi5mFqwYmf
GTqUoCPQcCncUeDj2HRG3/WomhkOva8xa/69qmx52Rfk4s1cLzNMqf6qaRziDjph
ldI8r6+BaS92nZYoHWpdsWqFbRiPnareIyUyOkhWBLIodnqGug5LSLhk/a5vQ20n
WHFEaYbKcc/MZtDiD7o665vqclD27ukgDxbxg55NFpSZoFHGdBXHvAfz6HzPOc7u
3R7Vfsoix5BoSXprDcVVZi+pyz8nk1oflNfKyfSCPSPzvKsNYoSfvY201bhUQlGq
hkPMk02Z3pb9mEJe6EObwtSRIxQmDRbP4RCVJi0EdfW3+5pWsiMhKaH5/OCmwo7q
AVATW2jps60DXR3UfleC9MWcVcpbtsYdCkyJVhHooSG2d2+gLPGB9eP+Bj4YYvYE
qoBt/egTM6VaoW8e/SXx
=pKsc
-----END PGP SIGNATURE-----

--IbVRjBtIbJdbeK1C--
