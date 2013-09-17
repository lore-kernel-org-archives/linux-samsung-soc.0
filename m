From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add DTS files to patterns for Samsung
 platform
Date: Tue, 17 Sep 2013 12:05:45 +0100
Message-ID: <20130917110545.GS21013@sirena.org.uk>
References: <1378983449-6205-1-git-send-email-broonie@kernel.org>
 <1466354.6bhNY3vCLP@amdc1227>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O3bhLwMadv7h6/J9"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:53497 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752207Ab3IQLFu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Sep 2013 07:05:50 -0400
Content-Disposition: inline
In-Reply-To: <1466354.6bhNY3vCLP@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org


--O3bhLwMadv7h6/J9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 17, 2013 at 12:31:20PM +0200, Tomasz Figa wrote:

> > +F:	arch/arm/boot/s3c*
> > +F:	arch/arm/boot/exynos*

> I believe it should be arch/arm/boot/dts/.

Bah, so it should.  I wonder why I did actually start seeing the
appropriate things turning up after I did this patch then?

--O3bhLwMadv7h6/J9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSODeGAAoJELSic+t+oim9XQIP/0PcuXJ3V40p1c6zB74oons0
NuV4UDUupsI8+ab0k2/yeLWz7YFX2XMT1Pa3wr83hFjzGVX5yewbyi8TPt6416Yj
e8iUOLShXT37k0G/IE+9jD0LHdXHjM1mfwJyO/1y/2hag8Zz8O6CwwKdA8cOhfHu
7eSn1ra2bTZigSt22rA1cEz4Z93u2ShP7W7lNRLJZArlPefoAdyp0tq3Fg/yB+zG
+aYYSSkYZ4aflWOs0pWXlbuMmua8g4m8p7ueDmACdQBcIsEO6RcqPOxeDs/F49mi
v3UYJZfy/pVcZrUo3Y6u/20/5mDM+C0n5ATl/0ZxMr0iT6Ewj9dcx2Xy6T1hMdea
Tjhnharl3YgWFZKdkqS2b3+OG/a/15hvxPJzwm0yUfg61rsunaSgGgZ9AR/vMkT9
+LglPWzqNdzG3CnnMlpmq8KbWaL3yppuII80C2HEgU6J80GDfUje2E/LDxwjNAID
eHgq1hOMkWS5BJjSRhB8+ZAXJ9DjynklnGdpOdU30JhGRtuDw69yFFuD8HHCUc8K
qJCen7Pt9AINRZ5nj8LAdBKpu83wP2QZ5lLlbq8YF6oYoL1Esabsn98wT2JAPmcQ
cwwvhILrXdtO+auRid4GyPRwRk/ORkqRi0xDTWZlUuPE29PD38u0yrM/5XSCvpoT
tw2pgmcMe5jsgDKKWYGq
=Pxir
-----END PGP SIGNATURE-----

--O3bhLwMadv7h6/J9--
