From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 1/2] usb: host: Kconfig: Select PHY drivers for Exynos
 EHCI/OHCI
Date: Fri, 27 Jun 2014 10:46:08 -0500
Message-ID: <20140627154608.GI8069@saruman.home>
References: <1403761178-5371-1-git-send-email-sachin.kamat@samsung.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2nTeH+t2PBomgucg"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:54484 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753451AbaF0PqT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 11:46:19 -0400
Content-Disposition: inline
In-Reply-To: <1403761178-5371-1-git-send-email-sachin.kamat@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, gregkh@linuxfoundation.org, dianders@chromium.org, gautam.vivek@samsung.com, spk.linux@gmail.com, Kishon Vijay Abraham I <kishon@ti.com>

--2nTeH+t2PBomgucg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2014 at 11:09:37AM +0530, Sachin Kamat wrote:
> EHCI and OHCI drivers on Exynos platforms do not work without their
> corresponding SoC specific phy drivers. Hence it makes no sense to
> keep these phy drivers as user selectable. Instead select them from
> the respective USB configs to make things easier for the end user.
> While at it enable 5250 phy for Exynos 5420 SoC too.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>

no more selects, please. We've already had way too many issues because
of misused selects.

--=20
balbi

--2nTeH+t2PBomgucg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTrZHAAAoJEIaOsuA1yqREr9oQAK/CbxSzzjrULvTG7SGTnH00
1QYK8C5qDYeTTG6eDCCF8jRsCLcYVnola8iiCP8UQdASPwj3BQjWhbB5zfc+os5Y
/f/jj39oD4657DOihgmmxBwHo+xOoz9oYe60uTh53Nxap0Z/ugiyQbpRFkZTrvHt
M3sbki+myk9KXfDdCAC+udk+JRYcb4cywh53+eQO/nC4ehiRgC/myND9jdqfx4uM
PhlMC+v1vQFxQCLtnsf4zsrjENCDVLDCgy5WMLyEUuL++ZFCtg2sulyzOFFTrHVj
YS2BwJDxsrdcgMwmkO3z6JhdrkKHRRo9GK72VzSRG6NGZoz8CDFXVurSKyd2cXgx
4DNEkmAWWMw8osb3rDJTMTHGeDeL0Eiq8BZ43th0JcgnZGR9QXXT97drl8fWCJvL
hBgle3emgZehnU+zYimWw2Ht9J9Z3LjZol32Izxl8qh3YjHuvVRNN0VcoAWU+o0/
sjksKBKfiN9CD28uAwTNeuhcMLYDa+Fd5l33sDhtrr3Oi0G6/RRiBcz/NO42iEZU
NmCaSqLvzWpSycFJyDBjTrM1TkrGG4XRt6x23TJeDzlV6aGQ1y7jRho+7R1LQ9q1
jIr6nwap2przugmGNJuHuvJ9zCNRkJbZAZmL87Y+ELgA/qGh43WgEpYTHZ2+U2YV
nmx7+x5cJeVoIav2cY8v
=m+1m
-----END PGP SIGNATURE-----

--2nTeH+t2PBomgucg--
