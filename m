From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] Asoc: Samsung: I2S: Add support for runtime S2R
Date: Thu, 31 Jan 2013 15:36:34 +0800
Message-ID: <20130131073632.GG7663@opensource.wolfsonmicro.com>
References: <1359547864-1057-1-git-send-email-rcsekar@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sClP8c1IaQxyux9v"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:33474 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754239Ab3AaHgn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jan 2013 02:36:43 -0500
Content-Disposition: inline
In-Reply-To: <1359547864-1057-1-git-send-email-rcsekar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "R. Chandrasekar" <rcsekar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, jassisinghbrar@gmail.com


--sClP8c1IaQxyux9v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 30, 2013 at 05:41:04PM +0530, R. Chandrasekar wrote:
> From: "R. Chandrasekar" <rcsekar@samsung.com>
>=20
> This patch adds runtime suspend to resume support for I2S.
> I2S clk is disabled at suspend and enabled at resume.

Applied, thanks.  Please use subject lines appropriate to the subsystem
and keep your signoffs in order:

> Signed-off-by: R. Chandrasekar <rcsekar@samsung.com>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>

--sClP8c1IaQxyux9v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRCh7yAAoJELSic+t+oim9GOkP/0Mtqfvuq2OBLXEDHiueVLBj
o/jRAFnBehTPJ/eBGJZTD21AiWuXpoM+QykH7KfUUR3McAeue9CWvfGcKA0etRxx
MidMR/28vo9zMP1s8kHrPTm8e2Vq2PTpoPNh9jPdzLlZ+/326IiMdOZvyA1bUN52
dwrR9LkxqrCAdKoni+mXeuPrqK6nD63zcHgyiz5JbpYGUfXaiXmSoO3KAq7EoAbO
tXnXvWn7hEWHbqk6hhdcfJYeXDbZtlREX0nlgHMLsf4MCdm/uzYgZQ9TtEccQEVv
DS6rv3RKCpkAmhdVJ3kKAUjwy9U+MsGiRDlL4TV3gABxzByMwAfxGdjhGDRTx/Ua
D54dTvK8ypXPFAjnWhiP7fbBy08otVSoNJu2nedaZRAVUD7NOpI1MsvElPZHClT9
cZSt/RR8NAmMHaAiLySkcbzBbfdfUW2R2Iis/ZBF/2VcwUoB4Foe9yiL8YkWSNbo
zJjl6do5aj5AGCfypfm3mfIPciGlWAD6fiMSqdBFwAL5JDf46xySkoghrwAdtpT5
XHyk7EVvS9+4rgKpzDzHVH9iYsWyRVnlb3RJHo/mjj2lL8KydnsCEANsLDcdATOp
pyAWnv0a0HEwwfZMaN4IxeyI0RAalZaGJxgHbxoc9muTq07vyKIMxO/LF3ubRYWJ
Tb9aw5tu5BaOaM3PDIvt
=n7X8
-----END PGP SIGNATURE-----

--sClP8c1IaQxyux9v--
