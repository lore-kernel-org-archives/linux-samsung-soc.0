From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH CRITICAL] ARM: s3c64xx: dt: Fix boot failure due to
 double clock initialization
Date: Mon, 16 Dec 2013 21:09:15 +0000
Message-ID: <20131216210915.GD3185@sirena.org.uk>
References: <1386964779-29457-1-git-send-email-tomasz.figa@gmail.com>
 <CAOesGMifjnTDUcsweOwsw9fFgsE7b4q3wsASfP8YL-uMH5KiPA@mail.gmail.com>
 <CAPTRvHn7yTt6mC1fjEn5Ra9yx=GZ1DyNQtGWvHsDd_LkuiM_wA@mail.gmail.com>
 <1500417.9RFCmzklxv@flatron>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TIEGfCGDzZzDroj5"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:49892 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751636Ab3LPVJk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Dec 2013 16:09:40 -0500
Content-Disposition: inline
In-Reply-To: <1500417.9RFCmzklxv@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: hua dillon <dillonhua@gmail.com>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>


--TIEGfCGDzZzDroj5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 14, 2013 at 04:41:06AM -0800, Tomasz Figa wrote:

>  - Wolfson Cragganmore 6410 - Mark Brown (copied) is using it for some
>    testing of audio codec AFAIK, but I'm not sure if you can get that
>    anywhere.

Essentially no, though you could try asking nicely.  It's not suitable
for a test farm anyway without a SD mux as the only bootloader supported
is Qi which only boots from flash.

>  - SMDK6400/SMDK6410 are Samsung's official development boards for
>    S3C6400/S3C6410 - I have access to one at the office; no idea if
>    you can get one anywhere,

I believe they're no longer available though ICBW.  The cost for low
volume orders is likely to be a bit high too.

--TIEGfCGDzZzDroj5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSr2v4AAoJELSic+t+oim9HVIP/Rpgu9Jr/HZ2QAV0Z1B3GDpN
jeX5HvOv8Uax6XEkvjEX7i7VSdYLz6lIyqUZ8ngXSVcBsjROwS3jV6KnwnW8JOOA
L4pCa7UWOO39FJ7qel2AzSLxdDgaiZcgWPSjg1qRWXUY6dRG4+crJ38wef/Bnz8d
vvqTwSj2jsVm3mYRCMKEsa832UFy9kCnyeIXruSP5su1SJveOiW2oOTcc7LwwejN
bBAu7XKt5g6t8HGK8w8aIgdqGI0wG7Y8R988jg/eQoOzgvLJ4+RjjV0Ww9LDPnaY
f2HXIAKUyxM1uydlZKeP2XNL3CbUVYr7bIdzihirW1xjfIZwwK4UrB5ReZJeffNU
aKJgusFgHYdR3mLemmEipdo+KdI4kkrUaKoQb+ZVx8Ylgfh/z+lVBlQQtKqG3Y7A
F5Mlk9r9hkPH7K7aqyZqQIlCzyrd4sEOg/fMup4UTrUj0DJ1ReOWyWFBPcSQb/AK
NHyPKAi7r0IFbN6gicTFuyEYWL+fJ0GXlS4VrnSblwyK7AdYZ0kVZCpmILzk4wpg
5oXLsK+OPyv+AbMBsmoYX+547rPjI4Yze8ieGWy4dXW4RyTu9KIgKf24bEtAu/vG
Bb9RGWTfghMhl5aGZ36bTYmxxxVO0Kopyhp3e+U4Ta4F32ir+6iAnNYrnoNGJFyN
DzIcVLAotQ94CC5MqZCK
=xBeJ
-----END PGP SIGNATURE-----

--TIEGfCGDzZzDroj5--
