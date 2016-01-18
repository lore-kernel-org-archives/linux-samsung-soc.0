From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 09/10] dt-bindings: video: exynos5433-decon: add
 bindings for DECON-TV
Date: Mon, 18 Jan 2016 18:54:44 +0900
Message-ID: <569CB664.3090806@samsung.com>
References: <CAJKOXPfXrEwu1egSnLxwYofu_scskkPRKOjOCskObPFn9yVcJw@mail.gmail.com>
 <1445860796-23045-1-git-send-email-a.hajda@samsung.com>
 <56977A3B.8020104@samsung.com> <56977D42.2050904@samsung.com>
 <569C279D.1020705@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57577 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754427AbcARJyv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jan 2016 04:54:51 -0500
In-reply-to: <569C279D.1020705@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>, Rob Herring <robh+dt@kernel.org>



2016=EB=85=84 01=EC=9B=94 18=EC=9D=BC 08:45=EC=97=90 Krzysztof Kozlowsk=
i =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> On 14.01.2016 19:49, Inki Dae wrote:
>> + Rob Herring
>>
>> 2016=EB=85=84 01=EC=9B=94 14=EC=9D=BC 19:36=EC=97=90 Andrzej Hajda =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>> Hi Inki,
>>>
>>> It seems this patch and 04/10 did not get picked up yet.
>>> Could you merge it?
>>
>> Yes, I can. However, 04/10 is required for acked-by from dt or SoC m=
aintainer.
>> Krzysztof and Rob, could you give me acked-by?
>>
>> Thanks,
>> Inki Dae
>=20
> My ack is really not required, because this is a binding for a specif=
ic
> driver from video subsystem. It does not fall into the arm/mach-exyno=
s
> nor the dts/*exynos*.
>=20
> Anyway I reviewed the patch on 28th of October and Rob acked it on 13=
th
> of November.

I meant 04/10 not 09/10 patch. :)

Thanks,
Inki Dae

>=20
> Best regards,
> Krzysztof
>=20
>=20
>>>
>>> Regards
>>> Andrzej
>>>
>>> On 10/26/2015 12:59 PM, Andrzej Hajda wrote:
>>>> DECON-TV(Display and Enhancement Controller for TV) is a variation
>>>> of DECON IP. Its main purpose is to produce video stream for HDMI =
IP.
>>>>
>>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>>> ---
>>>> Hi Krzysztof,
>>>>
>>>> I have decided to skip cleanup part as it would require more work,
>>>> not related to this patchset.
>>>>
>>>> Regards
>>>> Andrzej
>>>>
>>>>  Documentation/devicetree/bindings/video/exynos5433-decon.txt | 3 =
++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/video/exynos5433-de=
con.txt b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>>>> index 3dff78b..c9fd7b3 100644
>>>> --- a/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>>>> +++ b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>>>> @@ -5,7 +5,8 @@ Exynos series of SoCs which transfers the image da=
ta from a video memory
>>>>  buffer to an external LCD interface.
>>>> =20
>>>>  Required properties:
>>>> -- compatible: value should be "samsung,exynos5433-decon";
>>>> +- compatible: value should be one of:
>>>> +	"samsung,exynos5433-decon", "samsung,exynos5433-decon-tv";
>>>>  - reg: physical base address and length of the DECON registers se=
t.
>>>>  - interrupts: should contain a list of all DECON IP block interru=
pts in the
>>>>  	      order: VSYNC, LCD_SYSTEM. The interrupt specifier format
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-sam=
sung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>
>>
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20
