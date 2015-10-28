From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 0/7] add atomic_check callback to exynos_crtc
Date: Wed, 28 Oct 2015 14:57:28 +0900
Message-ID: <563063C8.2040202@samsung.com>
References: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
 <563026D7.307@samsung.com> <56305D91.4040402@samsung.com>
 <56305F44.405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57117 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752803AbbJ1F5g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 01:57:36 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWX004LF1VYV720@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Oct 2015 05:57:34 +0000 (GMT)
In-reply-to: <56305F44.405@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

On 28.10.2015 14:38, Krzysztof Kozlowski wrote:
> On 28.10.2015 14:30, Inki Dae wrote:
>>
>>
>> 2015=EB=85=84 10=EC=9B=94 28=EC=9D=BC 10:37=EC=97=90 Krzysztof Kozlo=
wski =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>> On 26.10.2015 21:03, Andrzej Hajda wrote:
>>>> Hi Inki,
>>>>
>>>> This patchset removes hacky mode validation in Mixer driver by add=
ing
>>>> atomic_check callback to exynos_crtc and replacing direct function=
 call
>>>> with DRM framework validation. As a result HDMI driver does not de=
pend anymore
>>>> on MIXER driver and both drivers can be selected with different Kc=
onfig options,
>>>> it is usefull especially for latests SoCs which do have HDMI IP bu=
t do not have
>>>> MIXER IP.
>>>> Additionally patchset performs small Kconfig refactoring.
>>>>
>>>> Krzysztof could you look at exynos_defconfig patch. Maybe it would=
 be good
>>>> to merge it before next patch to allow full bi-sectability :)
>>>
>>> I would be happy to see similar for multi_v7. HDMI is already there=
=2E
>>>
>>> I also wonder why actually DRM_EXYNOS_HDMI has to depend on MIXER o=
r DECON?
>>
>> DECON controller has two kinds of data paths in case of Exynos5433 o=
r later.
>> One is Display path and other is TV path. So it'd be reasonable for =
DRM_EXYNOS_HDMI to depend on MIXER or DECON -
>> TV path of DECON controller transfers Display data to HDMI like MIXE=
R IP of previous Exynos SoC did.
>=20
> So this is not a build-time dependency but rather runtime? What will
> happen if HDMI is compiled and enabled (for example in DTB) but there
> will be no DECON nor MIXER compiled in?
>=20

Okay, I received the explanation off-line. :)

The solution looks good to me, I'll give the respective tags for
individual patches (please submit also multi_v7).

Best regards,
Krzysztof
