From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 11/14] regulator: s2mps11: Add opmode for S2MPS14
 regulators
Date: Fri, 14 Feb 2014 21:05:02 +0000
Message-ID: <20140214210502.GX4451@sirena.org.uk>
References: <1392282847-25444-1-git-send-email-k.kozlowski@samsung.com>
 <1392282847-25444-12-git-send-email-k.kozlowski@samsung.com>
 <CAKew6eWcwVm1EAUAdFu48y_O5puu+eGvGW3k6923MdXfMa3UAw@mail.gmail.com>
 <1392383156.12506.20.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Kwy1es1GwkEJhNg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1392383156.12506.20.camel@AMDC1943>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Yadwinder Singh Brar <yadi.brar01@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <t.figa@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--/Kwy1es1GwkEJhNg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2014 at 02:05:56PM +0100, Krzysztof Kozlowski wrote:
> On Thu, 2014-02-13 at 17:46 +0530, Yadwinder Singh Brar wrote:

>  - low-power mode;
>  - low-power mode controlled by PWREN;
> Although not all are present for each regulator.

What exactly is low power mode and how does it interact with the enable?
The name suggests it's a more efficient mode for use with low current
drain, is that right?

> A generic solution for operating mode of regulators (not only s2mps11
> and s5m8767) could cover all of these above or just a subset, for
> example regulator bindings could look like:
>  - regulator-mode-suspend; /* PWR controls: on/off or low-power mode */
>  - regulator-mode-low-power; /* Low power mode */

Those properties have awfully generic names and part of what I was
wondering above is if the low power mode maps onto the idle or standby
modes that the API defines?  We don't cover those in the bindings yet
since they are unfortunately fuzzy but perhaps we need to do so.

--/Kwy1es1GwkEJhNg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS/oT7AAoJELSic+t+oim99lcP/2kFSZ61Z4yz77nEn7NV5oSy
GngIymNi8N76RIDELr+jN0U4a0ijjgSx+sZqiap1B0IoKpGl6lTs2fOKeFMzPUBY
HAEQF3pPPz70O7AQ9uI4YkuDBXh3vhhaQV+3M/ZXr39EqWySjrjVW21M/Et87FDh
tQ6VbbBmXq7N0DdXI4FhYJjtdsa6WgWhbEyVK0GDxKKl7lGyayZ+UJ9ntV4u+z30
t2EztL2xT9GtPaxIAXs//Tc6ltkxlVZR13G8OYyTUVDc7YaDljbuGJHFUdt6tn/1
TpFxkpqqPZ/FO7uoOpUTrzj6BAxejl44HPmDPBtPjHYdfXzy9XUUEAGBCG2wa1qX
sQzKPYk5GVVaAi0T2YAWGDqmCEU3DjuiUAPmmI67RIMTxrxyxJJviW+8kuvWrP9o
NYP0XbRJfrhc1MoG+/TeLu3kI4cZ/aMvhS/j7xmLXS7rt4WSSN0b0qURJEB9E5Gi
TZq1ykVwPTGiAy57Eu4jbvW8kDPEUHRNqJCb0dOjVJp8AP0+NTxhOCOPiXruVDUE
K19AB68UVj2CHnPgwYRmARwJsZpjBch7ykEkk6QgbgXdOhmWZ1PzpYrSCIzo5Chb
Z9KG2UnaRCXaq5+ImEK9VwpCnElUsOlQJWfSpq0jpo6rZvpeos6LdtMzmC+VVG/Q
p0d8Zw2DX92wSQJxj04v
=Cd9B
-----END PGP SIGNATURE-----

--/Kwy1es1GwkEJhNg--
