From: Inki Dae <inki.dae@samsung.com>
Subject: Re: Linux-next, Exynos Octa boot fail,
 bisected to: "drm/exynos: remove drm_iommu_attach_device_if_possible"
Date: Wed, 22 Jul 2015 19:08:51 +0900
Message-ID: <55AF6BB3.9000505@samsung.com>
References: <CAJKOXPehvV2jbxaiBmdgj98T59Y5aeK+6px6zTHR9Z=SdTDC8w@mail.gmail.com>
 <55AEF9AD.6090709@samsung.com> <55AF222F.1060303@samsung.com>
 <55AF5058.3060106@samsung.com> <55AF52BF.4030201@samsung.com>
 <55AF577F.10606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47484 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933007AbbGVKIx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jul 2015 06:08:53 -0400
In-reply-to: <55AF577F.10606@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>

On 2015=EB=85=84 07=EC=9B=94 22=EC=9D=BC 17:42, Joonyoung Shim wrote:
> On 07/22/2015 05:22 PM, Inki Dae wrote:
>> On 2015=EB=85=84 07=EC=9B=94 22=EC=9D=BC 17:12, Joonyoung Shim wrote=
:
>>> On 07/22/2015 01:55 PM, Inki Dae wrote:
>>>> On 2015=EB=85=84 07=EC=9B=94 22=EC=9D=BC 11:02, Joonyoung Shim wro=
te:
>>>>> On 07/21/2015 10:19 PM, Krzysztof Kozlowski wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Today's linux-next (next-20150721) encounters boot failures on E=
xynos
>>>>>> Octa (Exynos5422) based boards. The boards hangs. I bisected it =
to:
>>>>>>
>>>>>> d80167b85024982c5f18d0481a5c248100360118 is the first bad commit
>>>>>> commit d80167b85024982c5f18d0481a5c248100360118
>>>>>> Author: Joonyoung Shim <jy0922.shim@samsung.com>
>>>>>> Date:   Thu Jul 2 21:49:39 2015 +0900
>>>>>>
>>>>>>     drm/exynos: remove drm_iommu_attach_device_if_possible
>>>>>>
>>>>>>     Already drm_iommu_attach_device checks whether support iommu=
 internally.
>>>>>>     It should clear channels always regardless iommu support. We=
 didn't know
>>>>>>     because we can detect the problem when iommu is enabled, so =
we don't
>>>>>>     have to use drm_iommu_attach_device_if_possible and then we =
can remove
>>>>>>     drm_iommu_attach_device_if_possible and clear_channels funct=
ion pointer.
>>>>>>
>>>>>>     Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
>>>>>>     Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>>>     Signed-off-by: Inki Dae <inki.dae@samsung.com>
>>>>>>
>>>>>> :040000 040000 83379efbf4960f58d680371628ec04387935bd53
>>>>>> da03c338b88e7cb6bda895b3dd52d78d9b6eba30 M drivers
>>>>>>
>>>>>>
>>>>>> Config: exynos
>>>>>> Boot log from Odroid XU3-Lite attached.
>>>>>>
>>>>>> Any hints or ideas?
>>>>>
>>>>> The point that hangs is when accesses fimd register in
>>>>> fimd_clear_channels function, so i doubt clock setting for fimd.
>>>>>
>>>>> It's gone something that hangs after i enable gating for ACLK_200=
_DISP1
>>>>> clock.
>>>>>
>>>>> If ACLK_200_DISP1 clock needs for fimd really, i'm thinking how c=
an it
>>>>> support. Any ideas?
>>>>
>>>> I think bootloader should have enabled ACLK_200_DISP1 clock and al=
so
>>>> device driver should enable all relevant clocks before the device
>>>> accesses its own registers.
>>>>
>>>> Best way would be that the clock is enabled by common clock framew=
ork
>>>> but it seems there is no anything that the clock framework can do =
it. So
>>>> I think what we have to do is to add the clock support to device t=
ree.
>>>
>>> It's not easy problem to me. Should we add which clock? I think we
>>> cannot control ACLK_200_DISP1 or CLKDIV2_DISP1_BLK directly by belo=
w
>>> hierarchy, right? Then we should control gate clocks, but we have n=
ot
>>> controlled any gate clocks using BTS_ prefix.
>>>
>>> The clock hierarchy from Exynos5422 user manual,
>>> ACLK_200_DISP1 -- CLKDIV2_DISP1_BLK -- HDMI LINK
>>>                                        HDMI PHY
>>>                                        MIC1
>>>                                        DSIM1
>>>                                        DPTX LINK
>>>                                        MDNIE1
>>>                                        SYSMMU_MIXER
>>>                                        SYSMMU_FIMD1_M0
>>>                                        SYSMMU_FIMD1_M1
>>>                                        BTS_TVM0
>>>                                        BTS_TVM1
>>>                                        BTS_FIMD1_M0
>>>                                        BTS_FIMD1_M1
>>>
>>> Other way, IMHO, fimd driver doesn't have to enable ACLK_200_DISP1 =
clock,
>>> just it should be controlled by connector drivers, e.g. dsi, dp bec=
ause
>>> fimd only cannot operate, so dsi or dp must need (Actually i'm not =
sure
>>> about this, just i thought that Exynos5 SoCs don't have any gpios f=
or
>>> dpi, so they cannot use dpi, right?).
>>>
>>> It needs to probe connector driver like dsi or dp earlier than fimd=
 and
>>> fimd_bind function should return error if connector driver like dsi=
 or
>>> dp was not probed. This is also not easy to me.
>>
>> In this case, if one of above gate clocks is enabled, the ACLK_200_D=
ISP1
>> should be enabled. So I guess the problem would be due to below line=
 of
>> clk-exynos5420.c,
>>
>> GATE(CLK_FIMD1, "fimd1", "aclk300_disp1", GATE_IP_DISP1, 0, 0, 0),
>>
>> Can you check it again after modifying it like below?,
>> GATE(CLK_FIMD1, "fimd1", "aclk200_disp1", GATE_IP_DISP1, 0, 0, 0),
>=20
> No, parent clock of fimd1 gate clock is ACLK_300_DISP1.

Yes, I checked just it through exynos5420 and exynos5422 document. I
just guessed. So do you mean that aclk200_disp1 affects FIMD controller
even though aclk200_disp1 isn't a parent clock of FIMD? If so, it's ver=
y
strange.

> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
