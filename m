From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 06/15] drm/exynos: dpi: Add support for panel prepare and
 unprepare routines
Date: Fri, 1 Aug 2014 12:22:02 +0200
Message-ID: <20140801102200.GH21724@ulmo>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406828534-10072-7-git-send-email-ajaykumar.rs@samsung.com>
 <20140801090444.GB21724@ulmo>
 <53DB5CDA.3010901@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xQmOcGOVkeO43v2v"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:39767 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752174AbaHAKWG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 06:22:06 -0400
Content-Disposition: inline
In-Reply-To: <53DB5CDA.3010901@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, cpgs@samsung.com


--xQmOcGOVkeO43v2v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2014 at 06:24:42PM +0900, Inki Dae wrote:
> On 2014=EB=85=84 08=EC=9B=94 01=EC=9D=BC 18:04, Thierry Reding wrote:
> > On Thu, Jul 31, 2014 at 11:12:05PM +0530, Ajay Kumar wrote:
> >> Modify exynos_dpi driver to support the new panel calls:
> >> prepare and unprepare.
> >>
> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> ---
> >>  drivers/gpu/drm/exynos/exynos_drm_dpi.c |    8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > Looks good to me. Inki, can I have your Acked-by to take this through
> > the panel tree?
>=20
> Of course.
>=20
> Acked-by: Inki Dae <inki.dae@samsung.com>

I'll take it that this Acked-by applies also to patch 07/15?

Thierry

--xQmOcGOVkeO43v2v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT22pIAAoJEN0jrNd/PrOhV1AP/i0cljheT+tEWXY9Et6bO+c2
9I40W3a2VNwSxGlolhNurU0Jfj75zEAb/tO+1IUfg8ClOQd5HoJHiqS/a6RC0VRR
5oc1V84PkK75wHmrUbmds3dabPxzYIQkTbG5j2yUvLdAZINig05npzi81Jc9tzhv
HAGZVlhuFKH9nGqUYcoTz+NFwQ4j2ndZg2QgPG+JMJsPaOVEIEk7glQ63nYaKeQn
rZTz92nkWoEfrrNH4kBY3wg3IRalCbbtrFgwnr1T3WUnDjvgT5Z41iNJYURr25Zy
wZf6JFZceykS11srAU4fUN9hmB1Qcq0W8PMENnQSPjXZIJIxiO6TxPMceBKlnE1s
EzBz30B92tdWTSqkWUm/PlX+hdNMQlcyMF43EI/QzEW0zbhAg6mJd+D71D4H7qQH
AeogIgDbBLP/HNbEQrCzXXmQRdV3peOO7fFG4Q+xr/YdwjA5Xx81chdse6Lmo7tE
SY9jg8cPnOkGEnKpKdixalr5FNuTu8Vw7cjCA0g2E3i3KxlI92cea5KbtU5xQyt8
oLqtxdQRdnJZWXGilS6ZbMjVTpu2Q7Cz0hDn1u+BlNlGBRMb6Tv4LFBRtvZTVdFe
u98qwcNp7mXinn67dDHSib0d7FrRmbbnjKpaVYHMILjzSSdSu1v+KLV0P9AMxbcg
eAq2XURGC1v0H+UcO+Mg
=HDMR
-----END PGP SIGNATURE-----

--xQmOcGOVkeO43v2v--
