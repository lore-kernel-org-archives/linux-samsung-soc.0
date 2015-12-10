From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 03/22] drm/exynos: gsc: add device tree support and
 remove usage of static mappings
Date: Thu, 10 Dec 2015 15:55:05 +0900
Message-ID: <566921C9.7020308@samsung.com>
References: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
 <1448891617-18830-4-git-send-email-m.szyprowski@samsung.com>
 <56692049.9050709@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:30507 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753069AbbLJGzP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Dec 2015 01:55:15 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NZ400CEWR801S70@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Dec 2015 06:55:12 +0000 (GMT)
In-reply-to: <56692049.9050709@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

On 10.12.2015 15:48, Inki Dae wrote:
> CCing Mr. Kukjin and Krzysztof
>=20
>=20
> Hi Kukjin and Krzysztof,
>=20
> Below patch includes dt binding about gsc device but it'd be nice thi=
s patch to exynos drm tree with others.
> So could you give me Acked-by so that I can merge it to exynos drm tr=
ee?
>=20
> Thanks,
> Inki Dae
>=20
> 2015=EB=85=84 11=EC=9B=94 30=EC=9D=BC 22:53=EC=97=90 Marek Szyprowski=
 =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> From: Seung-Woo Kim <sw0312.kim@samsung.com>
>>
>> This patch adds device tree support for exynos_drm_gsc. This patch
>> also fixed build issue on non-Exynos platforms, thus dependency on
>> !ARCH_MULTIPLATFORM can be now removed. The driver cannot be used
>> simultaneously with V4L2 Mem2Mem GScaller driver thought.
>>
>> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
>> [updated commit message, removed the need for wb-lcd property, becau=
se
>> all gscallers have support for lcd writeback, replaced dependency on
>> !ARCH_MULTIPLATFORM with !VIDEO_SAMSUNG_EXYNOS_GSC]
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  .../devicetree/bindings/media/exynos5-gsc.txt      |  4 +++
>>  drivers/gpu/drm/exynos/Kconfig                     |  2 +-
>>  drivers/gpu/drm/exynos/exynos_drm_gsc.c            | 30 +++++++++++=
++++++++---
>>  drivers/gpu/drm/exynos/regs-gsc.h                  |  4 +--
>>  4 files changed, 33 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/exynos5-gsc.txt=
 b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
>> index 0604d42f38d1..5fe9372abb37 100644
>> --- a/Documentation/devicetree/bindings/media/exynos5-gsc.txt
>> +++ b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
>> @@ -7,6 +7,10 @@ Required properties:
>>  - reg: should contain G-Scaler physical address location and length=
=2E
>>  - interrupts: should contain G-Scaler interrupt number
>> =20
>> +Optional properties:
>> +- samsung,sysreg: handle to syscon used to control the system regis=
ters to
>> +  set writeback input and destination
>> +
>>  Example:
>> =20
>>  gsc_0:  gsc@0x13e00000 {


Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
