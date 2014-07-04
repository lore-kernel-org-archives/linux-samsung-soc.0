From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Correct I2S DAI suspend/resume ops
Date: Fri, 4 Jul 2014 20:29:47 +0100
Message-ID: <20140704192947.GG14896@sirena.org.uk>
References: <1404482745-29177-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Wtrm9ATX0sn6fFKv"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:47313 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752602AbaGDTaE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 15:30:04 -0400
Content-Disposition: inline
In-Reply-To: <1404482745-29177-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--Wtrm9ATX0sn6fFKv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 04, 2014 at 04:05:45PM +0200, Sylwester Nawrocki wrote:
> We should save/restore relevant I2S registers regardless of
> the dai->active flag, otherwise some settings are being lost
> after system suspend/resume cycle. E.g. I2S slave mode set only
> during dai initialization is not preserved and the device ends
> up in master mode after system resume.

Applied, thanks.

--Wtrm9ATX0sn6fFKv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTtwCnAAoJELSic+t+oim9vp4P/1dlgpq8HlWt95YEPGdlanwK
xa2uqTcAXEafBmoJqEs0DI18CfLKKE/JTZdQa9mKqWif67Vxc2+KvBnn9k0JXIYX
FR2h3vteL9vyI009wB2C0EBRp7a9qlQkjjupDy1zX1k8ASi20N4qN6XHrCOqEY7j
0xHj8Qujedxv5SXhri3vT/0R4l4s1BcF/6YF39auTB36DT3LwLegocE/j3N4+k2h
H2ZdTFoa3V8M+e+5I/aRwKNyXzmb46yQnn3vKSz7n7Q5jCKmv6LxARFGf51k9yrF
lzHzL57gDqskMF5DFhVYaExSs/5ddNIqtFIRa94eqyqFNjeqDeFS4YihnsFf5Ycv
nn3rKLiEz4H6zNbmgV3HoYvhE8JqCdCjRPIhU/L7DtjZ9n1OkN7jL4JiVXtUsuak
qSbmMopFeJZUiBsl8b3yQKzDd989+BszTCKUgVj2dkxT5DdghijRzPA4VQTec/yd
9zj1pU1s0fpo/NF3zPk6BNooZ8hmNAuBtqsHHk1xDwVluyTAzyNKfrkc/bf3szZu
8mMbklnyDr54yQyzz1SVXcJm3mMa1ah/AzJNtxcR7GA1mmXk4CKB3IYQ+mK2QeeO
1dSTMVpQteN2HZppoMXoa9NQKSLo4pbo4ojbTKqiKfcW8sFlY1LCulqYhJzKAvMZ
eRUPhaGAqwXa1QXsRnJS
=Exlp
-----END PGP SIGNATURE-----

--Wtrm9ATX0sn6fFKv--
