From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 09/10] dt-bindings: video: exynos5433-decon: add
 bindings for DECON-TV
Date: Mon, 18 Jan 2016 08:45:33 +0900
Message-ID: <569C279D.1020705@samsung.com>
References: <CAJKOXPfXrEwu1egSnLxwYofu_scskkPRKOjOCskObPFn9yVcJw@mail.gmail.com>
 <1445860796-23045-1-git-send-email-a.hajda@samsung.com>
 <56977A3B.8020104@samsung.com> <56977D42.2050904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <56977D42.2050904@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 14.01.2016 19:49, Inki Dae wrote:
> + Rob Herring
>=20
> 2016=EB=85=84 01=EC=9B=94 14=EC=9D=BC 19:36=EC=97=90 Andrzej Hajda =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> Hi Inki,
>>
>> It seems this patch and 04/10 did not get picked up yet.
>> Could you merge it?
>=20
> Yes, I can. However, 04/10 is required for acked-by from dt or SoC ma=
intainer.
> Krzysztof and Rob, could you give me acked-by?
>=20
> Thanks,
> Inki Dae

My ack is really not required, because this is a binding for a specific
driver from video subsystem. It does not fall into the arm/mach-exynos
nor the dts/*exynos*.

Anyway I reviewed the patch on 28th of October and Rob acked it on 13th
of November.

Best regards,
Krzysztof


>>
>> Regards
>> Andrzej
>>
>> On 10/26/2015 12:59 PM, Andrzej Hajda wrote:
>>> DECON-TV(Display and Enhancement Controller for TV) is a variation
>>> of DECON IP. Its main purpose is to produce video stream for HDMI I=
P.
>>>
>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>> ---
>>> Hi Krzysztof,
>>>
>>> I have decided to skip cleanup part as it would require more work,
>>> not related to this patchset.
>>>
>>> Regards
>>> Andrzej
>>>
>>>  Documentation/devicetree/bindings/video/exynos5433-decon.txt | 3 +=
+-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/video/exynos5433-dec=
on.txt b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>>> index 3dff78b..c9fd7b3 100644
>>> --- a/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>>> +++ b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>>> @@ -5,7 +5,8 @@ Exynos series of SoCs which transfers the image dat=
a from a video memory
>>>  buffer to an external LCD interface.
>>> =20
>>>  Required properties:
>>> -- compatible: value should be "samsung,exynos5433-decon";
>>> +- compatible: value should be one of:
>>> +	"samsung,exynos5433-decon", "samsung,exynos5433-decon-tv";
>>>  - reg: physical base address and length of the DECON registers set=
=2E
>>>  - interrupts: should contain a list of all DECON IP block interrup=
ts in the
>>>  	      order: VSYNC, LCD_SYSTEM. The interrupt specifier format
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>=20

