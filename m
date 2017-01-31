From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver
 on TM2 board
Date: Tue, 31 Jan 2017 22:17:29 +0100
Message-ID: <20170131211728.GB872@mithrandir.ba.sec>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com>
 <588FD3C3.7080508@samsung.com> <20170131085449.GA19348@ulmo.ba.sec>
 <20170131143853.GU20076@art_vandelay>
 <20170131150226.GB4519@ulmo.ba.sec>
 <20170131154951.GZ20076@art_vandelay>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0165104940=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170131154951.GZ20076@art_vandelay>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Donghwa Lee <dh09.lee@samsung.com>, linux-kernel@vger.kernel.org, andi.shyti@samsung.com, jh80.chung@samsung.com, cw00.choi@samsung.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, Hyungwon Hwang <human.hwang@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0165104940==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 10:49:51AM -0500, Sean Paul wrote:
> On Tue, Jan 31, 2017 at 04:02:26PM +0100, Thierry Reding wrote:
> > On Tue, Jan 31, 2017 at 09:38:53AM -0500, Sean Paul wrote:
> > > On Tue, Jan 31, 2017 at 09:54:49AM +0100, Thierry Reding wrote:
> > > > On Tue, Jan 31, 2017 at 09:01:07AM +0900, Inki Dae wrote:
> > > > >=20
> > > > >=20
> > > > > 2017=EB=85=84 01=EC=9B=94 24=EC=9D=BC 10:50=EC=97=90 Hoegeun Kwon=
 =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> > > > > > Dear Thierry,
> > > > > >=20
> > > > > > Could you please review this patch?
> > > > >=20
> > > > > Thierry, I think this patch has been reviewed enough but no comme=
nt
> > > > > from you. Seems you are busy. I will pick up this.
> > > >=20
> > > > Sorry, but that's not how it works. This patch has gone through 8
> > > > revisions within 4 weeks, and I tend to ignore patches like that un=
til
> > > > the dust settles.
> > > >=20
> > >=20
> > > Seems like the dust was pretty settled. It was posted on 1/11, pinged=
 on 1/24,
> > > and picked up on 1/31. I don't think it's unreasonable to take it thr=
ough
> > > another tree after that.
> > >=20
> > > I wonder if drm_panel would benefit from the -misc group maintainersh=
ip model
> > > as drm_bridge does. By spreading out the workload, the high-maintenan=
ce
> > > patches would hopefully find someone to shepherd them through.
> >=20
> > Except that nobody except me really cares.=20
>=20
> I certainly haven't been paying attention. My excuse, at least, is that y=
ou're a
> great maintainer and I haven't thought the patches need a second look. Pe=
rhaps
> if we moved towards a group, more people would be vested/care?

I doubt that group maintainership would change much about the lack of
peer review. Peer review makes maintenance a lot easier. Usually when I
see that a patch has been reviewed by someone that I think I can trust,
I only give it a very brief look before applying. However, if there's
been no other review I need to take a lot more time to review.

> > If we let people take patches
> > through separate trees or group-maintained trees they'll likely go in
> > without too much thought. DRM panel is somewhat different from core DRM
> > in this regard because its infrastructure is minimal and there's little
> > outside the panel-simple driver. So we're still at a stage where we need
> > to fine-tune what drivers should look like and how we can improve.
> >=20
>=20
> Fair point. With drm_bridge, I've been lending review help, but deferring=
 to
> Archit for merge on patches which I think he should look at. Gustavo is i=
n a
> similar place with fences. drm_panel seems like something that should fol=
low
> the same model. Maybe once more people (or one person) get up to speed on
> things, we could share the load.

I certainly wouldn't mind more people reviewing panel patches. Applying
them is the easy part.

> > > > Other than that, this continues the same madness that I've repeated=
ly
> > > > complained about in the past. The whole mechanism of running throug=
h a
> > > > series of writes and not caring about errors until the very end is
> > > > something we've discussed at length in the past. It also in large p=
arts
> > > > duplicates a bunch of functions from other Samsung panel drivers th=
at I
> > > > already said should eventually be moved to something saner.
> > > >=20
> > >=20
> > > FWIW, this type of error handling isn't my preference either. If we m=
ust defer,
> > > I'd rather not keep it in ctx, but rather pass around an argument so =
it's more
> > > obvious we need to deal with it in the return. That said, this seems =
like
> > > a case of letting the perfect be the enemy of the good, surely someth=
ing is
> > > better than nothing?
> >=20
> > That's what I ended up saying the last two times. But this has got to
> > stop at some point. If you look at most of the panel drivers, they look
> > more like material for the staging tree rather than DRM proper.
> >=20
> > Yes, something is better than nothing, but we can't have this multiply
> > further.
> >
>=20
> So perhaps if we had more reviewers, we could tighten up the review feedb=
ack
> loop and avoid this while still getting things merged?

Maybe. Like I said, I would very much welcome more review on panel
patches.

Thierry

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliQ/uUACgkQ3SOs138+
s6FcZBAAo2Z1NWGtu5Vac3mQVEx0ZEjo1jqzcWiiFnI5nba2dY5QwQ32sh11mzMF
gYLe4A9sTiRSny3GcVYcoKF16g84o6Ih3mhbvlFsbqagkRPkHvaYMpmMm51Ryca/
hmmUQMBNh76Yxe51s+l1/nzc1ntsPjSScKt2NKmkOfZnvRp+kC61uczpoZYKYvG6
FP0PnbP1iHl3VhBhe0TLDcmIJpAv0gr59GjpVLZDdrdOPVq8bzMUx2OQQGf/Bj1F
cbfrSJGpYTY9iVJQBoBf+3vud5e5VXUd7Gf71bEigae8eKCNP4VFRvZbjQtx4BJe
BMr8FqcUXCIP7Kjm+OaSIRilH4OydJm50TMNplk4MofUISp3zlD+x3+8Cl3wrkKS
2BYokIY9/MGLEed3AZtTP1BZT2etvVzTAERvcQl/cPtKAafPXyK4ta7hiwXSQ6m7
6Ild4iLcjTIog12SBbloi73z8YZihmwGItGbHT5jaPXqVs7igA3K+sBOEAfiZT2E
62cWeBi53/08RnbudYAPl4v/pSxa3aw9KDdk41T/rCrow+sdRww5GCnVr4/6MuSO
6JGgcK9C7g3YmIdZYmBVNl8+SVBsr4WFdROC8vQ/7lrGYs/lrxfzSAMHfG6eHNVl
Pliz7sxXKZBCBpChgUT2IC6twZv5jb+m51cxfEPN1xFKrK6TMwA=
=W8A7
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--

--===============0165104940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0165104940==--
