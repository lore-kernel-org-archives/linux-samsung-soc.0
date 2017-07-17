From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 4/4] drm/sun4i: make sure we don't have a commit pending
Date: Mon, 17 Jul 2017 08:55:04 +0200
Message-ID: <20170717065504.xnahsboer3fh4k3i@flea>
References: <cover.75b0c7f741ed33015a7ad44941bed1f6152a48a9.1499956639.git-series.maxime.ripard@free-electrons.com>
 <a6dfec7ea3598c64f6653e9b8b5febac79172341.1499956639.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v64KnB_zU0yk7MsGr9WRK1wpWq1xOj_cNuQ4mSQJeAGarw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yyvplvvq5lnu33e5"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:39598 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751256AbdGQGzG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jul 2017 02:55:06 -0400
Content-Disposition: inline
In-Reply-To: <CAGb2v64KnB_zU0yk7MsGr9WRK1wpWq1xOj_cNuQ4mSQJeAGarw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>, open list:ARM/SHMOBILE A


--yyvplvvq5lnu33e5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2017 at 04:56:01PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Thu, Jul 13, 2017 at 10:41 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > In the earlier display engine designs, any register access while a comm=
it
> > is pending is forbidden.
> >
> > One of the symptoms is that reading a register will return another, ran=
dom,
> > register value which can lead to register corruptions if we ever do a
> > read/modify/write cycle.
>=20
> Alternatively, if changes to the backend (layers) are guaranteed to happen
> while the CRTC is disabled (which seems to be the case after looking at
> drm_atomic_helper_commit_planes and drm_atomic_helper_commit_tail), we
> could just turn on register auto-commit all the time and not deal with
> this.

As far as I understand, it will only be the case if we need a new
modeset or we changed the active CRTC or connectors. But if you change
only the format, buffers or properties it won't be the case, and we'll
need to commit.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--yyvplvvq5lnu33e5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbF9IAAoJEBx+YmzsjxAgitcP/AzVUYWQ/7YwScIi3w1+1y3C
NmHrSmtqH2cKCgft+K5IkbxcLNre8jaVprbTSPPuUjfz4wxyLiz1/rgmSbAt5oeE
WX9TrebgCLpnwQMiaHC2qRqIaJXHjab5h4gFRI9x8ghzX8ozqnzG8brknqaRjn5b
aHVkf4gjJ2NS75CJxNxjPoWDdbCX1+6fepPlHcBwhq+NvcMbBehybXuVQ+cktx9O
RE3ZxixHEZZFmtdc+4Laq93XcMrmEkZRimwyWs641xF5BwPtbipZpbY7lEV4+1r5
pZNSM+rZH9opaGntT10fvwTfgSnu+dcRd65ZsECNzLPmKUjWzEn7yVKgqhTDwPtX
I4FdtbW7mUnpdrIM9jPnYrvoxbcsCbebR3dPuwl8xtpqVQGGYdOBK/9lbTSuP38D
kLg/wIeZ8K/1EoYWZyhESWtw50Joqi2xjipxApmXgYjTa+PVfjo/+ywU9KrQspPQ
XhCkWAjJzXkuMBh3WR0n0DwmiAQ/TqklJBiIGmXH0O0ARbP3CkCBMB/FQ3plrLg7
bZxu/kieLSuxV5K2K6dNzoQJe/0rYHl76fr1kTUS7j8EE5d0GO1u/dY22eJ9y0je
AAeBSUdJ3ybyJptbeEf4yxggkkuY9lMKpJ5edrDQoP2/HF+0MEfaCWNINnLXlFl9
xsGcpQYVCFY91+GVpsdt
=2/Xt
-----END PGP SIGNATURE-----

--yyvplvvq5lnu33e5--
