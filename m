From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] drm/exynos: Add missing includes
Date: Tue, 13 Aug 2013 10:53:57 +0100
Message-ID: <20130813095357.GO6427@sirena.org.uk>
References: <1376351200-23009-1-git-send-email-broonie@kernel.org>
 <005601ce97cc$995f3840$cc1da8c0$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o1EK/QvPH/YNh/i/"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:44579 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756556Ab3HMJyV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Aug 2013 05:54:21 -0400
Content-Disposition: inline
In-Reply-To: <005601ce97cc$995f3840$cc1da8c0$%dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: 'David Airlie' <airlied@linux.ie>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org


--o1EK/QvPH/YNh/i/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 13, 2013 at 11:27:04AM +0900, Inki Dae wrote:

> > Ensure that all externally accessed functions are correctly prototyped
> > when defined in each file by making sure the headers with the protoypes
> > are included in the file with the definition.

> I definitely missed it. sorry about that. Actually I was going to try to
> incur something such as compile warning. You mean that the warning could be
> incurred by compiler in case that a external module includes a header of
> Exynos drm but the prototype of the header file differs from the one of .c
> file?

Probably nothing would actively warn about a mismatch (since everything
happens per complilation unit) without the file defining the function
including the incorrect prototype but you'd get problems at runtime if
the declaration and defintion were incompatible so some things
(including sparse) will warn if there's no prototype for an exported
symbol.

> I will apply it to -next but I'd like to understand why this patch is needed
> surely. And it seems like that other drivers have same issue also. :)

Yes, it's a bit of a problem (especially in the graphics stack for some
reason) but since there's tools that pick up the issue it does tend to
get fixed.

--o1EK/QvPH/YNh/i/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSCgIyAAoJELSic+t+oim9DGkP/iE6lDuY2F/RysUp+XimGVVR
n12I5clGXHNgNkqiA68YZo5Y8DW2VVoEkCs4Hy5cPF7wRAKGyochLwIaMCxfyhn2
dAMsEYlFTd1y4a9dtXZt+E/2IhO3fzWB2u8Uzf3oGAd5fdVvxIik23V8ZxBeUQDY
lpwotsVBKbpVw3TOE94/VeXqec1xDDycuGCkoXqtvFAtmmZdx8SgEoJiQQmJ5kZI
8vET8sv1wQI4+q21bgP9BAog/f7Q7k+oxDrLffri9RhTvWLQ30lUSPX4heOmNGg4
hYDS2iLsAvdJfamBYU4bAxQAofBVyyRWIHkvIaeBtvTWls/c0xebWsL+ZqXXFYeV
vUHZiYb6GRqkqxi2UduF9QdYAuJGv3xwSzyt8TUEwN365m/18nIBIyRrarQo0roa
WSnjMlrOEgjoVLkoPwG7pxy/0J3ItF8FQQRrb/Xdi73iGq9okbw8i7e4T/U8fsLO
5CurnI9XOAuC9WH+C7Yi17xak4+OTpkRcRClJPExOdmUuzGVhY6m3W69BRhYZ7WV
XW1jAVk7Smw9QmSH0qkn5nRhG5+UScsdSp4PMZnr5ZzfcM4J/eT6fWJrcTxoWV5w
P0wrALnsxBRdU4npeSrulZxnKCRiYPLZZNp+JFkilAf7HpJpzwORiDxBdlO9C7BJ
u6p9PdyN5d9uMfIs2Q9/
=D9Tg
-----END PGP SIGNATURE-----

--o1EK/QvPH/YNh/i/--
