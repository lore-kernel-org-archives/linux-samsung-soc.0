From: Mark Brown <broonie@debian.org>
Subject: Re: Endless "supply vcc not found, using dummy regulator"
Date: Tue, 24 May 2016 16:45:08 +0100
Message-ID: <20160524154508.GK8206@sirena.org.uk>
References: <20160521144308.GA13960@sesse.net>
 <20160523134737.GA21683@sesse.net>
 <20160523144047.GA36908@sesse.net>
 <20160523162455.GW8206@sirena.org.uk>
 <20160523170617.GA8997@sesse.net>
 <CAJKOXPds5PgVmcYLEOriyL-a6tp0jkg7x0GTjPZaN9YLL_gO_A@mail.gmail.com>
 <20160524152638.GA20341@sesse.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IB2Qao3B4XdnqHmg"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34538 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751515AbcEXPpP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 May 2016 11:45:15 -0400
Content-Disposition: inline
In-Reply-To: <20160524152638.GA20341@sesse.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 823552@bugs.debian.org


--IB2Qao3B4XdnqHmg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 24, 2016 at 05:26:38PM +0200, Steinar H. Gunderson wrote:
> On Tue, May 24, 2016 at 05:06:43PM +0200, Krzysztof Kozlowski wrote:

> > Please send an appropriate separate patch for fixing this. Your email
> > did not reach people, I think.

> I only sent one patch so far, namely the leak fix.

You buried it in the middle of another mail and didn't CC any of the
maintainers - he's asking you to submit it using the process in
SubmittingPatches, the USB maintainers won't have seen this discussion
and may not notice a patch buried in the middle of a message in the
middle of a thread even if they see it.

--IB2Qao3B4XdnqHmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXRHcBAAoJECTWi3JdVIfQmzcIAINvh63Ic8DI3ys1keY9ph5m
Psq+w8p1pKwKp0F2MGlebuE4qTcM5MykAnld+xjB1RndOSL8w/GEujVYas1l5B5o
gnY1IbDwWZ+s94EltrzlgjImQYJedKQP53oeQrB492OuspCwdC3Zir+lQwzo9oiB
wq6Z3dGBeNCxpI4uYcruoDUgxwTlUoLK++uo8sy59KQEdtwbuVwvujicPh39UanI
5oZS7RwJ66m2wP0ZSWIdVflId1SjfsCFRMy5G+o/GwSpZ7MkhvYbJyKE87h2ZS4w
3215GkOksMLAMYgKQKc1tKPx+7buTK4LyqNLcn5i7L0gtDnDxbo0rKApQ0ekmcU=
=awRr
-----END PGP SIGNATURE-----

--IB2Qao3B4XdnqHmg--
