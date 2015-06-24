From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: s2mps11: Fix GPIO suspend enable shift
 wrapping bug
Date: Wed, 24 Jun 2015 10:31:44 +0100
Message-ID: <20150624093144.GE14071@sirena.org.uk>
References: <1432696928-4690-1-git-send-email-k.kozlowski@samsung.com>
 <20150528144449.GZ21577@sirena.org.uk>
 <CAJKOXPc3_uHBqKYShn603OT=UdLk-Q=i9Q84rwywtNpCTfUp=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="42wYT+Mt3aBUaKnv"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53540 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750988AbbFXJbz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jun 2015 05:31:55 -0400
Content-Disposition: inline
In-Reply-To: <CAJKOXPc3_uHBqKYShn603OT=UdLk-Q=i9Q84rwywtNpCTfUp=w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, stable@vger.kernel.org


--42wYT+Mt3aBUaKnv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 24, 2015 at 01:02:28PM +0900, Krzysztof Kozlowski wrote:
> 2015-05-28 23:44 GMT+09:00 Mark Brown <broonie@kernel.org>:
> > On Wed, May 27, 2015 at 12:22:08PM +0900, Krzysztof Kozlowski wrote:
> >> Status of enabling suspend mode for regulator was stored in bitmap-like
> >> long integer.

> > Applied, thanks.

> Mark, what happened with this patch? I can't find it in your tree.

I don't know.  If it's not there it's not there and you'll need to
resend, sorry.  There were some problems with error handling for bad
networks when pushing things but it looks like this was after I fixed
those.

--42wYT+Mt3aBUaKnv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVinj/AAoJECTWi3JdVIfQ+iMH/RUmo0E8BgSJHV/+YYaVoDrS
JN/UNk1aprkol854yoYyYEt5/Labb1HIUB4GkIobcJpJA/HWpb2mciYxw0J/xTUP
3EiM2ssoovNGcWxxq2Z5pGCp91pJ4SqYe4a5fUUMRVB/Cx5QEh6hGRgGIf1+zpy8
a8Y7zgqYtUiLkC8gES/HYyuNK0I2K7n9EMJp6WcTGOUPrMNLasOUqgFNxM8rs3rv
4HNMa6RaLRLBMYui8Y+bD6nLBP65PWQV7u0//GtPxiv+zqQR6YR2C0FBw7UiocEv
iNMACM5ebMa8i86Y34By0k898WAIIKGj3HZGBVkw25DD1pi1Jp8kGKgdqv+bYbM=
=N3IV
-----END PGP SIGNATURE-----

--42wYT+Mt3aBUaKnv--
