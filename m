From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/7] add atomic_check callback to exynos_crtc
Date: Wed, 28 Oct 2015 14:30:57 +0900
Message-ID: <56305D91.4040402@samsung.com>
References: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
 <563026D7.307@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46458 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752888AbbJ1Fa7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 01:30:59 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NWX014UR0NLSK90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Oct 2015 14:30:57 +0900 (KST)
In-reply-to: <563026D7.307@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>



2015=EB=85=84 10=EC=9B=94 28=EC=9D=BC 10:37=EC=97=90 Krzysztof Kozlowsk=
i =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> On 26.10.2015 21:03, Andrzej Hajda wrote:
>> Hi Inki,
>>
>> This patchset removes hacky mode validation in Mixer driver by addin=
g
>> atomic_check callback to exynos_crtc and replacing direct function c=
all
>> with DRM framework validation. As a result HDMI driver does not depe=
nd anymore
>> on MIXER driver and both drivers can be selected with different Kcon=
fig options,
>> it is usefull especially for latests SoCs which do have HDMI IP but =
do not have
>> MIXER IP.
>> Additionally patchset performs small Kconfig refactoring.
>>
>> Krzysztof could you look at exynos_defconfig patch. Maybe it would b=
e good
>> to merge it before next patch to allow full bi-sectability :)
>=20
> I would be happy to see similar for multi_v7. HDMI is already there.
>=20
> I also wonder why actually DRM_EXYNOS_HDMI has to depend on MIXER or =
DECON?

DECON controller has two kinds of data paths in case of Exynos5433 or l=
ater.
One is Display path and other is TV path. So it'd be reasonable for DRM=
_EXYNOS_HDMI to depend on MIXER or DECON -
TV path of DECON controller transfers Display data to HDMI like MIXER I=
P of previous Exynos SoC did.

Thanks,
Inki Dae

>=20
> Best regards,
> Krzysztof
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
