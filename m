From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/7] drm/exynos: HDMI and DECON fixes and enhancements
Date: Thu, 24 Mar 2016 10:07:39 +0900
Message-ID: <56F33DDB.70401@samsung.com>
References: <1458738918-32054-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48899 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750827AbcCXBHn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 21:07:43 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O4I00G7RR4SM0A0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Mar 2016 10:07:40 +0900 (KST)
In-reply-to: <1458738918-32054-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

Hi Andrzej,

2016=EB=85=84 03=EC=9B=94 23=EC=9D=BC 22:15=EC=97=90 Andrzej Hajda =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> Hi Inki,
>=20
> This set of patches provides set of different fixes and enhancements
> for DECON -> HDMI path. It is based on:
> - my HDMI patches which are not yet merged[1], could you look at them
>   by the way, they were posted about 5 months ago :)

Oops, really sorry. Will have a review ASAP.

Thanks,
Inki Dae

> - IOMMU patches by Marek (for some mysterious reason HDMI path on 543=
3
>   works only with IOMMU enabled),
> - latest exynos-drm-next patches.
>=20
> [1]: http://permalink.gmane.org/gmane.comp.video.dri.devel/140109
>=20
> Regards
> Andrzej
>=20
>=20
> Andrzej Hajda (7):
>   drm/exynos/hdmi: fix PHY configuration sequence
>   drm/exynos/hdmi: add PHY power off signal handling
>   drm/exynos/hdmi: add core reset code
>   drm/exynos/hdmi: remove registry dump
>   drm/exynos/decon5433: fix DECON standalone update
>   drm/exynos/decon5433: reset decon on start
>   drm/exynos/decon5433: do not protect window in plane disable
>=20
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  22 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c          | 293 ++--------------=
----------
>  2 files changed, 29 insertions(+), 286 deletions(-)
>=20
