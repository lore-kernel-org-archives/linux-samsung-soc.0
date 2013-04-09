From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: GENERIC_GPIO considered deprecated
Date: Tue, 9 Apr 2013 10:10:35 +1000
Message-ID: <20130409101035.c59edcf9fa6e40a064f7fe41@canb.auug.org.au>
References: <CAAVeFu+QUw1WmzwaJDfjyw75PrStd3p3PHs1MU5BC7_WXMB7kw@mail.gmail.com>
	<2c9501ce342b$1535d290$3fa177b0$%kim@samsung.com>
	<5162EC32.2030602@wwwdotorg.org>
	<201304082136.44905.arnd@arndb.de>
	<20130409093842.656ae3fff92d5368db5c0646@canb.auug.org.au>
	<CAAVeFuJCxYiOXRkjJZXpSFUaGoiAtWwBWBJmxXUyQMkmrSEsew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__9_Apr_2013_10_10_35_+1000_355/KesLd0LvUYG6"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:51162 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761961Ab3DIAKr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 20:10:47 -0400
In-Reply-To: <CAAVeFuJCxYiOXRkjJZXpSFUaGoiAtWwBWBJmxXUyQMkmrSEsew@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Romain Naour <romain.naour@openwide.fr>, linux-next <linux-next@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, ARM kernel mailing list <linux-arm-kernel@lists.infradead.org>

--Signature=_Tue__9_Apr_2013_10_10_35_+1000_355/KesLd0LvUYG6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 8 Apr 2013 17:07:54 -0700 Alexandre Courbot <gnurou@gmail.com> wrot=
e:
>
> On Mon, Apr 8, 2013 at 4:38 PM, Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > On Mon, 8 Apr 2013 21:36:44 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> On Monday 08 April 2013, Stephen Warren wrote:
> >> > >>
> >> > >> Should do the trick, if we can make sure that your tree is merged
> >> > >> prior to my patches.
> >> > >
> >> > > I'm not sure but I think, arm-soc tree should be merged into mainl=
ine before others...
> >> > >
> >> > >> Can you put it into your tree for 3.10?
> >> > >>
> >> > > I did, so it should be fine.
> >> > >
> >> >
> >> > You may want to discuss how to handle this dependency with the arm-s=
oc
> >> > maintainers (CC'd).
> >>
> >> I'm fine with putting the same branch into arm-soc as well as the gpio=
 tree
> >> and anything else that might need it, that tends to be the least invas=
ive
> >> way.
> >
> > Just a reminder: that had better be the exact same branch and that bran=
ch
> > had better never be rebased/rewritten ...
>=20
> Sorry, which branch are we talking about - is it the one I published
> for -next initially? If so wouldn't it be simpler to withdraw it and
> have Grant integrate the patches in his branch? Since no one depends
> on them for now anyway...
>=20
> I remember rebasing it once some time ago to add Acked-bys, but it
> hasn't changed since then.

I am talking about the branch that Arnd says should be merged into both
the arm-soc and gpio trees.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__9_Apr_2013_10_10_35_+1000_355/KesLd0LvUYG6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRY1x7AAoJEECxmPOUX5FEDvsP/RClNbupydN4sWsUD7M7z2j4
eYLvXhQBpjsjh+0sKVL10KM6h2cbW6wLyBcfyUNeZ/qbKM2CAIrmVAcKR+uAnqCY
2+nA3/PBcliXJtuKPZZD442m+CD1i4KnftmkkcjhnAdSeAwofSzyckZTDMDfTLyI
AZe96A0xtifnbM2RExll59DigFwRYAcQ7Qjt1KtmqEfyWjar7c08pLCcnVHuHNIr
ELa4fhr4qjEUkJeV64YpkqxmpCVUFYOgFCLhUaKz2gQY4RZCDvbUwB5yKJzt3aLx
8+M/GBV3l2ipK/X8rQBIKfLIrvfAyr5QQIdHoC0oeZqeb7+Jh/Ez6DgsbPTQc/mn
uBm6TgSVPrWHaRZR0V4MwCmSXtB0tzBhNfdh7tt2Gjrs0vDp64tRSpdf+AzuAXf6
HR0rIhJo5N8mNUk7SxCrv1taXrU4EnmeJGnvkNLVS7h30Ed8T4LoWDZwTkCOaE4a
KUZb+nS2Mh0tUOeywZ5MYfz510S5WJyHB8g4ME4RBHSUg+x50UY5O6yQmi7l8EEh
c52MNfHr4kLjIZOwF4nQsaZeXYIG2dTLuin0HrTiFLLOMyG6uBA9z1wvznMZd6fY
2pMuJxEQ9OgnGbNpbikuOAgi56Dkagi40zWD7HLnbFQBm9dnwwWP/YraxBxUlm90
mrFwESvzEYyfsR0AXrJi
=1DrC
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Apr_2013_10_10_35_+1000_355/KesLd0LvUYG6--
