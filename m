From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: S3C2412 SPI controller in DMA/FIFO mode
Date: Wed, 12 May 2010 12:42:41 +0100
Message-ID: <20100512114241.GI26401@trinity.fluff.org>
References: <4BEA78AA.1090409@reciva.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:51197 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754392Ab0ELLmm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 May 2010 07:42:42 -0400
Content-Disposition: inline
In-Reply-To: <4BEA78AA.1090409@reciva.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jonathan Miles <jm@reciva.com>
Cc: linux-samsung-soc@vger.kernel.org


--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2010 at 10:45:14AM +0100, Jonathan Miles wrote:
> Hi!
>
> Has anyone had any success in getting the S3C2412 SPI controller to work =
=20
> in FIFO or DMA mode? I've been trying for a while now but not managed to =
=20
> create anything stable.
>
> I note that the current kernels have s3c24xx_fiq - is this because no =20
> one else has managed to get FIFO/DMA to work either?

Partly it is there because other SoCs don't have FIFO and also don't
have bi-directional capable DMA. Not tried FIFO with S3C2412, the
FIQ was plenty fast enough.

--=20
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.


--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iD8DBQFL6pQxJZCApG2L7OYRAqGXAJ4snx3Z5BlgUczGgRc5Xc1qxzP2sACfVGGP
KfyGc8RtmjN5Shd5UO5CZ7s=
=LA1N
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--
