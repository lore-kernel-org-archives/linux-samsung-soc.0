From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: GENERIC_GPIO considered deprecated
Date: Tue, 9 Apr 2013 09:38:42 +1000
Message-ID: <20130409093842.656ae3fff92d5368db5c0646@canb.auug.org.au>
References: <CAAVeFu+QUw1WmzwaJDfjyw75PrStd3p3PHs1MU5BC7_WXMB7kw@mail.gmail.com>
	<2c9501ce342b$1535d290$3fa177b0$%kim@samsung.com>
	<5162EC32.2030602@wwwdotorg.org>
	<201304082136.44905.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__9_Apr_2013_09_38_42_+1000_7wLC3SjYUJ.IXUu3"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:41555 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1763340Ab3DHXjA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 19:39:00 -0400
In-Reply-To: <201304082136.44905.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Kukjin Kim <kgene.kim@samsung.com>, 'Alexandre Courbot' <gnurou@gmail.com>, Olof Johansson <olof@lixom.net>, 'Romain Naour' <romain.naour@openwide.fr>, 'linux-next' <linux-next@vger.kernel.org>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Linus Walleij' <linus.walleij@linaro.org>, 'Tomasz Figa' <tomasz.figa@gmail.com>, =?UTF-8?B?IidIZWlrbyBTdMO8Ym5l?= =?UTF-8?B?cici?= <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, ARM kernel mailing list <linux-arm-kernel@lists.infradead.org>

--Signature=_Tue__9_Apr_2013_09_38_42_+1000_7wLC3SjYUJ.IXUu3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 8 Apr 2013 21:36:44 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Monday 08 April 2013, Stephen Warren wrote:
> > >>
> > >> Should do the trick, if we can make sure that your tree is merged
> > >> prior to my patches.
> > >=20
> > > I'm not sure but I think, arm-soc tree should be merged into mainline=
 before others...
> > >=20
> > >> Can you put it into your tree for 3.10?
> > >>
> > > I did, so it should be fine.
> > >=20
> >=20
> > You may want to discuss how to handle this dependency with the arm-soc
> > maintainers (CC'd).
>=20
> I'm fine with putting the same branch into arm-soc as well as the gpio tr=
ee
> and anything else that might need it, that tends to be the least invasive
> way.

Just a reminder: that had better be the exact same branch and that branch
had better never be rebased/rewritten ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__9_Apr_2013_09_38_42_+1000_7wLC3SjYUJ.IXUu3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRY1UCAAoJEECxmPOUX5FEJvwP/2ho4rdgU54EsqmohH0IXaxC
pY5XzzcVDRUbyNizxbVeYyQJNq5c7NYY2NJa+Sl6eoHtBeN8u0woIzA1zSMxYro7
j2sXwb2TUb2XwkkrujEa9URgb78rCH9aeWl9usGRpv7wfDAdLuQJUG4yYPf7G+pu
+coDBQyN4+lqVxcocNmtmt6ZLwyq7fcp4ecam+9X/L+Wi4BRz8X+RxrzHHM78RQB
KjZ6xo4d4EK+nZTNEO71wFmGUrjlyjqjFrSv6gRLk7Q6MRsoyIxf+izC9b+bD4E2
MXoR2aJCqUXgw6xUXPGNJNY03ltFN/oWgjjUt41sIGfGygT1ch+b49O6rIgl6oNo
vepkzis0SddT+JfSSHRTf9Wb3jPWSSBeyAwn1mPiODHziglY2VNO7M2uSWdB1EHR
CdYA8nGp1ejwchX55AlW6coXr9SN/Mj86IF5QTlC19QSlMbky7VokCqhXSdja0Ns
DvYCmdn1nLHAvB/2WKu7FWrMe+W6gr3POhLlzWVgFaJkblbFHaealtesOR+cb8p8
HXVJ5VfofEYvaVhrc03sduVVJm2wWX7FwHm/CJiYWYq1Qn4ikFhWtO4zmbaNdD9t
WUzvp+mXCQknWEQGFSYPNd+B2pBbegUprSYhuYjKoyWdY413to9djhIWjdBWACUR
O84orbclBMPymrZPbjux
=aFTD
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Apr_2013_09_38_42_+1000_7wLC3SjYUJ.IXUu3--
