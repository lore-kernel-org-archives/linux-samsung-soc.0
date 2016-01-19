From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 09/10] dt-bindings: video: exynos5433-decon: add
 bindings for DECON-TV
Date: Tue, 19 Jan 2016 15:34:23 +0900
Message-ID: <569DD8EF.90703@samsung.com>
References: <CAJKOXPfXrEwu1egSnLxwYofu_scskkPRKOjOCskObPFn9yVcJw@mail.gmail.com>
 <1445860796-23045-1-git-send-email-a.hajda@samsung.com>
 <56977A3B.8020104@samsung.com> <56977D42.2050904@samsung.com>
 <569C279D.1020705@samsung.com> <569CB664.3090806@samsung.com>
 <569CBA70.8000107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <569CBA70.8000107@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org



2016=EB=85=84 01=EC=9B=94 18=EC=9D=BC 19:12=EC=97=90 Andrzej Hajda =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> Hi Inki,
>=20
> On 01/18/2016 10:54 AM, Inki Dae wrote:
>>
>> 2016=EB=85=84 01=EC=9B=94 18=EC=9D=BC 08:45=EC=97=90 Krzysztof Kozlo=
wski =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>> On 14.01.2016 19:49, Inki Dae wrote:
>>>> + Rob Herring
>>>>
>>>> 2016=EB=85=84 01=EC=9B=94 14=EC=9D=BC 19:36=EC=97=90 Andrzej Hajda=
 =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>>>> Hi Inki,
>>>>>
>>>>> It seems this patch and 04/10 did not get picked up yet.
>>>>> Could you merge it?
>>>> Yes, I can. However, 04/10 is required for acked-by from dt or SoC=
 maintainer.
>>>> Krzysztof and Rob, could you give me acked-by?
>>>>
>>>> Thanks,
>>>> Inki Dae
>>> My ack is really not required, because this is a binding for a spec=
ific
>>> driver from video subsystem. It does not fall into the arm/mach-exy=
nos
>>> nor the dts/*exynos*.
>>>
>>> Anyway I reviewed the patch on 28th of October and Rob acked it on =
13th
>>> of November.
>> I meant 04/10 not 09/10 patch. :)
>=20
> There is document in kernel with clear explanation about the subject:
> Documentation/devicetree/bindings/submitting-patches.txt.
> See especially paragraph II.2 [1].
>=20
> [1]: Documentation/devicetree/bindings/submitting-patches.txt#L50

Got it. The document says,
"For driver (not subsystem) bindings: If you are comfortable with the
 binding, and it hasn't received an Acked-by from the devicetree
 maintainers after a few weeks, go ahead and take it."

Thanks,
Inki Dae

>=20
> Regards
> Andrzej
>=20
>>
>> Thanks,
>> Inki Dae
>>
>>> Best regards,
>>> Krzysztof
>>>
>>>
>>>>> Regards
>>>>> Andrzej
>>>>>
>>>>> On 10/26/2015 12:59 PM, Andrzej Hajda wrote:
>>>>>> DECON-TV(Display and Enhancement Controller for TV) is a variati=
on
>>>>>> of DECON IP. Its main purpose is to produce video stream for HDM=
I IP.
>>>>>>
>>>>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>>>>> ---
>>>>>> Hi Krzysztof,
>>>>>>
>>>>>> I have decided to skip cleanup part as it would require more wor=
k,
>>>>>> not related to this patchset.
>>>>>>
>>>>>> Regards
>>>>>> Andrzej
>>>>>>
>>>>>>  Documentation/devicetree/bindings/video/exynos5433-decon.txt | =
3 ++-
>>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/video/exynos5433-=
decon.txt b/Documentation/devicetree/bindings/video/exynos5433-decon.tx=
t
>>>>>> index 3dff78b..c9fd7b3 100644
>>>>>> --- a/Documentation/devicetree/bindings/video/exynos5433-decon.t=
xt
>>>>>> +++ b/Documentation/devicetree/bindings/video/exynos5433-decon.t=
xt
>>>>>> @@ -5,7 +5,8 @@ Exynos series of SoCs which transfers the image =
data from a video memory
>>>>>>  buffer to an external LCD interface.
>>>>>> =20
>>>>>>  Required properties:
>>>>>> -- compatible: value should be "samsung,exynos5433-decon";
>>>>>> +- compatible: value should be one of:
>>>>>> +	"samsung,exynos5433-decon", "samsung,exynos5433-decon-tv";
>>>>>>  - reg: physical base address and length of the DECON registers =
set.
>>>>>>  - interrupts: should contain a list of all DECON IP block inter=
rupts in the
>>>>>>  	      order: VSYNC, LCD_SYSTEM. The interrupt specifier format
>>>>> --
>>>>> To unsubscribe from this list: send the line "unsubscribe linux-s=
amsung-soc" in
>>>>> the body of a message to majordomo@vger.kernel.org
>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.htm=
l
>>>>>
>>>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-sam=
sung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20
