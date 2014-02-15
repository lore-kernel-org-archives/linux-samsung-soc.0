From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: s3c2410: do not put a default class for the adapter
Date: Sat, 15 Feb 2014 16:10:39 +0100
Message-ID: <20140215151039.GE2579@katana>
References: <1391761795-28384-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jKBxcB1XkHIR0Eqt"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:53426 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753279AbaBOPKo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Feb 2014 10:10:44 -0500
Content-Disposition: inline
In-Reply-To: <1391761795-28384-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, naveenkrishna.ch@gmail.com, ben-linux@fluff.org, cpgs@samsung.com, broonie@kernel.org, Vincent Palatin <vpalatin@chromium.org>


--jKBxcB1XkHIR0Eqt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2014 at 01:59:55PM +0530, Naveen Krishna Chatradhi wrote:
> From: Vincent Palatin <vpalatin@chromium.org>
>=20
> Avoid adding I2C_CLASS_HWMON and I2C_CLASS_SPD class flags to all
> Samsung I2C adapters when the I2C mappings are defined in a device tree.
> So the drivers doing an auto-detection by probing busses won't mess-up
> sensitive I2C devices or trigger long timeouts on non-functional busses.
>=20
> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> Reviewed-by: Olof Johansson <olofj@chromium.org>
> Tested-by: Vincent Palatin <vpalatin@chromium.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>

I'd prefer to drop it in favour of this series:

http://lkml.org/lkml/2014/2/10/836


--jKBxcB1XkHIR0Eqt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJS/4NuAAoJEBQN5MwUoCm2zkgQAI223Br8FLGO+UjZx6lpkIPJ
BtQMnfChcCqiRF58tgX6PD7k1tq/XesWAuud/DWpSEu3XYv6IXkw1GWm5+CcQKcx
BArwffntzdq0q8/2Ol1JSRg7BB98ImH0yCksxfMAzrC86CcNBNT3mfWQFMAQRUmG
KImEV41ymVRf4AGdoNoy69sTrXHR9ZwTwd4YIN4fRZxY6oZqYzD2u6C7ZuOGyIaX
7scT7GXMxC0okVyh4RtZqOpX1KyXtOrZQIrtqB9uIcd1h+uOo5WXCG95jUXp5AUJ
8FytC1QO/alJuNilXY6H4+uvnfLM147ExetfLkz44vAm4o4m5ztnVvE6Xdxdqoai
zeZ6NhET8OsYIvUDeRrg+uMThO5FonWmNTg/PnNuSoN0mZ27o5CQnYGoy5ZNWsqo
d+PECdrwXyV8NXQZdLq8UhCdAbKp7JEVbtGeYB/VHD+ARBVB98JWdEf/dmmFBcPH
njjkTfDHqWe6BfOa3Ur+1qv/NVL3XiQt1oTavyenBzJwNvDO0zbhOdU1o+6HgbJ8
LOaYVqjwQ4gmaTWSBwb9pHvviEFtzLjxGlVTiE4qZacsqzMBLn23OAK9RtTr2Uik
RUjdAwY2INzvQz62ynX7nQMhWcx4DJii71itftNNK1xtGlCdm719vvch+HFuU93e
Jc81DWLfXmpwWpiFB44Q
=MqSk
-----END PGP SIGNATURE-----

--jKBxcB1XkHIR0Eqt--
