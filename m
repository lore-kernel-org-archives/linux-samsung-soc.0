From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 4/5] regulator: max77802: Parse regulator operating
 mode properties
Date: Wed, 22 Oct 2014 17:48:13 +0100
Message-ID: <20141022164813.GD2344@sirena.org.uk>
References: <1413816472-1895-1-git-send-email-javier.martinez@collabora.co.uk>
 <1413816472-1895-5-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4AmJdx/+JAF2YHMk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1413816472-1895-5-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--4AmJdx/+JAF2YHMk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 20, 2014 at 04:47:51PM +0200, Javier Martinez Canillas wrote:

> +	char *states[PM_SUSPEND_MAX + 1] = {
> +		[PM_SUSPEND_MEM] = "regulator-state-mem",
> +		[PM_SUSPEND_MAX] = "regulator-state-disk",
> +	};

This still has the same problem as your previous patch with things not
being as joined up with the core as they should be.  What I'd like to
see is that the code to extract the number for each state is in the core
and then the drivers just provide a translation function to map from
this to the internal modes.

--4AmJdx/+JAF2YHMk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUR9/MAAoJECTWi3JdVIfQ03YH/3062yTpAZtvA+PXjtXdoIx+
q25+NGfS3pT5MXU9PU5nUSQeJivWIP8oBYtP0LZiGnV6Zog59EHBOnO2u3luk+r4
AW1boZSsPBos6rmKoG4PDDM4a7uWfk7jOxE9WlIk+G4LNJAgScx4s/8c0cMATBAk
XhgwAjfQe4BP+tsxQHvCKnCIemU7I4TXvBOnujEB2YxLA5c5O0I2WCOl8YR5AUxg
THNdRJQbrI3CusFI5+QpqS6dAf9I1DqM2ut4CyBWCEfzjFtu3uwlK0UeLAKnCxKn
hIq7vR2m59bT/W5YkDwY+IkESg25UXzDcV65DbRVn4XHL95Du2Ebjuxx4xBud3w=
=SGAV
-----END PGP SIGNATURE-----

--4AmJdx/+JAF2YHMk--
