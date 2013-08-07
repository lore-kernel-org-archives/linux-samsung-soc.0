From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V3 6/7] ASoC: Samsung: wm8994: Register the osc clock.
Date: Wed, 7 Aug 2013 16:28:59 +0100
Message-ID: <20130807152859.GD6427@sirena.org.uk>
References: <1375866616-5541-1-git-send-email-padma.v@samsung.com>
 <1375866616-5541-7-git-send-email-padma.v@samsung.com>
 <1445367.zmBep3Ocuo@amdc1227>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q4+B1pX2h4duw/kc"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:45135 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754072Ab3HGP3U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 11:29:20 -0400
Content-Disposition: inline
In-Reply-To: <1445367.zmBep3Ocuo@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org


--Q4+B1pX2h4duw/kc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2013 at 05:18:10PM +0200, Tomasz Figa wrote:

> I don't think this patch is needed at all. You can use generic fixed rate=
=20
> clock bindings[1] to define a fixed rate clock using device tree.

OK, good - that's what I'd have expected but I wasn't sure if that
hadn't been defined for some reason.

--Q4+B1pX2h4duw/kc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSAme4AAoJELSic+t+oim9kcMP/1xrjUPTZH/3sBOkvtdlYlUR
pMQY0J+cThx2snx7YxV0iUN4cdq++YYHsfRb8jDJJcrP95S5xQqU6r+kKJ22bOkV
kEBd9Jh2kyn7/KgKPQ54/gtQVdiocIvraV9+78Rk1dkIPDbphZv2pJiT1wXK9IN4
pU7LdOfcjuD0kbY7z4sR58uim3/VzB9ZOASYdk6TBhGc+UidE6s3kv/TuwmB+5En
pa35N/Og8kgKFWvwiIbbi41fLwBHmJkXJmtlrfk3b/XdinEILIm7xnXCwwZ/E0T1
/7BI3HrPuMrIjBRxe6fQGUsU6Nb3HYRXmbmIef/0bq2P8Zr8BFe1c782bMqSV+V6
GRGOCJJaaOxrXUOvgdbFltL3fFN2rUL/w2Whk1yP8AMjVUOUuOx/2CckOld6SaaD
L0UBwKBhMzj9n684Lx0gemFF6IN0vBqX1aPJmxWzlsDYxstwTq/NO9u0uZAS7iYE
hl1n6zPdWYrt3bndx063iYKIL0NbMDt+JNZwE6Ggn8VWChMcCl36V6w66OAPR5Pg
U3Os1krUwrdUCYMNzx1Voe/GOwVOvZwgFo1C5HKk+2K5cpzoVWNel0HtwvcaxlFX
75OBA0C+p58cv+9wpzU/esegq2eeuZGWzAvMtZPJDmGYcjruaLN0VuytlXhuKY9d
cze1VeMYVYVIq8zHLBC7
=5dKq
-----END PGP SIGNATURE-----

--Q4+B1pX2h4duw/kc--
