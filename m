From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] video: treat signal like timeout as failure
Date: Mon, 26 Jan 2015 14:50:16 +0200
Message-ID: <54C63808.5070505@ti.com>
References: <1421731430-13207-1-git-send-email-der.herr@hofr.at>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="DmL8GCDmfpxL65I4pOhTWoVEQR6lijXME"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:58122 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753456AbbAZMuz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Jan 2015 07:50:55 -0500
In-Reply-To: <1421731430-13207-1-git-send-email-der.herr@hofr.at>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicholas Mc Guire <der.herr@hofr.at>, Inki Dae <inki.dae@samsung.com>
Cc: Donghwa Lee <dh09.lee@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Kukjin Kim <kgene@kernel.org>, linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

--DmL8GCDmfpxL65I4pOhTWoVEQR6lijXME
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi,

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


The code changes look ok to me, but again you have detailed descriptions
above which are not in the patch description. All the above looks like
something that should be in the patch description.

 Tomi



--DmL8GCDmfpxL65I4pOhTWoVEQR6lijXME
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUxjgIAAoJEPo9qoy8lh71xkgP/1LWI281Ua37tkCYWjhvjtHg
CmmTtNyfi5DZcMewq2NhCxnE8zeu3So54LTsQgjDjlSVPWAyhD84POY6a7CbNvjb
ZbhaB3t04I5v+REIG3rc7SkIXV2QP4EVvzHBajiz75YbSlM1hG+d76ZW1gqFNmoi
8V4Yn2a3JNRzGMB9xQEdZKC45dyvafRhKCB3GYsyCR8SMa1tW0i2ZW/nAHOwd0QD
nI5XSpJwhXgIexgWwhMciz1eJqNQJtotjqK8xOCld4vP9FnCrKHrNXgfxlZ88+oL
KOkzTzeDJCAm4PnK/LPBfmj5B7kqxEhLJ0LFyWL5UA4uxYnLxb0rJBTVNerorug2
Ew2NMWgDvzExZsWIjRIqrk5oYsYalmpdxMYeYyEtBkp+pBTACNhW64q1bW0Vy9eS
CWPHCC7x7ZgWDU1J8/0foZ8cyjC7H+eMsw+1gDbw8XLSsuc9E73au6cjD7zLSkbF
E7wjPio/ramhobiCaRNWgzoyza/2ekbsXBDMbhmPtiI+iFbqPXyQ1EC8fzim+TFb
NQb1yZUuZPIMQF+TrtW1z/L5FNVBUfm9+Eqdyn46sB0XCUCapbw3lWq1o/ZuRce+
/FXBoQQz+oy/JgjJCh6a62/nLpDL3U+9RQTnGuxyq0YquKBH6rd4my6eqSMJFbM0
RK5sLlnIlf8PncgR63us
=ec8W
-----END PGP SIGNATURE-----

--DmL8GCDmfpxL65I4pOhTWoVEQR6lijXME--
