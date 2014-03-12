From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c-s3c2410: Leave the bus disabled unless it is in use
Date: Wed, 12 Mar 2014 20:29:32 +0100
Message-ID: <20140312192932.GF28891@katana>
References: <1354165536-18529-2-git-send-email-ch.naveen@samsung.com>
 <1391763249-28964-1-git-send-email-ch.naveen@samsung.com>
 <20140312192714.GE28891@katana>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s5/bjXLgkIwAv6Hi"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:57485 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752619AbaCLT3e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Mar 2014 15:29:34 -0400
Content-Disposition: inline
In-Reply-To: <20140312192714.GE28891@katana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, naveenkrishna.ch@gmail.com, ben-linux@fluff.org, cpgs@samsung.com, sjg@chromium.org, grundler@chromium.org


--s5/bjXLgkIwAv6Hi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2014 at 08:27:14PM +0100, Wolfram Sang wrote:
> On Fri, Feb 07, 2014 at 02:24:09PM +0530, Naveen Krishna Chatradhi wrote:
> > From: Simon Glass <sjg@chromium.org>
> >=20
> > There is a rather odd feature of the exynos i2c controller that if it
> > is left enabled, it can lock itself up with the clk line held low.
> > This makes the bus unusable.
> >=20
> > Unfortunately, the s3c24xx_i2c_set_master() function does not notice
> > this, and reports a timeout. From then on the bus cannot be used until
> > the AP is rebooted.
> >=20
> > The problem happens when any sort of interrupt occurs (e.g. due to a
> > bus transition) when we are not in the middle of a transaction. We
> > have seen many instances of this when U-Boot leaves the bus apparently
> > happy, but Linux cannot access it.
> >=20
> > The current code is therefore pretty fragile.
> >=20
> > This fixes things by leaving the bus disabled unless we are actually
> > in a transaction. We enable the bus at the start of the transaction and
> > disable it at the end. That way we won't get interrupts and will not
> > lock up the bus.
> >=20
> > It might be possible to clear pending interrupts on start-up, but this
> > seems to be a more robust solution. We can't service interrupts when
> > we are not in a transaction, and anyway would rather not lock up the
> > bus while we try.
> >=20
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > Cc: Grant Grundler <grundler@chromium.org>
> > Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> > Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>=20
> Applied to for-next, thanks!

Do you consider this relevant for stable?


--s5/bjXLgkIwAv6Hi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJTILWbAAoJEBQN5MwUoCm29twQAKARD46nhzr6228nAQ6s6Ubo
JBKeKtEOmiC8wLIq/khfW4EIHplgdujqxmETWUU/JNuEWQeL1cV9+1PO0Guorsbx
0UQYFrEVOWuEB0vaONRon551FWlI1BPlzldkZ74u2ZoeP9268v4Yyo386c/qnqNX
6PjoiSFHo3mLNv+56y896gZrkRDWprzyuDM+Car8K4Qsxa7HBU/Ww0dN+I+wCtXt
plkfAmh/tbvEaaB0S6zUHa7sisEe7XPcoeK/0l6jJrfVW8xJTJbadx3bYExcPl6M
punoCUKfCk1sqyvKn45Dvy5WOyEas99jJQTzW7yvwza5AW9Dzbx8+a5Teg9rlCqh
MISHsqaa7g3dRTvi/dApfeQIBABA7HERpqU9lKvLtM78FIvV7PCMN2VIjkkv/1Vl
IgemCwFgNuNw9wP1v9MsjYL/uJgbIsetfBIQsmC/4KaBIgrvebPgbbJIuJzrhE6/
c0KEU/sWBK59s9rgat9pTWMh/7sma5bbSGgzwO0DolnfcqVe0l40hOXpTacBbg/T
3o9G7j5u5tXGPP4tXkjJT8/Uc3uyo8tB9jHrmO6CHEcp62UU2H8u+VbYhy3qgjWs
fSqs0NytXX1r3p88smhcpkdHkJu5Pj6pLkOUF0AvwW7h5AL38OVPyrz1MLnfx5nb
o6F8D7Y7JwiZaukGV9iO
=0cBN
-----END PGP SIGNATURE-----

--s5/bjXLgkIwAv6Hi--
