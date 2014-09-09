From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung-i2s: Check secondary DAI exists before
 referencing
Date: Tue, 9 Sep 2014 18:09:03 +0100
Message-ID: <20140909170903.GG2601@sirena.org.uk>
References: <1410277909-27922-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7WOaRjS1a0Wu0ZkU"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59494 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754492AbaIIRJ1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Sep 2014 13:09:27 -0400
Content-Disposition: inline
In-Reply-To: <1410277909-27922-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: sbkim73@samsung.com, lgirdwood@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, patches@opensource.wolfsonmicro.com


--7WOaRjS1a0Wu0ZkU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 09, 2014 at 04:51:49PM +0100, Charles Keepax wrote:
> In a couple of places the driver is missing a check to ensure there is a
> secondary DAI before it de-references the pointer to it, causing a null
> pointer de-reference. This patch adds a check to avoid this.

Applied, thanks.

--7WOaRjS1a0Wu0ZkU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUDzQuAAoJECTWi3JdVIfQ+xoH+wRhzNpYYOd90UR5cm3lGWhz
O4KV4cKvBDX51SDwkTv0+31nDqtre0TpFKqGriAbGn3aNzBOhBJN4BAhxPDUJn2H
y7ZRRmwIep2EY7wS5KmKgvxJhl98IGRJZgEeGo9yVk8x1eJT5SrfCCzK5CX86N1E
wkJ3eQlkmsfvLqIvEInQokUaaTuanXsMcBQ9HjN2d5tUouXnsAjDcLZWq4F8giwE
oltwbTLgG/aEM7wqqyAZTY5jQaSjwvnpkh0yFKqUNi2m5FKBwPLKE9G7yYz+rXk5
3ZL1hbvknLC4nU1Ffy0+tRZx2ILzQE7YvimYoBTYK8i5gpX6QY2G8tyTEgdYhBQ=
=TxYW
-----END PGP SIGNATURE-----

--7WOaRjS1a0Wu0ZkU--
