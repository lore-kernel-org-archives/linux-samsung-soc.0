From: Mark Brown <broonie@kernel.org>
Subject: Re: Re: Ask for help on SPI slave side driver support
Date: Mon, 7 Oct 2013 12:33:23 +0100
Message-ID: <20131007113323.GL21581@sirena.org.uk>
References: <23ff6b10.bf1d.1416a88321f.Coremail.youshenghui0322@163.com>
 <4025277.bhF6fFGQqq@flatron>
 <20130930093317.GX19304@sirena.org.uk>
 <4cd52b0c.af8e.14184497bb9.Coremail.youshenghui0322@163.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RD6GsZsdEJvsf78O"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:53216 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751881Ab3JGLdj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Oct 2013 07:33:39 -0400
Content-Disposition: inline
In-Reply-To: <4cd52b0c.af8e.14184497bb9.Coremail.youshenghui0322@163.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YouShenghui <youshenghui0322@163.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, jassi.brar@samsung.com


--RD6GsZsdEJvsf78O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 05, 2013 at 12:25:10AM +0800, YouShenghui wrote:
> At 2013-09-30 17:33:17,"Mark Brown" <broonie@kernel.org> wrote: >On Mon, =
Sep 30, 2013 at 01:20:42AM +0200, Tomasz Figa wrote: > >> Mark will probabl=
y know better, but AFAIK there is no API for slave mode  >> SPI available i=
n Linux kernel. Please correct me if I'm wrong. > >That's correct. > >> The=
 code mentioned in the post from your link was some internal vendor  >> cod=
e, which is unlikely to be available publicly. However support for  >> slav=
e mode from hardware side seems more or less similar to master mode,  >> wh=
ich means that assuming you can add some kernel API for it, the  >> modific=
ation to the spi-s3c64xx wouldn't be too big. > >There were some people wor=
king on slave mode (or at least talking about >it) but I don't think they e=
ver sent it.  It'd probably just be the same >as master mode but with trans=
fers triggered from /CS instead of from >driver action.  The biggest trick =
would be making sure the transfer is >running before the master actually st=
arts sending data

The formatting of your mail is really bad, I can barely read it.  Please
check the configuration of your mail program, there are some suggstions
for common clients in Documentation/email-clients.txt.

> Thanks for Mark for your answer.
> But how could I trigger from /CS? Could I enable transfer in open syscall?

I'd expect this to be done in-kernel, at least in the first instance.

--RD6GsZsdEJvsf78O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSUpwAAAoJELSic+t+oim9sWkP/0862eCW+BeGxravoic/Ymus
qgGExL3K9qkwGvDW3VdNcn3dRc4DdMlDhn8iMC8DuAOX8neTaCjf0fvSmQuUVB8t
XHSAeQCShlFc5DKvDu3rCMGi1gGTZ7G2+ug/lEZmzj6KTBZr9dJgpKnSLc6Dxamo
vETlKpHq8EiBPXdSnh8nah1vogm3gTHfWt7EWEH0gxkh+7llX6Gytv/u5VG0wE37
+CJzg8cci1b8IeIxC+18v2pNV1EyRRwkrBobOsZNFV2uXQnUyHV0OXAT54/sAqUs
klfxaaKizpkYCByw4O68K6AG0V3PCI7q+HGVl8qFgYXEyb5OWGxxgHQ8h0Xd1bQM
GpwsgUBLti/lb7kvScPAfPXKOuTk8EGNfIqBxAHjhGqVPhGgp9kdyBJYnAZ8d4Jm
+/dL5B5w4b+uRiC4rbMrJ9EcvA0V1b0/LywtaOrs2PqIGDkde6Tadp5GPmm1lLg/
ObP7fjIqXcZWF6kzwknf0yTM9q8wh0BtX8PqLholcsGSJ2XNLU6YqmmeUDS1FybC
u9SjT9jltMwHtrF5ALc9UTj3POhjXWS28v3/UFeiAkjKWPInaAr5PD1ppe7NNV1F
OCUEYghUrKYMqtuP4nXI4Dkj6xhUEZI3SOsHpTRZ902clnNKycDGX+hxy5aYwA4x
Z21h+AT6HW2N8v8986Mw
=CWMM
-----END PGP SIGNATURE-----

--RD6GsZsdEJvsf78O--
