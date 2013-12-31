From: Mark Brown <broonie@kernel.org>
Subject: Re: [GIT PULL 2nd 3/5] Samsung defconfig update for v3.14
Date: Tue, 31 Dec 2013 16:17:43 +0000
Message-ID: <20131231161743.GH31886@sirena.org.uk>
References: <52B5DCAB.204@samsung.com>
 <20131228231531.GB22753@quad.lixom.net>
 <CAOesGMj38JPgFic+ByShH3nHXWe0j=rzcdQzEiTGJ18OKfR6zw@mail.gmail.com>
 <CAOesGMh-ptLF_fvJ2X_7_WZVnB3oUkO2QUPxPENb4e+aDUb6iQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GH2w3bbsGmSMo31z"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:52157 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753749Ab3LaQSR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Dec 2013 11:18:17 -0500
Content-Disposition: inline
In-Reply-To: <CAOesGMh-ptLF_fvJ2X_7_WZVnB3oUkO2QUPxPENb4e+aDUb6iQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>


--GH2w3bbsGmSMo31z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 28, 2013 at 07:48:26PM -0800, Olof Johansson wrote:
> On Sat, Dec 28, 2013 at 7:44 PM, Olof Johansson <olof@lixom.net> wrote:

> > The regulator driver causes build breaks. Really, nobody checks these
> > things before sending patches or merge requests?

> > Having exynos_defconfig broken in arm-soc isn't an alternative. So I
> > dropped this branch again. If the regulator driver gets fixed in -rc
> > then we can probably merge it before the merge window, otherwise we'll
> > have to merge the defconfig change after the regulator fix goes in for
> > the 3.14 merge window.

> Ah, I guess the fix went in after -rc4, which is the latest -rc that
> we have in for-next today. I'll bring for-next forward and merge this
> in.

> Still, it's odd that you were able to test your branch before sending it in.

The build breakage was only introduced in -rc4 - a MFD/RTC change went
in via Andrew's tree so it got no exposure in -next before it showed up
in Linus' tree which wasn't good.  The fix was in by -rc5, looking at
the date on the pull request I expect that any testing against -next (as
opposed to arm-soc) would've been OK and since the branch is based on
-rc1 it'd have tested out by itself as well.

--GH2w3bbsGmSMo31z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSwu4kAAoJELSic+t+oim9ZE0P/0x5jE60RIlBGENSJzXZAV3h
7AVdjujomJtMvAK2VvHkqZGhk5ZJemYb7FvV+AdRJ/UMdPAhF59FznsdQ9xVxic2
e76Q0YC9BpS8cfg9OyPt+Hvd3kHXrewZXEejEqXrQx+fJD6jT+UxGC9XKyw383il
QRk983+wj5Tl6/+xhrMbtHDtOHBg8IgMQLeWgGHZv5Et8+zhctItPg1vgo0GDyqC
l1YcN88jag4+b1QU0we7WU6kgBGPeKMyy69PetzezyBYj65L8UesqevIL7GPrsJd
rQu1o9hyXn+z6pk5Z54wWvZtYn+qx32LvXBfaJFs1d1ngdlP9MR2BeKPBUDle8tj
kFJIMQ11yKq9E9ZIGI2AfKJg6sWOo1e9b87hhaAQwJLZFPqBPAI3lCCjMT+R9Q8r
wjYyg70XsHIQaQSSZQTEy4n3ybi+BhooaRnTT1H94FTszzan81nGp67WLnMNuXTW
CiR8n73xkhQVjAcfyjoyRRSu/zT/BnFl4tkSOx6RfC4mI7waeWrpoM/TCKIVzGV9
hKFtmOcuYlOK94TTGNr5lcJUDuwUjIx1Bn9sD+Sz8Ko8TvJ1PMtwt5nFby6ztyrJ
dDh0+M+60Qbs1Jgyj6661EmB6nZDrUWwKIXXrT3xb+T15luQyH2twOGhOShDnuT3
jaJsMfo6Oy3uglY6fRuM
=Jq9X
-----END PGP SIGNATURE-----

--GH2w3bbsGmSMo31z--
