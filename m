From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/9] drm/exynos: initialization/deinitialization fixes
Date: Wed, 17 Sep 2014 20:44:43 +0900
Message-ID: <5419742B.4090907@samsung.com>
References: <1410268573-2297-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:9092 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754786AbaIQLoz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 07:44:55 -0400
In-reply-to: <1410268573-2297-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>

On 2014=EB=85=84 09=EC=9B=94 09=EC=9D=BC 22:16, Andrzej Hajda wrote:
> This set of patches contains fixes of initialization and deinitializa=
tion
> code of exynos_drm core and components.
> It is based on exynos-drm-next branch.
>=20
> Patchset has been tested on trats and universal_c210 platforms.

Applied all patches except patch #5. As of now, it seems good to merge
also patch #5 if you couldn't post next version of that patch until the
end of this week. In this case, I will have a pull request including
that patch so that we can fix it up correctly later. Give me your
opinion if there is other plan.

Thanks,
Inki Dae

>=20
> Regards
> Andrzej
>=20
>=20
> Andrzej Hajda (9):
>   drm/exynos/ipp: traverse ipp drivers list safely
>   drm/exynos: fix drm driver de-initialization order
>   drm/exynos/fbdev: fix fbdev gem object cleanup
>   drm/exynos/fb: free exynos framebuffer on error
>   drm/exynos/crtc: fix framebuffer reference sequence
>   drm/exynos/dsi: unregister connector on removal
>   drm/exynos/dpi: unregister connector and panel on removal
>   drm/exynos/dp: unregister connector on removal
>   drm/exynos/hdmi: unregister connector on removal
>=20
>  drivers/gpu/drm/exynos/exynos_dp_core.c   | 4 +++-
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 6 ++++++
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c   | 6 +++++-
>  drivers/gpu/drm/exynos/exynos_drm_drv.c   | 8 ++++----
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c   | 9 ++++++---
>  drivers/gpu/drm/exynos/exynos_drm_fb.c    | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 3 ---
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c   | 4 ++--
>  drivers/gpu/drm/exynos/exynos_hdmi.c      | 4 +++-
>  9 files changed, 30 insertions(+), 15 deletions(-)
>=20
