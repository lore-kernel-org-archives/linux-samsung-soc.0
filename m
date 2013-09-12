From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] ARM: dts: Disable I2C controllers by default on
 Exynos5250
Date: Thu, 12 Sep 2013 14:52:33 +0100
Message-ID: <20130912135233.GS29403@sirena.org.uk>
References: <1378982427-5802-1-git-send-email-broonie@kernel.org>
 <1378982427-5802-3-git-send-email-broonie@kernel.org>
 <2175767.kktjrZWOAr@amdc1227>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wlp6b3zZ5qAEpghO"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:58079 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750899Ab3ILNxA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 09:53:00 -0400
Content-Disposition: inline
In-Reply-To: <2175767.kktjrZWOAr@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@vger.kernel.org


--wlp6b3zZ5qAEpghO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 12, 2013 at 02:58:59PM +0200, Tomasz Figa wrote:
> On Thursday 12 of September 2013 11:40:27 Mark Brown wrote:

Please delete unneeded context from your mails, it makes it much easier
to find the new content.

> > +	i2c@12CA0000 {
> > +		status = "okay";

> Hmm, no other properties needed here?

Apparently not, it looks like the binding for the aribtrator doesn't sit
as a child of the bus it's arbitrating - this is the controller
referenced from the arbitrator node.

--wlp6b3zZ5qAEpghO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMcceAAoJELSic+t+oim9CQwP/A88jugOE9SpfRhwAhNYOP82
s1PxSKBleihDGwU+ReuJUzBz59BpgTzAKZGDy36q25O+uWUL0nQiN5vhgfFjX8Is
Y/0NQMBYG5AEhPNqNuI5H1IhuaRGYwJq8SMH+xMmLZXMYXjG5OSy8QDJCUuwclJV
3vlvGE9ZcF78cjndYFEsnaRcZysxBRvMmEnkipX2IhB6cxTpzz69ErWGvgLqlasj
E9nT5BTjfDkjMgNPbb6SfI9yqM6vc5ojsTgMghW7qhOavSYcoMDl/iYnnj+V0KxM
/yP6dcVGBHlUnrKFcFnpgw7TRzBjOSYeQFdg1SlZ/Ap1Ey3ZHLtXgt40lyJvQ8pt
5b9hoe/L/2QGzDIKYVx1WDruD8iJd1NaGbtdwAg5icvR6SIRAk8dYWE9/Fgq/pQc
a3f7UCEvkjaNYnVHAnpXMlzPATHHYmlrM4JiKcAtPQfc6Hj/rthIu9hc3rjYGvuH
GSfyDwWyvLKBpNYCKSAU0R9K6Mf+nz6+CJ3b/RLBuxJztQp/T9xqai+8NOSz1RaG
4jYFAO0+TtdqY3y8rswEocIlstIqnYAbZdR/4fD+D4pibzl5S2JQE2WVv/AAEdAb
NDENGJLjOOEq46pIpl/lMa8TCnwvOHF8KdDMr5zEcni3kSxzFdeM1ok8uBhDPt/w
3fH5iFEakj7AnYuEG+wv
=WMvk
-----END PGP SIGNATURE-----

--wlp6b3zZ5qAEpghO--
