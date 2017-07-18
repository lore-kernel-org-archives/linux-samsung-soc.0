From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 4/4] drm/sun4i: make sure we don't have a commit pending
Date: Tue, 18 Jul 2017 09:07:32 +0200
Message-ID: <20170718070732.ogoyc2fjcxoqbgj5@flea>
References: <cover.75b0c7f741ed33015a7ad44941bed1f6152a48a9.1499956639.git-series.maxime.ripard@free-electrons.com>
 <a6dfec7ea3598c64f6653e9b8b5febac79172341.1499956639.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v64KnB_zU0yk7MsGr9WRK1wpWq1xOj_cNuQ4mSQJeAGarw@mail.gmail.com>
 <20170717065504.xnahsboer3fh4k3i@flea>
 <CAGb2v676F2ye7fDUSFwzWMxd8rF7_5YAxn+u+MNG-U2PuaDDoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="l73pifmvc5vmxq5r"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v676F2ye7fDUSFwzWMxd8rF7_5YAxn+u+MNG-U2PuaDDoQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>, open list:ARM/SHMOBILE A
List-Id: linux-samsung-soc@vger.kernel.org


--l73pifmvc5vmxq5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2017 at 02:57:19PM +0800, Chen-Yu Tsai wrote:
> On Mon, Jul 17, 2017 at 2:55 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Fri, Jul 14, 2017 at 04:56:01PM +0800, Chen-Yu Tsai wrote:
> >> Hi,
> >>
> >> On Thu, Jul 13, 2017 at 10:41 PM, Maxime Ripard
> >> <maxime.ripard@free-electrons.com> wrote:
> >> > In the earlier display engine designs, any register access while a c=
ommit
> >> > is pending is forbidden.
> >> >
> >> > One of the symptoms is that reading a register will return another, =
random,
> >> > register value which can lead to register corruptions if we ever do a
> >> > read/modify/write cycle.
> >>
> >> Alternatively, if changes to the backend (layers) are guaranteed to ha=
ppen
> >> while the CRTC is disabled (which seems to be the case after looking at
> >> drm_atomic_helper_commit_planes and drm_atomic_helper_commit_tail), we
> >> could just turn on register auto-commit all the time and not deal with
> >> this.
> >
> > As far as I understand, it will only be the case if we need a new
> > modeset or we changed the active CRTC or connectors. But if you change
> > only the format, buffers or properties it won't be the case, and we'll
> > need to commit.
>=20
> So in other words, if someone were to use it for actual compositing and
> moved the upper composited layer around, we would need commit support to =
be
> safe.
>
> Sounds more or less like something a video player would do.

Not only that. A change of buffer will happen every frame or so, and
we can change the format whenever we want too (even if it's usually
going to be in sync with a new buffer). Changing a property can happen
any time too (like zpos for example).

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--l73pifmvc5vmxq5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbbO0AAoJEBx+YmzsjxAg/OAP/RMCNIvJPl/njc4Dd4RQpKgC
Qk8ov27HknbG25KuXSdoaUGQDb1+x+ehDrqqp0/sqQQ4L7dhvHrfMGA+z2ZZnQHY
I7rdvJWVFbLY1oYNMntltnoTyDM6DOWi64hbmzuvXKHkOnyxbdY47KQPaPfW5MIV
H48tnb3IT3HAJp6Tms3fAsaHlYnJ6fLGKCRX5WiudyXF7QLLhy87J2YYELnMVg+V
FJpKpjEBuJak33mxIJ9jUUaZoradCHswMGmUKF3goZEczOtbRWoD+0x/C2ePmjFy
c6147eAA+qeSplKj9omFR3M0lAgJ4mFpAEbrvHzNghmacq+1Cd67mRIqBYUX1NVQ
/xhqGZeFfojOMBrLycmI9OV5qrpk9rtpzyxG8RBHPCgivAwMciXJlMCkr73VPNkn
7Ab9tVZmMVid8jvq6sy51Vs0NMaPo2FiBcft+w3Ha9MoW31V4Ds52AUJCVhwh0Jk
+f4KSTkNK9u1uRaXYElmkwjAVy4mPOjArzdMEAHzg1mYQCmlyhksmBnLV+eHtyy4
PHkTKELQRYHGqWBID6ilut1fGsXtPidFnJzmQslDqxL9+32+b2pCM0Yx3LzQhyUP
wEqMXwSlfoqPyp9pYz5P8s2tjdcAcMjuCchy7y2L3qh+El/gOkFr9RNhDr3lImzO
9F6GwptfS5uUYoOQYXIl
=dH7D
-----END PGP SIGNATURE-----

--l73pifmvc5vmxq5r--
