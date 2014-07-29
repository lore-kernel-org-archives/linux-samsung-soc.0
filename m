From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip
 support
Date: Tue, 29 Jul 2014 13:43:49 +0200
Message-ID: <20140729114346.GA26346@ulmo.nvidia.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <53D5435B.8030305@suse.de>
 <CAEC9eQPW-Z4craCC15M7oTp8eSD09AGxdTFEWaAWqn3Up4eJUg@mail.gmail.com>
 <53D783CC.2080108@suse.de> <20140729113645.GB21732@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1819947374=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140729113645.GB21732@ulmo.nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, daniel.vetter@ffwll.ch, joshi@samsung.com, dri-devel@lists.freedesktop.org, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Ajay kumar <ajaynumb@gmail.com>, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1819947374==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2014 at 01:36:46PM +0200, Thierry Reding wrote:
> On Tue, Jul 29, 2014 at 01:21:48PM +0200, Andreas F=C3=A4rber wrote:
> > Hi Ajay,
> >=20
> > Am 28.07.2014 08:13, schrieb Ajay kumar:
> > > On 7/27/14, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> > >> Am 25.07.2014 21:22, schrieb Ajay Kumar:
> > >>> This series is based on exynos-drm-next branch of Inki Dae's tree a=
t:
> > >>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
> > >>>
> > >>> I have tested this after adding few DT changes for exynos5250-snow,
> > >>> exynos5420-peach-pit and exynos5800-peach-pi boards.
> > >>
> > >> I'm trying to test this with a modified exynos5250-spring DT based o=
ff
> > >> kgene's for-next branch due to DT, and I run into the following:
> > >>
> > >>   CC      drivers/gpu/drm/bridge/ptn3460.o
> > >> drivers/gpu/drm/bridge/ptn3460.c: In function =E2=80=98ptn3460_post_=
encoder_init=E2=80=99:
> > >> drivers/gpu/drm/bridge/ptn3460.c:275:2: error: implicit declaration =
of
> > >> function =E2=80=98drm_connector_register=E2=80=99 [-Werror=3Dimplici=
t-function-declaration]
> > >>   drm_connector_register(&ptn_bridge->connector);
> > >>   ^
> > > Hope this might help:
> > > http://www.spinics.net/lists/dri-devel/msg60578.html
> >=20
> > That fixed my build, thanks.
> >=20
> > Unfortunately the most I got on Spring with attached DT was a blank
> > screen with a white horizontal line in the middle.
> >=20
> > Do I need to specify a specific panel model for Spring?
> >=20
> > For testing I re-applied your iommu patches (which btw fail now for 5420
> > due to disp_pd) but didn't know what to do about your panel-lvds
> > regulator patch now that it's gone.
> >=20
> > If I don't apply this series, then commenting out the dp-controller node
> > gets me a working display with simplefb as before.
> >=20
> > Regards,
> > Andreas
> >=20
> > --=20
> > SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> > GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=
=C3=BCrnberg
>=20
> > From 9172a26a8f0d0f0d170bd27e1c150ad204d8086a Mon Sep 17 00:00:00 2001
> > From: =3D?UTF-8?q?Andreas=3D20F=3DC3=3DA4rber?=3D <afaerber@suse.de>
> > Date: Sun, 27 Jul 2014 21:58:06 +0200
> > Subject: [PATCH] ARM: dts: exynos5250: Add eDP/LVDS bridge to Spring
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=3DUTF-8
> > Content-Transfer-Encoding: 8bit
> >=20
> > Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> > [AF: Redone for v6]
> > Signed-off-by: Andreas F??rber <afaerber@suse.de>
> > ---
> >  arch/arm/boot/dts/exynos5250-spring.dts | 32 +++++++++++++++++++++++++=
++++++-
> >  1 file changed, 31 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dt=
s/exynos5250-spring.dts
> > index 687dfab86bc8..517b1ff2bfdf 100644
> > --- a/arch/arm/boot/dts/exynos5250-spring.dts
> > +++ b/arch/arm/boot/dts/exynos5250-spring.dts
> > @@ -64,10 +64,14 @@
> >  		vdd_pll-supply =3D <&s5m_ldo8_reg>;
> >  	};
> > =20
> > +	panel: panel {
> > +		compatible =3D "simple-panel";
> > +	};
>=20
> You can't do this. "simple-panel" isn't a valid panel model. It should
> probably be removed from the platform_of_match table in the driver.

Done.

Thierry

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT14jyAAoJEN0jrNd/PrOhlv0P/joFJ6IDUp0uTHI8E0xs05Oh
1r1CUV3yC+TmCHcOscBTMUIFd8IGn2rC4FznRqWaUD9V+Q/97/2TP2zTJFn6lqSz
7aWYTusv5Uc1E9beBBMv9LnNenWSFWrD/N8Xk0CR/SQsehVFg+b6nAF5AJcTrN4K
eLSIiaz78TWyKWbanbjBoJ3fsGsd2z8E7dS67s9KEdMspIXd+1jJDiLbWrhForBs
7PxaJ93lNCXvZJuJXw1Ki5SmrANAG9ctQgp26/jyDy6sZwV2e/V7pfe/iyExv9s1
zrNEFJI/YJEon15S1gxerv5geoJsdUs5Jgp18b8MvcLDR0ZhZLWZoZE0phVMJDEH
Hgdz5EXMM4DWxlN2ieUXBXhYPQAIoG6F5I4kp0q4o5zV7ghHR14+uPUYaoabdkai
emth3dtJFRePNAWMsQon7hCXW2uJIUC2TE5lU+D18p7dFYQUTNJWGvZbrIthy3sh
LO22S3o5lfTaja56szHUqNXzs7Kr/VqT5fjVG5pBbBgOiu9lFmKuRcOBYjitvCPt
d08Bsl7P763BJbC5mJRf6kqy+RnhQR7r7tp4BVegittrbCgmptHIBdtdm0wfqQwX
UJQCgn8C4q6GrdSCc2ZD8qCIwxl0Qn9NJ3VmjOTrOpoSfPtR2KqEV3aETnksTQ+Z
ttcNj5m6XONg+9gtUqg1
=Bflu
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--

--===============1819947374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1819947374==--
