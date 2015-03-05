From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [GIT PULL 2/2] Samsung fixes-2 for v4.0
Date: Thu, 5 Mar 2015 08:34:00 -0400
Message-ID: <20150305123358.GC25728@developer.hsd1.ca.comcast.net>
References: <54F4B33E.3070803@kernel.org>
 <2064108.qlOP0oDx90@wuerfel>
 <02cd01d057f6$ab1a8e40$014faac0$@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:39837 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755227AbbCFTmy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Mar 2015 14:42:54 -0500
Received: by pabrd3 with SMTP id rd3so20383183pab.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2015 11:42:53 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <02cd01d057f6$ab1a8e40$014faac0$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, arm@kernel.org, 'Kevin Hilman' <khilman@linaro.org>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Lukasz Majewski' <l.majewski@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>


--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2015 at 07:16:53PM +0900, Kukjin Kim wrote:
> Arnd Bergmann wrote:
> >=20
> + Eduardo
>=20
> Hi Arnd,
>=20
> > On Tuesday 03 March 2015 04:00:14 Kukjin Kim wrote:
> > > Please pull Samsung tmu and hdmi regression fixes for v4.0 and I know
> > > this is quite big for fixes but I couldn't handle this series for
> > > previous merge window because of dependency with driver side...sorry =
for
> > > that and please pull so that we could support them in v4.0 on exynos
> > > platforms.
> >=20
> > What kind of dependency do you have there? It really should not be
> > necessary to wait for driver changes, unless you do an incompatible
> > DT binding change, which you should avoid.
> >=20
> For TMU patches, I've asked Eduardo to provide topic branch for
> 'include/dt-bindings/thermal/thermal_exynos.h' has been added via thermal=
 tree
> because if I can't apply the patch in Samsung tree for arm-soc, kernel bu=
ild
> breakage will be happened. But I couldn't get Eduardo's topic branch.


Specifically, the developer, while migrating the driver to support DT
and OF thermal, decided to create a header with constants. The header is
used by DT files and the driver code. The header was the dependency.


BR,

Eduardo Valentin

>=20
> http://www.spinics.net/lists/linux-samsung-soc/msg41877.html
>=20
>=20
> For HDMI patches, I thought the DT changes have a dependency with "drm/ex=
ynos:
> add support for 'hdmi' clock" so waited for its applying then in drm tree=
=2E But
> I couldn't send it to arm-soc after that...
>=20
> http://www.spinics.net/lists/linux-samsung-soc/msg42173.html
>=20
>=20
> I asked about the situation (late DT changes?) when I sent a pull-request=
, then
> I couldn't get a access my kernel.org because of biz. trip to China :(
>=20
> http://www.spinics.net/lists/linux-samsung-soc/msg42235.html
>=20
>=20
> > I've pulled it into fixes, but won't forward it until I hear a
> > good explanation.
> >=20
> As you know, basically I tried to make a clear branch for pull-request bu=
t in
> that case, I couldn't find a solution. Sorry for the inconvenience.
>=20
> I hope v4.0 can support them properly.
>=20
> Thanks,
> Kukjin
>=20

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJU+E0sAAoJEMLUO4d9pOJWjhMIAIDCDyxq0JqxSApvdOegcwLU
FzJOYWnhyZdTDlsJO0sWuTiwgrOKK0Z8yBs1nhkQwpRLFCupoMW8JyBIuwlXEu7B
SDW59BoKIFLIseiCE1N7ORb5PXtcyPIX/9vqnRON7lyUTTSq7Q34FQFI/5hmqnii
NIpn5S5E10prTuZA1zCoYoREifgopKV/9l8wSb1lCul9n3rehn2tsC3fErGkY69I
c4c5p8nRQjfpmgQtPNEkgVzn+SFGO3EHgYlx2Py3UfWZkvQ+hA60WHzTnJsYfXaB
OH0LEd2oq/RtFR83Lnp8TG5AMILufEB3daJtAbf5MXiC9aBfXyeDwsamo/8gu5M=
=sLYu
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--
