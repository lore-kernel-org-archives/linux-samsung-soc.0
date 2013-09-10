From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 6/6] spi: spi-s3c64xx: Move DMA initialization
Date: Tue, 10 Sep 2013 13:03:58 +0100
Message-ID: <20130910120358.GG29403@sirena.org.uk>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
 <1378735766-12330-7-git-send-email-l.czerwinski@samsung.com>
 <20130909145351.GD29403@sirena.org.uk>
 <522F0151.50905@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zlx9VeIOwFZpCeUB"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:47242 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214Ab3IJMEV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Sep 2013 08:04:21 -0400
Content-Disposition: inline
In-Reply-To: <522F0151.50905@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?=C5=81ukasz_Czerwi=C5=84ski?= <l.czerwinski@samsung.com>
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org


--zlx9VeIOwFZpCeUB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2013 at 01:24:01PM +0200, =C5=81ukasz Czerwi=C5=84ski wrote:

> For 16kB buffer upload time is reduced from ~90ms to ~80ms (I tested
> with S5C73M3 355560B transfer). If you think that performance
> increase isn't valuable we should skip that patch.

That does seem worthwhile.  Is that just a single transfer in isolation?

> amba-pl80 uses virtual DMA channels support so driver won't occupy
> all the time physical channel. pl330 driver don't use such framework
> but It will be very hard to occupy all channels at the same time. If
> I'm wrong please correct me.

OK.

--zlx9VeIOwFZpCeUB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSLwqrAAoJELSic+t+oim91cIP/1AR+E00NBXEbxoWN8dhiPV2
qTeRC+0bxV2eDzO0Clx4HKaCeQ4Ou2rfrJtq4G5UDTAcL1qdDSkzv0iSMjCKLTGz
B1Mp5kf4hJr01e1x5nogz3pPHr33IxOiO+dtMC5TSMegndlBaX80+yihJz5/7+in
EchJSTU/TsVCH5Y3cilncmmV6tNXiJwKm7CkvZPurXsN79gwpgCYMTbzsKKl+byH
bARQ40hgHtzub1gCt7/+eUPMECY5npHzMj0YpzqM94GjQvREk3OCzJ0BYArXYTz/
GupAPFbg0i3edMmLiV7yeGkezqA5kIl2V4iaKrrqZYThdxBihCz/pXcAvFhJ4IRw
kbUtbGhvCv957fWhxiaMgePO6SIVjMEE2i4bGapnc3qyifNTA6Gl72L2fYLU8V2A
FYDBAFvMBkaQRqgU0mRssDnX74Q0JMA+1Lob0CN0HBW8aRlYIfFsSRIJxCBBy7yq
lNR0BBBlvfoEGHJ1MalcpbJS/DSVVa9DgZW2bay9ansFqq+0Hs3KNYy+tarNBgIy
I8CvZaclAfetytKsPVv9ey/zACe0LHRr23dDx9vWmdaYjMoRLKFotZUca1qhRUXX
CMz+Z4/dyqb9Q9hfD1/FOYYmFUT2BdBQmH8zOkuo9B7sHjLITO9+AKO63uUMFh7Q
kU0jsuzzGxNYbkalkJZI
=BcV8
-----END PGP SIGNATURE-----

--zlx9VeIOwFZpCeUB--
