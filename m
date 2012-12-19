From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V5 2/2] ASoC: SAMSUNG: Add DT support for i2s
Date: Wed, 19 Dec 2012 17:09:37 +0000
Message-ID: <20121219170937.GV4985@opensource.wolfsonmicro.com>
References: <1355395373-22058-1-git-send-email-padma.v@samsung.com>
 <1355395373-22058-3-git-send-email-padma.v@samsung.com>
 <20121219132414.2CF653E0AD7@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+Yg8W10oK6rlW0RR"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:57749 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755671Ab2LSRJl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Dec 2012 12:09:41 -0500
Content-Disposition: inline
In-Reply-To: <20121219132414.2CF653E0AD7@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, jassisinghbrar@gmail.com, kgene.kim@samsung.com, sbkim73@samsung.com, tiwai@suse.de, ben-linux@fluff.org, lrg@ti.com


--+Yg8W10oK6rlW0RR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 19, 2012 at 01:24:14PM +0000, Grant Likely wrote:
> On Thu, 13 Dec 2012 16:12:53 +0530, Padmavathi Venna <padma.v@samsung.com=
> wrote:

> > +- compatible : "samsung,samsung-i2s"

> Isn't that kind of redundant?  :-)

> The format of the compatible strings should be "<vendor>,<part-number>-i2=
s".=20
> Please be specific about the part number that you're doing the binding
> for. For example; use "samsung,exynos4210-i2s" instead of "samsung,exynos=
-i2s".

There are actually versioned IPs here (where the versions are used
publically in a few places) but it's not clearly documented which is
which.  It would be reasonable to use the IP versions here I think.

--+Yg8W10oK6rlW0RR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ0fS+AAoJELSic+t+oim99iQQAJKF9qTp0/p73XtK6TJwvXVM
xYY0ZzmZzFv8q6HG7Nx+gw+SE1DAp+GmQefCIAahsEIEnRf/9MHhiz9uuMtP3jLL
rYCqy5uiYgXDAOhW3dVB7r4l+XFotslkkigm0dDA2GTrLQrWdP2CXqmN2j8fix3G
MARX79RwNoRLTWHz4LvOgB2tdqjLUfhNEbBSrwnTGLNR3TMa32+26zABO+bgASx9
dx8A1O9m6Y+ZBuDfVNAVixnMZ90P0+iaM0TKmaEzKMnCsg9779V85PkkhYKMdewc
NQiwhfsHs26bF/Fub2SJpCYAvMW7YfTU1go3H5UuXOPY2KvgFhZmREx0zBkoGyT9
jDOUJJPtxYaCNfi+qM2gOxdfSYl0jcbCQ82U+wlWB8GhdZyWzxirk3sE4o78FXZL
hDKY0dWEtHOY1uKuHQPmQ4eo6ORYaECEBTexHDe+lBmT0DxELeE9b83FCwEItcSC
Dl316A6Ojo8KJi7Fxwl/xLHFoi6vMNU8lCT/fvdn81z5U5YshxRuJIHy7VJFWccO
iD2Gt9tPU60Y0YarAnEhK+JhSeabvsWBco7fAQYkk89GSAz8T8BWmmtl2phPtfRd
+fiUK5wb1jYaSztOwZUvCPTBcbLH5owFf/byn2VXZ7be5xRsNGp1u0XMMx0aeRtF
XvnudmpfXR6Z3+OXztDr
=tTsm
-----END PGP SIGNATURE-----

--+Yg8W10oK6rlW0RR--
