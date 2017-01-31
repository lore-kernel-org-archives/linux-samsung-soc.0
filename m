From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver
 on TM2 board
Date: Tue, 31 Jan 2017 16:02:26 +0100
Message-ID: <20170131150226.GB4519@ulmo.ba.sec>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com>
 <588FD3C3.7080508@samsung.com> <20170131085449.GA19348@ulmo.ba.sec>
 <20170131143853.GU20076@art_vandelay>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1084566372=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170131143853.GU20076@art_vandelay>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene@kernel.org, Donghwa Lee <dh09.lee@samsung.com>, linux-kernel@vger.kernel.org, andi.shyti@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, dri-devel@lists.freedesktop.org, Hyungwon Hwang <human.hwang@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1084566372==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline


--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 09:38:53AM -0500, Sean Paul wrote:
> On Tue, Jan 31, 2017 at 09:54:49AM +0100, Thierry Reding wrote:
> > On Tue, Jan 31, 2017 at 09:01:07AM +0900, Inki Dae wrote:
> > >=20
> > >=20
> > > 2017=EB=85=84 01=EC=9B=94 24=EC=9D=BC 10:50=EC=97=90 Hoegeun Kwon =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> > > > Dear Thierry,
> > > >=20
> > > > Could you please review this patch?
> > >=20
> > > Thierry, I think this patch has been reviewed enough but no comment
> > > from you. Seems you are busy. I will pick up this.
> >=20
> > Sorry, but that's not how it works. This patch has gone through 8
> > revisions within 4 weeks, and I tend to ignore patches like that until
> > the dust settles.
> >=20
>=20
> Seems like the dust was pretty settled. It was posted on 1/11, pinged on =
1/24,
> and picked up on 1/31. I don't think it's unreasonable to take it through
> another tree after that.
>=20
> I wonder if drm_panel would benefit from the -misc group maintainership m=
odel
> as drm_bridge does. By spreading out the workload, the high-maintenance
> patches would hopefully find someone to shepherd them through.

Except that nobody except me really cares. If we let people take patches
through separate trees or group-maintained trees they'll likely go in
without too much thought. DRM panel is somewhat different from core DRM
in this regard because its infrastructure is minimal and there's little
outside the panel-simple driver. So we're still at a stage where we need
to fine-tune what drivers should look like and how we can improve.

> > Other than that, this continues the same madness that I've repeatedly
> > complained about in the past. The whole mechanism of running through a
> > series of writes and not caring about errors until the very end is
> > something we've discussed at length in the past. It also in large parts
> > duplicates a bunch of functions from other Samsung panel drivers that I
> > already said should eventually be moved to something saner.
> >=20
>=20
> FWIW, this type of error handling isn't my preference either. If we must =
defer,
> I'd rather not keep it in ctx, but rather pass around an argument so it's=
 more
> obvious we need to deal with it in the return. That said, this seems like
> a case of letting the perfect be the enemy of the good, surely something =
is
> better than nothing?

That's what I ended up saying the last two times. But this has got to
stop at some point. If you look at most of the panel drivers, they look
more like material for the staging tree rather than DRM proper.

Yes, something is better than nothing, but we can't have this multiply
further.

Last time we discussed this there was some rough concensus that the
initialization sequence would be split into separate functions, which is
already mostly true for these drivers, and then settle on a common
signature for these functions, which is also mostly the case already,
and then have a table of functions that can be called one after another
with error handling on each call. That way at least you can provide
diagnostics about what function failed, and you can abort early because
we have to assume that failures are fatal.

Thierry

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliQpwAACgkQ3SOs138+
s6FhbxAAlZ6HlmkYuhlVcUBqtZsadl98rU0LkyuFLbKc5QApR5pQqg/cy84jyuqn
4fGsp8V6/jEnh+rj2h5DDr1DrgnbaCaKarcN0xDNUsg6LmpXzaHLW9kKNxXA8eNI
ex+euJOfXnWIkBy4afMvxsteU0jMWSyeA7Tq0mvqRBpkJqK2d69PLRDOspBaaHYC
dbaFexL1/TjIt8SHCAqzk8u0yzXCHzk5YXcCffEI9lG6YS+mNwVFAhEEi++DFLAm
2wwYX13QeNmAoaBryiD96C4yVGS5MaUfUQanRgdd8odcNhXL5R6vGayb2HoXFZXo
yXPkqMneT08naaOH/d8djPgkgymPxyWU2uiOoLzki3cc5mtKpWMeTdq0LnfOw+r9
kfUtQj5xmz7pMio4AXEjMMQ7VOD8qbYWjW5TE/1Odo6crqBPbVvYm8y8zfKEBsv7
rp3WEj/uSSnrkQb2CDTJA7ygFCKgsInIC2DF61MpgNX97M5l4Z2AUt0t812DAn7h
MwLEZlLgVyNYC+BzCziXMD+DxPDgEk6SJGWATOrqmDkgUJGxWk9czr1AUwu8BNAQ
XARNdUmxCdcmJnHIUYyi2vJCkzXAsUK+W0t+bVZtp3Oe3U/umXV8RFP1HNaVrP3T
X9DJvw+si7Y+ZAJlqoGI+ShE6kUbcPYUBs+YQUHHp1iKS7F8xF8=
=W98E
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--

--===============1084566372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1084566372==--
