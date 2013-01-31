From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] regulator: s2mps11: fix incorrect register for buck10
Date: Thu, 31 Jan 2013 14:45:27 +0800
Message-ID: <20130131064525.GD7663@opensource.wolfsonmicro.com>
References: <1359550947-5731-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6WlEvdN9Dv0WHSBl"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:33260 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750917Ab3AaGpe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jan 2013 01:45:34 -0500
Content-Disposition: inline
In-Reply-To: <1359550947-5731-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: sbkim73@samsung.com, linux-samsung-soc@vger.kernel.org


--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 30, 2013 at 08:02:27AM -0500, Alim Akhtar wrote:
> For BUCK10 the control registers are wrongly set as buck9 control register
> This patch corrects the control registers for buck10

Applied, thanks.

--6WlEvdN9Dv0WHSBl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRChLzAAoJELSic+t+oim9iwgP/RbqLbprwzNJ+pU8B9DDg+YG
QTNAAiPM5KPnLksY3xKQAB7vL6XdgTo0oGenepznB5ED0TaLsajXwYcDBtgFxQ/u
EXwgT4HeVVsw/6SO0NfQu3+PrcNAfWCgdlOX8m9zW99py0uGv0cQiDGXPqtBjswE
fF5KGU5htGExk065oRRzW9MYVYY8t4hrxbdCPi2nc2eSBw0uhx9X0DYBdGDv1AWx
ovjonqR1lrLxmmyP1EhL/09dfKaIsYnSclxqZOhuopqtTRAvEStZTBQjCA46IZY2
lDx8dSYESuBVKPDqCPAUhdmBNMM5k4C1JyDCqv8YfHmTI+jxkwOJi/SM4dIApxHn
TMz06agPFDgUiyRvDFdi/X1IIa7sB75XPqjO/BH4Xf4k4+6g9y8Qefp6fihXYYQo
zU9nmw249TwnNFUSQYsT45a04R2Dv4WdbRBS1pZC9ls54ESOwGWIQpXRByXNv8vY
+Q0JW7MmkGgy7ly853AjoccZWIi1MrzFtTi/CRj3B4t+pxnxxs942zKuQO1rhEkM
92RlwyLMUyVq4ZtWouCC2HBG+OlIYIdKJnyze+75nkKg6BIOvnP79Xs8b+F+WrAm
fnW2/VT+zZQZy67Nh241F1rLqRf+x0ei9Fwj8k5De6CFXtEtnrLdFsTNO5ZxPzx7
8z+KBuZyU2yNNorGxmux
=NXkG
-----END PGP SIGNATURE-----

--6WlEvdN9Dv0WHSBl--
