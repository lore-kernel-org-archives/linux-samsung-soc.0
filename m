From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH v2 2/2] s5p-mfc: Adding MFC v7 and v8 firmwares
Date: Wed, 04 Jun 2014 00:26:35 +0100
Message-ID: <1401837995.2412.45.camel@deadeye.wl.decadent.org.uk>
References: <1400676064-17819-1-git-send-email-arun.kk@samsung.com>
	 <1400676064-17819-2-git-send-email-arun.kk@samsung.com>
	 <1401824047.2412.7.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-SSjDebV/TXfc2M+bJetC"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:52984 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752922AbaFCXW0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jun 2014 19:22:26 -0400
In-Reply-To: <1401824047.2412.7.camel@deadeye.wl.decadent.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: dwmw2@infradead.org, linux-samsung-soc@vger.kernel.org, k.debski@samsung.com, t.figa@samsung.com, arunkk.samsung@gmail.com, linux-firmware@kernel.org


--=-SSjDebV/TXfc2M+bJetC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2014-06-03 at 20:34 +0100, Ben Hutchings wrote:
> On Wed, 2014-05-21 at 18:11 +0530, Arun Kumar K wrote:
> > Adding the following firmware files for MFC
> > s5p-mfc-v7.fw: Used in exynos 5420
> > s5p-mfc-v8.fw: Used in exynos 5800
> >=20
> > Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> > ---
> > Changes from v1
> > - None
> > ---
> >  WHENCE                |    2 ++
> >  s5p-mfc/s5p-mfc-v7.fw |  Bin 0 -> 382724 bytes
> >  s5p-mfc/s5p-mfc-v8.fw |  Bin 0 -> 360576 bytes
> >  3 files changed, 2 insertions(+)
> >  create mode 100644 s5p-mfc/s5p-mfc-v7.fw
> >  create mode 100644 s5p-mfc/s5p-mfc-v8.fw
> [...]
>=20
> Applied, thanks.

Just noticed a problem with all the s5p-mfc firmware: you are putting it
in the s5p-mfc subdirectory, so distribution packages will install them
in /lib/firmware/s5p-mfc.  However, unless I'm mistaken your driver
requests it with a bare filename (e.g. "s5p-mfc-v7.fw") so it won't be
found.

Ben.

--=20
Ben Hutchings
Experience is what causes a person to make new mistakes instead of old ones=
.

--=-SSjDebV/TXfc2M+bJetC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIVAwUAU45Ztee/yOyVhhEJAQrFURAAs9f5SGC+BQGrrvAi/SfC+NDFr/AbObTy
CIeyZvNSOAzbVndKRlutvy8lPMYTKY2ewLZYdd1qrKhAdOmjgxqlkxO+X07QZUkA
F7zVdGDGKt54RBqzL1eDSu+hsTJLwp1QWZrZ7LbIyTdf7aJaAC741/5gcML9JP1X
i9tTNaAPWcQfy2IJ9a7e7E+gcFT0/JAeKn/y4GFVpRB+eos9H6iHSauhnwINMCK5
ldDB+kpuqrZBVQ0O2+6cIm6JERQZ8qCwx6Xg0TyBPc7p+ovdO9iuEOpwouAH4ozv
N7PeT9clF0ncY9wxwIV7kygUhPWP1Dc7oE4eU6KRe5nPav+FRqZUokDsZeBp9e2C
VPljlQn6zRhf6yADe+wsaJAfHZCL21jCVMz93iQLZHBOnQxhvsteUUZTykSS/Zdc
GC/ElKR2bV1HGzZnvUiXQA8DyWQ83V6lyxKY11UICkY6sy26m/Xb2Gw5Us/ichFs
+ve0MwxnJ7Wkdhur0OzzBVYImwBDqffAotzBkyvxpcGIwgTQ3kfsfUGjRIMBYnjU
fiwA9jblB5NwrlwCYeeh5nTJD+hHb1RJfnXmRUzPB4fjc3TAXgSgJ/ijtE4pzkpO
Gl1qcGxlv1XjViEaAzWYFsaowtqb3TCPpwTLOAAKNbC/53i+VnqGlTwAH+Grr1ft
a1Y9UkUqyhE=
=D4N+
-----END PGP SIGNATURE-----

--=-SSjDebV/TXfc2M+bJetC--
