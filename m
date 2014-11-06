From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] drm/exynos: resolve infinite loop issue on multi-platform
Date: Thu, 06 Nov 2014 14:00:17 +0100
Message-ID: <1415278817.21639.2.camel@AMDC1943>
References: <1415269965-427-1-git-send-email-inki.dae@samsung.com>
 <545B656F.40401@samsung.com> <545B6A62.7060305@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:24816 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750926AbaKFNAW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Nov 2014 08:00:22 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NEM002M6C9BA760@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Nov 2014 13:03:11 +0000 (GMT)
In-reply-to: <545B6A62.7060305@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

On czw, 2014-11-06 at 21:32 +0900, Inki Dae wrote:
> On 2014=EB=85=84 11=EC=9B=94 06=EC=9D=BC 21:11, Krzysztof Koz=C5=82ow=
ski wrote:
> > On 06.11.2014 11:32, Inki Dae wrote:
> >> This patch resolves temporarily infinite loop issue incurred
> >> when Exynos drm driver is enabled and multi-platform kernel
> >> is used by registering Exynos drm device object only in case
> >> of Exynos SoC. So this patch will be replaced with more generic
> >> way later.
> >=20
> > Does not help for Rinato board.
> >=20
> > On Rinato:
> > -----------------------
> > Failed to find PMU node
> > Registering SWP/SWPB emulation handler
> > mmc0: BKOPS_EN bit is not set
> > mmc_host mmc0: Bus speed (slot 0) =3D 100000000Hz (slot req 1000000=
00Hz,
> > actual 100000000HZ div =3D 0)
> > exynos-drm-ipp exynos-drm-ipp: drm ipp registered successfully.
> > mmc0: new HS200 MMC card at address 0001
> > platform exynos-drm: Driver exynos-drm requests probe deferral
> > mmcblk0: mmc0:0001 F5X5MA 3.64 GiB
> > mmcblk0boot0: mmc0:0001 F5X5MA partition 1 4.00 MiB
> > exynos-drm-ipp exynos-drm-ipp: drm ipp registered successfully.
> > mmcblk0boot1: mmc0:0001 F5X5MA partition 2 4.00 MiB
> > platform exynos-drm: Driver exynos-drm requests probe deferral
> > mmcblk0rpmb: mmc0:0001 F5X5MA partition 3 512 KiB
> > exynos-drm-ipp exynos-drm-ipp: drm ipp registered successfully.
> > platform exynos-drm: Driver exynos-drm requests probe deferral
> >  mmcblk0: p1 p2 p3 p4 p5 p6 p7
> > exynos-drm-ipp exynos-drm-ipp: drm ipp registered successfully.
> > platform exynos-drm: Driver exynos-drm requests probe deferral
> > exynos-drm-ipp exynos-drm-ipp: drm ipp registered successfully.
> > platform exynos-drm: Driver exynos-drm requests probe deferral
> >=20
> > and so on...
> > -----------------------
>=20
> Can you show me compatible string placed on top of exynos3250-rinato.=
dts
> file? If the compatible has "samsung,exynos3" it should be no problem
> with this patch. And the rinato dts file we posted to mainline has th=
e
> compatible string.

model =3D "Samsung Rinato board";
compatible =3D "samsung,rinato-rev05", "samsung,exynos3250",
"samsung,exynos3";

The problem is "samsung,exynos3" because the patch solves only issue on
multiplatform kernel run on non-exynos board. It does not solve the
problem on exynos board with DRM enabled but without all drivers.


> >=20
> > I do not know whether it is related but Trats2 board cannot boot du=
e to
> > lockup after:
> > [drm] Initialized drm 1.1.0 20060810
> > (with or without the patch)
> > https://lkml.org/lkml/2014/11/6/125
> >=20
>=20
> hmm... it's strange because my trats2 board works well with this patc=
h.
> Which kernel did you test? And how can I reproduce above lockup?

Just boot up next-2014110{456} with kernel config attached in mentioned
email.

Best regards,
Krzysztof
