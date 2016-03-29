From: Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: [PATCH 0/3] drm/exynos: Kconfig dependency fixes
Date: Tue, 29 Mar 2016 10:46:11 +0900
Message-ID: <56F9DE63.6050808@samsung.com>
References: <1459214937-18686-1-git-send-email-javier@osg.samsung.com>
Reply-To: sw0312.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39739 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751322AbcC2BqP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Mar 2016 21:46:15 -0400
In-reply-to: <1459214937-18686-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org

Hi Javier,

On 2016=EB=85=84 03=EC=9B=94 29=EC=9D=BC 10:28, Javier Martinez Canilla=
s wrote:
> Hello Inki,
>=20
> This patch series contains some fixes for the Kconfig symbol dependen=
cies
> of the Exynos DRM driver. They make sure that the Exynos DRM componen=
ts
> and the media platform drivers that makes use of the same HW IP block=
 are
> not enabled at the same time.
>=20
> Best regards,
> Javier
>=20
>=20
> Javier Martinez Canillas (3):
>   drm/exynos: Use VIDEO_SAMSUNG_S5P_G2D=3Dn as G2D Kconfig dependency
>   drm/exynos: Use VIDEO_SAMSUNG_EXYNOS_GSC=3Dn as GSC Kconfig depende=
ncy
>   drm/exynos: Make DRM_EXYNOS_FIMC depend on VIDEO_S5P_FIMC=3Dn

In G2D case, there is only one instance, but for the other cases, there
are several instances and in my environment, I enable both drivers on
v4l2 and drm FIMC/GSC.

So, IMHO, the not-enabled v4l2 dependency is not really required for dr=
m
fimc and drm gsc.

Best Regards,
- Seung-Woo Kim

>=20
>  drivers/gpu/drm/exynos/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20

--=20
Seung-Woo Kim
Samsung Software R&D Center
--
