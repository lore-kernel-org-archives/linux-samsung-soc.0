From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 00/17] ARM: S5P64X0, S5PC100: no more support in mainline
Date: Mon, 30 Jun 2014 16:22:25 +0200
Message-ID: <20140630142224.GA30417@ulmo>
References: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
 <6153646.CZ57BgYKf3@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:36793 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752007AbaF3OW2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 10:22:28 -0400
Received: by mail-wi0-f179.google.com with SMTP id cc10so6118336wib.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2014 07:22:27 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <6153646.CZ57BgYKf3@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2014 at 03:34:27PM +0200, Arnd Bergmann wrote:
> On Tuesday 01 July 2014 06:32:10 Kukjin Kim wrote:
> > This series removes S5P64X0 and S5PC100 related codes in mainline,
> > because no more user now. And if its supporting is required later,
> > it will be done with using device tree.
> >=20
>=20
> Acked-by: Arnd Bergmann <arnd@arndb.de>

It seems like I'm not completely up-to-date. What happened to our prime
directive never to remove support for boards? Why is this special? What
about people that still use this hardware? The commit message says that
there are no longer any users. How was this determined?

Thierry

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTsXKgAAoJEN0jrNd/PrOhZTgQALm6kMsbUMEvoihoMKT0ffbS
wsqYhbSXTh98pnW4/ggCEMbgGXwzb7HOlp1O/uRpMSAGK58gp/1hiGKvcQn0zxSY
EhCq8+9y9saf612E0D2C/LXdBMun9GZolhodflnAEnLOzhAtShVtpHTWNSeuYYcf
tRhxMfyZe7HDZ1y8IfSLOd6X+7+pPBPm41lL2m9JYYKqRGZjW/bjl81FQAkjpB0I
AHdhrBMx98dDUcc6Q1sF8ZYqxmRLtMG/qnRoGOpc+zmAmklVz3fHkIpDBjFooC20
gVCM9EyA4mRmyUDigude4vsWxkmHMQ3YklHlunxTix9GsP/ZMOdirA0EV4TSez6V
6GyGJnMMOK/k33C8N0O13TqtPBNYdcOxQn/dV+63ZC7vY1fM5zrnbfZma7ZTD5af
9uBjigaUQl4rsSQJxhqO09O8a24NcY0NVdT2vjnOtT1/gMGl3wtTKE/csnPRjzZi
pdM+kiwSo4JWF/ZZ94Bgs1/88qkPmxkPIaReD7yarTmsIx1ZqTZGUC8zZ33Mx0HL
Q9dUJX3lzWQNHBQYblWukkteO80lKq48y9/c5TKR77thdCzxZDUCWwa8WRaioRBV
/yIngxaj9Fv1IhAFboDH07g42/2RkNPZGUSdw3Y9IXyFyOdIng9R4++WSjTcYR5u
Q74pYaQa2NMTAyr/oiKa
=lSXA
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
