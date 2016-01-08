From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/4] drm/exynos: introduce generic zpos property
Date: Fri, 08 Jan 2016 17:49:28 +0900
Message-ID: <568F7818.1020701@samsung.com>
References: <1451998373-13708-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:34860 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751314AbcAHIta convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Jan 2016 03:49:30 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O0M00DAQLUGJJ70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Jan 2016 17:49:28 +0900 (KST)
In-reply-to: <1451998373-13708-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>

Hi Marek,


2016=EB=85=84 01=EC=9B=94 05=EC=9D=BC 21:52=EC=97=90 Marek Szyprowski =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> Hello all,
>=20
> This patch series is a continuation of rework of blending support in
> Exynos DRM driver. Some background can be found here:
> http://www.spinics.net/lists/dri-devel/msg96969.html
>=20
> Daniel Vetter suggested that zpos property should be made generic, wi=
th
> well-defined semantics. This patchset is my proposal for such generic
> zpos property:
> - added zpos properties to drm core and plane state structures,
> - added helpers for normalizing zpos properties of given set of plane=
s,
> - well defined semantics: planes are sorted by zpos values and then p=
lane
>   id value if zpos equals.
>=20
> Patches 2/4 and 3/4 are fixes for Exynos DRM driver, which are requir=
ed

Picked them up. Especially, 2/4 is a good patch.

Thanks,
Inki Dae

> to properly implement generic zpos handling. However they can be also
> merged regardless of the rest of the patches (if there is a need for
> further discussion on the generic zpos property feature).
>=20
> Patches are based on top of latest exynos-drm-next branch.
>=20
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
>=20
>=20
> Patch summary:
>=20
> Marek Szyprowski (4):
>   drm: add generic zpos property
>   drm/exynos: crtc: rework atomic_{begin,flush}
>   drm/exynos: mixer: properly update all planes on the same vblank ev=
ent
>   drm/exynos: use generic code for managing zpos plane property
>=20
>  Documentation/DocBook/gpu.tmpl                | 14 +++++-
>  drivers/gpu/drm/drm_atomic.c                  |  4 ++
>  drivers/gpu/drm/drm_atomic_helper.c           | 52 +++++++++++++++++=
+++
>  drivers/gpu/drm/drm_crtc.c                    | 13 +++++
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 14 +++---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 14 +++---
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c      | 20 ++------
>  drivers/gpu/drm/exynos/exynos_drm_drv.h       | 11 ++---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 14 +++---
>  drivers/gpu/drm/exynos/exynos_drm_plane.c     | 68 +++++++----------=
----------
>  drivers/gpu/drm/exynos/exynos_mixer.c         | 53 ++++++++++++++++-=
----
>  include/drm/drm_atomic_helper.h               |  2 +
>  include/drm/drm_crtc.h                        | 13 +++++
>  13 files changed, 187 insertions(+), 105 deletions(-)
>=20
