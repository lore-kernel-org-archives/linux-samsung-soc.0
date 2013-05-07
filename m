From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: Samsung: i2s: Fix crash in i2s driver
Date: Tue, 7 May 2013 10:03:36 +0100
Message-ID: <20130507090336.GP7478@sirena.org.uk>
References: <1367897941-18439-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6sj9mcRtP+pTWLOo"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:49720 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759198Ab3EGJDk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 May 2013 05:03:40 -0400
Content-Disposition: inline
In-Reply-To: <1367897941-18439-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, kgene.kim@samsung.com, alim.akhtar@samsung.com, thomas.ab@samsung.com


--6sj9mcRtP+pTWLOo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2013 at 09:09:01AM +0530, Padmavathi Venna wrote:
> This patch fixes a null pointer deference in i2s driver in DT
> case
>=20
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>=20
> This patch is dependent on below patch posted by Thomas Abraham.
> https://patchwork.kernel.org/patch/2224801/

Please don't submit patches that can't be applied, the two patches need
to be submitted together.  Please also remember to include human
readable descriptions of patches in e-mails for the benefit of human
readers, commit IDs and URLs aren't immediately comprehensible.

Please further note my new e-mail address.

--6sj9mcRtP+pTWLOo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRiMNlAAoJELSic+t+oim9DQsP/A1kjHtUC3/7k05NK/il11Ym
zqUkzOi7PTll5Gfj2v+C5i4rRBjwycUJVVDyev53EP9kmcPDWvEDOuSeSvejRozS
YHteVVV58SC+BgSf3MR0LVmfIWFswCzJ61Xm1L1QDYkPft/6FnnhRvgcMhcnkJBo
TDb3HzmSwjVxYfttzVkP6sNrUkSuHc3VWxxeO3HbsYfph/wcffWnw7k3UJE+NKdP
p3+zhL/RjioY3AE/gnVHbHmx7XhRs3LEOD8p4j/h2VcraMLckXTv3kRrt0lgXRvp
U9xOOM9uUJWGDBNlSSSTCCOiUQiZQLvtb6Z+ibVYUTIotp8riqXj5t9M2jIK5sbj
FBBVs5tCe+x/Fl+O9DOwiw+eACJTENYpMwSWachkRugl9LYq6AVMuRtjJTVl96vV
z+Jpw20V4rdyC13zUcX1Yr+e0t+waFFW/CZgO265ysQNN6RJ28ZaTxc0N9Hi4h/Y
fKjCMbRs8lXTLUwzijMsS+v3QLEwj12zNsvkXNiyvmiLcVwnSmsTVuyKkTuPt5Ww
KwXxUxrTf3RgNM1fqdML7QEPnBOAlsC/5Q6SayzCWqyC4xcJ6Lsjf99zLRQLMDDh
/eWu4uxqxpz2wyANo19VlYGzdAEpsoKKfk+OUEwaxW8CsiWsoxMu3F93aHXB5vq8
lfCLEwJbJY65NzsQd1/L
=LIG1
-----END PGP SIGNATURE-----

--6sj9mcRtP+pTWLOo--
