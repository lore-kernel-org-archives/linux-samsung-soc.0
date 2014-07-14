From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/4] ASoC: samsung: s3c24xx dmaengine follow-up
Date: Mon, 14 Jul 2014 19:51:58 +0100
Message-ID: <20140714185158.GC6800@sirena.org.uk>
References: <1405086308-1461192-1-git-send-email-arnd@arndb.de>
 <1405086308-1461192-6-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Oh6wehMCKJhhoxlo"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37394 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752433AbaGNSwo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 14:52:44 -0400
Content-Disposition: inline
In-Reply-To: <1405086308-1461192-6-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, lgirdwood@gmail.com, t.figa@samsung.com, Heiko Stuebner <heiko@sntech.de>, Sangbeom Kim <sbkim73@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org


--Oh6wehMCKJhhoxlo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 11, 2014 at 03:45:07PM +0200, Arnd Bergmann wrote:
> Commit ae602456e83c92 ("ASoC: samsung: drop support for legacy
> S3C24XX DMA API") removed the old code for the samsung specific
> DMA interfaces, now that everybody can use dmaengine.

Applied, thanks.

--Oh6wehMCKJhhoxlo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTxCbLAAoJELSic+t+oim9ZRIP/2Ks2gRzcg1IfHpiVZ9kK72N
/ssds4lgOJU85dmARbiLYx7V0s3N2IfGKio8NMqwkWOEoorG2uZX8NvsshqKrckO
GNnPlGh2R50+x+pLtw/xNz2RfFtR6uSUiljPMLCeXdcKYsevNQZy+K821izza+K6
YuDR7/X79ZQxSW9vfg+gi4rRdF1+n6tjGa44xIUXim5dFPT0V+8y019pqPaf4xw5
MEYEIjehn916cOPDGl871WrM0ZmjqM6mOpFuowAGcFkA7zspB82PNBQMovbq4bIO
/q3WlrkN2MVkVUu0y95riZiExsCkPYLKv1YmDLmsiT+5stuGgs27zVWcCxTpigB+
0RMCBX5JSt+PpiP4KjVNYlcC9mmeGMqjxhwvjJ/GTay4YGd6qOVY8iUaSYw5kg6V
v+gYiSInEC3+2MxAYBUY98tXc2ZjjzYZ4RdWFvgockWvyulXrW4iFxxjqPvWd5we
69XQjfO8hj7Ln+zMTX+oMoVJVrdlDoxmwentL6cWCdLrgZApMV/Rghl+N4LM6hF/
BDLOo8Ot2HhsTuoBDJ+hM6vCZ1uffNXToLXhe1D0uJ+TTFa9Doo84vBSgPmVLJ0K
lYCBP2klpyJEN6upFTB/vD5llb0BNlGXyvZ4j3PdgCvqOVo6ALJMssZdrA9mJxpd
B3CNXpnw79ATdUF+3Zbn
=ujXQ
-----END PGP SIGNATURE-----

--Oh6wehMCKJhhoxlo--
