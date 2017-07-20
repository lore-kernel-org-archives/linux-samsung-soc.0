From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 4/4] drm/sun4i: make sure we don't have a commit pending
Date: Thu, 20 Jul 2017 11:53:39 +0200
Message-ID: <20170720095339.lkyufn6qq5rnra4n@flea>
References: <cover.75b0c7f741ed33015a7ad44941bed1f6152a48a9.1499956639.git-series.maxime.ripard@free-electrons.com>
 <a6dfec7ea3598c64f6653e9b8b5febac79172341.1499956639.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v64KnB_zU0yk7MsGr9WRK1wpWq1xOj_cNuQ4mSQJeAGarw@mail.gmail.com>
 <20170717065504.xnahsboer3fh4k3i@flea>
 <CAGb2v676F2ye7fDUSFwzWMxd8rF7_5YAxn+u+MNG-U2PuaDDoQ@mail.gmail.com>
 <20170718070732.ogoyc2fjcxoqbgj5@flea>
 <CAKMK7uGk7ncuBqCDbgeg9ai3RkuDRmQ75Jr1kAP5QCBj006cxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6pukwqvvgnlhri6j"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKMK7uGk7ncuBqCDbgeg9ai3RkuDRmQ75Jr1kAP5QCBj006cxg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Chen-Yu Tsai <wens@csie.org>, "open list:ARM/SHMOBILE ARM..." <linux-renesas-soc@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: linux-samsung-soc@vger.kernel.org


--6pukwqvvgnlhri6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, Jul 18, 2017 at 09:35:03AM +0200, Daniel Vetter wrote:
> On Tue, Jul 18, 2017 at 9:07 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Mon, Jul 17, 2017 at 02:57:19PM +0800, Chen-Yu Tsai wrote:
> >> On Mon, Jul 17, 2017 at 2:55 PM, Maxime Ripard
> >> <maxime.ripard@free-electrons.com> wrote:
> >> > On Fri, Jul 14, 2017 at 04:56:01PM +0800, Chen-Yu Tsai wrote:
> >> >> Hi,
> >> >>
> >> >> On Thu, Jul 13, 2017 at 10:41 PM, Maxime Ripard
> >> >> <maxime.ripard@free-electrons.com> wrote:
> >> >> > In the earlier display engine designs, any register access while =
a commit
> >> >> > is pending is forbidden.
> >> >> >
> >> >> > One of the symptoms is that reading a register will return anothe=
r, random,
> >> >> > register value which can lead to register corruptions if we ever =
do a
> >> >> > read/modify/write cycle.
> >> >>
> >> >> Alternatively, if changes to the backend (layers) are guaranteed to=
 happen
> >> >> while the CRTC is disabled (which seems to be the case after lookin=
g at
> >> >> drm_atomic_helper_commit_planes and drm_atomic_helper_commit_tail),=
 we
> >> >> could just turn on register auto-commit all the time and not deal w=
ith
> >> >> this.
> >> >
> >> > As far as I understand, it will only be the case if we need a new
> >> > modeset or we changed the active CRTC or connectors. But if you chan=
ge
> >> > only the format, buffers or properties it won't be the case, and we'=
ll
> >> > need to commit.
> >>
> >> So in other words, if someone were to use it for actual compositing and
> >> moved the upper composited layer around, we would need commit support =
to be
> >> safe.
> >>
> >> Sounds more or less like something a video player would do.
> >
> > Not only that. A change of buffer will happen every frame or so, and
> > we can change the format whenever we want too (even if it's usually
> > going to be in sync with a new buffer). Changing a property can happen
> > any time too (like zpos for example).
>=20
> You can upgrade any property change to an atomic modeset by e.g.
> setting connector->mode_changed (and then making sure to call
> check_modeset() helper again perhaps). This is for cases where your hw
> can't handle a property change within 1 vblank. The default is just
> the solution for most common hw.
>=20
> The other way round works too, you can clear these flags in your
> atomic_check callbacks. But that requires a bit more care (to make
> sure you never clear it when there's something else also changing that
> still needs a full modeset sequence to commit to hw).

Hmm, that's good to know, but that would imply disabling the CRTC each
time we change even a small property, with all the visual artifacts it
might imply, right?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6pukwqvvgnlhri6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZcH2jAAoJEBx+YmzsjxAggFEP/jGaqxY8H25VdipBweR+MtGT
ZCU/hyiUJCZcjWEFbueeEuxAxDAEnpRVXma/ZFYKcPRsXUC37P9oDKaWzXBFac5J
5lPPUP5uwPT/x5RlTf+Bc8j+fbHxgG+MK+XMGhkQDgzqLE4ABydQVsGf4P61kHeO
D6YP/oG6BAa0GMo8n9XM88WbT7RJLzLe0OQniu9+9veHrCSbKbnXZdQB8YGLg8pl
3FTIaJ0/jKqIeK46bd+NQts5LALxKKJIzXO+28hYyh33wE8jIb3Fc4zRVn25aFOL
DqYvMhgEkebssWOovavPOd0mqS7sJliZN76RulmDJ4xWnRdUmgwSDL4PuUfzOcna
T9Vn2UXvVbPyEFlyI3kAYv5eSZfG1Y+NMiXrNHd1UI8rORWDGvgLjpStP64ZUaYI
AkuMQuugHMQZ9DINE8fgEa9Oy1gS4GYEyo6VUKZXNPiWewu6EQjq+qqaj7YFr09m
+GUDarbEWV+9aQi8+BFxx6zrOMYVVG6SsneLediZ9M0a4M3IIE7X9/m3GGyLezds
KmvURn6BxMcW40VEV51coIpG+8OyC0OagF1kYb+EanRPxK5ADpUCRAqwzOjCerKL
D215UID3phfCdRJuOLJGwZuiBnYG1AfG3Ksgu3vNaWYn/8H/kPJlZg28L9gTH9GC
Pv3dDOSnhE9kq1xJhndb
=UVwq
-----END PGP SIGNATURE-----

--6pukwqvvgnlhri6j--
