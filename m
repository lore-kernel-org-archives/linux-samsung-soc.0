From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver
 on TM2 board
Date: Tue, 31 Jan 2017 22:31:34 +0100
Message-ID: <20170131213132.GC872@mithrandir.ba.sec>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com>
 <588FD3C3.7080508@samsung.com> <20170131085449.GA19348@ulmo.ba.sec>
 <20170131143853.GU20076@art_vandelay>
 <20170131150226.GB4519@ulmo.ba.sec>
 <87r33j85ap.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1784668479=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <87r33j85ap.fsf@eliezer.anholt.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Eric Anholt <eric@anholt.net>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Donghwa Lee <dh09.lee@samsung.com>, linux-kernel@vger.kernel.org, andi.shyti@samsung.com, jh80.chung@samsung.com, cw00.choi@samsung.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, Hyungwon Hwang <human.hwang@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1784668479==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline


--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 10:15:10AM -0800, Eric Anholt wrote:
> Thierry Reding <thierry.reding@gmail.com> writes:
>=20
> > [ Unknown signature status ]
> > On Tue, Jan 31, 2017 at 09:38:53AM -0500, Sean Paul wrote:
> >> On Tue, Jan 31, 2017 at 09:54:49AM +0100, Thierry Reding wrote:
> >> > On Tue, Jan 31, 2017 at 09:01:07AM +0900, Inki Dae wrote:
> >> > >=20
> >> > >=20
> >> > > 2017=EB=85=84 01=EC=9B=94 24=EC=9D=BC 10:50=EC=97=90 Hoegeun Kwon =
=EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> >> > > > Dear Thierry,
> >> > > >=20
> >> > > > Could you please review this patch?
> >> > >=20
> >> > > Thierry, I think this patch has been reviewed enough but no comment
> >> > > from you. Seems you are busy. I will pick up this.
> >> >=20
> >> > Sorry, but that's not how it works. This patch has gone through 8
> >> > revisions within 4 weeks, and I tend to ignore patches like that unt=
il
> >> > the dust settles.
> >> >=20
> >>=20
> >> Seems like the dust was pretty settled. It was posted on 1/11, pinged =
on 1/24,
> >> and picked up on 1/31. I don't think it's unreasonable to take it thro=
ugh
> >> another tree after that.
> >>=20
> >> I wonder if drm_panel would benefit from the -misc group maintainershi=
p model
> >> as drm_bridge does. By spreading out the workload, the high-maintenance
> >> patches would hopefully find someone to shepherd them through.
> >
> > Except that nobody except me really cares. If we let people take patches
> > through separate trees or group-maintained trees they'll likely go in
> > without too much thought. DRM panel is somewhat different from core DRM
> > in this regard because its infrastructure is minimal and there's little
> > outside the panel-simple driver. So we're still at a stage where we need
> > to fine-tune what drivers should look like and how we can improve.
>=20
> I would love to care and participate in review, but with the structure
> of your tree you're the only one whose review counts, so I don't
> participate.

Really? What exactly do you think is special about the structure of my
tree? I require patches to be on dri-devel (I pick them up from the
patchwork instance at freedesktop.org), the tree is publicly available
and reviewed-by tags get picked up automatically by patchwork.

The panel tree works exactly like any other maintainer tree. And my
review is *not* the only one that counts. I appreciate every Reviewed-by
tag I see on panel patches because it means that I don't have to look as
closely as I have to otherwise.

It is true that I am responsible for those patches, that's why I get to
have the final word on whether or not a patch gets applied. And that's
no different from any other maintainer tree either.

> As is, I'm stuck out here with my panel driver I submitted on December
> 14th completely ignored, and no other developer will look at it because
> their review doesn't count and only yours does.

That's the same lame excuse as above. Nobody's keeping you or anyone
else from reviewing panel patches.

The truth is that reviewing code is hard and time-consuming, and that's
why nobody can be bothered to do it. That has nothing whatsoever to do
with how any specific maintainer operates.

> I would love for drm-panel to be moved under -misc.

Like that's going to magically motivate people to spend their time
reviewing other patches. The only thing that group maintainership adds
is redundancy.

Thierry

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliRAjAACgkQ3SOs138+
s6HGeA/8C9dz2A5XIEgLz/15UPM5GpWHoS9YcP7HKzYeFkYQbo+A2ZMvjz5Y+kSw
GOYKl0KuEvA0fg+FTmL1hLVxuonU00N5xXx8vNI/0kNvyww5GuhoMIJk6aTvCXy7
uAZFi5QUYyYQSKYbwEkLpIirYSSOeXgU3PBwbNBN0RREvvgMs+3KXb8usg2AJG+9
O/NkAQryWcn9t89wSYOY9BlS+Ec1wVypcFw2kLUCOMAd2oRj5fiF6Kl3vIdR5lu3
J5VlRWW4COLbqkRtEMYZEdy38neVCf4SigQqjyafG7Zbbc3821fGl/tcVKf8fwLv
5WvAi4XCbPTJ+6N8EdY2t2B0RZdeCIa519sqfK3vT2jIQZ1csVIbR+Y4wola3mw8
aWPN7vOiNrKpvo5GLpCdzMsGx2BFXglIbqW+JwG6/3JWfu9W22psjOgiWrqQrdOD
eCHXSt4itckeEW6R/vd18H7LIftXnTmDoZwi3+wOmpBVNt2jMZztbWPJjtTvN+Wn
BhR+zcMkPgz0WiuAYAfY8ma6kbfnnL9fQb0e51A3Xm369TWqlxh1UBCPw2jr3ulb
5lCzardRuOHhzp4Kiyt1EzhXDWaBRxnAVzQ2eQP6hiZPG9Fi7MIYSv96HizyYlNv
8ySrEtzCvN6Cqj/wzX27bkRbfqlc0TAyIqPDt7l9cPum/cd0vFo=
=yv2s
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--

--===============1784668479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1784668479==--
