From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ASoC: samsung: let device core setup the default pin
 configuration
Date: Wed, 6 Mar 2013 19:49:20 +0800
Message-ID: <20130306114918.GB19556@opensource.wolfsonmicro.com>
References: <1362570951-14403-1-git-send-email-thomas.abraham@linaro.org>
 <20130306113741.GA19556@opensource.wolfsonmicro.com>
 <201303061242.09978.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:35894 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757414Ab3CFLuF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 06:50:05 -0500
Content-Disposition: inline
In-Reply-To: <201303061242.09978.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, alsa-devel@alsa-project.org, lrg@ti.com, jassisinghbrar@gmail.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, patches@linaro.org


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2013 at 12:42:09PM +0100, Heiko St=FCbner wrote:

> What is going away is the deprecated non-pinctrl way to setup the pins on=
 dt=20
> platforms.

OK, can we have a changelog improvement please?  I didn't read the patch
properly because the changelog said it would break my primary
development system.

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRNyzVAAoJELSic+t+oim99AkQAJrKu1NEkAW0Wy5DjaHwF6By
K8qiXv7PRV+KSN66TUFS+Hp4HZk+/jW959DiufKIphrOFqfpaCHcZUyth5cTw/2N
TkKTcyJCg/G8fZX5leLhDqzQbs43YxhIzuSg9AiNbzTa5VTVM32gAiP7qkJJJdxs
1AbkL6CZsLbigv/vsIq1iCQxvi4jby2+ZMXv007dyqJfnA6gX150LNQX/+OvQe5t
5GSzTCyjefrA/IaOl/i78DSgF8wE834BsrGUfv7Kd7tz8c0xzTM3bf5lAJz1TQNx
l6SjTSDW+TGRDQ35BU2OWIy4WQEyuYWiwxGmXDPyfyQDRLTGNDJnfo7cFjMg9RkQ
g7cwE2/tC4KjQRQz68lXIelmWvSiopnITFC6gpDkZ98CdLkTChRVEIJzliYGko57
plx19JJ+YA5dGTQTesX3H/wt5x1vBiY/zcvZbJdobP/G/42jWKqe6CBATbhay21J
27ICpznQiHCdRwGEwSxgOxxsJnVkmouVjHb+//W/MSDUrs/CkjP3cOs9NNbx1szO
WNJMuVtztCTlQ3j6XhHOuUluyt7Pr/1clC9PNY6kKYBhq5MWdM8hbeKPpPi2FzmX
nADV+auvs8IiO0MMgzDG6IEcplAk9bjZZXJ3R+SufH1Xl+RmF8Z0NRUdIoJAB6JM
jAFY7wpeciD97F607MwU
=C+2N
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
