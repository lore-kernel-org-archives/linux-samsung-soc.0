From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver
 on TM2 board
Date: Wed, 1 Feb 2017 15:52:49 +0100
Message-ID: <20170201145249.GB17698@ulmo.ba.sec>
References: <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com>
 <588FD3C3.7080508@samsung.com> <20170131085449.GA19348@ulmo.ba.sec>
 <20170131143853.GU20076@art_vandelay>
 <20170131150226.GB4519@ulmo.ba.sec>
 <87r33j85ap.fsf@eliezer.anholt.net>
 <20170131213132.GC872@mithrandir.ba.sec>
 <87d1f2kfgi.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2083378738=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <87d1f2kfgi.fsf@eliezer.anholt.net>
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


--===============2083378738==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 02:54:53PM -0800, Eric Anholt wrote:
> Thierry Reding <thierry.reding@gmail.com> writes:
>=20
> > [ Unknown signature status ]
> > On Tue, Jan 31, 2017 at 10:15:10AM -0800, Eric Anholt wrote:
> >> Thierry Reding <thierry.reding@gmail.com> writes:
> >>=20
> >> > [ Unknown signature status ]
> >> > On Tue, Jan 31, 2017 at 09:38:53AM -0500, Sean Paul wrote:
> >> >> On Tue, Jan 31, 2017 at 09:54:49AM +0100, Thierry Reding wrote:
> >> >> > On Tue, Jan 31, 2017 at 09:01:07AM +0900, Inki Dae wrote:
> >> >> > >=20
> >> >> > >=20
> >> >> > > 2017=EB=85=84 01=EC=9B=94 24=EC=9D=BC 10:50=EC=97=90 Hoegeun Kw=
on =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> >> >> > > > Dear Thierry,
> >> >> > > >=20
> >> >> > > > Could you please review this patch?
> >> >> > >=20
> >> >> > > Thierry, I think this patch has been reviewed enough but no com=
ment
> >> >> > > from you. Seems you are busy. I will pick up this.
> >> >> >=20
> >> >> > Sorry, but that's not how it works. This patch has gone through 8
> >> >> > revisions within 4 weeks, and I tend to ignore patches like that =
until
> >> >> > the dust settles.
> >> >> >=20
> >> >>=20
> >> >> Seems like the dust was pretty settled. It was posted on 1/11, ping=
ed on 1/24,
> >> >> and picked up on 1/31. I don't think it's unreasonable to take it t=
hrough
> >> >> another tree after that.
> >> >>=20
> >> >> I wonder if drm_panel would benefit from the -misc group maintainer=
ship model
> >> >> as drm_bridge does. By spreading out the workload, the high-mainten=
ance
> >> >> patches would hopefully find someone to shepherd them through.
> >> >
> >> > Except that nobody except me really cares. If we let people take pat=
ches
> >> > through separate trees or group-maintained trees they'll likely go in
> >> > without too much thought. DRM panel is somewhat different from core =
DRM
> >> > in this regard because its infrastructure is minimal and there's lit=
tle
> >> > outside the panel-simple driver. So we're still at a stage where we =
need
> >> > to fine-tune what drivers should look like and how we can improve.
> >>=20
> >> I would love to care and participate in review, but with the structure
> >> of your tree you're the only one whose review counts, so I don't
> >> participate.
> >
> > Really? What exactly do you think is special about the structure of my
> > tree? I require patches to be on dri-devel (I pick them up from the
> > patchwork instance at freedesktop.org), the tree is publicly available
> > and reviewed-by tags get picked up automatically by patchwork.
> >
> > The panel tree works exactly like any other maintainer tree. And my
> > review is *not* the only one that counts. I appreciate every Reviewed-by
> > tag I see on panel patches because it means that I don't have to look as
> > closely as I have to otherwise.
> >
> > It is true that I am responsible for those patches, that's why I get to
> > have the final word on whether or not a patch gets applied. And that's
> > no different from any other maintainer tree either.
>=20
> If me reviewing a patch isn't part of unblocking that patch getting in,
> then I won't bother because all I could end up doing is punishing the
> developer of the patch.  Contributors have a hard enough time already.

Maybe you should go and read my previous reply again more carefully.
Perhaps then you'll realize that reviews are in fact helping in getting
patches merged.

Interestingly my inbox doesn't show you ever bothering to review panel
patches, so maybe you should be more careful about your assumptions.

Thierry

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliR9kEACgkQ3SOs138+
s6Gj0xAAinLKUivC7pzazVn7KxANbbJQwmFFiW0sDZHg4H/2e8oh743j/FG7M+vs
22lhJf/suHeZXxq/7ws16xCgwVRcp6a06vB4aTDVVagREDZO8GSdS9ycZnXkEmTG
kWOTbBnmufrqSSuLCcag1bnDMcs5Fxl0GhZrs7egwbPKFUHgHE1v/1cCD+oF1lqH
lymTkgjknpndYNkAl3+hnDYac3BQL73onYjDkB+G7yHF2646MzcB3OkjMQBRhcbb
OUWQkIqe+GGx/OLeJUaDdonOtV3+c2F+NyYboGM8lZSUQTXaEOhxBsiE5x7dl/zB
Ktz5f+wBuAH/THD3VGWSjEG7vs5a3Bx6D3gm5aYhgGqvk31EtVEljOJ+EnX54um2
SXQdG36tZfPzxT/z07rlk43ZzqiGGoYniOAfNDd2xvormEEYyJiv1E4yEOWxNE3S
dys2G9VsWqTXGzvIA/aF5lI3A7WAR/JzRmC+A73fQSrPNcu5qaVfbi8V0HIdKpSG
oim5yddRhyrwzAUFms0PGC1sHrmnSf0hdmR/rehsokbwvcjl6hbviF02w9qTtDiy
ATtI1DUPzBEfujB18jHp95l2zkmVTTlz3PQEzDqf9rBpKmhyJKW635bsmQmZ7uU3
jScoKsyLTJZo1X+MRlU5wld6EfD8tF86tHWTkPcPEtUKDsJPIrc=
=RuYQ
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--

--===============2083378738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2083378738==--
