From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] video: treat signal like timeout as failure
Date: Tue, 10 Mar 2015 14:43:57 +0200
Message-ID: <54FEE70D.3010307@ti.com>
References: <1421731430-13207-1-git-send-email-der.herr@hofr.at>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="hSxBenJVt5VGC0LvbgKT63tiVM86u8Jse"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:42260 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752382AbbCJMog (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Mar 2015 08:44:36 -0400
In-Reply-To: <1421731430-13207-1-git-send-email-der.herr@hofr.at>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicholas Mc Guire <der.herr@hofr.at>, Inki Dae <inki.dae@samsung.com>
Cc: Donghwa Lee <dh09.lee@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Kukjin Kim <kgene@kernel.org>, linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

--hSxBenJVt5VGC0LvbgKT63tiVM86u8Jse
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 20/01/15 07:23, Nicholas Mc Guire wrote:
> if(!wait_for_completion_interruptible_timeout(...))
> only handles the timeout case - this patch adds handling the
> signal case the same as timeout and cleans up.
>=20
> Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
> ---
>=20
> Only the timeout case was being handled, return of 0 in=20
> wait_for_completion_interruptible_timeout, the signal case (-ERESTARTSY=
S)
> was treated just like the case of successful completion, which is most =

> likely not reasonable.
>=20
> Note that exynos_mipi_dsi_wr_data/exynos_mipi_dsi_rd_data return values=

> are not checked at the call sites in s6e8ax0.c (cmd_read/cmd_write)!
>=20
> This patch simply treats the signal case the same way as the timeout ca=
se,
> by releasing locks and returning 0 - which might not be the right thing=
 to
> do - this needs a review by someone knowing the details of this driver.=


While I agree that this patch is a bit better than the current state,
the code still looks wrong as Russell said.

I can merge this, but I'd rather have someone from Samsung look at the
code and change it to use wait_for_completion_killable_timeout() if
that's what this code is really supposed to use.

 Tomi



--hSxBenJVt5VGC0LvbgKT63tiVM86u8Jse
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU/ucNAAoJEPo9qoy8lh71DugP/06YskwaUGN3REpIqS0okRvi
bf1/L7scSl0Q0RAMfRwK4Od8eveDAu67XLgsfpxqaxI5GJG0aGclplS/IEhbsKqe
2niXyHtT8ZfZGEmOOJv2IM2W0PwDrv/6lNBWUbJU12GLVDlEUanMZTgyy93ivQGB
ySIjhwsMp9bMyirCNBG5rf4jGLZMlXMT9P1v0X3tL4ikZwB84jcwQW8D6KTxy/U+
PsoBTLWHls5yDNwY61RuIUhN+klrggNnWeavrwCs8pD7XoybBYqlAtU+zCg7eSeQ
diy2itw6r2bmh6ZXW7jcRNe/xKVXlPXknZQ25cMtP5r0JaX/2lKS0qQd5J/nC7jH
LhJBK+esZiNM7SwRrWDRCF10HEQuPQYHg9WwOnu/+VdUhsCXqzUrcZG7PgGJVwvP
iLcmTJaxY7tD3VvbPML2raYCIOfYNQLMkGkWgmoagZ4pI4ZU6lIuSzK7x/ndivrE
7jhKPMM++0zX9Koz+IQkEPWVmBdxybBuD3Arj9LLGwbcqx4MSuVVXPDbDiCNlPdu
vRY62/BkgGJJ4pbJvJ3+Xr4O9ukk/J2mkFPv9ny017CVqCVDM2UcQOJDQnDJV77b
rMoB/MqFyOxMcSFkk2GYk7yUkv7JzeP3emab3DWDUIh7dMvvzso2d8zeHyfaD/BX
1/dAYt4N7Z9DJH2ai1kV
=XlPX
-----END PGP SIGNATURE-----

--hSxBenJVt5VGC0LvbgKT63tiVM86u8Jse--
