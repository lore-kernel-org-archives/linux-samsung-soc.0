From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH v2] pwm: samsung: add missing s3c->pwm_id
Date: Fri, 14 Dec 2012 08:34:25 +0100
Message-ID: <20121214073425.GC24094@avionic-0098.adnet.avionic-design.de>
References: <1355468338-12611-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9Ek0hoCL9XbhcSqy"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:63972 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751827Ab2LNHed (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Dec 2012 02:34:33 -0500
Content-Disposition: inline
In-Reply-To: <1355468338-12611-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com


--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2012 at 03:58:58PM +0900, Joonyoung Shim wrote:
> The s3c->pwm_id is used to calculate offset of related register.
>=20
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>

I've modified the subject a bit to make it clear the assignment of
s3c->pwm_id was missing, not the s3c->pwm_id field altogether.

Applied, thanks.

Thierry

--9Ek0hoCL9XbhcSqy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQytaBAAoJEN0jrNd/PrOhAlcP/14qb5YTkwpRW74RubZ3jIRS
U7VK+3h1DCvzQUlvCiQCMexgkC2/pIn/2trtE1Jj8I76FgWog01pebBxmGrjh6xY
dH2Iue6ak6U7tzUHeG2uJUARQPc/JVElfG36mM9/RSJ1XxZ3RDeBVhZzkckFLANW
dXnM1aXV3HomGacy8k5IeJNlvm8NvzX7BwjAl1PTlZxlxUJZmCHDQRal/UxfNBt+
JsOgSXAFDD/hTN2XjBHH6xJf54HFNuNx5KsCKCcqoyRy6TKJO+RjwvGW41sXlEhP
stH2bwDgzhwa7W98UA/1WECb/xZtEgFtr31/rw+UxtHZ6gzceBvii8PoAHR8LPp1
jNJQpmAaj7bL//BThLBx5+H7knH3Lrok70C39dh3f16BLul16gUaODnUcC/H4+vM
VN7o/RSSTqHpWjUdVzdKR42jr6LDNkBtL4NvHstm5X9cGvtna9N9PERW0sAxjUN6
t/jBOCJswl80K9Yt8uLRgBGF8JTPEQ3yTUm+sNVarZ01XuVZNQbJWZT9KsWfkeiL
nU7NxJB5np3T0DQFLTEmCeVZgAobmrqESzGHz+LNucOcZRspLj3FKyK9nlGxzBZo
1yfY3ttqtKKRF+E2O687BVO12UJjWHGNf8Gh7+o+B8Lu8WrW9jjQQZCxuJiXUC5F
nlYTb07jTtP9MPGdXE7M
=2BBC
-----END PGP SIGNATURE-----

--9Ek0hoCL9XbhcSqy--
