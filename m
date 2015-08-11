From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 11/11] drm/exynos: remove struct exynos_drm_encoder layer
Date: Tue, 11 Aug 2015 21:13:54 +0900
Message-ID: <55C9E702.8060603@samsung.com>
References: <1438817060-22164-10-git-send-email-gustavo@padovan.org>
 <1438867908-18975-1-git-send-email-gustavo@padovan.org>
 <1438867908-18975-2-git-send-email-gustavo@padovan.org>
 <55C49B8A.4090009@samsung.com> <20150811003833.GE8125@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49588 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933981AbbHKMN4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Aug 2015 08:13:56 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NSX009UZ3B6FY90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Aug 2015 21:13:54 +0900 (KST)
In-reply-to: <20150811003833.GE8125@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 2015=EB=85=84 08=EC=9B=94 11=EC=9D=BC 09:38, Gustavo Padovan wrote:
> Hi Inki,
>=20
> 2015-08-07 Inki Dae <inki.dae@samsung.com>:
>=20
>> Hi Gustavo,
>>
>> On 2015=EB=85=84 08=EC=9B=94 06=EC=9D=BC 22:31, Gustavo Padovan wrot=
e:
>>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>>
>>> struct exynos_drm_encoder was justing wrapping struct drm_encoder, =
it had
>>> only a drm_encoder member and the internal exynos_drm_encoders ops =
that
>>> was directly mapped to the drm_encoder helper funcs.
>>>
>>> So now exynos DRM uses struct drm_encoder directly, this removes
>>> completely the struct exynos_drm_encoder.
>>>
>>
>> Trats2 board, which uses Exynos4412 Soc, doesn't work after this pat=
ch
>> is applied. Below is the booting logs,
>> [    1.171318] console [ttySAC2] enabled
>> [    1.175522] 13830000.serial: ttySAC3 at MMIO 0x13830000 (irq =3D =
60,
>> base_baud =3D 0) is a S3C6400/10
>> [    1.185545] [drm] Initialized drm 1.1.0 20060810
>> [    1.194104] exynos-drm exynos-drm: bound 11c00000.fimd (ops
>> fimd_component_ops)
>> [    1.200352] exynos-drm exynos-drm: bound 11c80000.dsi (ops
>> exynos_dsi_component_ops)
>> [    1.207688] [drm] Supports vblank timestamp caching Rev 2 (21.10.=
2013).
>> [    1.214313] [drm] No driver support for vblank timestamp query.
>> [    1.220218] [drm] Initialized exynos 1.0.0 20110530 on minor 0
>>
>> Booting is locked up here. This patch looks good to me so I tried to
>> find why locked up and I found the booting is locked up as soon as
>> console_lock function is called. Can you and other guys look into th=
is
>> issue?
>=20
> I've realized that I left a fix for patch 01 behind, it could be the
> cause of this issue. I've just resent this patch with the added v2 fi=
x
> up.

With above change, still locked up. So your updated patch doesn't
resolve this issue.

Anyway, I tested it with fbdev emulation relevant patch series[1] and
the booting was ok with disabling fbdev emulation as Daniel commented.
However, I think the booting should also be ok with fbdev emulation so =
I
don't want for your last patch to be merged to mainline until the issue
is resolved.

[1] http://www.spinics.net/lists/dri-devel/msg86617.html
    http://lists.freedesktop.org/archives/dri-devel/2015-March/078975.h=
tml

Thanks,
Inki Dae

>=20
> 	Gustavo
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
