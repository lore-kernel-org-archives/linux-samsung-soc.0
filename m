From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/9] ARM: SAMSUNG: Remove platform dependency from
 samsung.S
Date: Tue, 31 Dec 2013 15:38:26 +0000
Message-ID: <20131231153826.GD31886@sirena.org.uk>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
 <1388397640-720-2-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dds9jO4idXToq0wP"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:51180 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752842Ab3LaPit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Dec 2013 10:38:49 -0500
Content-Disposition: inline
In-Reply-To: <1388397640-720-2-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, Sachin Kamat <sachin.kamat@linaro.org>


--dds9jO4idXToq0wP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 30, 2013 at 03:30:32PM +0530, Tushar Behera wrote:
> From: Sachin Kamat <sachin.kamat@linaro.org>
>=20
> regs-serial.h only includes linux/serial_s3c.h. Include this
> header directly in samsung.S to remove unnecessary platform
> dependency.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---

If you're forwarding on a patch from someone else you need to add your
Signed-off-by to it - that's important for the whole goal of tracking
licensing.

--dds9jO4idXToq0wP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSwuTvAAoJELSic+t+oim9qYUP/1RNzBqScZlUrQuJJEYhkpbH
074xAO6HlDIzJK8zgkbL9qLljZQHGsaf6yfkJ8WJDK7UV9UEebDWfV/kvWyIvHvb
dKYlE5Z6IgOk8raf68DzpjN4sxwhToNyCRl1JuQs0aJ9/yQJHraJ3FA6X8KSPUoM
YSJPbuMr0PkEF9QB7wZBDQF6OnQS/5HXmVNnFpvAvAm8JqtyftRCi7u1ujqxzhud
6IYDjdM3ace3nCtzbOyhfHgJftl5hcCBYL4raUKcSn11Fagz83hKA6JNau/p0SfC
YoWe8z34DVquQTbJxKq5atsfWgR6xK8lllNGwFmnxSgdkFA73NZ2D5Rv/bj85Nm+
wQe6nm2vrLp3rN7QUYfRk3LxXqjTHWmYvO6VlizaZZAllWMilevQVwVxrubulA+K
afQL01p4F2yu/kLd688fNPoOc290tqiM5KarjB6AkFmROr143skP5TcpdPC/1q0m
9zUKr63WQxXI+6gFLJ5RuKsQ2Bkrjdz4kiH0I6x0K2mxdIdSS48zrqWU8WYmvNmx
5f5u3iZf86eHMixO9ZUFQ1r9ymKueH25il7aw6R7LXhanF1UaMzhGYRkUIDjq0ry
QPzW0tnmHOxDpLXmeP5CqimhIsWkyVqozODDLb3jsWjv8UC12IBHozfNVvgVJsE7
WpV8vXNXohUOxgzWiN8q
=q5hL
-----END PGP SIGNATURE-----

--dds9jO4idXToq0wP--
