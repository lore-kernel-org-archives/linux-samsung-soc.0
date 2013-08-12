From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 1/4] ARM: dts: exynos5420: add i2s controllers
Date: Mon, 12 Aug 2013 12:34:48 +0100
Message-ID: <20130812113447.GW6427@sirena.org.uk>
References: <1376302070-1877-1-git-send-email-padma.v@samsung.com>
 <1376302070-1877-2-git-send-email-padma.v@samsung.com>
 <21180092.af8YMiXtjc@amdc1227>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="muZOxeWw7VP4OgIK"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:57861 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755019Ab3HLLfL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 07:35:11 -0400
Content-Disposition: inline
In-Reply-To: <21180092.af8YMiXtjc@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org


--muZOxeWw7VP4OgIK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2013 at 01:14:20PM +0200, Tomasz Figa wrote:
> On Monday 12 of August 2013 15:37:47 Padmavathi Venna wrote:

> > +	i2s_0: i2s@03830000 {
> > +		status =3D "disabled";

> If a node does not require any board-specific properties for the device t=
o=20
> operate properly, there is no point in disabling it, just to add a single=
=20
> status property at board level.

I'd expect that to interact badly with the pinmuxing - unless the device
is disabled it'll try to grab its pins on probe which is not going to be
a good idea unless it is actually wired up for use in the system.  Or is
there some other mechanism for handling that?

--muZOxeWw7VP4OgIK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSCMhUAAoJELSic+t+oim9nJ8P/0u+42W4yK/ouDZ6GuxVSFci
Pmxj0Q02fdIw5wNRrfainfjJT05fvp+HxeU8qZV4AAAoP2xoZewVyCh4FM05SATU
ADkkLtSwFz4gE02hYu6hH24MBrwL5aQHY+QyTiByXGASeVmsRmEH6aoyuFYgBy83
v8UJaKCL+CFFTxyY2oh4QZz7pxHP1lMVY5qBeX0QyzqoABhBMYgz5c/qPHX6lUNs
Poauav1GaQJnz5z2iPSO2Ts5B/1EUTmKXCiEFXc8pGv8IQzt4eQ8yOpeTgCiRugu
6XAxdHJRC2yT9D3Yy+QOR/qIHaC0tzzzWepC0TRPcSJ0joBd0B6odkGC3en9jUri
scM/y2kKLg6kfPciG6uS7U4DLtAUtqepq65Uig+I/53mehjyuieTHpkjVzHEMi68
LwSbBUBIF3m2XNRADj/JZidzbIGG7HYUGE0Zo7TjSi9I3cCAwyodWhfizKMdy76S
wXtfMuJpa1qUbAm4DtnV5ct3fHw18oUiatUvsW9wfhyY+CuuUT8Wg1BBnQbqJzH7
tZyaGTtKX1T7V0XwPtSyUz0ZmeD0hOJCa6lTTh5sJ66JcqO1W0hMEHYQpk18bZBH
SkS2sKkm8Xh96MWcMTKiSBR1wtb2e5VC6CFpMH8MD4L/w4AA3NhrDhywgWUH66bG
WU0JGIctWnVzIG/nElMh
=XLls
-----END PGP SIGNATURE-----

--muZOxeWw7VP4OgIK--
