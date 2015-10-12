From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 00/16] drm/exynos/hdmi: refactoring/cleanup patches
Date: Mon, 12 Oct 2015 22:26:50 +0900
Message-ID: <561BB51A.2050307@samsung.com>
References: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:41609 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751801AbbJLN0w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Oct 2015 09:26:52 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NW402CRV00RLP60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Oct 2015 22:26:51 +0900 (KST)
In-reply-to: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Andrzej,

=46or all patches, merged excepting patch 2 which cleans up dt binding
document.

Thanks,
Inki Dae

2015=B3=E2 09=BF=F9 25=C0=CF 21:48=BF=A1 Andrzej Hajda =C0=CC(=B0=A1) =BE=
=B4 =B1=DB:
> Hi,
>=20
> This is another set of cleanup/improvement patches for HDMI.
>=20
> The patchset is based on exynos-drm-next.
> It was tested on Universal and Odroid U3.
>=20
> Regards
> Andrzej
>=20
>=20
> Andrzej Hajda (15):
>    drm/exynos/hdmi: remove support for deprecated compatible
>    dt-bindings: remove deprecated compatible string from exynos-hdmi
>    drm/exynos/hdmi: use mappings for registers with IP dependent addr=
ess
>    drm/exynos/hdmi: move PLL stabilization check code to separate
>      function
>    drm/exynos/hdmi: simplify HDMI-PHY power sequence
>    drm/exynos/hdmi: replace all writeb with writel
>    drm/exynos/hdmi: fix removal order
>    drm/exynos/hdmi: use optional regulator_get for hdmi-en
>    drm/exynos/hdmi: use constant size array for regulators
>    drm/exynos/hdmi: simplify clock re-parenting
>    drm/exynos/hdmi: convert to gpiod API
>    drm/exynos/hdmi: remove deprecated hdmi_resources structure
>    drm/exynos/hdmi: convert container_of macro to inline function
>    drm/exynos/hdmi: improve HDMI/ACR related code
>    drm/exynos/hdmi: remove unused field
>=20
> Tomasz Stanislawski (1):
>    drm: exynos: mixer: fix using usleep() in atomic context
>=20
>   .../devicetree/bindings/video/exynos_hdmi.txt      |   7 +-
>   drivers/gpu/drm/exynos/exynos_hdmi.c               | 491 +++++++---=
-----------
>   drivers/gpu/drm/exynos/exynos_mixer.c              |   2 +-
>   drivers/gpu/drm/exynos/regs-hdmi.h                 |  33 +-
>   4 files changed, 189 insertions(+), 344 deletions(-)
>=20
