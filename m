From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 00/14] ARM: samsung-time: Prepare for multiplatform
 support
Date: Tue, 16 Apr 2013 17:22:57 +0100
Message-ID: <20130416162256.GM26958@opensource.wolfsonmicro.com>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x38akuY2VS0PywU3"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51854 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757438Ab3DPQW7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Apr 2013 12:22:59 -0400
Content-Disposition: inline
In-Reply-To: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, tomasz.figa@gmail.com, heiko@sntech.de, robherring2@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de


--x38akuY2VS0PywU3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 12, 2013 at 09:17:16PM +0200, Tomasz Figa wrote:
> This series is an attempt to make the samsung-time clocksource driver ready
> for multiplatform kernels. It moves the driver to drivers/clocksource, cleans
> it up from uses of static platform-specific definitions, simplifies timer
> interrupt handling and adds Device Tree support.

Tested-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

--x38akuY2VS0PywU3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRbXrCAAoJELSic+t+oim9wRYP/0MG/qu/RCTOiBt/L+UxzVIM
G8La8eLyEWpym4dTBt7biSuYGJqcS6AjYesY3MnMnTdnzXi7U2AtP3H/llNVQQSt
Ej20ckboiSmm+hzewR2vpKecnYMDClB6k1belEKv6TrVYt3Bkca2o+yj3Lw9jH9I
nrbNetekcEz5rnQdpJOSgLfHAlMDIiZ8Xlwxrm5YN7fU+Q851lyEtweML0E5/5Qn
Oe/IzPK4uxVJqmki318Pnae5LC0rb8qM7AxQjTh06nKetpE7phw5DtcZMSLE+GGR
UrvGXDQUP72fW81UZzdCqrMUwOmACvyRXbWlslvP5EJHJ50K1yQdX38jrbWqU1hq
sRtpx2yDZ5rT6NW6LShVWebiUrdvghMei6sfkKqiovFfcraaafwNni+/WP50a/KS
unWlJKlc/DsjXfFEbsGNIKM3ReX5tspcUc1gcgRqwlLuayWoWx07hSe8eISvz0FH
v/e5eGetNxlNWeNmO2DLXUIotOxXN9Aix7MTKGxRzTL7g8YREP9dPNuqn2vTydk/
rc5xgYSwV7Sen07psBNMpFnOjZslR2gilUvhwvz+yTHcYQD8musI+bwybDPvS2E3
eMHJ8VghBMkg1pKe/w5p2CMHtPS6ytJ/FlWVX6QIuYlOOd84O0VGOfurIz4zU3Cc
sE4nUKgeMwbakBWPGDi3
=RIg9
-----END PGP SIGNATURE-----

--x38akuY2VS0PywU3--
