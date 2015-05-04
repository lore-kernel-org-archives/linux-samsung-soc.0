From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: Re: [PATCH] drm/exynos: Fix build breakage on !DRM_EXYNOS_FIMD
Date: Mon, 04 May 2015 22:24:06 +0900
Message-ID: <554772F6.3020003@gmail.com>
References: <1430539706-2945-1-git-send-email-k.kozlowski.k@gmail.com> <55472339.8040408@samsung.com> <CAPj87rM-utcjuWD+ZB7_m01X3qUsNnwJmabCYZAAQUkAdRabaQ@mail.gmail.com> <5547696D.8000300@gmail.com> <554770E1.2000401@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:36111 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752675AbbEDNYM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 May 2015 09:24:12 -0400
In-Reply-To: <554770E1.2000401@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Daniel Stone <daniel@fooishbar.org>
Cc: Inki Dae <inki.dae@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

W dniu 04.05.2015 o 22:15, Andrzej Hajda pisze:
> Hi,
>=20
>=20
> On 05/04/2015 02:43 PM, Krzysztof Kozlowski wrote:
>> 2015-05-04 20:34 GMT+09:00 Daniel Stone <daniel@fooishbar.org>:
>>> Hi,
>>>
>>> On 4 May 2015 at 08:43, Inki Dae <inki.dae@samsung.com> wrote:
>>>> On 2015=EB=85=84 05=EC=9B=94 02=EC=9D=BC 13:08, Krzysztof Kozlowsk=
i wrote:
>>>>> Selecting CONFIG_FB_S3C disables CONFIG_DRM_EXYNOS_FIMD leading t=
o build
>>>>> error:
>>>>
>>>> No, eDP has no any dependency of FIMD but DECON. Just add dependen=
cy
>>>> code like below,
>>>>
>>>>  config DRM_EXYNOS7_DECON
>>>>         bool "Exynos DRM DECON"
>>>> -       depends on DRM_EXYNOS
>>>> +       depends on DRM_EXYNOS && !FB_S3C
>>
>> Actually my commit message was not detailed enough. The FB_S3C here
>> won't solve the issue because you may:
>> 1, disable FIMD and FB_S3C,
>> 2, enabke DECON and DP,
>> and it won't compile.
>>
>> Currently the FIMD must be enabled if DRM_EXYNOS_DP is enabled.
>>
>>>
>>> But it does clearly and explicitly call fimd_dp_clock_enable from
>>> exynos_dp_powero{n,ff}. So the dependency you're proposing seems
>>> backwards: it's not an expression of the requirements of the curren=
t
>>> code (that FIMD DP code be available, i.e. CONFIG_DRM_EXYNOS_FIMD i=
s
>>> selected), but an indirect expression of another dependency
>>> (CONFIG_FB_S3C disables CONFIG_DRM_EXYNOS_FIMD, so disable
>>> CONFIG_FB_S3C).
>>>
>>> Additionally, as the call comes from exynos_dp_core.c, which is bui=
lt
>>> by CONFIG_DRM_EXYNOS_DP (an explicitly user-selectable option), why
>>> shouldn't the dependency be there? Ah, because the dependency on DP=
 is
>>> for (DECON || FIMD), but as DECON doesn't provide
>>> fimd_dp_clock_enable(), it doesn't seem like it would compile if yo=
u
>>> selected DECON and not FIMD.
>>>
>>> So, for me, the cleanest solution would be config DRM_EXYNOS_DP gai=
ns
>>> a hard dependency on DRM_EXYNOS_FIMD, at least until it can be fixe=
d
>>> to compile without FIMD.
>>
>> Right, you correctly pointed current dependencies. Still it looks li=
ttle
>> hacky because EXYNOS_DP may work with FIMD or DECON.=20
>=20
> Are you sure? I have not seen any chipset having DECON and DP. In all
> chipsets known to me DP is always accompanied by FIMD. I guess it can
> change in the future, but for now hard dependency on FIMD seems to be=
 OK
> - it just reflects hardware design.
> Of course this is just my humble opinion :)

OK, so my next question would be: does DECON requires similar clock
handling like FIMD on certain SoCs? In other words - does something lik=
e
fimd_dp_clock_enable() have any sense in context of DECON?

Best regards,
Krzysztof
