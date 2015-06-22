From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v6 15/15] ARM: dts: rename the clock of MIPI DSI 'pll_clk'
 to 'sclk_mipi'
Date: Mon, 22 Jun 2015 21:35:27 +0900
Message-ID: <CAJKOXPe-XJb2qCSWxY2gQnYpACGcN=6=1XmWHX5gF7s2a_UTPw@mail.gmail.com>
References: <1434113958-15877-1-git-send-email-human.hwang@samsung.com>
	<1434113958-15877-16-git-send-email-human.hwang@samsung.com>
	<5587D111.9090602@samsung.com>
	<5587F4A1.2090502@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f51.google.com ([209.85.216.51]:44391 "EHLO
	mail-vn0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754298AbbFVMf2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jun 2015 08:35:28 -0400
In-Reply-To: <5587F4A1.2090502@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Hyungwon Hwang <human.hwang@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, daniel@fooishbar.org, sw0312.kim@samsung.com, jy0922.shim@samsung.com, linux-samsung-soc@vger.kernel.org

2015-06-22 20:42 GMT+09:00 Inki Dae <inki.dae@samsung.com>:
> + Krzysztof
>
> On 2015=EB=85=84 06=EC=9B=94 22=EC=9D=BC 18:10, Inki Dae wrote:
>> On 2015=EB=85=84 06=EC=9B=94 12=EC=9D=BC 21:59, Hyungwon Hwang wrote=
:
>>> The clock which was named as 'pll_clk' is actually not the clock so=
urce
>>> of PLL in MIPI DSI. This patch fixes this disagreement.
>>
>> Mr. Kukjin and Krzysztof, can you give me Acked-by or Singed-off-by?=
 I'd
>> like to merge this patch to mainline through drm-next.

Thanks for forwarding me other necessary patch. All that burden could
be easily avoided by sending everything to samsung-soc anyway.

The patch itself looks good:
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

>>
>> Thanks,
>> Inki Dae
>>
>>>
>>> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
>>> ---
>>> Changes before:
>>> - Refer https://patchwork.kernel.org/patch/6191811
>>> Changes for v6:
>>> - None
>>>
>>>  arch/arm/boot/dts/exynos4.dtsi | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exy=
nos4.dtsi
>>> index e20cdc2..1538d7a 100644
>>> --- a/arch/arm/boot/dts/exynos4.dtsi
>>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>>> @@ -167,7 +167,7 @@
>>>              phys =3D <&mipi_phy 1>;
>>>              phy-names =3D "dsim";
>>>              clocks =3D <&clock CLK_DSIM0>, <&clock CLK_SCLK_MIPI0>=
;
>>> -            clock-names =3D "bus_clk", "pll_clk";
>>> +            clock-names =3D "bus_clk", "sclk_mipi";
>>>              status =3D "disabled";
>>>              #address-cells =3D <1>;
>>>              #size-cells =3D <0>;
>>> --
>>> 1.9.1
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe devicetre=
e" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
>
