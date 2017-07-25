From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/4] drm/atomic: implement
 drm_atomic_helper_commit_tail for runtime_pm users
Date: Tue, 25 Jul 2017 08:57:34 +0200
Message-ID: <20170725065734.kbtb2mrfsjwm2szz@flea>
References: <cover.204b8c1b76558ee33ecf147e51c2b6a04d302d55.1500555652.git-series.maxime.ripard@free-electrons.com>
 <a8f92dc70048bab746e94dadd1c23200626aff60.1500555652.git-series.maxime.ripard@free-electrons.com>
 <20170720184628.5vizn7hjdaaz7rqy@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="26cvhe4wesa4iglx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170720184628.5vizn7hjdaaz7rqy@phenom.ffwll.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org


--26cvhe4wesa4iglx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Thu, Jul 20, 2017 at 08:46:28PM +0200, Daniel Vetter wrote:
> On Thu, Jul 20, 2017 at 03:01:16PM +0200, Maxime Ripard wrote:
> > The current drm_atomic_helper_commit_tail helper works only if the CRTC=
 is
> > accessible, and documents an alternative implementation that is suppose=
d to
> > be used if that happens.
> >=20
> > That implementation is then duplicated by some drivers. Instead of
> > documenting it, let's implement an helper that all the relevant users c=
an
> > use directly.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> Should I throw this into drm-misc, or do you want to merge this through
> some driver tree?

Yes, you can put them in drm-misc, it will the be the easiest option.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--26cvhe4wesa4iglx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZduveAAoJEBx+YmzsjxAgm6oP/1DwCy48Y1XdDytrb+iB2sGF
Cba/gXGWgi8yTN34QilwH2fNmES56+qAUmQqjm5htwGwHbs4tHEdCm4aWuDtnvEQ
dYf6AP1I75BsJGSpKZ0CHxRFpUAGx0pA2dkPJLpgzHtLxAves46uMPmMtGLW4qrO
5kx0J2ou99LbvYk+Nwgwn82pDax9htFtubWzTGPqlbtf1m3/RHGQ73KrgF58zS8N
wNuo9Kt45Sf/tZLU/E0A9osJKpFr4w09xJGUYW+s4Jtgyv7olW6VHNHlJcWUtZ6c
pQeXZH1y2dtwhbNwn7cgRmWwY3ZEMKMaw+DfqVM/NKHWhFwkyDdu24sBCRtWGoTo
VuQc3XsILhS8ESL/wHEkJHElcbpQt2zp7hBkjahl50uvMgvZQM0O1qR8F3MnGvvG
6eJzi/dgONvDNawdLM6yOenwT0bzh1poLRbWRQPXaD6CHRHmMQkrfqgdFa0/o8HA
Er1rKaaluTbGQ1q/wijbUBlRWDL6Q1kgfIHLJFWmdXcPkuEU5VmJI7e2sa9qqHLh
os6FXFal7A1LDd7RhUF2fLapaRgUIQwyFlmN9Baymd+gqXind5J2HCw/Wcm9FiWt
peEyGPAGy9Ogx/1HkFez964I3aydq0Mkz7mIxIQrhQIq4n/hGm94Qkd34QK4LvyZ
KzMz1G3BGdTZOUbdv3YW
=nfr2
-----END PGP SIGNATURE-----

--26cvhe4wesa4iglx--
