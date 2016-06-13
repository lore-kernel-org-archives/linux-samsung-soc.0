From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: don't use HW trigger for Exynos5420/5422/5800
Date: Mon, 13 Jun 2016 10:38:17 +0900
Message-ID: <575E0E89.40400@samsung.com>
References: <CGME20160602142058epcas1p4f26bc6ab2acd0012962f90bb2c6c4141@epcas1p4.samsung.com>
 <1464877210-27207-1-git-send-email-javier@osg.samsung.com>
 <5758A58D.7050106@samsung.com>
 <6e24059d-16f3-210a-8dd2-f8dcb89213a1@osg.samsung.com>
 <5759EF32.5040302@samsung.com>
 <CABxcv=nuw7ZUF0bDC1PZfP0WVQhRY3HSoO5LdwT8_FvNi9N+aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55640 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933059AbcFMBiU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 Jun 2016 21:38:20 -0400
In-reply-to: <CABxcv=nuw7ZUF0bDC1PZfP0WVQhRY3HSoO5LdwT8_FvNi9N+aQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Kukjin Kim <kgene@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, David Airlie <airlied@linux.ie>, Joonyoung Shim <jy0922.shim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>



2016=EB=85=84 06=EC=9B=94 10=EC=9D=BC 09:24=EC=97=90 Javier Martinez Ca=
nillas =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> Hello Inki,
>=20
> On Thu, Jun 9, 2016 at 6:35 PM, Inki Dae <inki.dae@samsung.com> wrote=
:
>=20
> [snip]
>=20
>>> I know that removing .trg_type is enough but I also removed those l=
ines
>>> because the fields are not used if .trg_type !=3D I80_HW_TRG. So th=
ere is
>>> no point to leave a set for unused fields.
>>>
>>> We can latter add those one HW trigger support is fixed for Exynos5=
420.
>>>
>>
>> As of now, I can merge it but I think it would be not reasonable sol=
ution because potential problem still exists even we use SW trigger mod=
e in default - ie., in case of using HW trigger mode at bootloader, sam=
e problem would happen as long as we don't support PSR mode support.
>>
>=20
> Yes, I understand that the problem will show again if the bootloader
> uses HW trigger mode and that we need proper Panel Self Refresh
> support but I think that's a separate issue. That's why I said that
> those can be addressed for v4.8 but revert to SW trigger for v4.7 as =
a
> short term fix for the regression.
>=20
> In other words, enabling HW trigger mode breaks the display for the
> Exynos5420 and Exynos5800 Peach Pi Chromebooks with the shipped
> bootloaders (which are probably the most popular Exynos5 devices with
> display and mainline support so is likely to affect users).

I thought to add PSR support somehow but put me other things to trouble=
=2E
Anyway, we could support it later so picked it up.

Thanks,
Inki Dae

>=20
> Best regards,
> Javier
>=20
>=20
>=20
