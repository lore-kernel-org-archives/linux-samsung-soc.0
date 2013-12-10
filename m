From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: Leave Exynos5250 SPI controller disabled
 by default
Date: Tue, 10 Dec 2013 11:13:09 +0000
Message-ID: <20131210111309.GD29268@sirena.org.uk>
References: <1385381710-5212-1-git-send-email-broonie@kernel.org>
 <CAD=FV=XEKUFWEM-30Bx0pVBOT8X0zXsdHyzq=pDY8TOcdGHgRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UrvBM2MrVm6e3rrU"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:55440 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753198Ab3LJLNf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Dec 2013 06:13:35 -0500
Content-Disposition: inline
In-Reply-To: <CAD=FV=XEKUFWEM-30Bx0pVBOT8X0zXsdHyzq=pDY8TOcdGHgRg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>


--UrvBM2MrVm6e3rrU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 09, 2013 at 04:57:01PM -0800, Doug Anderson wrote:

> I'm a little surprised that I don't see removal of spi_0 on SMDK5250.
> When I apply your patch to ToT Linux I still see this in
> "exynos5250-smdk5250.dts":

>         spi_0: spi@12d20000 {
>                 status = "disabled";
>         };

I suspect that one went AWOL during rebasing - these have been kicking
around since September.  Resent with that added.

--UrvBM2MrVm6e3rrU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSpvdCAAoJELSic+t+oim9/rgP/jzkFKnlSzD3Qwybt5/JtNZK
QpK/qq0O/SFfyB84CYYMQAJ8306mz1gcpOarHx7bjyfko84B4radh6artcN6GS/h
F89PUjHPUCQ1gTsfJokJuwd834eQnMZBgZVUrL7cOy1PWglXEOGwOXohTgMrC5MK
b4Dol1GYALQnCH7LQ194pNZGDDJs0CMW6NlIFRk8q/NIm6A8r2wQYA5+1wWGWLXP
WwiYZEIdSL5WzCr+/hB8XvG8M2h/vBO34a69sXOvGSdSzaj6/xDtgauw90MtjQmM
/OZMF1i99LTzQNcsXn1xhXOVkwgWVHw1oBDFIV2/nAref1jyeIj44oZIcEkXJVTn
DUtHnJ0I2n/h7tGQErDBDVpR668z3Hygv0gw9pGLIROImEQ6nJvRRMTHQe88Ezo0
kkXLtpXRDqFyfnAkIJOItXmBobPMvfCgacmyxP2Av6xIkUL7YFOJv4QUro9ypPwI
R+juyulN3VGrlhRVi2ylNMF8ATHsAT8ofi+cHFP8fdFJtzLshlJAKPQuK8UuXYR5
9ZfchIoVYbLCQfU9yzIb6uuEY4wh0mJXrtQ/kLk8ulsbpcdkke7HZrLZ0TjRcaeR
cLSPI9cRScHBYSTWeR0j89uQqMzu8YV8gQPgUYrfxils6qv7dWdBL0/ZC9R8uveN
QLJofOW2VIPX+Xdb1YrL
=P+Go
-----END PGP SIGNATURE-----

--UrvBM2MrVm6e3rrU--
