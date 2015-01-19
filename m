From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V8 00/14] drm/exynos: few patches to enhance bridge chip
 support
Date: Mon, 19 Jan 2015 17:30:45 +0100
Message-ID: <20150119163043.GB7751@ulmo.nvidia.com>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>
 <CAEC9eQOrKw2Z1q-ztFfadXmsL3CTcAkkv9kcS2QnDOAVSh2AuQ@mail.gmail.com>
 <548ABAB6.6010200@collabora.co.uk>
 <3197445.qizQc0zeRb@avalon>
 <54914D7D.9060108@collabora.co.uk>
 <CAPj87rN4HZzDt5JBLyTRmKZs7XcOG=0ha7ZQf9hmjPAFgTyhYQ@mail.gmail.com>
 <20150105135015.GA12010@ulmo.nvidia.com>
 <54BCDC28.7080003@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:34763 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751426AbbASQau (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jan 2015 11:30:50 -0500
Content-Disposition: inline
In-Reply-To: <54BCDC28.7080003@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Daniel Stone <daniel@fooishbar.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Ajay kumar <ajaynumb@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2015 at 11:27:52AM +0100, Javier Martinez Canillas wrote:
> Hello Thierry,
>=20
> On 01/05/2015 02:50 PM, Thierry Reding wrote:
> > On Fri, Jan 02, 2015 at 01:10:14PM +0000, Daniel Stone wrote:
> >> >
> >> > Ajay's series don't apply cleanly anymore because it has been a whil=
e since
> >> > he posted it but he can rebase on top of 3.19-rc1 once it is release=
d and
> >> > re-resend.
> >> >
> >>=20
> >> Do you have any plans to rebase this so it's ready for merging?
> >>=20
> >> Thierry, Daniel, Dave - whose tree would this be best to merge through?
> >=20
> > The plan is for me to take the bridge patches through the drm/panel
> > tree. I'm going to look at these patches again later this week but from
> > a very quick peek there don't seem to be any major issues left.
> >
>=20
> I know you probably are very busy but it would be great if you can take a=
 look
> to this series to avoid another kernel release to be missed since we are =
already
> at v3.19-rc5.
>=20
> Only this version was posted 2 months ago and the first version of the se=
ries
> was sent on May, 2014 so it has been on the list for almost a year now...
>=20
> Tomi and Laurent had already agreed with the DT binging so I think that w=
e can
> already merge these and if there are any remaining issues, those can be f=
ixed
> during the 3.20 -rc cycle.

I see only a single Tested-by on this series and that seems to be with a
bunch of out-of-tree patches applied on top. Does this now actually work
applied on top of upstream? Also it seems like many people actually want
this to get merged but there's been no Reviewed-bys and only a single
Tested-by? Is that as good as it's going to get?

Also I think the last update was that Ajay was going to resend this
based on v3.19-rc1 or something. Is that still going to happen?
Otherwise I can probably try to apply as-is, but not sure how well it
will.

Thierry

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUvTEzAAoJEN0jrNd/PrOhdhkQALMBzkN1mDndgqsU3OQdXFwL
yYdJE4PbjbQFro2E8aVUR/hcAP/U7dyC41QtZfQODlExmbAn8oHcejORdRnihmCq
axMTCECHYjeXgivLOhrRqTCLTZa2CzQ+LHwsYcOcKXb4cz8E+NB6O4zrSJGP0S2c
DavYziQsZqAch9LwDsmty6pWAGleLBExyg7RnTqM5A4YnpHnQwYcoTqCXR3HUX5G
fjj+VTm9ld8ioAJw3FzcyosYFlHzw3dkECcDODW1YWJF1qqegP4xaGLJ9RIv0bHA
h7AddhOrOOBh++EgQ2aI/oE/cuocGGNLMuCy3R1ucRWeEPUh88oQBjeRYTzcCESa
+CrFgWm8UcxOD5HJcsaj5zSU1+Xdr3Z4R/laCMiZbF5aMoCg2/ZGff5iz71guC12
duvvlxYTjnJpAAfWr6K13YxLpJnvJdWDMrLfl/WGMcHG9F6/LnW8qZQhyoI/H+sH
0gcWZ31rK/D/N41rq73obfShbhc64o2ITEqHfWUcl+z1iAPvc+gwl5c4hycek+fq
jImHO+rvKlb5WumI021gsjVuKU/fI2dKWHVfdbTOnx8h1F4acADdh5BsDoD1s41J
Kns07xqm7ntFmOvrWfZaKeDzEUXKoWo2NKHIpvwKpY1dwdMH6XZVNZODvBgBiGwZ
m1ZUDcuP0E3HTo2ZvwBp
=YISN
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
