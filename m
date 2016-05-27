From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] dwc3-exynos: Fix deferred probing storm.
Date: Fri, 27 May 2016 16:26:42 +0300
Message-ID: <877fefpr71.fsf@linux.intel.com>
References: <20160524192424.GA11690@sesse.net> <E1b5Hwn-0005Be-UA@pannekake.samfundet.no> <CAFp+6iGFkquYkHCCJRkQALRZ2g-htiKbrJZbJwMoAMR=+A5u_Q@mail.gmail.com> <20160527114641.GA39472@sesse.net> <5748480D.8000501@samsung.com> <87bn3rprtw.fsf@linux.intel.com> <20160527132519.GA5268@sesse.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:23650 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751222AbcE0N3B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 May 2016 09:29:01 -0400
In-Reply-To: <20160527132519.GA5268@sesse.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Vivek Gautam <gautamvivek1987@gmail.com>, "Steinar H. Gunderson" <sesse@google.com>, Mark Brown <broonie@debian.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 823552@bugs.debian.org, Linux USB Mailing List <linux-usb@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

"Steinar H. Gunderson" <sgunderson@bigfoot.com> writes:
> On Fri, May 27, 2016 at 04:12:59PM +0300, Felipe Balbi wrote:
>> yes, please do that. Keep in mind, also, that we're still in the middle
>> of the merge window and nothing will really happen until v4.7-rc1 is
>> tagged.
>
> Sent. As a fix, there's a chance it could go into 4.7, right?

yup, shouldn't be a problem. But only after v4.7-rc1 is tagged.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXSEsSAAoJEIaOsuA1yqRE03wQAKK3sdNzZ9g2sic7b9DFQl1w
jmjGfMSWigVcDRrQ2QLNnDUWGTV9bykoPW79BnLbzho8966QAPomMgMAXja2XtTc
Fq/TWhZUCjPjzx7ui7iIEpVyVNkQJTOv2ilmYHZCJrptaz0uA1u1pFgaNMe8Oqnr
ataWRHsjdjzBKWvxoSai5MR42MKiftVOr918PQKCKYzxsRQq/pBwFSz0KFqobtJL
BCedkpmS+oNEyTZvsyLgFCVRqzljQ1ENe1LU0GHhsrIqRAAUnwLuUMAiKgD0+G9p
ZsBZl/3qKk5PTp3bMG+0tTOWvG6hx3yI6K9PUXKueRvIHT4SicPQv0IFDdYVkqbP
6Z3PRBhBUTP784NV7tDX/cWPLcRjb4LesVmWy/yEppHBn4pt84JljzlWtcfQZHTo
ORpzXFzh/5DojQiLPzSYovw7mOvJpou4hmBc4P20GZqa4HdyaNbXjFXIBYp1HR8C
UuUe7neCkBgl1MLdPJf8/GRDuLKU+oY8qbNMyli67F/1D11RtzIQ6QKMue1DBvnI
6j5IlFLb7mQ61te+f3XxfYE2I1WljVwC/lYnSQtZZ3K/sw99S+spUqsl83zH2ibv
JC4Dj1g4tw47t9RD0gw2tztTsaJvMItJFcXqf6+WUfr09QPxKzvxDYlsMUpXagu2
5zt38SxY5SmifuBON9ks
=DakT
-----END PGP SIGNATURE-----
--=-=-=--
