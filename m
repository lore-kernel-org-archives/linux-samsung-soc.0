From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/7] drm/exynos/hdmi: add Exynos5433 support
Date: Thu, 14 Jan 2016 16:10:03 +0900
Message-ID: <569749CB.9010700@samsung.com>
References: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
 <569658CD.3090406@samsung.com> <569729F4.4010406@samsung.com>
 <56973F44.8020807@samsung.com> <569747BD.7090203@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57739 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750922AbcANHKH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jan 2016 02:10:07 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O0X0015FL8RL8C0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Jan 2016 16:10:03 +0900 (KST)
In-reply-to: <569747BD.7090203@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org



2016=EB=85=84 01=EC=9B=94 14=EC=9D=BC 16:01=EC=97=90 Andrzej Hajda =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> On 01/14/2016 07:25 AM, Inki Dae wrote:
>> Hi Andrzej,
>>
>> This patch series incurred merge conflicts at severial patches so I =
had to merge them manually.
>> It looks good to me but it seems to need more tests so I merged them=
 to exynos-drm-next-todo.
>> After that, I will move them to exynos-drm-next. Sorry for late reiv=
ew again.
>=20
> I guess it is because exynos-drm-next does not contains patch
> 'dt-bindings: remove deprecated compatible string from exynos-hdmi'.
> It is already in next, it entered via samsung-dt tree.
> With this patch this patchset applies cleanly to exynos-drm-next.

Including dt-bindings patch, other patches also incurred merge conflict=
s.
I think your patch set are conflicted with the configurable plane suppo=
rt already merged.

Thanks,
Inki Dae

>=20
> Regards
> Andrzej
>=20
>>
>> Thanks,
>> Inki Dae=20
>>
>> 2016=EB=85=84 01=EC=9B=94 14=EC=9D=BC 13:54=EC=97=90 Inki Dae =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>> Hi Andrzej,
>>>
>>> Really sorry for missing this.
>>> I will merge them soon.
>>>
>>> Thanks,
>>> Inki Dae
>>>
>>> 2016=EB=85=84 01=EC=9B=94 13=EC=9D=BC 23:01=EC=97=90 Andrzej Hajda =
=EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>>> Hi Inki,
>>>>
>>>> Ping.
>>>>
>>>> Regards
>>>> Andrzej
>>>>
>>>> On 11/02/2015 02:16 PM, Andrzej Hajda wrote:
>>>>> Hi Inki, Krzysztof,
>>>>>
>>>>> This patchset adds support for Exynos 5433 HDMI.
>>>>> There are also few preparation/cleanup patches.
>>>>> All patches except one touch only exynos-drm.
>>>>> Sixth patch adds binding properties for Exynos5433 HDMI,
>>>>> Krzysztof could you look at it.
>>>>>
>>>>> The patchset is based on exynos-drm-next.
>>>>>
>>>>> Regards
>>>>> Andrzej
>>>>>
>>>>>
>>>>> Andrzej Hajda (7):
>>>>>   drm/exynos/hdmi: clock code re-factoring
>>>>>   drm/exynos/hdmi: constify global variables
>>>>>   drm/exynos/hdmi: use array specifier for HDMI-PHY configuration=
s
>>>>>   drm/exynos/hdmi: code cleanup
>>>>>   drm/exynos/hdmi: stop programming registers with default values
>>>>>   dt-bindings: exynos_hdmi: add bindings for Exynos5433 variant
>>>>>   drm/exynos/hdmi: add Exynos5433 support
>>>>>
>>>>>  .../devicetree/bindings/video/exynos_hdmi.txt      |  27 +-
>>>>>  drivers/gpu/drm/exynos/exynos_hdmi.c               | 454 +++++++=
++++++++------
>>>>>  drivers/gpu/drm/exynos/regs-hdmi.h                 |   9 +-
>>>>>  3 files changed, 352 insertions(+), 138 deletions(-)
>>>>>
>>>>
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe linux-sa=
msung-soc" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-sam=
sung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20
