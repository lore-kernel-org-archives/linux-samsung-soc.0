From: Mark Brown <broonie@kernel.org>
Subject: Re: Ask for help on SPI slave side driver support
Date: Mon, 14 Oct 2013 17:24:37 +0100
Message-ID: <20131014162437.GE2443@sirena.org.uk>
References: <23ff6b10.bf1d.1416a88321f.Coremail.youshenghui0322@163.com>
 <4025277.bhF6fFGQqq@flatron>
 <20130930093317.GX19304@sirena.org.uk>
 <4cd52b0c.af8e.14184497bb9.Coremail.youshenghui0322@163.com>
 <20131007113323.GL21581@sirena.org.uk>
 <4e8f3999.9132.141b335ef13.Coremail.youshenghui0322@163.com>
 <20131014112519.GQ2443@sirena.org.uk>
 <525C04DA.6050409@163.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sD87aq2/Ee9ozic7"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:39636 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757150Ab3JNQZF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Oct 2013 12:25:05 -0400
Content-Disposition: inline
In-Reply-To: <525C04DA.6050409@163.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ysh <youshenghui0322@163.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, jassi.brar@samsung.com


--sD87aq2/Ee9ozic7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 14, 2013 at 10:51:06PM +0800, ysh wrote:

> Got it, then what about the setting of clk, mosi, miso pin in slave mode?
> Do you mean I need to simulate spi slave side using four gpios?

Hrm, now I think about it clock is going to be a problem...  you're
probably stuck with bitbanging unless there's some controller support
which won't be awesome.

--sD87aq2/Ee9ozic7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXBrCAAoJELSic+t+oim9NM8P/2vkVlt5gPIB0LV2eTCB7tDY
omvIs1OPrwwmqY/05ZhVMRCf23R1834+tBPH0BZwJK/0G8EehK83D1/CBkCh+N/w
/fGA8gYB+BeQdbb0wnFIPXAHzWNe2OicmuEpwK9Yb/aWAtfieGRmGFo8tsWgwYgJ
3ezIH8Tf46WbFYX4Af75gpSs8kuSuOH3haicNTyOpkGrSSdgLd7v0n6Q+oJxsF3C
FqjwFwC/zkVRjtkgDmoqQDlIQXgCjjvXOGaRiSvXSPZgYH3C7xAd50yfdqb/Bkdh
n7D1eXJ03KhGmFAcWX11Q4eb3t3e+vqwg/azrO+RCe6JYSt3r0ctJVTYErB7ei25
W8tFUHm0Av0SdAnuTPMHKQcxDaBAhkrJ6nhah30uCtceXHdwKn35a+Y6d5EwEENP
F7lDoM9svUtIMumr/GHF5s/zM3jXYttOiKOJujhRxLYtQaEtxW1I5X+HWKRtrSkZ
RFOJQR6fqUjv3rypul33N7bOLwBhBHWn8MkLIIewyNY14kdsQ2AsEaB/iirKaYPJ
CEqKsTMVjS8/QS6a6HA6vN3pkSlf6NWWyliuAnyH71D0h4Enqjh77RoBIp2kijut
d144SdJUck/Yur3fhz7aychq5eXCr/yo+CDgnE0dgI9UyL/3vm+WAlgpYbzA3tTa
iHnrn4Q3exoLp9gzvJiK
=AKrO
-----END PGP SIGNATURE-----

--sD87aq2/Ee9ozic7--
